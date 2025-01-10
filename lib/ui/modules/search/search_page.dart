import 'package:flutter/material.dart';
import 'package:my_garden/shared/components/custom_text_field.dart';
import 'package:my_garden/shared/utils/app_colors.dart';
import 'package:my_garden/ui/helpers/i18n/resources.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.amber,
      )),
    );
  }
}
