import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_test/models/user_model.dart';
import 'package:mars_test/screens/profile_screen.dart';
import 'package:mars_test/services/bloc/user_bloc.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Screen'),
      ),
      body: UserForm(),
    );
  }
}

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userBloc = context.read<UserBloc>();

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
            ),
          ),
          SizedBox(height: 16.0),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserSetState) {
                return Text('User: ${state.user.employeeName}');
              } else if (state is UserDeletedState) {
                return Text('User deleted.');
              } else {
                return Text('No user set.');
              }
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              final username = _usernameController.text;
              print(username);
              userBloc.add(SetUserEvent(new User(
                  employeeId: 12,
                  employeeName: username,
                  u: 123,
                  t: 123,
                  companyName: 'companyName')));
            },
            child: Text('Set User'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              userBloc.add(DeleteUserEvent());
            },
            child: Text('Delete User'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // userBloc.add(DeleteUserEvent());
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            child: Text('Profile Screen'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }
}
