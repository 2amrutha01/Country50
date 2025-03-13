import 'package:flutter/material.dart';

class CountryProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();

  final List<String> _allCountries = [
    "United States",
    "Canada",
    "Mexico",
    "Brazil",
    "Argentina",
    "United Kingdom",
    "Germany",
    "France",
    "Italy",
    "Spain",
    "Russia",
    "China",
    "Japan",
    "India",
    "South Korea",
    "Australia",
    "South Africa",
    "Egypt",
    "Nigeria",
    "Kenya",
    "Saudi Arabia",
    "United Arab Emirates",
    "Turkey",
    "Iran",
    "Pakistan",
    "Bangladesh",
    "Indonesia",
    "Malaysia",
    "Thailand",
    "Vietnam",
    "Philippines",
    "Singapore",
    "New Zealand",
    "Sweden",
    "Norway",
    "Denmark",
    "Finland",
    "Poland",
    "Czech Republic",
    "Greece",
    "Portugal",
    "Ukraine",
    "Israel",
    "Colombia",
    "Peru",
    "Chile",
    "Venezuela",
    "Cuba",
    "Bolivia",
    "Ecuador"
  ];

  List<String> _filteredCountries = [];

  List<String> get filteredCountries =>
      _filteredCountries.isEmpty ? _allCountries : _filteredCountries;

  CountryProvider() {
    searchController.addListener(() {
      filterCountries(searchController.text);
    });
  }

  void filterCountries(String query) {
    if (query.isEmpty) {
      _filteredCountries = [];
    } else {
      _filteredCountries = _allCountries
          .where(
              (country) => country.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
