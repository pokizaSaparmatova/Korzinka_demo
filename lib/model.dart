import 'dart:convert';
import 'package:http/http.dart' as http;

class Datum {
  Data? data;

  Datum({this.data});

  Datum.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? titleUz;
  String? titleEn;
  Null? description;
  Null? descriptionUz;
  Null? descriptionEn;
  String? tag;
  String? tagUz;
  String? tagEn;
  List<Products>? products;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.title,
        this.titleUz,
        this.titleEn,
        this.description,
        this.descriptionUz,
        this.descriptionEn,
        this.tag,
        this.tagUz,
        this.tagEn,
        this.products,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleUz = json['title_uz'];
    titleEn = json['title_en'];
    description = json['description'];
    descriptionUz = json['description_uz'];
    descriptionEn = json['description_en'];
    tag = json['tag'];
    tagUz = json['tag_uz'];
    tagEn = json['tag_en'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['title_uz'] = this.titleUz;
    data['title_en'] = this.titleEn;
    data['description'] = this.description;
    data['description_uz'] = this.descriptionUz;
    data['description_en'] = this.descriptionEn;
    data['tag'] = this.tag;
    data['tag_uz'] = this.tagUz;
    data['tag_en'] = this.tagEn;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  Prices? prices;
  String? weightParam;
  bool? isBigSize;
  int? catalogCategoryId;
  String? productUrl;
  String? smallImageUrl;
  int? sorting;

  Products(
      {this.id,
        this.title,
        this.prices,
        this.weightParam,
        this.isBigSize,
        this.catalogCategoryId,
        this.productUrl,
        this.smallImageUrl,
        this.sorting});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    prices =
    json['prices'] != null ? Prices.fromJson(json['prices']) : null;
    weightParam = json['weight_param'];
    isBigSize = json['is_bigSize'];
    catalogCategoryId = json['catalog_category_id'];
    productUrl = json['product_url'];
    smallImageUrl = json['small_image_url'];
    sorting = json['sorting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.prices != null) {
      data['prices'] = this.prices!.toJson();
    }
    data['weight_param'] = this.weightParam;
    data['is_bigSize'] = this.isBigSize;
    data['catalog_category_id'] = this.catalogCategoryId;
    data['product_url'] = this.productUrl;
    data['small_image_url'] = this.smallImageUrl;
    data['sorting'] = this.sorting;
    return data;
  }
}

class Prices {
  bool? isDiscount;
  String? actualPrice;
  String? oldPrice;
  Null? perUnit;
  String? productType;
  String? priceTagName;
  int? priceTagId;

  Prices(
      {this.isDiscount,
        this.actualPrice,
        this.oldPrice,
        this.perUnit,
        this.productType,
        this.priceTagName,
        this.priceTagId});

  Prices.fromJson(Map<String, dynamic> json) {
    isDiscount = json['is_discount'];
    actualPrice = json['actual_price'];
    oldPrice = json['old_price'];
    perUnit = json['per_unit'];
    productType = json['product_type'];
    priceTagName = json['price_tag_name'];
    priceTagId = json['price_tag_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_discount'] = this.isDiscount;
    data['actual_price'] = this.actualPrice;
    data['old_price'] = this.oldPrice;
    data['per_unit'] = this.perUnit;
    data['product_type'] = this.productType;
    data['price_tag_name'] = this.priceTagName;
    data['price_tag_id'] = this.priceTagId;
    return data;
  }
}

Future<Datum> getProductsList() async {
  const url = 'https://catalog.korzinka.uz/api/catalogs/categories/19';
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return Datum.fromJson(json.decode(response.body));
  } else {
    throw Exception("Error: ${response.reasonPhrase}");
  }
}
