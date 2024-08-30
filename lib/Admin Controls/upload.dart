import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vape_zone/Backend/Provider/Services/product_services.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductServices>(context, listen: false);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('Upload Product'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Consumer<ProductServices>(
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: () {
                    value.pickImageFromGallery();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Center(
                        child: value.image != null
                            ? Image.file(value.image!)
                            : const Icon(
                                Icons.image,
                                color: Colors.white,
                              ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: TextField(
                controller: productProvider.productNameController,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: TextField(
                controller: productProvider.companyNameController,
                decoration: const InputDecoration(
                  labelText: 'Company Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: productProvider.priceController,
                decoration: const InputDecoration(
                  labelText: 'Product Price',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: DropdownButtonFormField<String>(
                style: const TextStyle(color: Colors.white),
                value: productProvider.selectedItem,
                items: productProvider.deviceType.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    productProvider.selectedItem = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Device Type',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
            Consumer<ProductServices>(
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      value
                          .uploadDataToFireStore(value.selectedItem.toString());
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Theme.of(context).colorScheme.primary),
                      child: Center(
                          child: Text(
                        'Upload',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      )),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
