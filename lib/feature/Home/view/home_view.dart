import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../widgets/container_loader.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: const Text('Home'),
            floating: true,
            snap: true,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://picsum.photos/250?image=9',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    child: Column(
                      children: [
                        Text('Item $index'),
                        const SizedBox(height: 10),
                       SizedBox(
                          
                          width: 100,
                          child: TextButton(onPressed: (){
                            showDialog(
                              
                              context: 
                          
                          context,
                          
                             builder: 
                            (context) => const AlertDialog(
                              elevation: 0,
                              
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              content: CircularProgressIndicator(
                                backgroundColor: Colors.transparent,
                              ),
                            )
                            );
                          }, child: const Text('button')),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}
