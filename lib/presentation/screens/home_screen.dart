import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sonyliv/bottomnav/bottom_nav_bar.dart';
import 'package:sonyliv/data/models.dart';
import 'package:sonyliv/presentation/cubit/movie_cubit.dart';
import 'package:sonyliv/presentation/cubit/movie_state.dart';
import 'package:sonyliv/presentation/screens/downloadscreen.dart';
import 'package:sonyliv/presentation/screens/newhotscreen.dart';
import 'package:sonyliv/presentation/screens/profile_screen.dart';
import 'package:sonyliv/presentation/screens/searchscreen.dart';
import 'package:sonyliv/data/datasources/api_service.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeContent(),
    SearchScreen(),
    NewHotScreen(),
    DownloadScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isHome = _selectedIndex == 0;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: isHome
          ? AppBar(
              backgroundColor: Colors.black87,
              elevation: 0,
              title: Row(
                children: [
                  Image.network(
                    'https://images.slivcdn.com/UI_icons/sonyliv_new_revised_header_logo.png?w=40&q=high',
                    height: 35,
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.amberAccent, width: 1),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/premium.png', height: 18),
                        const SizedBox(width: 6),
                        const Text(
                          'Subscribe',
                          style: TextStyle(
                            color: Colors.amberAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Icon(Icons.cast_rounded, color: Colors.white),
                ),
              ],
            )
          : null,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.amber),
          );
        }

        if (state is MovieError) {
          return Center(
            child: Text(
              "Error: ${state.message}",
              style: const TextStyle(color: Colors.white),
            ),
          );
        }

        if (state is MovieLoaded) {
          final movies = state.movies;

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.55,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      movie.posterPath != null
                          ? "https://image.tmdb.org/t/p/w500${movie.posterPath}"
                          : "https://via.placeholder.com/150",
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Expanded(
                    child: Text(
                      movie.title ?? "No Title",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    "⭐ ${movie.rating ?? "N/A"}",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
