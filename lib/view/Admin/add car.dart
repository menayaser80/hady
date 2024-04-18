import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lava/constants/MyAppFunctions.dart';
import 'package:lava/constants/loading%20manager.dart';
import 'package:lava/constants/validator.dart';
import 'package:lava/model/car%20model.dart';
import 'package:lava/view/widget/title%20widget.dart';
import 'package:uuid/uuid.dart';

class EditOrUploadCarsScreen extends StatefulWidget {
  const EditOrUploadCarsScreen({super.key, this.productModel});
  final Carmodel? productModel;
  @override
  State<EditOrUploadCarsScreen> createState() =>
      _EditOrUploadCarsScreenState();
}

class _EditOrUploadCarsScreenState extends State<EditOrUploadCarsScreen> {
  final _formKey = GlobalKey<FormState>();
  XFile? _pickedImage;
  late TextEditingController _titleController,
      _priceController,

      _adultController,
      _quantityController;
  bool isEditing = false;
  String? productNetworkImage;
  bool _isLoading = false;
  String? productImageUrl;

  @override
  void initState() {
    if (widget.productModel != null) {
      isEditing = true;
      productNetworkImage = widget.productModel!.Image;
    }
    _titleController =
        TextEditingController(text: widget.productModel?.name);
    _priceController =
        TextEditingController(text: widget.productModel?.model);
    _adultController=
        TextEditingController(text: widget.productModel?.description);
    _quantityController =
        TextEditingController(text: widget.productModel?.price);


    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    _adultController.dispose();
    super.dispose();
  }

  void clearForm() {
    _titleController.clear();
    _priceController.clear();
    _quantityController.clear();
    _adultController.clear();
    removePickedImage();
  }

  void removePickedImage() {
    setState(() {
      _pickedImage = null;
      productNetworkImage = null;
    });
  }

