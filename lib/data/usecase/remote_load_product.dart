import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_garden/domain/models/product_model.dart';

class RemoteLoadProduct {
  final FirebaseFirestore firestore;

  RemoteLoadProduct({
    required this.firestore,
  });

  Future<List<ProductModel>> load() async {
    try {
      final snapshot = await firestore.collection('products').get();
      return snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Erro ao carregar todos os produtos: $e');
    }
  }

  Future<List<ProductModel>> searchByQuery(String query) async {
    try {
      final snapshot = await firestore
          .collection('products')
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: '$query\uf8ff')
          .get();

      return snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Erro ao pesquisar produto: $e');
    }
  }
}
