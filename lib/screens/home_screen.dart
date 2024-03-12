import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertask/screens/company_info.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> movies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    try {
      var response = await http.post(
        Uri.parse('https://hoblist.com/api/movieList'),
        body: {
          'category': 'movies',
          'language': 'kannada',
          'genre': 'all',
          'sort': 'voting',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          movies = jsonDecode(response.body)['result'];
        });
      } else {
        print('Failed to load movies');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movies',
          style: TextStyle(color: Colors.blue, fontSize: 30),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CompanyInfo()));
            },
            icon: Icon(
              Icons.info,
              size: 30,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return ListTile(
            subtitle: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.arrow_drop_up_sharp,
                          size: 50,
                        ),
                        Text(
                          '${movies[index]['voting']}',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 50,
                        ),
                        Text('Votes')
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.network(
                      movies[index]['poster'],
                      width: 65,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movies[index]['title'],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text('Genre: ${movies[index]['genre']}'),
                        Text('Director: ${movies[index]['genre']}'),
                        Container(
                          width: 200,
                          child: Text(
                            'Starring: ${movies[index]['stars']}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            Text('Mins'),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 3),
                              child: Container(
                                height: 15,
                                width: 1,
                                color: Color.fromARGB(255, 78, 76, 76),
                              ),
                            ),
                            Text('English'),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 3),
                              child: Container(
                                height: 15,
                                width: 1,
                                color: Color.fromARGB(255, 78, 76, 76),
                              ),
                            ),
                            Text('2 Apr')
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '${movies[index]['pageViews']}:views',
                              style: TextStyle(color: Colors.blue),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 3),
                              child: Container(
                                height: 15,
                                width: 1,
                                color: Color.fromARGB(255, 78, 76, 76),
                              ),
                            ),
                            Text(
                              'Voted by ${movies[index]['voting']} people',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 48, 160, 253),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      fixedSize: Size(360, 45),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Watch Trailer',
                      style: TextStyle(color: Colors.white),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 1,
                    width: 550,
                    color: Color.fromARGB(255, 78, 76, 76),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
