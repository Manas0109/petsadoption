import 'package:flutter/material.dart';
import 'package:petsadoption/features/home/Model.dart';
import 'package:petsadoption/features/home/ui/ui_widget.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage(
      {super.key, required this.productDataModel, required this.index});
  final Pet productDataModel;
  final int index;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    //var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'hero-rectangle${widget.index}',
          child: Container(
            width: width * 0.8,
            height: 360,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: Flex(direction: Axis.vertical, children: [
                Stack(
                  children: [
                    Center(
                        child: buildImage(
                            context, widget.productDataModel.imageUrl)),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: buildInfoGlass(
                          context,
                          widget.productDataModel.name,
                          widget.productDataModel.age,
                          widget.productDataModel.gender),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.red,
                    ),
                    child: TextButton(
                      child: const Text(
                        'Adopt',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        
                      },
                    ))
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