  Future<void> _uploadProduct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      try {
        setState(() {
          _isLoading = true;
        });

        final productId = const Uuid().v4();
        final ref = FirebaseStorage.instance
            .ref()
            .child("CarsImages")
            .child("$productId.jpg");
        await ref.putFile(File(_pickedImage!.path));
        productImageUrl = await ref.getDownloadURL();

        await FirebaseFirestore.instance
            .collection("Cars")
            .doc(productId)
            .set({
          'ModelId': productId,
          'carTitle': _titleController.text,
          'model':_priceController.text,
          'description':_adultController.text,
          'price':_quantityController.text,
          'Image': productImageUrl??"https://www.shutterstock.com/image-vector/medicine-pharmacy-hospital-set-drugs-labels-646593400",
          'createdAt': Timestamp.now(),
        });
        Fluttertoast.showToast(
          msg: "Car has been added",
          textColor: Colors.white,
        );
        if (!mounted) return;
        MyAppFunctions.showErrorOrWarningDialog(
            isError: false,
            context: context,
            subtitle: "Clear Form?",
            fct: () {
              clearForm();
            });
      } on FirebaseException catch (error) {
        await MyAppFunctions.showErrorOrWarningDialog(
          context: context,
          subtitle: error.message.toString(),
          fct: () {},
        );
      } catch (error) {
        await MyAppFunctions.showErrorOrWarningDialog(
          context: context,
          subtitle: error.toString(),
          fct: () {},
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _editProduct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (_pickedImage == null && productNetworkImage == null) {
      MyAppFunctions.showErrorOrWarningDialog(
        context: context,
        subtitle: "Please pick up an image",
        fct: () {},
      );
      return;
    }
    if (isValid) {
      try {
        setState(() {
          _isLoading = true;
        });

        if (_pickedImage != null) {
          final ref = FirebaseStorage.instance
              .ref()
              .child("CarsImages")
              .child("${widget.productModel!.Id}.jpg");
          await ref.putFile(File(_pickedImage!.path));
          productImageUrl = await ref.getDownloadURL();
        }

        await FirebaseFirestore.instance
            .collection("Cars")
            .doc(widget.productModel!.Id)
            .update({
          'ModelId':  widget.productModel!.Id,
          'carTitle': _titleController.text,
          'model':_priceController.text,
          'description':_adultController.text,
          'price':_quantityController.text,
          'Image': productImageUrl,
          'createdAt': Timestamp.now(),
        });
        Fluttertoast.showToast(
          msg: "Medicine has been edited",
          textColor: Colors.white,
        );
        if (!mounted) return;
        MyAppFunctions.showErrorOrWarningDialog(
            isError: false,
            context: context,
            subtitle: "Clear Form?",
            fct: () {
              clearForm();
            });
      } on FirebaseException catch (error) {
        await MyAppFunctions.showErrorOrWarningDialog(
          context: context,
          subtitle: error.message.toString(),
          fct: () {},
        );
      } catch (error) {
        await MyAppFunctions.showErrorOrWarningDialog(
          context: context,
          subtitle: error.toString(),
          fct: () {},
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> localImagePicker() async {
    final ImagePicker picker = ImagePicker();
    await MyAppFunctions.imagePickerDialog(
      context: context,
      cameraFCT: () async {
        _pickedImage = await picker.pickImage(source: ImageSource.camera);
        setState(() {
          productNetworkImage = null;
        });
      },
      galleryFCT: () async {
        _pickedImage = await picker.pickImage(source: ImageSource.gallery);
        setState(() {
          productNetworkImage = null;
        });
      },
      removeFCT: () {
        setState(() {
          _pickedImage = null;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LoadingManager(
      isLoading: _isLoading,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          bottomSheet: SizedBox(
            height: kBottomNavigationBarHeight + 10,
            child: Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.clear),
                    label: const Text(
                      "Clear",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      clearForm();
                    },
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                       backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.upload,color: Colors.white,),
                    label: Text(
                      isEditing ? "Edit Car" : "Upload Car",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                    ),
                    onPressed: () {
                      if (isEditing) {
                        _editProduct();
                      } else {
                        _uploadProduct();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: TitlesTextWidget(
              label: isEditing ? "Edit Car" : "Upload a new Car",
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),

                  // Image Picker
                  if (isEditing && productNetworkImage != null) ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        productNetworkImage!,
                        // width: size.width * 0.7,
                        height: size.width * 0.5,
                        alignment: Alignment.center,
                      ),
                    ),
                  ] else if (_pickedImage == null) ...[
                    SizedBox(
                      width: size.width * 0.4 + 10,
                      height: size.width * 0.4,
                      child: DottedBorder(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.image_outlined,
                                  size: 80,
                                  color: Colors.blue,
                                ),
                                TextButton(
                                  onPressed: () {
                                    localImagePicker();
                                  },
                                  child: const Text("Pick Car Image"),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ] else ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(
                          _pickedImage!.path,
                        ),
                        // width: size.width * 0.7,
                        height: size.width * 0.5,
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                  if (_pickedImage != null || productNetworkImage != null) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            localImagePicker();
                          },
                          child: const Text("Pick another image"),
                        ),
                        TextButton(
                          onPressed: () {
                            removePickedImage();
                          },
                          child: const Text(
                            "Remove image",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    )
                  ],
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _titleController,
                            key: const ValueKey('Title'),
                            maxLength: 80,
                            minLines: 1,
                            maxLines: 2,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            decoration: const InputDecoration(
                              hintText: 'name',
                            ),
                            validator: (value) {
                              return MyValidators.uploadProdTexts(
                                value: value,
                                toBeReturnedString:
                                "Please enter a valid name",
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller:_priceController,
                            key: const ValueKey('Address'),
                            maxLength: 80,
                            minLines: 1,
                            maxLines: 2,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            decoration: const InputDecoration(
                              hintText: 'model',
                            ),
                            validator: (value) {
                              return MyValidators.uploadProdTexts(
                                value: value,
                                toBeReturnedString:
                                "Please enter a valid model",
                              );
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            controller: _adultController,
                            key: const ValueKey('diagnosis'),
                            maxLength: 80,
                            minLines: 1,
                            maxLines: 2,
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            decoration: const InputDecoration(
                              hintText: 'Description',
                            ),
                            validator: (value) {
                              return MyValidators.uploadProdTexts(
                                value: value,
                                toBeReturnedString:
                                "Please enter a valid Description",
                              );
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFormField(
                            key: const ValueKey('Description'),
                            controller: _quantityController,
                            minLines: 5,
                            maxLines: 8,
                            keyboardType: TextInputType.phone,
                            maxLength: 1000,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: const InputDecoration(
                              hintText: 'Price',
                            ),
                            validator: (value) {
                              return MyValidators.uploadProdTexts(
                                value: value,
                                toBeReturnedString: "Description is missed",
                              );
                            },
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: kBottomNavigationBarHeight + 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}