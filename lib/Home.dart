// ignore: file_names
import "package:flutter/material.dart";
import 'package:frontend/models/post.dart';
import 'package:frontend/service.dart';

import 'detail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await Jatin().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemBuilder: (context, index) {
              // ignore: avoid_unnecessary_containers
              return TextButton(
                child: Text(posts![index].title.toString()),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomCard(
                              title: posts![index].title.toString(),
                            )),
                  );
                },
              );
            },
            itemCount: posts?.length),
      ),
    );
  }
}
