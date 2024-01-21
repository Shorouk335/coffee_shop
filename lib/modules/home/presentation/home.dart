import 'package:coffee_shop/modules/home/presentation/widget/bonus_rewords.dart';
import 'package:coffee_shop/modules/home/presentation/widget/welcome_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: WelcomeWidget(),
          ), 
           SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ), 
          SliverToBoxAdapter(
            child: BounsRewordsWidget(),
          ), 
           SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ), 
          SliverToBoxAdapter(
            child: Text("Your Favorites" , style: TextStyle(
              color: Colors.black , 
              fontSize: 28.0 , 
              fontWeight: FontWeight.bold

            ),),
          )
        ],
      ),
    );
  }
}

