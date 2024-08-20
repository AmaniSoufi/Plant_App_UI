import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled7/core/pallet.dart';
import 'package:untitled7/fetures/home/categories_list.dart';
import 'package:untitled7/fetures/home/details_screen.dart';
import 'package:untitled7/fetures/home/prodect_model.dart';

class EcommerceHomeScreen extends StatefulWidget {
  const EcommerceHomeScreen({super.key});

  @override
  State<EcommerceHomeScreen> createState() => _EcommerceHomeScreenState();
}

class _EcommerceHomeScreenState extends State<EcommerceHomeScreen> {
  int selectedIndex = 0;
  List<List<Product>> selectedCategory = [
    outdoor,
    indoor,
    succulents,
    herbs,
    trees,
    ferns
  ];

  void onCategorySelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: SecondryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            Text(
              'Discover your best Plants',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            TextField(
              decoration: InputDecoration(
                  fillColor: filledColor,
                  filled: true,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.white),
                  )),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            SizedBox(
              height: height * 0.1,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      CustomButtonWidget(
                        text: 'Outdoor Plants',
                        index: 0,
                        selectedIndex: selectedIndex,
                        onPressed: onCategorySelected,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      CustomButtonWidget(
                        text: 'Indoor Plants',
                        index: 1,
                        selectedIndex: selectedIndex,
                        onPressed: onCategorySelected,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      CustomButtonWidget(
                        text: 'Succulents',
                        index: 2,
                        selectedIndex: selectedIndex,
                        onPressed: onCategorySelected,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      CustomButtonWidget(
                        text: 'Herbs',
                        index: 3,
                        selectedIndex: selectedIndex,
                        onPressed: onCategorySelected,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      CustomButtonWidget(
                        text: 'Trees',
                        index: 4,
                        selectedIndex: selectedIndex,
                        onPressed: onCategorySelected,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      CustomButtonWidget(
                        text: 'Ferns',
                        index: 5,
                        selectedIndex: selectedIndex,
                        onPressed: onCategorySelected,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CustomText(
                  text: 'Popular',
                  size: 20,
                  color: Colors.black,
                ),
                Spacer(),
                CustomText(
                  text: 'View all',
                  size: 18,
                  color: PrimaryColor,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              height: height * 0.3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      selectedCategory[selectedIndex].length,
                      (index) {
                        final product = selectedCategory[selectedIndex][index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsScreen(product: product)));
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: width * 0.4,
                              height: height * 0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(product.image),
                                      fit: BoxFit.fill)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: width * 0.3,
                                        height: height * 0.08,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          children: [
                                            CustomText(
                                                text: product.title,
                                                size: 17,
                                                color: Colors.white),
                                            CustomText(
                                                text: product.price,
                                                size: 17,
                                                color: PrimaryColor),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.size,
    required this.color,
  });
  final String text;
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: FontWeight.bold, fontSize: size, color: color),
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.index,
    required this.selectedIndex,
    required this.onPressed,
  });

  final String text;
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedIndex == index ? PrimaryColor : filledColor,
      ),
      onPressed: () => onPressed(index),
      child: Text(
        text,
        style: TextStyle(
          color: selectedIndex == index ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
