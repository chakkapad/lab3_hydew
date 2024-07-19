import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int total = 0;

  void incrementNumber(int count, int price) {
    setState(() {
      total += count * price;
    });
  }

  void clearTotal() {
    setState(() {
      total = 0;
    });
  }

  String formatNumber(int number) {
    return number.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Shopping Cart"),
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
        ),
        body: Column(children: [
          Expanded(
            child: Column(children: [
              ShoppingItem(
                title: "iPad",
                price: 19000,
                onIncrement: (int count) {
                  incrementNumber(count, 19000);
                },
              ),
              ShoppingItem(
                title: "iPad mini",
                price: 23000,
                onIncrement: (int count) {
                  incrementNumber(count, 23000);
                },
              ),
              ShoppingItem(
                title: "iPad Air",
                price: 29000,
                onIncrement: (int count) {
                  incrementNumber(count, 29000);
                },
              ),
              ShoppingItem(
                title: "iPad Pro",
                price: 39000,
                onIncrement: (int count) {
                  incrementNumber(count, 39000);
                },
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                formatNumber(total),
                style: const TextStyle(fontSize: 30),
              ),
              const Text(
                "Bath",
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: clearTotal,
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepOrange),
                child: const Text("Clear"),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ]),
      ),
    );
  }
}

class ShoppingItem extends StatefulWidget {
  final String title;
  final int price;
  final Function(int count) onIncrement;

  ShoppingItem({
    required this.title,
    required this.price,
    required this.onIncrement,
  });

  @override
  State<ShoppingItem> createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 28),
              ),
              Text("${widget.price}฿"),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (count > 0) {
                      count--;
                      widget.onIncrement(-1);
                    }
                  });
                },
                icon: const Icon(Icons.remove)),
            const SizedBox(
              width: 10,
            ),
            Text(
              count.toString(),
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    count++;
                    widget.onIncrement(1);
                  });
                },
                icon: const Icon(Icons.add))
          ],
        )
      ],
    );
  }
}
