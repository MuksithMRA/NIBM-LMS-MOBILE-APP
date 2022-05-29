import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("About us"),
        centerTitle: true,
      ),
      body: Center(
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(30),
          child: SizedBox(
            height: height * 0.8,
            width: width * 0.9,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  child: SizedBox(
                      height: height * 0.2,
                      width: width * 0.9,
                      child: Image.asset(
                        "assets/librarycover.jpg",
                        fit: BoxFit.cover,
                      )),
                ),
                const Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        "National Institute of Buisness Management\n Library Management System",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          const Text(
                            "This mobile app is associated with our LMS system. You can find available books and book details from this app. we are working for improve more features to this application.",
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          const ListTile(
                            leading: Icon(Icons.location_on),
                            title: Text("Address"),
                            subtitle:
                                Text("120/5 Vidya Mawatha, Colombo 00700"),
                          ),
                          const ListTile(
                            leading: Icon(Icons.phone),
                            title: Text("Telephone"),
                            subtitle: Text("0117 321 000"),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          onPressed: () async {
                            String _url =
                                "https://www.facebook.com/OfficialNIBM";
                            if (!await launch(_url)) {
                              throw 'Could not launch $_url';
                            }
                          },
                          child: const Icon(FontAwesomeIcons.facebook),
                        ),
                        FloatingActionButton(
                          onPressed: () async {
                            String _url =
                                "https://www.youtube.com/channel/UCiPesfrP9o0VW_TOgQpW0Hg";
                            if (!await launch(_url)) {
                              throw 'Could not launch $_url';
                            }
                          },
                          child: const Icon(FontAwesomeIcons.youtube),
                        ),
                        FloatingActionButton(
                          onPressed: () async {
                            String _url = "https://twitter.com/nibmofficial";
                            if (!await launch(_url)) {
                              throw 'Could not launch $_url';
                            }
                          },
                          child: const Icon(FontAwesomeIcons.twitter),
                        ),
                        FloatingActionButton(
                          onPressed: () async {
                            String _url =
                                "https://www.linkedin.com/school/national-institute-of-business-management-nibm---sri-lanka-/";
                            if (!await launch(_url)) {
                              throw 'Could not launch $_url';
                            }
                          },
                          child: const Icon(FontAwesomeIcons.linkedin),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
