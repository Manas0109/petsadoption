import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petsadoption/features/history/ui/history.dart';
import 'package:petsadoption/features/home/Model.dart';
import 'package:petsadoption/features/home/bloc/home_bloc.dart';
import 'package:petsadoption/features/home/ui/pet_tile_widget.dart';
import 'package:petsadoption/features/themeMode/bloc/theme_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _homePageState();
}

class _homePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<Pet> filteredPets = [];
  final HomeBloc homeBloc = HomeBloc();
  final ThemeBloc themeBloc = ThemeBloc();
  late HomeLoaded sucessstate;
  bool isDarkMode = false;
  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
    themeBloc.add(InitialThemeSetEvent());
    //isDarkMode =  ThemeChangedHistory() ;
  }

  void filterPets(String query) {
    homeBloc.add(SearchPetsEvent(query));
  }

  Future<bool> ThemeChangedHistory() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Load the theme preference from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMod = prefs.getBool('isDarkMode') ?? false;
    return isDarkMod;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToHistory) {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => HistoryPage())));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case HomeError:
            return const Center(
              child: Text('something is wrong'),
            );
          case HomeLoaded:
            sucessstate = state as HomeLoaded;
            filteredPets = sucessstate.pets;
            //print(filteredPets.length);
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Pet Adoption App'),
                  actions: [
                    BlocBuilder<ThemeBloc, ThemeData>(
                      bloc: ThemeBloc(),
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () {
                            BlocProvider.of<ThemeBloc>(context)
                                .add(ThemeSwitchEvent());
                          },
                          icon: const Icon(Icons.dark_mode),
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        homeBloc.add(HistoryButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.favorite),
                    ),
                  ],
                ),
                body: Column(
                  children: [
                    Container(
                      height: 50,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          controller: searchController,
                          onChanged: filterPets,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Search by Pet Name',
                              fillColor: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredPets.length,
                        itemBuilder: (context, index) {
                          return PetTileWidget(
                            productDataModel: filteredPets[index],
                            homeBloc: homeBloc,
                            index: index,
                          );
                        },
                      ),
                    ),
                  ],
                ));
          default:
            return const Center(
              child: Text('Err'),
            );
        }
      },
    );
  }
}
