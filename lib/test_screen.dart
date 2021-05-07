import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  FloatingSearchBarController _floatingSearchBarController = FloatingSearchBarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Hello Floating'),),
      body: Stack(
              children: [
                Center(
                  child: Text('World'),
                ), 
                _searchBar(),
              ]
      ),
    );
  }

  Widget _searchBar() {
    return FloatingSearchBar(
      controller: _floatingSearchBarController,
      backdropColor: Colors.transparent,
      hint: 'Search...',
      clearQueryOnClose: true, // INSERT THIS
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      openAxisAlignment: 0.0,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction.icon(
              showIfClosed: false,
              showIfOpened: true,
              icon: Icon(Icons.clear),
              onTap: () {
                // FloatingSearchBar.of(context)
                _floatingSearchBarController.clear();
                _floatingSearchBarController.close();
                // FloatingSearchBar.of(context).close();
                // final bar = FloatingSearchAppBar.of(context);
                // bar.clear();
                // print(bar);
        }),
        
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
