import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/component.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';


class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context , state){
        var list = NewsCubit.get(context).search;
        return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value){
                      NewsCubit.get(context).getSearch(value);
                    },
                    validator: (value){
                      if (value!.isEmpty){
                        return "Enter your text";
                      }
                      return null;
                    },
                    decoration: InputDecoration(

                      border: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(5.0),
                      ),

                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search ,),
                    ),
                  ),
                ),
                Expanded(child: articleBuilder(list,)),
              ],
            )
        );
      },
    );
  }
}