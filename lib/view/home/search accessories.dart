import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:lava/model/car%20model.dart';

import 'package:lava/provider/accsessory%20provider.dart';
import 'package:lava/view/widget/Home/search%20acc%20widget.dart';
import 'package:lava/view/widget/title%20widget.dart';
import 'package:provider/provider.dart';

class searchaccessories extends StatefulWidget {
  const searchaccessories({super.key});

  @override
  State<searchaccessories> createState() => _searchaccessoriesState();
}

class _searchaccessoriesState extends State<searchaccessories> {
  late TextEditingController searchTextController;

  @override
  void initState() {
    searchTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  List<Carmodel> productListSearch = [];
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<AccessoriesProvider>(context);

    List<Carmodel> productList =
        productsProvider.products;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: StreamBuilder<List<Carmodel>>(
            stream: productsProvider.fetchProductsStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: SelectableText(snapshot.error.toString()),
                );
              } else if (snapshot.data == null) {
                return const Center(
                  child: SelectableText("No medicines has been added"),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      controller: searchTextController,
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            // setState(() {
                            FocusScope.of(context).unfocus();
                            searchTextController.clear();
                            // });
                          },
                          child: const Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      onSubmitted: (value) {
                        setState(() {
                          productListSearch = productsProvider.searchQuery(
                              searchText: searchTextController.text,
                              passedList: productList);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    if (searchTextController.text.isNotEmpty &&
                        productListSearch.isEmpty) ...[
                      const Center(
                        child: TitlesTextWidget(label: "No products found"),
                      ),
                    ],
                    Expanded(
                      child: DynamicHeightGridView(
                        itemCount: searchTextController.text.isNotEmpty
                            ? productListSearch.length
                            : productList.length,
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        builder: (context, index) {
                          return SearchAccwidget(
                            productId: searchTextController.text.isNotEmpty
                                ? productListSearch[index].Id
                                : productList[index].Id,
                            placeModel: searchTextController.text.isNotEmpty
                                ? productListSearch[index]
                                : productList[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}