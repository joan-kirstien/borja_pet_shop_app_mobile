import 'package:flutter/material.dart';
import 'package:flutter1_pet_shop_app_borja/colors.dart';
import 'package:flutter1_pet_shop_app_borja/style.dart';
import 'package:flutter1_pet_shop_app_borja/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette().pBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: [
            getCustomAppBar(),
            const Text(
              'Find a New Friend',
              style: onBoardHeadingTitle2,
            ),
            const SizedBox(height: 15),
            getSearch(),
            const SizedBox(height: 15),
            const Text(
              'Pet Categories',
              style: onBoardHeadingTitle2,
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return PetCategoryListCard(
                      categoryName: categoryList[index]['name'],
                      categoryImg: categoryList[index]['icon'],
                    );
                  }),
            ),
            //for pet choices
            const SizedBox(height: 20.0),
            SizedBox(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dogList.length,
                  itemBuilder: (context, index) {
                    return PetListCard(
                      name: dogList[index]['name'],
                      image: dogList[index]['image'],
                      type: dogList[index]['type'],
                      cart: dogList[index]['cart'],
                      //cart
                    );
                  }),
            ),
            const SizedBox(height: 15.0),
            const Text(
              'Newest Pets',
              style: onBoardHeadingTitle2,
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/German Shepherd.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PetListCard extends StatelessWidget {
  final String? name;
  final String? type;
  final String? image;
  final bool? cart; //age(supposed to be, then ang function kay sa heart)

  const PetListCard({this.name, this.type, this.image, this.cart, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.3,
      margin: const EdgeInsets.only(right: 14.0),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(
                        image.toString()), //'assets/images/Chow Chow.jpg
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Positioned(child: CircleAvatar(radius: 18,
              // child: ,)) //HEART ICON
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              name.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  type.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              //CART ICON
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.shopping_cart,
                  size: 25,
                  color: Palette().pYellowOrangeShadeColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PetCategoryListCard extends StatelessWidget {
  final String? categoryName;
  final String? categoryImg;

  const PetCategoryListCard({this.categoryName, this.categoryImg, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Palette().pYellowOrageColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(right: 10.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Palette().pYellowOrangeShadeColor,
              image: DecorationImage(
                image: AssetImage(categoryImg.toString()),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 10.0, left: 10.0),
            child: Text(
              categoryName.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget getSearch() {
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          margin: const EdgeInsets.only(right: 16.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Seacrh for Pets',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      ),
      Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Icon(Icons.filter),
      ),
    ],
  );
}

Widget getCustomAppBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      Row(
        children: [
          const SizedBox(height: 100.0), // Adjust the width as needed
          Icon(
            Icons.pin_drop,
            color: Palette().pYellowOrangeShadeColor,
          ),
          Text(
            'Berlin, Germany',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          )
        ],
      ),
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Palette().pYellowOrageColor,
          image: const DecorationImage(
            image: AssetImage('assets/images/dina.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  );
}
