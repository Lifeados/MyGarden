import 'package:flutter/material.dart';
import 'package:my_garden/data/usecase/remote_load_product.dart';
import 'package:my_garden/shared/components/custom_product_card.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final remoteLoadProduct = Provider.of<RemoteLoadProduct>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                height: 100,
                color: Colors.amber,
              ),
              FutureBuilder(
                future: remoteLoadProduct.load(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Erro ao carregar produtos'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('Nenhum produto encontrado.'),
                    );
                  } else {
                    final products = snapshot.data ?? [];

                    return Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1 / 1.7,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return CustomProductCard(
                            imageUrl: product.imageUrl,
                            name: product.name,
                            category: product.category,
                            price: product.price,
                            onTap: () {},
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
