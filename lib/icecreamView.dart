import 'package:flutter/material.dart';
import 'package:icecream_ui/data.dart';
import 'package:icecream_ui/icecreamDetail.dart';

class Icecreamview extends StatefulWidget {
  const Icecreamview({super.key});

  @override
  State<Icecreamview> createState() => _IcecreamviewState();
}

class _IcecreamviewState extends State<Icecreamview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Icecreams",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "We have something icey for you",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: icecreamData.length,
                      itemBuilder: (context, index) {
                        final icecream = icecreamData[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Icecreamdetail(
                                product: icecream,
                              );
                            }));
                          },
                          child: Container(
                            width: 220,
                            child: Card(
                              clipBehavior: Clip.hardEdge,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Hero(
                                    tag: icecream['imageLink'],
                                    child: Image.network(
                                      icecream['imageLink'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            icecream['flavor'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              "\$${icecream['price'].toString()}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ))),
    );
  }
}
