import 'package:cloud_firestore/cloud_firestore.dart';
import 'col.dart';

class Processing {
  static Processing _firestoreService = Processing._internal();

  Firestore _db = Firestore.instance;

  Processing._internal();

  factory Processing() {
    return _firestoreService;
  }

  Stream<List<Col>> getNotes() {
    return _db
        .collection('testdata')
        .orderBy('created_at', descending: false)
        .snapshots()
        .map(
          (snapshot) => snapshot.documents
              .map(
                (doc) => Col.fromMap(doc.data, doc.documentID),
              )
              .toList(),
        );
  }

  Future<void> addNote(Col col) {
    return _db.collection('testdata').add(col.ttMap());
  }

  Future<void> deleteNote(String id) {
    return _db.collection('testdata').document(id).delete();
  }

  Future<void> updateData(String id, Col col) {
    return _db.collection('testdata').document(id).updateData(col.ttMap());
    ;
  }
}
