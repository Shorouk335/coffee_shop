import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:coffee_shop/modules/DrinkDetails/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key, required this.title, this.isCup = true});
  final String title;
  final bool isCup;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = DrinkDetailsCubit.get(context);
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            child: DropdownButton(
                items: widget.isCup
                    ? cubit.cupSizeList.map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem(
                          child: Text(
                            e,
                          ),
                          value: e,
                        );
                      }).toList()
                    : cubit.addInsList.map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem(
                          child: Text(
                            e,
                          ),
                          value: e,
                        );
                      }).toList(),
                value: widget.isCup ? cubit.cupSize : cubit.addIns,
                isExpanded: true,
                underline: const SizedBox(),
                icon: Icon(
                  Icons.arrow_drop_down_circle_sharp,
                  size: 25.0,
                  weight: 20.0,
                  color: AppColors.primary,
                ),
                borderRadius: BorderRadius.circular(10.0),
                onChanged: (s) {
                  setState(() {
                    widget.isCup ? cubit.cupSize = s : cubit.addIns = s;
                  });
                }),
          ),
        ),
      ],
    );
  }
}
