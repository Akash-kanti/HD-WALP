import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hd_wallpaper/pages/appbar.dart';
import 'package:hd_wallpaper/pages/appdrawer.dart';
import 'package:hd_wallpaper/pages/showwall.dart';
import 'package:http/http.dart' as http;

class QueryPage extends StatefulWidget {
  final String pageurl;
  const QueryPage({super.key, required this.pageurl});

  @override
  State<QueryPage> createState() => _QueryPage();
}

class _QueryPage extends State<QueryPage> {
  List images = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    fetchapi();
  }

  fetchapi() async {
    await http.get(Uri.parse(widget.pageurl), headers: {
      'Authorization':
          'Iq850pkLW4owJfpjUXp01mNj4nlGhc0vtjPG12oeRZN2neOtuanLIGTe'
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images = result['photos'];
      });
    });
  }

  loadmore() async {
    setState(() {
      page = page + 1;
    });
    String fds = widget.pageurl;
   
    String url = fds + '&page=' + page.toString();
   

    await http.get(Uri.parse(url), headers: {
      'Authorization':
          'Iq850pkLW4owJfpjUXp01mNj4nlGhc0vtjPG12oeRZN2neOtuanLIGTe'
    }).then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images.addAll(result['photos']);
      });
     
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: hdAppBar(),
      drawer: AppDrawer(),
      body: Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 10,
            right: 10,
            bottom: 0,
          ),
          height: h,
          width: w,
          color: Colors.black,
          child: Column(
            children: [
              Flexible(
                child: GridView.builder(
                  itemCount: images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ShowWall(
                                imageurl: images[index]['src']['large2x'],
                                imageid: images[index]['id'],
                              ))),
                      child: Container(
                        color: Colors.amber,
                        child: Image.network(
                          images[index]['src']['tiny'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 5, bottom: 5),
                height: 30,
                child: ElevatedButton(
                    child: Text(
                      'LOAD MORE',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.deepPurpleAccent;
                          }
                          return Colors.deepPurple;
                        },
                      ),
                    ),
                    onPressed: loadmore),
              ),
            ],
          )),
    );
  }
}
