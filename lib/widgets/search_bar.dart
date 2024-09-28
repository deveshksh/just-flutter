import 'package:flutter/material.dart';

class CustomSearchBarWithFilter extends StatelessWidget {
  final Function(String) onSearch;
  final VoidCallback onFilterTap;

  CustomSearchBarWithFilter({required this.onSearch, required this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Row(
        children: [
          // Search bar
          Expanded(
            child: TextField(
              onChanged: (value) => onSearch(value),
              decoration: InputDecoration(
                hintText: 'Search messages', // Placeholder for search bar
                prefixIcon: Icon(Icons.search, color: Colors.grey), // Search icon
                filled: true,
                fillColor: Colors.blue[50], // Light background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded edges
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 10), // Spacing between search bar and filter icon
          // Filter button
          GestureDetector(
            onTap: onFilterTap,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue[50], // Light background color
                shape: BoxShape.circle, // Circular filter icon button
              ),
              child: Icon(Icons.tune, color: Colors.blue), // Filter icon
            ),
          ),
        ],
      ),
    );
  }
}
