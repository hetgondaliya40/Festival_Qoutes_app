import 'dart:math';

import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../utilis/qoutes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Random random = Random();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Festival',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://images.unsplash.com/photo-1696764190358-3edebaf382d4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8YnJvd24lMjBiYWNrZ3JvdW5kfGVufDB8fDB8fHww',
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: Global.allQoutes.map((e) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.of(context)
                        .pushNamed(Routes.quotepage, arguments: e);
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("${e['thumbnail']}"),
                    ),
                  ),
                  child: Text(
                    "${e['category']}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
