
import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';


import 'package:flutter/material.dart';
import 'package:hd_wallpaper/pages/appbar.dart';

// import 'package:hd_wallpaper/pages/hdwallpaper_homepage.dart';

class ShowWall extends StatefulWidget {
  final String imageurl;
  final int imageid;

  const ShowWall({super.key, required this.imageurl, required this.imageid});

  @override
  State<ShowWall> createState() => _ShowWallState();
}

class _ShowWallState extends State<ShowWall> {


  void downloadfile() async {
    Dio dio = Dio();

    String id = widget.imageid.toString();
    var path = "/storage/emulated/0/Download/image-$id.jpg";

    await dio.download(widget.imageurl, path);
  }

 Future<void> setwallpaper(int location) async{

//print(location);
var file= await DefaultCacheManager().getSingleFile(widget.imageurl);
await WallpaperManager.setWallpaperFromFile(file.path, location);


}
 

  @override
  Widget build(BuildContext context) {
    // var h = MediaQuery.of(context).size.height;
    // var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: hdAppBar(),
      body: Container(
          //color: Colors.black45,
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.imageurl),
                          fit: BoxFit.contain)),
                ),
              ),
              Container(
                height: 50,
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: ElevatedButton(
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
                    onPressed: () {
                      downloadfile();
                      
                      showModalBottomSheet(
                          backgroundColor: Colors.black,
                          isDismissible: true,
                          enableDrag: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5))),
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                ),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      minimumSize: const Size.fromHeight(50),
                                    ),
                                    onPressed: (){setwallpaper( WallpaperManager.HOME_SCREEN);
                                     Navigator.pop(context);},
                                    child: Text(
                                      "HOME SCREEN",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),
                                    )),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      minimumSize: const Size.fromHeight(50),
                                    ),
                                    onPressed: (){setwallpaper( WallpaperManager.LOCK_SCREEN);
                                     Navigator.pop(context);},
                                    child: Text("LOCK SCREEN", style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),)),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      minimumSize: const Size.fromHeight(50),
                                    ),
                                    onPressed:(){ setwallpaper( WallpaperManager.BOTH_SCREEN);
                                     Navigator.pop(context);},
                                    child: Text("HOME & LOCK", style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15),)),
                              ],
                            );
                          });
                    },
                    child: Text(
                      "SET WALLPAPER",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          )),
    );
  }
}
