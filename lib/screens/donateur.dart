import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<AnnonceList>> fetchAnnonceList() async {
  final response =
      await http.get(Uri.parse('https://sosblood.herokuapp.com/api/annonces'));

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
  final String titre;
  final String description;
  final String date;
  final String statut_user;
  final String position;

  AnnonceList({
    // required this.userId,
    required this.id,
    required this.titre,
    required this.description,
    required this.date,
    required this.statut_user,
    required this.position,
  });

  factory AnnonceList.fromJson(Map<String, dynamic> json) {
    return AnnonceList(
      // userId: json['userId'],
      id: json['id'],
      titre: json['titre'],
      description: json['description'],
      date: json['date'],
      statut_user: json['statut_user'],
      position: json['position'],
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
                      leading: const Icon(Icons.bloodtype,
                          color: Colors.green, size: 30),
                      title: Text(snapshot.data![index].titre),
                      subtitle: Text(snapshot.data![index].statut_user +
                          " - " +
                          snapshot.data![index].date),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
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
