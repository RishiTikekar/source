import 'package:flutter/material.dart';
import 'package:movieapp/provider/movie_list_pvd.dart';
import 'package:movieapp/provider/movie_list_pvd.dart';
import 'package:movieapp/provider/movie_list_pvd.dart';
import 'package:movieapp/styles/my_color.dart';
import 'package:movieapp/ui/movie_list_section.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ValueNotifier<int>(0)),
      ],
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final value = context.watch<ValueNotifier<int>>().value;
    return Scaffold(
      appBar: AppBar(title: const Text("Movie App")),
      body: value == 0
          ? _MovieTab(key: Key("Trending"), type: MovieType.popular)
          : _MovieTab(key: Key("Top rated"), type: MovieType.topRated),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: value,
        backgroundColor: MyColor.white.withOpacity(0.1),
        onTap: (currentIndex) =>
            context.read<ValueNotifier<int>>().value = currentIndex,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up_outlined),
            label: 'Trending',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome),
            label: 'Top rated',
          )
        ],
      ),
    );
  }
}

class _MovieTab extends StatelessWidget {
  final MovieType type;
  const _MovieTab({
    required this.type,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MovieListPvd>(
      create: (_) => MovieListPvd(type),
      child: Consumer<MovieListPvd>(
        builder: (context, movieListPvd, child) {
          if (movieListPvd.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (movieListPvd.hasData) {
            return const MovieListSection();
          } else {
            return const Center(child: Text("Something went wrong! "));
          }
        },
      ),
    );
  }
}
