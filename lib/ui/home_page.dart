import 'package:api_task/cubits/get_data/get_data_cubit.dart';
import 'package:api_task/db/insert_data_to_sql.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final AddData addData = AddData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      body: BlocBuilder<GetDataCubit, GetDataState>(
        builder: (context, state) {
          if (state.status == FormzStatus.submissionInProgress) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state.status == FormzStatus.submissionFailure) {
            return Text(state.errorText);
          } else if (state.status == FormzStatus.submissionSuccess) {
            addData.getAllCachedList();
            debugPrint(state.currencyData.length.toString());
            return ListView(
              children: List.generate(
                state.currencyData.length,
                (index) => ListTile(
                  title: Text(state.currencyData[index].title),
                  subtitle: Text(state.currencyData[index].code),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
