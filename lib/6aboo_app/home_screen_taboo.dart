
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googlesignin/6aboo_app/cubit/cubit.dart';
import 'package:googlesignin/6aboo_app/cubit/state.dart';
import 'package:googlesignin/6aboo_app/sign_in.dart';
import 'package:googlesignin/helper/cashe_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'model/categories_model.dart';
import 'model/fetured_model.dart';




class TabooScreen extends StatefulWidget {

  @override
  State<TabooScreen> createState() => _TabooScreenState();
}

class _TabooScreenState extends State<TabooScreen> {
  var myCarousalController=CarouselController();

  var myScrollController=ScrollController();

  int curentImage=0;

  List<FeturedModel> houses=[
    FeturedModel(
        picture: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTb6EJuiaKbu33qBIyk5k2fbfa1MWVfNJ-fvg&s',
        price: 100,
        Location: 'Amman - Abdoun',
        descrption: 'A building For Sale in Abdoun'

    ),
    FeturedModel(
        picture: 'https://6aboo-uploads3.s3.me-south-1.amazonaws.com/topics/xZesZ1715086756.webp',
        price: 150,
        Location: 'Amman - Al Rabiah',
        descrption: 'A building For Sale in Al Rabiah'

    ),



  ];

  List<CategoriesModel> categories=[

    CategoriesModel(
        image: 'https://media.istockphoto.com/id/1165384568/photo/europe-modern-complex-of-residential-buildings.jpg?s=612x612&w=0&k=20&c=iW4NBiMPKEuvaA7h8wIsPHikhS64eR-5EVPfjQ9GPOA=',
        titile: 'Apartment'
    ),
    CategoriesModel(
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWjwVCeajlG52IXmxDsP4-V7R11zOM1DJ8PA&s',
        titile: 'Villa'
    ),
    CategoriesModel(
        image: 'https://media.istockphoto.com/id/1437629749/photo/land-plot-in-aerial-view-in-chiang-mai-of-thailand.webp?b=1&s=170667a&w=0&k=20&c=Xsz0O363gGwnvhI3L2d29D_Dr4qBcrGVdUmvvTXoMUo=',
        titile: 'Land'
    ),
    CategoriesModel(
        image: 'https://images.pexels.com/photos/998499/pexels-photo-998499.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        titile: 'Commerical'
    ),
    CategoriesModel(
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLwsfo9NC1pzBgR2nmp8LIBDIPbZSqODx4Sg&s',
        titile: 'Building'
    ),
    CategoriesModel(
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOA_U2KzJGmfwfN9Gs3uBEWH4kmEgLLZx0hg&s',
        titile: 'Farm'
    ),
    CategoriesModel(
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvwyDMyCCk4E4zCHOd0mrMD2JTCsMfjveVcA&s',
        titile: 'Studio'
    ),
    CategoriesModel(
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLbTGWnADS-iYHrvrCjM5BmmJ4RIDr_mx0Xg&s',
        titile: 'House'
    ),
    CategoriesModel(
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRadcMAH968F3wWZ32KHQNTFJnBb-j9soda4Q&s',
        titile: 'Chalet'
    ),
    CategoriesModel(
        image: 'https://media.istockphoto.com/id/582256640/photo/oil-refinery-chemical-petrochemical-plant.jpg?s=612x612&w=0&k=20&c=BEdsHVe2vUfzRTb9KcsCS_tCH6_R_nKLKkOQCht8AKo=',
        titile: 'Industrial'
    ),



  ];

  List<FeturedModel> lastPosts=[
    FeturedModel(
        picture: 'https://6aboo-uploads3.s3.me-south-1.amazonaws.com/topics/WkPPc1714038981.webp',
        price: 150,
        Location: 'Amman - Gardenz',
        descrption: 'A building For Sale in Gardenz'

    ),
    FeturedModel(
        picture: 'https://6aboo-uploads3.s3.me-south-1.amazonaws.com/topics/6Rc261714554407.webp',
        price: 120,
        Location: 'Amman - Jabal el taj',
        descrption: 'A building For Sale in Jabal el taj'

    ),



  ];

