import 'package:flutter/material.dart';
import 'package:healthy_app/constant/images.dart';

class CategoryHome extends StatefulWidget {
  const CategoryHome({super.key});

  @override
  State<CategoryHome> createState() => _CategoryHomeState();
}

List<String> listRender = [ImageConstant.catogory01,ImageConstant.catogory02,ImageConstant.catogory03,ImageConstant.catogory04];

class _CategoryHomeState extends State<CategoryHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Danh mục', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(listRender.length, (index) => Image.asset(listRender[index], width: 74, height: 95,))
            ),
          )
        ],
      ),
    );
  }
}
