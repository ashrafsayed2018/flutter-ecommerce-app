import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/view_model/auth_controller.dart';

import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthController controller = AuthController();
  final List<String> names = ['رجال', 'نساء', 'اطفال', 'd', 'e', 'f'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              _searchTextFormField(),
              const SizedBox(
                height: 30,
              ),
              const CustomText(
                text: 'المنتجات',
                fontSize: 18,
                alignment: Alignment.topRight,
              ),
              _listViewCategories(),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomText(
                    text: ' الاكثر مبيعا',
                    fontSize: 18,
                    alignment: Alignment.topRight,
                  ),
                  CustomText(
                    text: '   المزيد',
                    fontSize: 16,
                    alignment: Alignment.topRight,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              _listViewProducts(),
            ],
          ),
        ),
      ),
    );
  }

  Container _listViewProducts() {
    return Container(
      height: 300,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * .4,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade100,
                    ),
                    child: Container(
                      height: 130,
                      width: MediaQuery.of(context).size.width * .4,
                      child: Image.asset(
                        'assets/images/product1.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: names[index],
                    fontSize: 16,
                    alignment: Alignment.bottomRight,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: names[index],
                    fontSize: 16,
                    alignment: Alignment.bottomRight,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomText(
                    text: "\$100",
                    fontSize: 16,
                    alignment: Alignment.bottomRight,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container _listViewCategories() {
    return Container(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
        itemCount: names.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade100,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/product1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: names[index],
                  fontSize: 16,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Container _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        textDirection: TextDirection.rtl,
        textAlignVertical: TextAlignVertical.center,
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefix: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
