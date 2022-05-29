import 'package:flutter/material.dart';
import 'package:galileo_sqljocky5/sqljocky.dart';
import '../Database/db.dart';
import 'package:galileo_sqljocky5/public/results/results.dart' as res;
import '../Model/Book.dart';

class BookController{
  static Future<List<Book>> loadBooks() async {
    List<Book> books = [];
    MySqlConnection? conn;
    try {
      conn = await MySqlConnection.connect(DBConnection.setConnection());
      var results = await conn.execute("select * from Book");
      results.forEach((res.Row row) {
        books.add(
          Book(
            id: row[0],
            name: row[1],
            category: row[2],
            author: row[3],
            isbn: row[4],
            availability: row[5] == 1 ? true : false,
            rackNo: row[6],
          ),
        );
      });
      conn.close();
    } catch (e) {
      
      debugPrint(e.toString());
      if (conn != null) {
        conn.close();
      }
    }

    return books;
  }
}
