import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yellowclass/constants.dart';

import '../../../Moviemodel.dart';

TextEditingController myController = TextEditingController();

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String link = "";
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: UploadtoHive());
  }
}

class UploadtoHive extends StatefulWidget {
  const UploadtoHive({Key key}) : super(key: key);

  @override
  _UploadtoHiveState createState() => _UploadtoHiveState();
}

class _UploadtoHiveState extends State<UploadtoHive> {
  TextEditingController moviename, genre, directorname, linkdetail;
  Box<Moviemodel> moviebox;
  @override
  void initState() {
    super.initState();
    moviebox = Hive.box<Moviemodel>("movieinfo");
    moviename = TextEditingController();
    genre = TextEditingController();
    directorname = TextEditingController();
    linkdetail = TextEditingController();
  }

  @override
  void dispose() {
    myController.dispose();
    moviename.dispose();
    genre.dispose();
    directorname.dispose();
    linkdetail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
          child: Text(
            "ADD MOVIE",
            style: TextStyle(
                color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Textfieldcontainer(
            child: TextField(
                controller: moviename,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Movie Name",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ))),
          ),
        ),
        Container(
          child: Title(
              name: " Genre",
              colors: Color(0xFFFF0000),
              name2: "Enter",
              colors2: Colors.white),
        ),
        Container(
          child: Textfieldcontainer(
            child: TextField(
                controller: genre,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Genre",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ))),
          ),
        ),
        Container(
          child: Title(
              name: " Director",
              colors: Color(0xFFFF0000),
              name2: "Enter",
              colors2: Colors.white),
        ),
        Container(
          child: Textfieldcontainer(
            child: TextField(
                controller: directorname,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Director Name",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ))),
          ),
        ),
        Container(
          child: Title(
              name: "Poster",
              colors: Color(0xFFFF0000),
              name2: "Link",
              colors2: Colors.white),
        ),
        Container(
          child: SizedBox(
              width: size.width * 0.8, height: 52, child: Linktoimage()),
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 20),
              color: Color(0xFF60E89A),
              onPressed: () {
                // var box = Hive.box(movieboxname);
                // box.put(0, moviename);
                // box.put(1, directorname);
                // box.put(2, genre);
                // print(box.get(0));
                Moviemodel moviemodel = Moviemodel(
                    moviename: moviename.text,
                    directorname: directorname.text,
                    genre: genre.text,
                    link: myController.text);

                moviebox.add(moviemodel);
                print(moviebox.get(0));
                Navigator.pop(context);
              },
              child: Text("SAVE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        )
      ],
    );
  }
}

class Linktoimage extends StatefulWidget {
  @override
  _LinktoimageState createState() => _LinktoimageState();
}

class _LinktoimageState extends State<Linktoimage> {
  final mmyController = TextEditingController();
  @override
  void dispose() {
    mmyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: TextField(
          controller: mmyController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.white),
            hintText: "Poster URL",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myController = mmyController;
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: kprimaryColor,
                  content: Container(
                    color: kprimaryColor,
                    padding: EdgeInsets.all(5),
                    child: Image.network(myController.text),
                  ),
                );
              });
        },
        child: Icon(Icons.image),
      ),
    );
  }
}

class Textfieldcontainer extends StatelessWidget {
  final Widget child;
  const Textfieldcontainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 40),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(50)),
      child: child,
    );
  }
}

class Title extends StatelessWidget {
  final String name;
  final String name2;
  final Color colors;
  final Color colors2;
  const Title({
    Key key,
    @required this.name,
    @required this.colors,
    @required this.name2,
    @required this.colors2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 3),
            child: Text(
              name2,
              style: TextStyle(
                  color: colors2, fontWeight: FontWeight.bold, fontSize: 27),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 3),
            child: Text(
              name,
              style: TextStyle(
                  color: colors, fontWeight: FontWeight.bold, fontSize: 27),
            ),
          )
        ],
      ),
    );
  }
}
