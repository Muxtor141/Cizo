import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

class SelectCountry extends Cubit<List<String>> {
  SelectCountry() : super([]);

  List<String> currentList = [];

  Future<List<String>> getCountries() async {
    final response =
        await http.get(Uri.parse('https://restcountries.eu/rest/v2/'));
    if (response.statusCode == 200) {
      List<dynamic> bodyList = jsonDecode(response.body);
      List<String> newList = [];
      for (var country in bodyList) {
        newList.add(country['name']);
      }
      return newList;
    } else {
      print('NO CONNECTION');
      return [];
    }
  }

  sortByWord(String word) {
    var list = currentList.where((element) {
      return element.contains(word);
    }).toList();
    emit(list);
  }

  void updateList() {
    getCountries().then((value) {
      currentList = value;
      emit(value);
    });
  }

  void sortList(String word) {
    sortByWord(word);
  }
}
