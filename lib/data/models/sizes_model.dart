class SizesModel{
  final int id;
  final String title;
  SizesModel({required this.title,required this.id});

  factory SizesModel.fromJson(Map<String, dynamic> json) {
    return SizesModel(id: json['id'], title: json['title']);
  }
}