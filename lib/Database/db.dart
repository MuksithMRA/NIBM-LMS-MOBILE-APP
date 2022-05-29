import 'package:galileo_sqljocky5/public/connection/connection.dart';

class DBConnection {
  static ConnectionSettings  setConnection()  {
    var s = ConnectionSettings(
        user: "irixsolu_irix",
        password: "Mot413654*",
        host: "98.142.97.194",
        port: 3306,
        db: "irixsolu_coda");
    return s;
  }
}
