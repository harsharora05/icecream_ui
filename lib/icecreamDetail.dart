import 'package:flutter/material.dart';

class Icecreamdetail extends StatelessWidget {
  Map<String, dynamic> product;
  Icecreamdetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IceCream Detail"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Hero(
                    tag: product["imageLink"],
                    child: CircleAvatar(
                      radius: 90,
                      backgroundImage: NetworkImage(product["imageLink"]),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Text(
                      "\$${product["price"].toString()}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product['description'],
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Toppings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: product['toppings'].length,
                    itemBuilder: (context, index) {
                      final toping = product['toppings'];
                      return Container(
                        margin: const EdgeInsets.only(right: 5, left: 5),
                        child: Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          label: Text(toping[index]),
                          backgroundColor: Colors.grey.shade400,
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Ingredients",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                // width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: product['ingredients'].length,
                    itemBuilder: (context, index) {
                      final ingredient = product['ingredients'];
                      return Container(
                          margin: const EdgeInsets.only(right: 10, left: 10),
                          child: Card(
                            child: ListTile(
                              title: Text(ingredient[index]['name']),
                              subtitle: Text(ingredient[index]['quantity']),
                            ),
                          ));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
