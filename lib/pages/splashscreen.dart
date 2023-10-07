import 'dart:async'; 
import 'package:flutter/material.dart';
import 'package:hd_wallpaper/pages/querypages.dart'; 


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
 
@override 
State<MyHomePage> createState() => _MyHomePageState(); 
} 
class _MyHomePageState extends State<MyHomePage> { 
@override 
void initState() { 
	super.initState(); 
	Timer(Duration(seconds: 4), 
		()=>Navigator.pushReplacement(context, 
										MaterialPageRoute(builder: 
														(context) => 
														const QueryPage(
                    pageurl:
                        "https://api.pexels.com/v1/curated?per_page=20") 
														) 
									) 
		); 
} 
@override 
Widget build(BuildContext context) { 
	return Container( 
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/splashlogo.jpg'), fit: BoxFit.cover)),
	 
	
	); 
} 
} 

