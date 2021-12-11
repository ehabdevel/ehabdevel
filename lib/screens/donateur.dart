import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'chat_screen.dart';

Future<List<AnnonceList>> fetchAnnonceList() async {
  final response = await http.get(
    // Uri.parse('https://sosblood.herokuapp.com/users/'),
    Uri.parse('https://jsonplaceholder.typicode.com/users'),
    headers: {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          'true', // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS",
      HttpHeaders.authorizationHeader:
          '1e15ba4e5483e7b32f283555e3f0bc2dc8f62d99',
      HttpHeaders.accessControlAllowOriginHeader: '*',
      // HttpHeaders.accessControlAllowOriginHeader:
      //     'https://sosblood.herokuapp.com/api/annonces',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.accessControlAllowCredentialsHeader: 'true',
      HttpHeaders.accessControlAllowHeadersHeader:
          'Origin, X-Requested-With, Content-Type, Accept',
      HttpHeaders.accessControlAllowMethodsHeader:
          'GET, POST, PUT, DELETE, OPTIONS',
      HttpHeaders.accessControlMaxAgeHeader: '1728000',
      HttpHeaders.cacheControlHeader: 'no-cache',
      HttpHeaders.pragmaHeader: 'no-cache',
      HttpHeaders.expiresHeader: '0',
      HttpHeaders.dateHeader: '0',
      HttpHeaders.connectionHeader: 'keep-alive',
      HttpHeaders.varyHeader: 'Origin',
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List jsonResponse = json.decode(response.body);
    // return Annonce.fromJson(jsonDecode(response.body));
    return jsonResponse
        .map((annonce) => AnnonceList.fromJson(annonce))
        .toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Annonce');
  }
}

class AnnonceList {
  // final int userId;
  final int id;
  final String username;
  final String name;
  // final String address;
  final String email;
  // final String zipcode;

  AnnonceList({
    // required this.userId,
    required this.id,
    required this.username,
    required this.name,
    // required this.address,
    required this.email,
    // required this.zipcode,
  });

  factory AnnonceList.fromJson(Map<String, dynamic> json) {
    return AnnonceList(
      // userId: json['userId'],
      id: json['id'],
      username: json['username'],
      name: json['name'],
      // address: json['address'],
      email: json['email'],
      // zipcode: json['zipcode'],
    );
  }
}

class Donateur extends StatefulWidget {
  const Donateur({Key? key}) : super(key: key);

  @override
  _DonateurState createState() => _DonateurState();
}

class _DonateurState extends State<Donateur> {
  late Future<List<AnnonceList>> futureAnnonceList;

  @override
  void initState() {
    super.initState();
    futureAnnonceList = fetchAnnonceList();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<AnnonceList>>(
        future: futureAnnonceList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.teal[50],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Icon(Icons.bloodtype,
                              color: Colors.green, size: 30),
                        ),
                      ),
                      title: Text(snapshot.data![index].username),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                              flex: 0,
                              child: Icon(Icons.location_on_outlined,
                                  color: Colors.green, size: 15)),
                          Expanded(
                            flex: 8,
                            child: Text(snapshot.data![index].name),
                          ),
                          const Expanded(
                            flex: 0,
                            child: Icon(Icons.date_range,
                                color: Colors.green, size: 15),
                          ),
                          Expanded(
                            flex: 0,
                            child:
                                Text(' ' + snapshot.data![index].id.toString()),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.add_box_outlined,
                          color: Colors.green, size: 30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatScreen(
                                // peerId: snapshot.data![index].id,
                                // peerAvatar: snapshot.data![index].name,
                                ),
                          ),
                        );
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => AnnonceDetail(
                        //       id: snapshot.data![index].id,
                        //       titre: snapshot.data![index].titre,
                        //       description: snapshot.data![index].description,
                        //       date: snapshot.data![index].date,
                        //       statut_user: snapshot.data![index].statut_user,
                        //       position: snapshot.data![index].position,
                        //     ),
                        //   ),
                        // );
                      },
                    ),
                  ),
                );
              },
            );
            // child: Text(snapshot.data[i].titre));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
