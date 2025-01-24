import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:my_garden/domain/models/product_model.dart';
import 'package:my_garden/shared/components/custom_button.dart';
import 'package:my_garden/shared/components/quantity_widget.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:my_garden/ui/modules/product_details/components/rating.dart';
import 'package:provider/provider.dart';
import '../product_details/components/plant_info.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {
    final numberFormatProvider = Provider.of<NumberFormat>(
      context,
      listen: false,
    );
    final product = ModalRoute.of(context)?.settings.arguments as ProductModel?;
    double totalPrice = product!.price * cartItemQuantity;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.secondaryGreyColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.primaryWhiteColor,
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
              height: 364,
              width: double.infinity,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 18,
                right: 16,
                bottom: 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 22,
                      color: AppColors.primaryDarkColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 4, bottom: 24),
                    child: Rating(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Descrição',
                      style: TextStyle(
                        color: AppColors.primaryDarkColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      PlantInfo(
                        label: 'Categoria',
                        information: product.category,
                      ),
                      PlantInfo(
                        label: 'Contém',
                        information: '${product.weight} de semente',
                      ),
                      PlantInfo(
                        label: 'Ciclo',
                        information: product.cicle,
                      ),
                      PlantInfo(
                        label: 'Época de Plantio',
                        information: product.plantingTime,
                      ),
                      PlantInfo(
                        label: 'Referência',
                        information: product.reference,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        numberFormatProvider.format(totalPrice),
                        style: const TextStyle(
                          color: AppColors.primaryDarkColor,
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      QuantityWidget(
                        value: cartItemQuantity,
                        handleQuantity: (quantity) {
                          setState(() {
                            cartItemQuantity = quantity;
                          });
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                    icon: SvgPicture.asset(
                      'lib/ui/assets/icons/mycart.svg',
                      width: 22,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primaryWhiteColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: 'Adicionar ao Carrinho',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
