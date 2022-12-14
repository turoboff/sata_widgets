import 'package:localstore/localstore.dart';

final Localstore _db = Localstore.instance;

class SwLocalstore {
  // saves single data
  static Future<void> save(String collection,
      {required Map<String, dynamic> data}) async {
    final CollectionRef tb = _db.collection(collection);

    await tb.doc('0').set(data);
  }

  // gets single saved data
  static Future<Map<String, dynamic>?> get(String collection) async {
    final items = await _db.collection(collection).get();

    if (items != null && items.isNotEmpty) {
      final key = items.keys.last;
      return items[key];
    }
    return null;
  }

  // deletes single saved data
  static Future<void> delete(String collection) async {
    final CollectionRef tb = _db.collection(collection);

    await tb.doc('0').delete();
  }

  // saves list of data
  static Future<void> saveList(
    String collection, {
    required Map<String, dynamic> data,
    String? divorceName,
  }) async {
    await _db
        .collection(collection)
        .doc(divorceName ?? collection)
        .set({"list": data});
  }

  // gets saved list of data
  static Future<List<Map<String, dynamic>>> getList(
    String collection, {
    String? divorceName,
  }) async {
    final Map<String, dynamic>? items = await _db.collection(collection).get();

    List<Map<String, dynamic>> list = [];
    String path = "/$collection/${divorceName ?? collection}";

    if (items != null && items[path] != null) {
      for (var i = 0; i < items[path]["list"].length; i++) {
        list.add(items[path]["list"][i]);
      }
    }
    return list;
  }

  // deletes saved list of data
  static Future<void> deleteList(
    String collection, {
    String? divorceName,
  }) async {
    final CollectionRef tb = _db.collection(collection);

    await tb.doc(divorceName ?? collection).delete();
  }
}
