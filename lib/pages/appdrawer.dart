import 'package:flutter/material.dart';
import 'package:hd_wallpaper/pages/querypages.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        backgroundColor: Colors.grey,
        child: ListView(children: [
          DrawerHeader(
              padding: EdgeInsets.zero,

              child:
              
                 Image.asset('assets/drawerlogo.jpg', fit: BoxFit.cover,),
                
              //)
              ),

//search

          Padding(
            padding:
                const EdgeInsets.only(top: 2, bottom: 2, left: 20, right: 10),
            child: SearchBar(
              leading: const Icon(Icons.search),
              elevation: MaterialStateProperty.all(1),
              overlayColor: MaterialStateProperty.all(Colors.white),
              shadowColor: MaterialStateProperty.all(Colors.deepPurple),
              side: MaterialStateProperty.all(
                  const BorderSide(color: Colors.black)),
              constraints: const BoxConstraints(maxHeight: 50, minHeight: 40),
              hintText: 'Search',
              onSubmitted: (String value) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => QueryPage(
                        pageurl:
                            'https://api.pexels.com/v1/search/?per_page=20&query=$value')));
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.white,
          ),

          ListTile(
            leading: SizedBox(width: 5),
            title: const Text(
              "HOME",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const QueryPage(
                    pageurl:
                        "https://api.pexels.com/v1/curated?per_page=20"))),
          ),

          //nature
          ListTile(
            leading: SizedBox(width: 5),
            title: const Text(
              "NATURE",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const QueryPage(
                    pageurl:
                        "https://api.pexels.com/v1/search/?per_page=20&query=nature"))),
          ),

          //dark
          ListTile(
            leading: SizedBox(width: 5),
            title: const Text(
              "DARK",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const QueryPage(
                    pageurl:
                        "https://api.pexels.com/v1/search/?per_page=20&query=dark"))),
          ),

//space
          ListTile(
            leading: SizedBox(width: 5),
            title: const Text(
              "SPACE",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const QueryPage(
                    pageurl:
                        "https://api.pexels.com/v1/search/?per_page=20&query=universe"))),
          ),
          Divider(
            color: Colors.white,
          ),
        ]),
      ),
    );
  }
}
