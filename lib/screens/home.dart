import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pet_adoption/model/category_model.dart';
import 'package:pet_adoption/theme/color.dart';
import 'package:pet_adoption/utils/data.dart';
import 'package:pet_adoption/widgets/category_item.dart';
import 'package:pet_adoption/widgets/custom_textbox.dart';
import 'package:pet_adoption/widgets/notification_box.dart';
import 'package:pet_adoption/widgets/pet_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColor.appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: _buildAppBar(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildBody(),
              childCount: 1,
            ),
          )
        ],
      ),
      // body: Column(
      //   children: [
      //     _buildCategories(),
      //   ],
      // ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomTextBox(
            hint: "Search",
            prefix: Icon(Icons.search, color: Colors.grey),
          ),
        ),
        Gap(5),
        NotificationBox(
          notifiedNumber: 1,
          onTap: null,
        )
      ],
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Gap(20),
          _buildCategories(),
          Gap(25),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
            child: Text(
              "Adopt Me",
              style: TextStyle(
                color: AppColor.textColor,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          ),
          _buildPets(),
        ]),
      ),
    );
  }

  int _selectedCategory = 0;
  Widget _buildCategories() {
    return SizedBox(
      height: 90,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('categories').snapshots(),
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            List<DocumentSnapshot> documents = snapshot.data!.docs;
            return ListView.builder(
              padding: EdgeInsets.only(bottom: 5, left: 15),
              scrollDirection: Axis.horizontal,
              itemCount: documents.length,
              itemBuilder: (context, index) {
                var document = documents[index];
                final category = CategoryModel(
                  id: document['id'],
                  name: document['name'],
                  icon: document['icon'],
                );
                return CategoryItem(
                  data: category,
                  selected: index == _selectedCategory,
                  onTap: () {
                    setState(() {
                      _selectedCategory = index;
                    });
                  },
                );
              },
            );
          } else {
            // Trường hợp không có dữ liệu
            return const Center(
                child: Text(
              'No data available',
              semanticsLabel: 'No data available',
            ));
          }
        },
      ),
    );
  }

  _buildPets() {
    double width = MediaQuery.of(context).size.width * .8;
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .8,
      ),
      items: List.generate(
        pets.length,
        (index) => PetItem(
          data: pets[index],
          width: width,
          onTap: null,
          onFavoriteTap: () {
            setState(() {
              pets[index]["is_favorited"] = !pets[index]["is_favorited"];
            });
          },
        ),
      ),
    );
  }
}
