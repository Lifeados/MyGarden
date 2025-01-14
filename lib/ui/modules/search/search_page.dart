import 'package:flutter/material.dart';
import 'package:my_garden/data/usecase/remote_load_product.dart';
import 'package:my_garden/domain/models/product_model.dart';
import 'package:my_garden/shared/components/custom_product_card.dart';
import 'package:my_garden/shared/components/custom_text_field.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:my_garden/ui/helpers/i18n/resources.dart';
import 'package:my_garden/ui/modules/search/components/category_tile.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();
  String currentQuery = '';
  String? selectedCategory;
  List<ProductModel> filteredProducts = [];

  void onUpdateSearchQuery(String query) {
    setState(() {
      currentQuery = query;
      selectedCategory = null;
      filteredProducts = [];
    });
  }

  void filterByCategory(String category, List<ProductModel> allProducts) {
    setState(() {
      selectedCategory = category;
      filteredProducts =
          allProducts.where((product) => product.category == category).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final remoteLoadProduct = Provider.of<RemoteLoadProduct>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 32,
          ),
          child: Column(
            spacing: 16,
            children: [
              Row(
                spacing: 6,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextField(
                      label: R.string.searchFieldLabel,
                      onChange: onUpdateSearchQuery,
                      inputController: searchController,
                    ),
                  ),
                  currentQuery != ''
                      ? TextButton(
                          onPressed: () {
                            setState(() {
                              searchController.clear();
                              selectedCategory = null;
                              currentQuery = '';
                            });
                          },
                          child: Text(
                            R.string.cancelSearchButton,
                            style: const TextStyle(
                              color: AppColors.primaryGreenColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              Expanded(
                child: FutureBuilder(
                  future: currentQuery.isEmpty
                      ? remoteLoadProduct.load()
                      : remoteLoadProduct.searchByQuery(currentQuery),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(R.string.errorLoadingProduts),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(R.string.noProdutsFound),
                      );
                    } else {
                      final products = snapshot.data ?? [];
                      final Set<String> categories =
                          products.map((e) => e.category).toSet();
                      final productsToShow = selectedCategory == null
                          ? products
                          : filteredProducts;

                      return Column(
                        children: [
                          currentQuery != ''
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: SizedBox(
                                    height: 32,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final categoriesList =
                                            categories.toList();
                                        final category = categoriesList[index];
                                        return CategoryTile(
                                          category: category,
                                          isSelected:
                                              category == selectedCategory,
                                          onTap: () => filterByCategory(
                                              category, products),
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        width: 10,
                                      ),
                                      itemCount: categories.length,
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1 / 1.7,
                              ),
                              itemCount: productsToShow.length,
                              itemBuilder: (context, index) {
                                final product = productsToShow[index];
                                return CustomProductCard(
                                  imageUrl: product.imageUrl,
                                  name: product.name,
                                  category: product.category,
                                  price: product.price,
                                  onTap: () {},
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
