import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odcorange/core/constants/App_Colors.dart';
import 'package:odcorange/core/constants/styles.dart';
import 'package:odcorange/features/home/logic/home_cubit/home_cubit.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HomeCubit()..getProducts()..
  getUserData()..getCategories(),
  child: BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.grey,
            currentIndex:  context.read<HomeCubit>().index,
            onTap: (index){
              context.read<HomeCubit>().changeIndex(index);
            },
            items:  context.read<HomeCubit>().items),
      body: context.read<HomeCubit>().screens
      [context.read<HomeCubit>().index],
      ),
    );
  },
),
);
  }
}
