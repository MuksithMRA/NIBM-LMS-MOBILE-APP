import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nibm_lms/Animations/page_transition_slide.dart';
import 'package:nibm_lms/Animations/straggered_list.dart';
import 'package:nibm_lms/Screens/about_us.dart';
import 'package:nibm_lms/Widgets/book_dialog.dart';
import '../Model/Book.dart';
import '../controllers/book_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Book>> books;

  @override
  void initState() {
    super.initState();
    books = BookController.loadBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            books = BookController.loadBooks();
          });
        },
        icon: const Icon(Icons.refresh),
        label: const Text("Refresh"),
      ),
      appBar: AppBar(
        leading: const Icon(FontAwesomeIcons.house),
        title: const Text("Book Store"),
        centerTitle: true,
        actions: [
          ElevatedButton.icon(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
            ),
            onPressed: () {
              Navigator.push(context, SlideTransition1(const AboutUs()));
            },
            icon: const Icon(FontAwesomeIcons.peopleGroup),
            label: const Text(""),
          )
        ],
      ),
      body: FutureBuilder(
        future: books,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data.length <= 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "please check your internet \nconnection or no data",
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          books = BookController.loadBooks();
                        });
                      },
                      child: const Text("Retry"))
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              Book book = snapshot.data[index];
              return CustomStaggeredList(
                  index: index,
                  child: ListTile(
                    leading: Icon(FontAwesomeIcons.bookOpen,color: Colors.blue,),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return BookDialog(book: book);
                          });
                    },
                    title: Text(book.name),
                    subtitle: Text(book.author),
                    trailing: book.availability
                        ? const Text(
                            "Available",
                            style: TextStyle(color: Colors.green),
                          )
                        : const Text(
                            "Unavailable",
                            style: TextStyle(color: Colors.red),
                          ),
                  ));
            },
          );
        },
      ),
    );
  }
}
