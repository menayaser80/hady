import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:lava/model/car%20model.dart';
import 'package:lava/provider/Car%20provider.dart';
import 'package:lava/view/Admin/add%20car.dart';
import 'package:lava/view/widget/title%20widget.dart';
import 'package:provider/provider.dart';
class ProductWidget extends StatefulWidget {
  const ProductWidget({
    super.key,
    required this.productId, required this.placeModel,
  });
  final String productId;
  final Carmodel placeModel;
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<PlaceProvider>(context);
    final getCurrProduct = productsProvider.findByProdId(widget.productId);
    Size size = MediaQuery.of(context).size;

    return getCurrProduct == null
        ? const SizedBox.shrink()
        : Padding(
      padding: const EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EditOrUploadCarsScreen(
                  productModel: getCurrProduct,
                );
              },
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: FancyShimmerImage(
                imageUrl: getCurrProduct.Image,
                height: size.height * 0.22,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: TitlesTextWidget(
                label:'${getCurrProduct.name}',
                fontSize: 18,
                maxLines: 2,
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: TitlesTextWidget(
                label:'${getCurrProduct.description}',
                fontSize: 18,
                maxLines: 2,
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                "model: ${getCurrProduct.model}",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                  fontSize: 15
              ),

              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                "${getCurrProduct.price}",style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                  fontSize: 15
              ),

              ),
            ),

          ],
        ),
      ),
    );
  }
}