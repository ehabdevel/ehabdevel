import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../graphQLConf.dart';
import '../services/queryMutation.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

enum FrormType { login, register }

class _AuthScreenState extends State<AuthScreen> {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation addMutation = QueryMutation();

  final TextEditingController _emailFilter = TextEditingController();
  final TextEditingController _passwordFilter = TextEditingController();

  FrormType _formType = FrormType.login;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _errorMessage = '';

  bool _isLoading = false;

  _AuthScreenState() {
    _emailFilter.addListener(() {
      if (_emailFilter.text.isEmpty) {
        _email = "";
      } else {
        _email = _emailFilter.text;
      }
    });
    _passwordFilter.addListener(() {
      if (_passwordFilter.text.isEmpty) {
        _password = "";
      } else {
        _password = _passwordFilter.text;
      }
    });
  }

  void _submit() {
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    if (_formType == FrormType.login) {
      // Log user in
      _loginPressed();
    } else {
      // Sign user up
      _createAccountPressed();
    }
  }

  void _createAccountPressed() async {
    print('Create Account Pressed with $_email and $_password');
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.mutate(
      MutationOptions(
        document: addMutation.register(_email, '', _password),
      ),
    );
    if (result.data!["success"] != null) {
      print('The user was created successfully!');
    } else {
      print('There was an error!');
      print(result.data!["register"]["errors"]["email"][0]["message"]);
    }
  }

  void _loginPressed() {
    print('Login Pressed with $_email and $_password');
  }

  void _passwordReset() {
    print('Password Reset Request with $_email');
  }

  void _switchFormState(FrormType formType) {
    _formKey.currentState!.reset();
    setState(() {
      _formType = formType;
    });
  }

  void _changeFormType() {
    setState(() {
      _formType =
          _formType == FrormType.login ? FrormType.register : FrormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/Back.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width / 2,
                            maxHeight: MediaQuery.of(context).size.height / 4),
                        child: Image.asset(
                          'assets/images/PNG.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Form(
                      key: _formKey,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width / 2),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              fit: FlexFit.loose,
                              child: TextField(
                                controller: _emailFilter,
                                decoration:
                                    const InputDecoration(labelText: 'Email'),
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: TextField(
                                controller: _passwordFilter,
                                decoration: const InputDecoration(
                                    labelText: 'Password'),
                                obscureText: true,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Flexible(
                              fit: FlexFit.loose,
                              child: TextButton(
                                child: const Text('Submit'),
                                onPressed: _submit,
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: TextButton(
                                child: Text(
                                  _formType == FrormType.login
                                      ? 'Dont\'t have account? Register!'
                                      : 'Already have an account? Login!',
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                onPressed: _changeFormType,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
