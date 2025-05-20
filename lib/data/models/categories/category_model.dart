import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {


 const factory  CategoryModel({required int id, required String title}) = _CategoryModel;

 factory CategoryModel.fromJson(Map<String,dynamic> json)=> _$CategoryModelFromJson(json);
}

class CategoryModelAdapter extends TypeAdapter<CategoryModel>{
 @override
  int get typeId => 2;
 @override
  CategoryModel read(BinaryReader reader) {
 return CategoryModel(id: reader.read(), title: reader.read());
  }

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
   writer.write(obj.id);
   writer.write(obj.title);
  }
}