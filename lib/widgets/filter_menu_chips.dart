import 'package:flutter/material.dart';

class FilterMenuChips extends StatefulWidget {
  const FilterMenuChips({super.key});

  @override
  State<FilterMenuChips> createState() =>
      _FilterMenuChipsState();
}

class _FilterMenuChipsState
    extends State<FilterMenuChips> {
  final Map<String, List<String>> filters = {
    "Renk": ["Kırmızı", "Mavi", "Yeşil"],
    "Beden": ["S", "M", "L"],
    "Marka": ["Nike", "Adidas", "Puma"],
  };
  final Set<String> selectedFilter = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category Selection"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Text(
            "Filtereler",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          ...filters.entries.map((entry) {
            final kategori = entry.key;
            final secenekler = entry.value;
            return ExpansionTile(
              title: Text(kategori),
              children: secenekler.map((secenek) {
                return CheckboxListTile(
                  title: Text(secenek),
                  value: selectedFilter.contains(
                    secenek,
                  ),
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        selectedFilter.add(
                          secenek,
                        );
                      } else {
                        selectedFilter.remove(
                          secenek,
                        );
                      }
                    });
                  },
                );
              }).toList(),
            );
          }).toList(),
          Divider(height: 32),
          Text(
            "Seçilen Filtreler",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: selectedFilter.map((
              filter,
            ) {
              return Chip(
                label: Text(filter),
                onDeleted: () {
                  setState(() {
                    selectedFilter.remove(filter);
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
