import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class SemanticsLiveRegionPage extends StatefulWidget {
  const SemanticsLiveRegionPage({super.key});

  @override
  State<SemanticsLiveRegionPage> createState() => _SemanticsLiveRegionPageState();
}

class _SemanticsLiveRegionPageState extends State<SemanticsLiveRegionPage> {
    final TextEditingController _searchController = TextEditingController();
  final List<String> _items = List.generate(100, (index) => 'Item $index');
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _items;
    _searchController.addListener(_filterItems);
  }

  void _filterItems() async{
    final query = _searchController.text.toLowerCase();
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
            
      _filteredItems = _items
          .where((item) => item.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Semantics(liveRegion: true, sortKey: const OrdinalSortKey(0), child: Text("There are ${_filteredItems.length} search results.")),
          Expanded(
            child: Semantics(sortKey: const OrdinalSortKey(1),
              child: ListView.builder(addSemanticIndexes: false,
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Semantics(liveRegion: true, sortKey:  OrdinalSortKey(index+2), child: Text(_filteredItems[index])),
                  );
                },
              ),
            ),
          ),
        ],
      ),);
  }
}