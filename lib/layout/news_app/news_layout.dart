import 'package:first_project/layout/news_app/cubit/cubit.dart';
import 'package:first_project/layout/news_app/cubit/states.dart';
import 'package:first_project/shareed/cubit/cubit.dart';
import 'package:first_project/shareed/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
    listener: (context, state){},
      builder: (context,state){

      var cubit = NewsCubit.get(context);

      return Scaffold(
        appBar: AppBar(
          title: Text(
            'News App',
          ),
          actions: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.search,
                )
            ),
            IconButton(
                onPressed: ()
                {
                  AppCubit.get(context).changeAppMode();
                },
                icon: Icon(Icons.brightness_4_outlined,
                  )
            ),

          ],

        ),
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index)
          {
            cubit.changeBottomNavBar(index);

          },
          items: cubit.bottomItems,
        ),
      );
      },
    );
  }
}
