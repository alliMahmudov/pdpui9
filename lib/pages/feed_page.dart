import 'package:flutter/material.dart';

import '../model/post_model.dart';
import '../model/story_model.dart';


class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);
  static const String id = "feed_page";

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  final List<Story> _stories = [
    Story("assets/images/img_3.png", "Jazmin"),
    Story("assets/images/img_4.png", "Sylvester"),
    Story("assets/images/img_5.png", "Lavina"),
    Story("assets/images/img_3.png", "Jazmin"),
    Story("assets/images/img_4.png", "Sylvester"),
    Story("assets/images/img_5.png", "Lavina"),
  ];

  final List<Post> _posts = [
    Post(
      userName: "Brianne",
      userImage: "assets/images/img_3.png",
      postImage: "assets/images/img.png",
      caption: "Consequatur nihil aliqiud omnis consequatur",
    ),
    Post(
      userName: "Henri",
      userImage: "assets/images/img_4.png",
      postImage: "assets/images/img_1.png",
      caption: "Consequatur nihil aliqiud omnis consequatur",
    ),
    Post(
      userName: "Mariano",
      userImage: "assets/images/img_5.png",
      postImage: "assets/images/img_2.png",
      caption: "Consequatur nihil aliqiud omnis consequatur",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(),
              // #stories watch all
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Stories", style: TextStyle(color: Colors.grey),),
                    Text("Watch All", style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),
              // #storyList
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _stories.map((story) {
                    return _itemOfStory(story);
                  }).toList(),
                ),
              ),

              // #postList
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _posts.length,
                  itemBuilder: (ctx, i){
                    return _itemOfPost(_posts[i]);
                  },

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemOfPost(Post post){
    return Column(
      children: [
        // #header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image(
                      image: AssetImage(post.userImage),
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(post.userName, style: TextStyle(color: Colors.grey),),
                ],
              ),

              IconButton(
                icon: const Icon(Icons.more_horiz_rounded),
                color: Colors.grey,
                onPressed: () {},
              ),
            ],
          ),
        ),
        FadeInImage(
          width: MediaQuery.of(context).size.width,
          image: AssetImage(post.postImage),
          placeholder: const AssetImage("assets/images/img_6.png"),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.favorite_border, color: Colors.grey,),
                ),
                IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.mode_comment_outlined, color: Colors.grey,),
                ),
                IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.near_me_outlined, color: Colors.grey,),
                ),
              ],
            ),
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.bookmark_border, color: Colors.grey,),
            ),
          ],
        ),

        // #tags
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 14),
          child: RichText(
            softWrap: true,
            overflow: TextOverflow.visible,
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Liked By ",
                  style: TextStyle(color: Colors.grey),
                ),
                TextSpan(
                  text: "Sigmund,",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                TextSpan(
                  text: " Yessenia,",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                TextSpan(
                  text: " Dayana",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                TextSpan(
                  text: " and",
                  style: TextStyle(color: Colors.grey),
                ),
                TextSpan(
                  text: " 1263 others",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ]
            ),
          ),
        ),

        // #caption
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 14,vertical: 5),
          child: RichText(
            softWrap: true,
            overflow: TextOverflow.visible,
            text: TextSpan(
              children: [
                TextSpan(
                  text: post.userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),

                TextSpan(
                    text: post.caption,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                ),
              ]
            ),
          ),
        ),

        // #postDate
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          alignment: Alignment.topLeft,
          child: const Text("April 2023",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Widget  _itemOfStory(Story story){
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: const Color(0xFF8e44ad),
            )
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Text(story.name,style: TextStyle(color: Colors.grey),)
      ],
    );
  }

}
