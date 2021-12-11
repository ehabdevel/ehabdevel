import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import '../api/annonce_service.dart';
// import '../api/annonce_model.dart';

Future<List<UtilisateurList>> fetchUtilisateurList() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/users'),
    headers: {
      // HttpHeaders.authorizationHeader:
      //     '1e15ba4e5483e7b32f283555e3f0bc2dc8f62d99',
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
    // return Utilisateur.fromJson(jsonDecode(response.body));
    return jsonResponse
        .map((utilisateur) => UtilisateurList.fromJson(utilisateur))
        .toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Utilisateur');
  }
}

class UtilisateurList {
  // final int annonce_id;
  final String name;
  // final String date;
  final int id;
  final String username;
  final String email;
  // final String country;
  // final String city;

  UtilisateurList({
    // required this.annonce_id,
    required this.name,
    // required this.date,
    required this.id,
    required this.email,
    required this.username,
    // required this.country,
    // required this.city,
  });

  factory UtilisateurList.fromJson(Map<String, dynamic> json) {
    return UtilisateurList(
      // annonce_id: json['annonce_id'],
      name: json['name'],
      // date: json['date'],
      id: json['id'],
      username: json['username'],
      email: json['email'],
      // country: json['country'],
      // city: json['city'],
    );
  }
}

class Demandeur extends StatefulWidget {
  const Demandeur({Key? key}) : super(key: key);

  @override
  _DemandeurState createState() => _DemandeurState();
}

class _DemandeurState extends State<Demandeur> {
  late Future<List<UtilisateurList>> futureUtilisateurList;

  @override
  void initState() {
    super.initState();
    futureUtilisateurList = fetchUtilisateurList();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<UtilisateurList>>(
        future: futureUtilisateurList,
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
                      leading: CircleAvatar(
                        backgroundColor: Colors.red[50],
                        child: Text('B'),
                        // Text(snapshot.data![index].annonce_id.toString()),
                      ),
                      title: Text(snapshot.data![index].username),
                      subtitle: Text("Desc:" +
                          snapshot.data![index].name +
                          // " City " +
                          // snapshot.data![index].city +
                          // " country " +
                          // snapshot.data![index].country +
                          // " date " +
                          // snapshot.data![index].date +
                          // " statut_user " +
                          // snapshot.data![index].statut_user +
                          // " user id " +
                          snapshot.data![index].id.toString()),
                      trailing: const Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Annonce(
                        //       id: snapshot.data![index].id,
                        //       groupage_et_rhesus: snapshot.data![index].groupage_et_rhesus,
                        //       tel: snapshot.data![index].tel,
                        //     ),
                        //   ),
                        // );
                      },
                    ),
                  ),
                );
              },
            );
            // child: Text(snapshot.data[i].groupage_et_rhesus));
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
