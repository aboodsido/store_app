import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/update_product_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textField.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({Key? key}) : super(key: key);

  static const String id = 'UpdatePage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;

  String? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    print(product);

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      color: Colors.grey,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Spacer(flex: 1),
              CustomTextField(
                  keyboardType: TextInputType.text,
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: 'Title',
                  hintTextColor: Colors.grey),
              const SizedBox(height: 10),
              CustomTextField(
                  keyboardType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: 'Price',
                  hintTextColor: Colors.grey),
              const SizedBox(height: 10),
              CustomTextField(
                  keyboardType: TextInputType.url,
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: 'Image',
                  hintTextColor: Colors.grey),
              const SizedBox(height: 10),
              CustomTextField(
                  keyboardType: TextInputType.text,
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: 'Description',
                  hintTextColor: Colors.grey),
              const SizedBox(height: 20),
              CustomButton(
                buttonText: 'Update',
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    await UpdateProductService().updateProduct(
                      id: product.id,
                      title: productName == null ? product.title : productName!,
                      price: price == null ? product.price : price!,
                      desc: desc == null ? product.description : desc!,
                      image: image == null ? product.image : image!,
                      category: product.category,
                    );
                  } catch (e) {
                    print(e.toString());
                  }
                  setState(() {
                    isLoading = false;
                  });
                },
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
