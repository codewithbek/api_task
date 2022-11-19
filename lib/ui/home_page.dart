import 'package:api_task/cubits/connectivity/connectivity_cubit.dart';
import 'package:api_task/cubits/get_data/get_data_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.watch<GetDataCubit>().state.isInternet),
        centerTitle: true,
      ),
      body: BlocListener<ConnectivityCubit, ConnectivityState>(
        listener: (context, internetState) {
          if (internetState.connectivityResult == ConnectivityResult.none) {
            context.read<GetDataCubit>().getCategoriesFromDB();
          } else {
            context.read<GetDataCubit>().getCategories();
          }
        },
        child: BlocBuilder<GetDataCubit, GetDataState>(
          builder: (context, dataState) {
            debugPrint(dataState.currencyData.length.toString());
            return dataState.status.isSubmissionInProgress
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: dataState.currencyData.length,
                    itemBuilder: (context, index) {
                      var nbu = dataState.currencyData[index];
                      return ListTile(
                        title: Text(nbu.title),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
