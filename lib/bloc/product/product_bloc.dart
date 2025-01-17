import 'package:apple_shop/data/repository/basket_repository.dart';
import 'package:apple_shop/data/repository/product_detail_repository.dart';
import 'package:apple_shop/models/card_item.dart';
import 'package:apple_shop/models/category.dart';
import 'package:apple_shop/models/product.dart';
import 'package:apple_shop/models/product_image.dart';
import 'package:apple_shop/models/product_property.dart';
import 'package:apple_shop/models/product_variant.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductDetailRepository productDetailRepository;
  final IBasketRepository basketRepository;

  ProductBloc(
      {required this.basketRepository, required this.productDetailRepository})
      : super(ProductInitial()) {
    on<ProductInitialize>((event, emit) async {
      emit(ProductLoading());
      var productImageList =
          await productDetailRepository.getGallery(event.productId);
      var productVariantsList =
          await productDetailRepository.getProductVariants(event.productId);
      var productCategory =
          await productDetailRepository.getProductCategory(event.categoryId);
      var productProperties =
          await productDetailRepository.getProductProperties(event.productId);
      var isAddedToBasket =
          await basketRepository.isAddedToBasket(event.productId);
      emit(
        ProductResponse(
          isAddedtoBasket: isAddedToBasket,
          productProperties: productProperties,
          productImageList: productImageList,
          productVariantList: productVariantsList,
          productCategory: productCategory,
        ),
      );
    });

    on<ProductAddToBasket>(
      (event, emit) async {
        BasketItem basketItem = BasketItem(
          id: event.product.id,
          collectionId: event.product.collectionId,
          thumbnail: event.product.thumbnail,
          discountPrice: event.product.discountPrice,
          price: event.product.price,
          name: event.product.name,
          categoryId: event.product.categoryId,
          realPrice: event.product.realPrice,
          persent: event.product.persent,
        );
        await basketRepository.addProductToBasket(basketItem);
        if (state is ProductResponse) {
          emit(
            (state as ProductResponse).copyWith(isAddedtoBasket: true),
          );
        }
      },
    );
  }
}
