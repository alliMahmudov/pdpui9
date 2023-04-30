import 'package:flutter/material.dart';
import 'package:pdpui9/pages/feed_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "homepage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPage = 0;
  final _pages = [
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
    const FeedPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("Instagram", style: TextStyle(color: Colors.grey),),
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.camera_alt_outlined),
          color: Colors.grey,
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.live_tv),
            color: Colors.grey,
          ),
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.near_me_outlined),
            color: Colors.grey,
          ),
        ],
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i) {
          setState(() {
            currentPage = i;
          });
        },

        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_sharp),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: "Upload",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Likes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
