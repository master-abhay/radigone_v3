import 'dart:convert';

// Root class for the business categories response
class BusinessCategoryModel {
  BusinessCategoryModel({
    this.success,
    this.data,
  });

  factory BusinessCategoryModel.fromJson(Map<String, dynamic> json) {
    return BusinessCategoryModel(
      success: json['success'] as bool?,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  final bool? success;
  final Data? data;

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.toJson(),
    };
  }
}

// Class to hold category data
class Data {
  Data({
    this.categories,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((item) => Categories.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  final List<Categories>? categories;

  Map<String, dynamic> toJson() {
    return {
      'categories': categories?.map((item) => item.toJson()).toList(),
    };
  }
}

// Class to represent a single category
class Categories {
  Categories({
    this.id,
    this.name,
    this.subcategories,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      id: json['id'] as int?,
      name: json['name'] as String?,
      subcategories: json['subcategories'] as String?,
    );
  }

  final int? id;
  final String? name;
  final String? subcategories;

  List<String> get subcategoriesList {
    return subcategories != null
        ? subcategories!.split(',').map((e) => e.trim()).toList()
        : [];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'subcategories': subcategories,
    };
  }
}
