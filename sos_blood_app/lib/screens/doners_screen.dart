import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphQLConf.dart';
import '../services/queryMutation.dart';
import '../model/user_model.dart';

class DonersScreen extends StatefulWidget {
  const DonersScreen({Key? key}) : super(key: key);

  @override
  _DonersScreenState createState() => _DonersScreenState();
}

class _DonersScreenState extends State<DonersScreen> {
  var listDoners = [];
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  void getDoners() async {
    QueryMutation queryDoners = QueryMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
          document: gql(queryDoners.getUsers()),
          variables: {"isDonator": true}),
    );
    if (result.hasException) {
      print(result.exception.toString());
    } else {
      print(result.data);
      setState(() {
        listDoners = result.data!['allProfiles'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDoners();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ListView.builder(
          itemCount: listDoners.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.teal[50],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(listDoners[index]['bloodType']),
                  ),
                ),
                title: Text(listDoners[index]['user']['username']),
                subtitle: Row(
                  children: [
                    const Expanded(
                      flex: 0,
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Colors.green,
                        size: 15,
                      ),
                    ),
                    Expanded(
                      child: Text(listDoners[index]['city']),
                    ),
                    Expanded(
                      child: Text(listDoners[index]['user']['dateJoined']),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
