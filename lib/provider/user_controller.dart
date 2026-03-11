import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../repository/user_repository.dart';
class UserProvider extends ChangeNotifier {
  final UserService _service = UserService();
  List<UserModel> users = [];
  List<UserModel> filteredUsers = [];
  bool isLoading = false;
  bool isApiLoading = false;
  bool hasMore = true;
  int skip = 0;
  String? genderFilter;
  String? errorMessage;

  void filterGender(String? gender) {
    users.clear();
    filteredUsers.clear();
    skip = 0;
    hasMore = true;
    genderFilter = gender;
    fetchUsers();
  }

  Future fetchUsers() async {
    if (isLoading || !hasMore) return;
    try {
      isApiLoading = true;
      isLoading = true;
      errorMessage = null;
      notifyListeners();
      final newUsers =
      await _service.fetchUsers(skip, gender: genderFilter);
      print("Gender => $genderFilter");
      if (newUsers.isEmpty) {
        hasMore = false;
      } else {
        skip += 10;
        users.addAll(newUsers);
        filteredUsers = List.from(users);
      }

    } catch (e) {

      errorMessage = e.toString();

    } finally {

      isApiLoading = false;
      isLoading = false;

      notifyListeners();
    }
  }

  void search(String query) {

    filteredUsers = users.where((user) {

      return user.firstName
          .toLowerCase()
          .contains(query.toLowerCase()) ||
          user.lastName
              .toLowerCase()
              .contains(query.toLowerCase());

    }).toList();

    notifyListeners();
  }

  // void sortAZ() {
  //
  //   filteredUsers
  //       .sort((a, b) => a.firstName.compareTo(b.firstName));
  //
  //   notifyListeners();
  // }
  //
  // void sortZA() {
  //
  //   filteredUsers
  //       .sort((a, b) => b.firstName.compareTo(a.firstName));
  //
  //   notifyListeners();
  // }

  Future refresh() async {

    users.clear();
    filteredUsers.clear();

    skip = 0;
    hasMore = true;

    await fetchUsers();
  }
}