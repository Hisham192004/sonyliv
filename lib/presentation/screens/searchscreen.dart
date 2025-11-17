import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> categories = [
    'Best of Tamil',
    'Best of Telugu',
    'Best of Marathi',
    'Best of Malayalam',
    'Best of Hollywood',
    'Latest Premium Content',
    'Trending TV Shows',
  ];

  final TextEditingController _searchController = TextEditingController();
  bool isLoading = false;
  List<dynamic> popularSearches = [];
  List<dynamic> searchResults = [];

  @override
  void initState() {
    super.initState();
    fetchPopularSearches();
  }

  Future<void> fetchPopularSearches() async {
    setState(() => isLoading = true);

    final url = Uri.parse(
        'https://api.themoviedb.org/3/trending/all/day?api_key=b54c63f033a6a1680407fa73ece79561');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        popularSearches = data['results'];
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
    }
  }

  Future<void> fetchSearchResults(String query) async {
    if (query.isEmpty) return;

    setState(() {
      isLoading = true;
      searchResults = [];
    });

    final url = Uri.parse(
        'https://api.themoviedb.org/3/search/multi?api_key=YOUR_API_KEY&query=$query');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        searchResults = data['results'];
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final resultsToShow = searchResults.isNotEmpty
        ? searchResults
        : popularSearches;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: _searchController,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.amberAccent,
            decoration: const InputDecoration(
              hintText: 'Search for movies, shows, sports etc.',
              hintStyle: TextStyle(color: Colors.white70),
              prefixIcon: Icon(Icons.search, color: Colors.white70),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
            onSubmitted: fetchSearchResults,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Popular Categories",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 10,
              runSpacing: 12,
              children: categories
                  .map(
                    (cat) => Chip(
                      label: Text(cat),
                      labelStyle: const TextStyle(color: Colors.white),
                      backgroundColor: Colors.grey[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 25),
            Text(
              searchResults.isEmpty
                  ? "Popular Searches"
                  : "Search Results",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            if (isLoading)
              const Center(
                child: CircularProgressIndicator(color: Colors.amberAccent),
              )
            else if (resultsToShow.isNotEmpty)
              GridView.builder(
                itemCount: resultsToShow.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final item = resultsToShow[index];
                  final imagePath = item['poster_path'] ??
                      item['backdrop_path'] ??
                      '';
                  final imageUrl = imagePath.isNotEmpty
                      ? 'https://image.tmdb.org/t/p/w500$imagePath'
                      : 'https://via.placeholder.com/150';
                  final title = item['title'] ??
                      item['name'] ??
                      'Untitled';

                  return SizedBox(
                    height: 190,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            imageUrl,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            ),
                            ),
                            const SizedBox(height: 4),
                            Expanded(
                              child: Text(
                                title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.white, fontSize: 12),
                                ),
                                ),
                                ],
                                ),
                                );
                                },
                                ),
                                ],
                                ),
                                ),
                                );
                                }
                                }
