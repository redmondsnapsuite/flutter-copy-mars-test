import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_test/models/user_model.dart';
import 'package:mars_test/services/bloc/user_bloc.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserSetState) {
                  final user = state.user;
                  return Column(
                    children: [
                      Text('Employee ID: ${user.employeeId}'),
                      Text('Employee Name: ${user.employeeName}'),
                      Text('U: ${user.u}'),
                      Text('T: ${user.t}'),
                      Text('Company Name: ${user.companyName}'),
                    ],
                  );
                } else if (state is UserDeletedState) {
                  return Text('User deleted.');
                } else {
                  return Text('No user set.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
