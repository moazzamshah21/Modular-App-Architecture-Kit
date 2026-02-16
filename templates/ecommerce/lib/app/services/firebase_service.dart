import '../models/product_model.dart';
import '../models/user_model.dart';

/// Dummy Firebase/API service. Replace with real Firebase Auth, Firestore, etc.
class FirebaseService {
  Future<UserModel?> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return UserModel(id: '1', email: email, displayName: email.split('@').first);
  }

  Future<UserModel?> signUp(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return UserModel(id: '1', email: email, displayName: email.split('@').first);
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 200));
  }

  Future<List<ProductModel>> getProducts() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return [
      const ProductModel(id: '1', name: 'Product A', price: 19.99, description: 'Description A'),
      const ProductModel(id: '2', name: 'Product B', price: 29.99, description: 'Description B'),
      const ProductModel(id: '3', name: 'Product C', price: 39.99, description: 'Description C'),
    ];
  }

  Future<ProductModel?> getProductById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const ProductModel(id: '1', name: 'Product A', price: 19.99, description: 'Description A');
  }
}
