import 'package:cloud_firestore/cloud_firestore.dart';

/// Firestore wrapper. Use from repositories/datasources.
class FirestoreService {
  FirestoreService() : _store = FirebaseFirestore.instance;

  final FirebaseFirestore _store;

  CollectionReference<Map<String, dynamic>> collection(String path) =>
      _store.collection(path);

  Future<void> setDoc(
    String path,
    Map<String, dynamic> data, {
    bool merge = false,
  }) {
    return _store.doc(path).set(data, SetOptions(merge: merge));
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getDoc(String path) =>
      _store.doc(path).get();

  Stream<DocumentSnapshot<Map<String, dynamic>>> docStream(String path) =>
      _store.doc(path).snapshots();
}
