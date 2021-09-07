

import 'package:winlife_conselor_flutter/data/provider/api.dart';

class CategoryItem {
  String id;
  String image;
  String name;
  String detail;
  CategoryItem(
    this.id,
    this.detail,
    this.image,
    this.name,
  );

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      json['id'],
      json['nama_kategori'],
      Api.IMAGE_KATEGORI_URL + json['gambar'],
      json['nama_kategori'],
    );
  }
}

class CategoryItem2 {
  int numori;
  String id;
  String image;
  bool isfav;
  String name;
  CategoryItem2(
    this.numori,
    this.id,
    this.isfav,
    this.image,
    this.name,
  );
}
