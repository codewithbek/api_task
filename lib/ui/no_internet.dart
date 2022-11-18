import 'package:api_task/cubits/connectivity/connectivity_cubit.dart';
import 'package:api_task/db/insert_data_to_sql.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NoInternetScreen extends StatelessWidget {
   NoInternetScreen({Key? key, required this.voidCallback})
      : super(key: key);

  final VoidCallback voidCallback;
  final AddData addData = AddData();


  @override
  Widget build(BuildContext context) {
    var data = addData.malumotlar;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            ...List.generate(
              data.length,
                  (index) => ListTile(
                title: Text(data[index].title),
                subtitle: Text(data[index].code),
              ),
            ),
            BlocListener<ConnectivityCubit, ConnectivityState>(
              listener: (context, state) {
                if (state.connectivityResult != ConnectivityResult.none) {
                  voidCallback.call();
                  Navigator.pop(context);
                }
              },
              child: const SizedBox(),
            )
          ]
        )
    ));
  }
}
/*

 */