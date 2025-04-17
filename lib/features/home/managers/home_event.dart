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
