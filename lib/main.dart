import 'package:flutter/material.dart';
import 'package:hd_wallpaper/pages/querypages.dart';

import 'package:hd_wallpaper/pages/splashscreen.dart';

void main() {
  runApp(const HDWallpaper());
}

class HDWallpaper extends StatelessWidget {
  const HDWallpaper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'hd wallpaper',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:
        const MyHomePage(),
        //  const QueryPage(
        //     pageurl: "https://api.pexels.com/v1/curated/?per_page=10")
       
         );
  }
}
