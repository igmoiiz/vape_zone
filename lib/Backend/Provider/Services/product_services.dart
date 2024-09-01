// ignore_for_file: prefer_final_fields

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vape_zone/Backend/Provider/Utilities/utils.dart';

class ProductServices extends ChangeNotifier {
  //  selected item index
  String? selectedItem;
  //  list for dropdown button
  final List<String> deviceType = [
    'Vapes',
    'Pods',
    'Liquor',
    'Disposable Pods',
    'Coils',
    'Accessories',
    'Offers',
    'Used Devices',
  ];

  //  controllers
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  //  variables
  File? _image;
  bool _loading = false;

  //  instances for firebase services

  final fireStore = FirebaseFirestore.instance;
  storage.FirebaseStorage firebaseStorage = storage.FirebaseStorage.instance;
  final picker = ImagePicker();

  //  getters for controllers
  TextEditingController get productNameController => _productNameController;
  TextEditingController get companyNameController => _companyNameController;
  TextEditingController get priceController => _priceController;

  //  getter for variables
  File? get image => _image;
  bool get loading => _loading;

  //  method to pick image from the gallery
  Future<void> pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
      Utils().toastMessage('Image Picked Successfully!');
    } else {
      Utils().toastMessage('Image Selection Canceled!');
    }
    notifyListeners();
  }

  //  method to upload data to firebase fire store
  Future<void> uploadDataToFireStore(String collectionName) async {
    if (_image == null) {
      Utils().toastMessage('Please Select an Image!');
      notifyListeners();
      return;
    }

    if (productNameController.text.isEmpty ||
        companyNameController.text.isEmpty ||
        priceController.text.isEmpty) {
      Utils().toastMessage('Please Fill All Fields!');
      notifyListeners();
      return;
    }

    //  id variable
    String productId = DateTime.now().millisecondsSinceEpoch.toString();

    try {
      //  loading variable
      _loading = true;
      notifyListeners();
      //  reference for firebase storage
      storage.Reference ref = storage.FirebaseStorage.instance.ref('Product');
      //  uploading the image to bucket
      final uploadTask = await ref.putFile(_image!);
      await Future.value(uploadTask);
      //  getting the download url of the image
      final imageUrl = await ref.getDownloadURL();
      //  uploading data to firebase fire store
      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(productId)
          .set({
        'name': productNameController.text,
        'company': companyNameController.text,
        'price': priceController.text,
        'imageUrl': imageUrl,
        'productId': productId,
        'category': selectedItem,
      }).then((value) {
        _loading = false;
        productNameController.clear();
        companyNameController.clear();
        priceController.clear();
        _image = null;
        notifyListeners();
        Utils().toastMessage('Product Uploaded Successfully!');
      }).onError((error, stackTrace) {
        _loading = false;
        notifyListeners();
        Utils().toastMessage(error.toString());
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
