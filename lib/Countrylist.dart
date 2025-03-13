import 'package:country50/CountryProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryListScreen extends StatelessWidget {
  const CountryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CountryProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 50),
              child: TextField(
                controller: provider.searchController,
                style: const TextStyle(
                  fontStyle: FontStyle.italic, // Italic text style
                  fontSize: 16,
                  color: Colors.blueAccent, // Same color as the border
                ),
                decoration: InputDecoration(
                  labelText: 'Search...',
                  labelStyle: const TextStyle(
                    fontStyle: FontStyle.italic, // Italic label text
                    color: Colors.blueAccent, // Same as border color
                  ),
                  prefixIcon: const Icon(Icons.search,
                      color: Colors.blueAccent), // Icon color same as border
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.blueAccent, width: 2.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                ),
              )),
          Expanded(
            child: Consumer<CountryProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  itemCount: provider.filteredCountries.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.blueAccent, width: 1),
                      ),
                      child: Text(
                        provider.filteredCountries[index],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
