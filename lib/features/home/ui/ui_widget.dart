import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:petsadoption/features/home/ui/custom_image.dart';
import 'package:petsadoption/theme/color.dart';


 Widget buildInfoGlass(BuildContext context,String name, int age, String gender) {
    return GlassContainer(
      borderRadius: BorderRadius.circular(25),
      blur: 10,
      opacity: 0.15,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 90,
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildInfo(name),
            const SizedBox(
              height: 5,
            ),
            buildAttributes(age,gender),
          ],
        ),
      ),
    );
  }
  Widget buildAttributes(int age,String gender) {
    return 
    Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        getAttribute(
          Icons.transgender,
          gender,
        ),
        getAttribute(
          Icons.color_lens_outlined,
          "brown",
        ),
        getAttribute(
          Icons.query_builder,
          age.toString(),
        ),
      ],
    );
  }

    Widget buildInfo(String name) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColor.glassTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(),
      ],
    );
  }

  Widget buildImage(BuildContext context, imageUrl) {
    return CustomImage(
      imageUrl,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(50),
        bottom: Radius.circular(30),
      ),
      isShadow: false,
      width:MediaQuery.of(context).size.width * 0.8,
      height: 300,
      //fit: BoxFit.cover,
    );
  }
  Widget getAttribute(IconData icon, String info) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Icon(
          icon,
          size: 18,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: AppColor.textColor, fontSize: 13),
        ),
      ],
    );
  }