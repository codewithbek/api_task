import 'package:api_task/cubits/connectivity/connectivity_cubit.dart';
import 'package:api_task/cubits/get_data/get_data_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repository/nbu_repository.dart';
import 'routes/router.dart';
import 'service/open_api_service.dart';
import 'utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OpenApiService openApiService =
      OpenApiService();
  // I will not use Multi repository. However I don't need to it.
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetDataCubit(
            nbuRepository: NbuRepository(
              openApiService: openApiService,
            ),
          )..getCategories(),
        ),
        BlocProvider(
          create: (context) => ConnectivityCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: home,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
