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
          .map((doc) => ProductModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Erro ao carregar os produtos: $e');
    }
  }
}
