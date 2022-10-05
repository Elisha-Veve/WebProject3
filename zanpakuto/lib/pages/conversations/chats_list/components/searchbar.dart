// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zanpakuto/api/api.dart';
import 'package:zanpakuto/blocs/auth/auth_bloc.dart';
import 'package:zanpakuto/models/user_model.dart';

class SearchBar extends SearchDelegate {
  // final Future<List<UserEntity>> listUsers = getUsers();
  // TODO: implement query
  @override
  List<Widget> buildActions(BuildContext context) {
    getUsers();
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            Navigator.pop(context);
          } else {
            query = "";
          }
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final state = AuthBloc().state;
    print("This is the state: $state");
    final List<String> userNamesList = [];
    final suggestionList = query.isEmpty
        ? userNamesList
        : userNamesList
            .where((element) =>
                element.toLowerCase().contains(query.toLowerCase()))
            .toList();
    print(suggestionList);
    return ShowSuggestions(
      suggestionList,
    );
  }

  ListView ShowSuggestions(List<String> suggestionList) {
    List searchPosition = [];
    for (var i = 0; i < suggestionList.length; i++) {
      if (suggestionList[i].toLowerCase().contains(query.toLowerCase())) {
        searchPosition
            .add(suggestionList[i].toLowerCase().indexOf(query.toLowerCase()));
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
          query = suggestionList[index];
        },
        leading: Icon(Icons.person),
        title: RichText(
          text: searchPosition[index] == 0
              ? TextSpan(
                  text: suggestionList[index].substring(0, query.length),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              : TextSpan(
                  text:
                      suggestionList[index].substring(0, searchPosition[index]),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: suggestionList[index].substring(
                          searchPosition[index],
                          searchPosition[index] + query.length),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: suggestionList[index]
                          .substring(searchPosition[index] + query.length),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}

Future<List<UserEntity>> getUsers() async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();

  var res = await CallApi().getData('user');
  var body = json.decode(res.body);
  List<dynamic> nameList = body['data'];
  List<UserEntity> userList = [];
  for (var i = 0; i < nameList.length; i++) {
    userList.add(UserEntity.fromJson(nameList[i]));
    print(userList[i].username);
  }
  return userList;
}
