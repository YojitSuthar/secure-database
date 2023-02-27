import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final TextEditingController name = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController age = TextEditingController();
  FlutterSecureStorage secure_storage = FlutterSecureStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_data();
  }

  Future<void> setdata(String key, String value) async {
    await secure_storage.write(key: key, value: value);
  }

  Future<String> getdata(String key ) async {
    return await secure_storage.read(key: key) ?? "";
  }

  void s_data() {
    setdata("name", name.text);
    setdata("address", address.text);
    setdata("age", age.text);
  }

  get_data() async {
    name.text = await getdata("name");
    address.text = await getdata("address");
    age.text = await getdata("age");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("secure Storage"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            text_field("name", name),
            text_field( "address", address),
            text_field("age", age),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  s_data();
                },
                child: Text("Save")),
          ],
        ),
      ),
    );
  }
}

class text_field extends StatelessWidget {
  final String? text;
  TextEditingController? controller = TextEditingController();
  text_field(this.text, this.controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            hintText: text,
            border: OutlineInputBorder()),
      ),
    );
  }
}
