abstract class HomeEvent {}

class HomeLoad extends HomeEvent {
  final String? title;
  final int? categoryId;
  final int? sizeId;
  final double? minPrice,maxPrice;
  final String? orderBy;
  HomeLoad({
    this.title,
    this.categoryId,
    this.sizeId,
    this.minPrice,
    this.maxPrice,
    this.orderBy,
});
}

class HomeSelectCategory extends HomeEvent{
  final int? selectedCategory;

  HomeSelectCategory({required this.selectedCategory});
}

class SavedLoad extends HomeEvent{
  SavedLoad({required this.like});
  final int like;
}
class UnSavedLoad extends HomeEvent{
  UnSavedLoad({required this.unLike});
  final int unLike;
}