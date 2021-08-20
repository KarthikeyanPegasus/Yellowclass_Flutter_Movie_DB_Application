import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:yellowclass/Screens/Addinto/Addinto.dart';
import 'package:yellowclass/Screens/Dashboard/Dashboard.dart';
import 'package:yellowclass/Screens/EditHome/EditHome.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../Moviemodel.dart';
import '../../../constants.dart';

final myController = TextEditingController();

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Box<Moviemodel> moviebox = Hive.box<Moviemodel>("movieinfo");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Pictureautoscroll(
            size: size,
            url:
                "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQA_-tL18_rj9zEcjN6n41NEaJm-kRNF9UeOtvksZ4z_OW6jRA9",
            directorname: ": Russel Brothers",
            movie: "Avengers Endgame",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Title(
                    name: " History",
                    colors: Color(0xFFDA0037),
                    name2: "Yours",
                    colors2: Colors.white),
              ),
              Container(
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Addinto()));
                    },
                    child: Text(
                      "+",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
            ],
          ),
          Recentcarosel(),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(top: 60),
            width: size.width,
            height: 55,
            color: Color(0xFF30302E),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 55,
                    alignment: Alignment.center,
                    child: FlatButton(
                      child: Image.asset("assets/icons/dashboard.png"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard()));
                      },
                    )),
                Container(
                    height: 55,
                    alignment: Alignment.center,
                    child: FlatButton(
                      child: Image.asset("assets/icons/edit.png"),
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Edithome()));
                      },
                    )),
                Container(
                    height: 55,
                    alignment: Alignment.center,
                    child: FlatButton(
                      child: Image.asset("assets/icons/me.png"),
                      onPressed: () {
                        // Navigator.push(context,
                        // MaterialPageRoute(builder: (context) => Addinto()));
                      },
                    ))
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class Recentcarosel extends StatefulWidget {
  const Recentcarosel({Key key}) : super(key: key);

  @override
  _RecentcaroselState createState() => _RecentcaroselState();
}

class _RecentcaroselState extends State<Recentcarosel> {
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder(
            valueListenable: moviebox.listenable(),
            builder: (context, Box<Moviemodel> movies, _) {
              List<int> keys = movies.keys.cast<int>().toList();
              log(keys.toString());
              return ListView.separated(
                itemBuilder: (_, index) {
                  int key = keys[index];
                  Moviemodel movie = movies.get(key);

                  return ListTile(
                      title: RawMaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: kprimaryColor,
                              content: SingleChildScrollView(
                                child: Container(
                                  color: kprimaryColor,
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 30),
                                        child: Text(
                                          "Edit",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 27,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Image.network(
                                        movie.link,
                                        width: 300,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        child: Textfieldcontainer(
                                          child: TextField(
                                              controller: moviename,
                                              style: TextStyle(
                                                  color: Colors.white),
                                              decoration: InputDecoration(
                                                  hintText: "Movie Name",
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                  ))),
                                        ),
                                      ),
                                      Container(
                                        child: Textfieldcontainer(
                                          child: TextField(
                                              controller: directorname,
                                              style: TextStyle(
                                                  color: Colors.white),
                                              decoration: InputDecoration(
                                                  hintText: "Director Name",
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                  ))),
                                        ),
                                      ),
                                      Container(
                                        child: Textfieldcontainer(
                                          child: TextField(
                                              controller: linkdetail,
                                              style: TextStyle(
                                                  color: Colors.white),
                                              decoration: InputDecoration(
                                                  hintText: "Link",
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                  ))),
                                        ),
                                      ),
                                      Container(
                                        child: Textfieldcontainer(
                                          child: TextField(
                                              controller: genre,
                                              style: TextStyle(
                                                  color: Colors.white),
                                              decoration: InputDecoration(
                                                  hintText: "Genre",
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                  ))),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: FlatButton(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20),
                                            color: Color(0xFF60E89A),
                                            onPressed: () {
                                              Moviemodel moviemodela =
                                                  Moviemodel(
                                                      moviename: moviename.text,
                                                      directorname:
                                                          directorname.text,
                                                      genre: genre.text,
                                                      link: linkdetail.text);
                                              log(key.toString());
                                              moviebox.put(key, moviemodela);
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop();
                                            },
                                            child: Text("SAVE",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: FlatButton(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20),
                                            color: Color(0xFFDA0037),
                                            onPressed: () {
                                              moviebox.delete(key);
                                              // key--;
                                              log(moviebox.get(0).toString());
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop();
                                            },
                                            child: Text("DELETE",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Column(
                      children: [
                        Image.network(
                          movie.link,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          movie.moviename,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ));
                },
                separatorBuilder: (_, index) => Divider(),
                itemCount: keys.length,
                shrinkWrap: true,
              );
            })
      ],
    );
  }
}

class Pictureautoscroll extends StatelessWidget {
  final String url, movie, directorname;
  const Pictureautoscroll({
    Key key,
    @required this.size,
    @required this.url,
    @required this.movie,
    @required this.directorname,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
              child: Image.network(
            "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQA_-tL18_rj9zEcjN6n41NEaJm-kRNF9UeOtvksZ4z_OW6jRA9", //get from the database
            width: size.width,
            height: 581,
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
          )),
          Image.asset(
            "assets/images/greyshade.png",
            width: size.width,
          ),
          Image.asset(
            "assets/images/shadegrey.png",
            width: size.width,
          ),
          Title(
            name: "Recent",
            name2: "Yours",
            colors: Color(0xFFDA0037),
            colors2: Colors.white,
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.fromLTRB(33, 450, 0, 0),
                child: Text(
                  "Avengers Endgame",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Title(
                  name: " Russel Brothers",
                  colors: Colors.white,
                  name2: "Director:",
                  colors2: Color(0xFFFA7D09))
            ],
          ),
        ],
      ),
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
      margin: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
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