  List<FeturedModel> postsInAnotherCountry=[
    FeturedModel(
        picture: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRepdaF_0-nvekJYo7d9w4hC6XnSgLgqntnKg&s',
        price: 1000,
        Location: 'Dubai ',
        descrption: 'A building For Sale in Dubai'

    ),
    FeturedModel(
        picture: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9mB2ZeKyfu8ljrzZPmHzv4QlUoJPyNtgeEQ&s',
        price: 2000,
        Location: 'Dubai',
        descrption: 'A building For Sale in Dubai'

    ),



  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: _myAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children:[
            _buildMyTextFormField(),
            _buildMyCarousal(),
            _buildMySmooth(),
            //build posts by categories
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 20
              ),
              child: Container(
                height: 50,
                alignment: AlignmentDirectional.centerStart,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10
                  ),
                  child: Text(
                    'Build posts by categories',

                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 18,
                        fontFamily: 'Janna'
                    ),
                  ),
                ),
              ),
            ),
            //Categories
             Container(
              height: 270,
              child:  RawScrollbar(
                controller: myScrollController,
                thumbVisibility: true,
                minOverscrollLength: 10,
                minThumbLength: 10,
                trackVisibility: true, // Shows the scrollbar track
                thickness: 5.0,
                thumbColor: Colors.green,// Adjust the thickness as needed
                radius:const Radius.circular(4.0), // For rounded corners
                scrollbarOrientation: ScrollbarOrientation.bottom,
                child:Padding(
                  padding: const EdgeInsetsDirectional.only(
                      bottom: 10
                  ),
                  child: GridView.count(
                    physics: const BouncingScrollPhysics(),
                    controller: myScrollController,
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 1.18,
                    children: List.generate(categories.length, (index)=>_buildNewCategories(categories[index])),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            //Ad
            const Image(
                height: 60,
                width: double.infinity,
                fit: BoxFit.fitWidth,
                image: AssetImage(
                    'asset/image/taboo.jpg'
                )),

            //Featured Posts
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 10,
                  top: 20
              ),
              child: Container(
                height: 50,
                alignment: AlignmentDirectional.centerStart,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Featured Posts',

                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 18,
                            fontFamily: 'Janna'
                        ),
                      ),
                     const Spacer(),
                     const Padding(
                        padding:  EdgeInsets.only(
                            right: 10
                        ),
                        child: Row(
                          children: [
                            Text(
                              'More',
                              style: TextStyle(
                                color: Colors.black54,

                              ),
                            ),
                            Icon(
                              Icons.more_horiz,
                              color: Colors.black54,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 20,
                  left: 20

              ),
              child: Container(
                height: 330,
                child: RawScrollbar(
                  controller: myScrollController,
                  thumbVisibility: true,
                  trackVisibility: true, // Shows the scrollbar track
                  thickness: 8.0,
                  minThumbLength: 30,
                  thumbColor: Colors.green,// Adjust the thickness as needed
                  radius:const Radius.circular(4.0), // For rounded corners
                  scrollbarOrientation: ScrollbarOrientation.bottom,

                  child: Padding(
                    padding:const EdgeInsetsDirectional.only(
                        bottom: 10
                    ),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index)=>_buildMyFeturedPosts(houses[index],'jo'),
                        separatorBuilder: (context,index)=>const SizedBox(
                          width: 15,
                        ),
                        itemCount: houses.length),
                  ),
                ),
              ),
            ),

            //Latest Post
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 10,
                  top: 20
              ),
              child: Container(
                height: 50,
                alignment: AlignmentDirectional.centerStart,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Latest Posts',

                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 18,
                            fontFamily: 'Janna'
                        ),
                      ),
                      Spacer(),
                      const Padding(
                        padding:  EdgeInsets.only(
                            right: 10
                        ),
                        child: Row(
                          children: [
                            Text(
                              'More',
                              style: TextStyle(
                                color: Colors.black54,

                              ),
                            ),
                            Icon(
                              Icons.more_horiz,
                              color: Colors.black54,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 20,
                  left: 20
              ),
              child: Container(
                height: 330,
                child: RawScrollbar(
                  controller: myScrollController,
                  thumbVisibility: true,
                  trackVisibility: true, // Shows the scrollbar track
                  thickness: 8.0,
                  minThumbLength: 30,
                  thumbColor: Colors.green,// Adjust the thickness as needed
                  radius: Radius.circular(4.0), // For rounded corners
                  scrollbarOrientation: ScrollbarOrientation.bottom,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10
                    ),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index)=>_buildMyFeturedPosts(lastPosts[index],'jo'),
                        separatorBuilder: (context,index)=>const SizedBox(
                          width: 15,
                        ),
                        itemCount: houses.length),
                  ),
                ),
              ),
            ),

            //Posts in onther country
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 10,
                  top: 20
              ),
              child: Container(
                height: 50,
                alignment: AlignmentDirectional.centerStart,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Posts in another country',

                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 18,
                            fontFamily: 'Janna'
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding:  EdgeInsets.only(
                            right: 10
                        ),
                        child: Row(
                          children: [
                            Text(
                              'More',
                              style: TextStyle(
                                color: Colors.black54,

                              ),
                            ),
                            Icon(
                              Icons.more_horiz,
                              color: Colors.black54,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 20,
                  left: 20
              ),
              child: Container(
                height: 330,
                child: RawScrollbar(
                  controller: myScrollController,
                  thumbVisibility: true,
                  trackVisibility: true, // Shows the scrollbar track
                  thickness: 8.0,
                  minThumbLength: 30,
                  thumbColor: Colors.green,// Adjust the thickness as needed
                  radius:const Radius.circular(4.0), // For rounded corners
                  scrollbarOrientation: ScrollbarOrientation.bottom,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10
                    ),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index)=>_buildMyFeturedPosts(postsInAnotherCountry[index],'ae'),
                        separatorBuilder: (context,index)=>const SizedBox(
                          width: 15,
                        ),
                        itemCount: houses.length),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
      bottomNavigationBar:_buildMyBottomNavigateBar(),

    );
  }

  String generateCountryFlag(String flag){
    String countryCode='${flag}';
    return countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'), (match)=>String.fromCharCode(match.group(0)!.codeUnitAt(0)+127397));
  }

  PreferredSizeWidget _myAppBar()=>AppBar(
    titleSpacing: 30,
    surfaceTintColor: Colors.white,
    toolbarHeight: 60,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.grey[195],
      statusBarIconBrightness: Brightness.dark,

    ),
    shape:const  RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(30),
            bottomEnd: Radius.circular(30)
        )
    ),
    backgroundColor:  Colors.white,
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<AppCubit,AppState>(
        builder: (BuildContext context, AppState state) {
          return IconButton(
            onPressed: (){
              AppCubit.get(context).signOut().then((value){
                CasheHelper.RemoveData(key: 'token');
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (s)=>false);
              });

            },
            icon:const Icon(
              Icons.logout,
              size: 30,
              color: Colors.black,
              fill: 0.8,
            ),
          );
        },
      ),
    ),
    centerTitle: true,
    title:const Padding(
      padding:  EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
              height: 30,
              image: NetworkImage(
                  'https://jo.6abbo.com/assets/images/6abbo.png'
              ))
        ],
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
            onPressed: (){},
            icon:const Icon(
              Icons.notifications,
              color: Colors.black,
              size: 30,
            )),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          radius: 20,
          child: Text(
            '${generateCountryFlag('jo')}',
            style:const TextStyle(
                fontSize: 30
            ),
          ),
        ),
      )
    ],
    //centerTitle: true,
  );

  Widget _buildMyTextFormField()=>Padding(
    padding:const EdgeInsetsDirectional.only(
        start: 20,
        end: 20,
        top: 10,
        bottom: 10
    ),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: TextFormField(
        decoration:const InputDecoration(
            labelText: 'Serach for apartment, land, villa , house, post ',
            border: InputBorder.none,
            labelStyle: TextStyle(
                fontFamily: 'Janna'
            ),
            prefixIcon: Icon(
                Icons.search_rounded
            ),
            filled: true,
            fillColor: Colors.white
        ),
      ),
    ),
  );

  Widget _buildMyCarousal()=>Padding(
    padding: const EdgeInsetsDirectional.only(
        bottom: 10
    ),
    child: CarouselSlider(

        items:const [
          Card(
            child: Image(
                width: double.infinity,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://mr.6abbo.com/assets/previews/%D8%B4%D9%82%D9%82.png'
                )),
          ),
          Card(
            child: Image(
                width: double.infinity,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://sa.6abbo.com/assets/previews/%D8%A7%D8%AD%D8%AF%D8%AB-%D8%A7%D9%84%D8%A7%D8%B9%D9%84%D8%A7%D9%86%D8%A7%D8%AA.png')),
          ),
          Card(
            child: Image(
                width: double.infinity,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://jo.6abbo.com/assets/previews/homeImage.png'
                )),
          ),
          Card(
            child: Image(
                width: double.infinity,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://mr.6abbo.com/assets/previews/%D9%85%D8%B2%D8%A7%D8%B1%D8%B9.png'
                )),
          )
        ],
        carouselController:myCarousalController,
        options: CarouselOptions(
            height: 200,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 1),
            onPageChanged: (index,reason){
              setState(() {
                curentImage=index;
              });
            },
            autoPlayCurve: Curves.linear,
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.9
        )),
  );

  Widget _buildMySmooth()=>Padding(
    padding:const EdgeInsetsDirectional.only(
        bottom: 20
    ),
    child: AnimatedSmoothIndicator(
      activeIndex: curentImage,
      count: 4,
      effect:const WormEffect(
          dotWidth: 15,
          dotHeight: 7.5,
          dotColor: Colors.black,
          activeDotColor: Colors.green
      ),
      onDotClicked: (index){
        myCarousalController.animateToPage(index);
      },
    ),
  );

  Widget _buildMyBottomNavigateBar()=>ConvexAppBar(
    backgroundColor: Colors.white,
    activeColor: Colors.black,
    color: Colors.black,
    style: TabStyle.reactCircle,
    initialActiveIndex: 2,
    items: const[
      TabItem(
          icon: Icon(
              Icons.post_add
          ),
          title: 'My posts'
      ),
      TabItem(
          icon: Icon(
              Icons.message
          ),
          title: 'Chat'
      ),
      TabItem(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          title: 'Add Post'
      ),
      TabItem(
          icon: Icon(
              Icons.location_pin
          ),
          title: '6abbo map'
      ),
      TabItem(
          icon: Icon(
              Icons.calendar_today
          ),
          title: 'My visits'
      )

    ],

  );

  Widget _buildMyFeturedPosts(FeturedModel model,String flag)=>Card(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            height: 300,
            width: 350,
            alignment: AlignmentDirectional.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  height: 200,
                  width: 350,
                  image: NetworkImage(
                      '${model.picture}'
                  ),
                  fit: BoxFit.cover,
                ),
                Row(
                  children: [
                    const Text(
                      'Apartment For sale',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Janna'
                      ),

                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 10
                      ),
                      child: Text(
                        '\$${model.price}',
                        style:const TextStyle(
                            fontFamily: 'Janna',
                            fontSize: 18
                        ),
                      ),
                    )

                  ],
                ),
                Text(
                  '${generateCountryFlag(flag)} ${model.Location}',
                  style:const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Janna'
                  ),
                ),
                Text(
                  '${model.descrption}',
                  style:const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Janna'
                  ),
                )


              ],
            ),
          ),
          Container(
            height: 30,
            color: Colors.grey[200],
            child:const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Speed',
                  style: TextStyle(
                      fontFamily: 'Janna'
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.rocket_launch,
                  color: Colors.green,
                )
              ],
            ),
          )
        ],
      ),
    ),
  );

  Widget _buildNewCategories(CategoriesModel model)=>Column(
    children: [
      Container(
        height: 100,
        width: 100,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image(
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                image:NetworkImage(
                    '${model.image}'
                ) ),
          ),
        ),
      ),
      Text(
        '${model.titile}',
        style:const TextStyle(
            fontFamily: 'Janna'
        ),
      )

    ],
  );
}
