import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import '../api/annonce_service.dart';
// import '../api/annonce_model.dart';

Future<List<UtilisateurList>> fetchUtilisateurList() async {
  final response = await http
      .get(Uri.parse('https://sosblood.herokuapp.com/api/utilisateurs'));

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
  // final int id;
  // final String user;
  final String groupage_et_rhesus;
  final String tel;

  UtilisateurList({
    // required this.id,
    // required this.user,
    required this.groupage_et_rhesus,
    required this.tel,
  });

  factory UtilisateurList.fromJson(Map<String, dynamic> json) {
    return UtilisateurList(
      // id: json['id'],
      // user: json['user'],
      groupage_et_rhesus: json['groupage_et_rhesus'],
      tel: json['tel'],
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
                        child: Text(snapshot.data![index].groupage_et_rhesus),
                      ),
                      title: Text(snapshot.data![index].tel),
                      subtitle: Text(snapshot.data![index].tel),
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
