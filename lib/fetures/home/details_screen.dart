import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:untitled7/core/custom_text.dart';
import 'package:untitled7/core/pallet.dart';
import 'package:untitled7/fetures/home/prodect_model.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.product});
  final Product product;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _counter = 00;
  bool _isLiked = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: SecondryColor,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: PrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
            onPressed: () {},
            child: CustomText(
              text: 'Buy Now',
              size: 15,
              color: Colors.white,
            )),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 50),
            height: height * 0.9,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.product.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                  child: FlexibleButton(
                    minheight: 50,
                    minwidth: 50,
                    icon: Icons.arrow_back_ios,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconColor: Colors.black,
                  ),
                ),
                CustomText(text: 'Details', size: 18, color: Colors.black),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                  child: FlexibleButton(
                    minheight: 50,
                    minwidth: 50,
                    icon: _isLiked ? Icons.favorite : LineIcons.heart,
                    iconColor: _isLiked ? Colors.red : Colors.black,
                    onPressed: _toggleLike,
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.40,
            minChildSize: 0.15,
            maxChildSize: 0.75,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: height * 0.02),
                            height: height * 0.004,
                            width: width * 0.1,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                          child: CustomText(
                            text: widget.product.title,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                          child: Row(
                            children: [
                              CustomText(
                                text: widget.product.price,
                                size: 25,
                                color: PrimaryColor,
                              ),
                              Spacer(),
                              FlexibleButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  _decrementCounter();
                                },
                                minheight: 25,
                                minwidth: 25,
                                iconColor: Colors.black,
                              ),
                              CustomText(
                                  text: '$_counter',
                                  size: 15,
                                  color: Colors.black),
                              FlexibleButton(
                                icon: Icons.add,
                                onPressed: () {
                                  _incrementCounter();
                                },
                                minheight: 25,
                                minwidth: 25,
                                iconColor: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                          child: CustomText(
                            text: widget.product.description,
                            size: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FlexibleButton extends StatelessWidget {
  const FlexibleButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.minwidth,
    required this.minheight,
    required this.iconColor,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final double minwidth;
  final double minheight;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints(
        minWidth: minwidth,
        minHeight: minheight,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      fillColor: Colors.white,
      padding: EdgeInsets.all(5),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
