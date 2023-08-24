abstract class CartState {}

class CartInitial extends CartState {}

class GetLocalCartStorageLoading extends CartState {}

class GetLocalCartStorageSuccess extends CartState {}

class SaveToLocalStorageLoading extends CartState {}

class SaveToLocalStorageSuccess extends CartState {}

class AddToCartLoading extends CartState {}

class AddToCartSuccess extends CartState {}

class ChangeNumber extends CartState {}
