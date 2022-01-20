import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphQLConf.dart';
import '../services/queryMutation.dart';
import '../model/demand_model.dart';

class DemandsScreen extends StatefulWidget {
  const DemandsScreen({Key? key}) : super(key: key);

  @override
  _DemandsScreenState createState() => _DemandsScreenState();
}

class _DemandsScreenState extends State<DemandsScreen> {
  var listDemands = [];
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  void getDemands() async {
    QueryMutation queryDemand = QueryMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(queryDemand.getAll()),
      ),
    );
    if (result.hasException) {
      print(result.exception.toString());
    }
    if (result.data != null) {
      print(result.data);
      setState(() {
        listDemands = result.data!['allDemands'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDemands();
  }

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(QueryMutation().getAll()),
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }
        if (result.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          // itemCount: result.data!['allDemands'].length,
          itemCount: listDemands.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: Text(
                  listDemands[index]['bloodType'],
                  style: const TextStyle(fontSize: 20),
                ),
                title: Text(listDemands[index]['title']),
                subtitle: Text(listDemands[index]['author']['user']
                        ['username'] +
                    ' - ' +
                    listDemands[index]['city'] +
                    ' - ' +
                    listDemands[index]['address1']),
                isThreeLine: true,
                trailing: Text(listDemands[index]['country']),
              ),
            );
          },
        );
      },
    );
  }
}
