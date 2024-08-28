import 'package:flutter/material.dart';
import 'package:vape_zone/Interface/product_list.dart';
import 'package:vape_zone/components/container.dart';
import 'package:vape_zone/components/text.dart';
import 'package:vape_zone/components/textfield.dart';
import '../components/drawer.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // Text editing controller for search
  final TextEditingController searchController = TextEditingController();

  // FocusNode to track focus state of the search bar
  final FocusNode searchFocusNode = FocusNode(); // Correctly initialized

  // Boolean to track if the search bar is focused
  bool isFocused = false;

  // List for category details
  final List customCardDetails = [
    ['assets/images/pods.jpeg', 'Pods'],
    ['assets/images/juices.jpeg', 'Liquor'],
    ['assets/images/vapes.jpeg', 'Vapes'],
    ['assets/images/disposable.jpeg', 'Disposable Pods'],
    ['assets/images/coils.jpeg', 'Coils'],
    ['assets/images/accessories.jpeg', 'Accessories'],
  ];

  @override
  void initState() {
    super.initState();
    searchFocusNode.addListener(() {
      setState(() {
        isFocused = searchFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            MyText(
              text: 'Smooth Clouds, Better Choices.',
              fontSize: 56,
              fontWeight: FontWeight.normal,
              color: Theme.of(context).colorScheme.secondary,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isFocused
                  ? MediaQuery.of(context).size.width * 0.95
                  : MediaQuery.of(context).size.width * 0.85,
              child: MyTextfield(
                controller: searchController,
                text: 'Search',
                focusNode: searchFocusNode, // Attach the focus node here
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: MyText(
                  text: 'Products',
                  fontSize: 28,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: customCardDetails.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => CustomCard(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProductListPage(),
                    ));
                  },
                  backgroundImage: customCardDetails[index][0],
                  title: customCardDetails[index][1],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
