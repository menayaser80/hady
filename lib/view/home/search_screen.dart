// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:lava/constatnt.dart';
import 'package:lava/view/home/home_page.dart';
import 'package:lava/view/widget/custom_backIcon_widget.dart';
import 'package:lava/view/widget/search_texr_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

TextEditingController searchController = TextEditingController();

class _SearchScreenState extends State<SearchScreen> {
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackIcon(),
        title: SearchTextField(
          enabled: true,
          controller: searchController,
          onChanged: (value) {
            setState(() {});
          },
          suffixIcon:
              searchController.text.isNotEmpty ? Icons.cancel_outlined : null,
          onTapSuffixIcon: () {
            searchController.clear();
          },
          onEditingComplete: () {
            HomePage.names.add(searchController.text);
            Navigator.push(context, MaterialPageRoute(builder: ((context) {
              return HomePage();
            })));
          },
        ),
      ),
      //search pervious
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Search',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Clear all',
                    style: TextStyle(
                        fontSize: 12,
                        color: kGreyColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: HomePage.names.length,
                itemBuilder: (context, index) => previousSearchsItem(index)),
          ],
        ),
      ),
    );
  }
}

previousSearchsItem(int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: InkWell(
      onTap: () {},
      child: Dismissible(
        key: GlobalKey(),
        onDismissed: (DismissDirection dir) {},
        child: Row(
          children: [
            const Icon(
              Icons.access_time_rounded,
              color: kGreyColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              HomePage.names[index],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  HomePage.names.removeAt(index);
                },
                icon: Icon(Icons.cancel_outlined))
          ],
        ),
      ),
    ),
  );
}

class DataSearch extends SearchDelegate {
  static List names = [
    'hady',
    'mohamed',
    'wael',
    'abdo',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != null && names.contains(query.toLowerCase())) {
      return ListTile(
        title: Text(query),
        onTap: () {},
      );
    } else if (query == '') {
      return Text('');
    } else {
      return ListTile(
        title: Text('No Result Found'),
        onTap: () {},
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filterNames =
        names.where((element) => element.contains(query)).toList();
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: query == '' ? names.length : filterNames.length,
        itemBuilder: (context, index) {
          return previousSearchsItem(index);
          // InkWell(
          //   onTap: () {
          //     showResults(context);
          //   },
          //   child: Container(
          //     padding: EdgeInsets.all(10),
          //     child: query == ''
          //         ? Text(
          //             names[index],
          //             style:
          //                 TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          //           )
          //         : Text(
          //             filterNames[index],
          //             style:
          //                 TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          //           ),
          //   ),
          // );
        });
  }
}
