import 'package:flutter/material.dart';
import 'package:petsadoption/features/details/ui/details.dart';
import 'package:petsadoption/features/home/Model.dart';
import 'package:petsadoption/features/home/bloc/home_bloc.dart';
import 'package:petsadoption/features/home/ui/ui_widget.dart';

class PetTileWidget extends StatelessWidget {
  const PetTileWidget({super.key, required this.productDataModel, required this.homeBloc,required this.index});
  final Pet productDataModel;
  final HomeBloc homeBloc;
  final int index ;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return  GestureDetector(
      onTap: () {
        Navigator.push(context,
              MaterialPageRoute(builder: ((context) => DetailsPage(productDataModel: productDataModel,index: index,))));
        homeBloc.add(DetailsButtonNavigateEvent());
      },
      child: Hero(
        tag: 'hero-rectangle$index',
        child: Container(
          width: width*0.8,
          height: 360,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
            child: Flex(
              direction: Axis.vertical,
              children:[ Stack(
                children: [
                  Center(child: buildImage(context,productDataModel.imageUrl)),
                  Positioned(
                    bottom: 0,
                    left: 40,
                    right: 40,
                    child: buildInfoGlass(context,productDataModel.name,productDataModel.age,productDataModel.gender),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
}
}

 