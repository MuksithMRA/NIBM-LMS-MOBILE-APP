import 'package:flutter/material.dart';

import '../Model/Book.dart';

class BookDialog extends StatelessWidget {
  final Book book;
  const BookDialog({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(book.name, textAlign: TextAlign.center),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/bookImg.png"),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    title: const Text("Availability"),
                    subtitle:
                        Text(book.availability ? "Available" : "Unavailable"),
                  ),
                  ListTile(
                    title: const Text("Category"),
                    subtitle: Text(book.category),
                  ),
                  ListTile(
                    title: const Text("Author"),
                    subtitle: Text(book.author),
                  ),
                  ListTile(
                    title: const Text("ISBN"),
                    subtitle: Text(book.isbn),
                  ),
                  ListTile(
                    title: const Text("Rack No"),
                    subtitle: Text(book.rackNo),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
              onPressed: () => Navigator.pop(context), child: const Text("Ok")),
        )
      ],
    );
  }
}
