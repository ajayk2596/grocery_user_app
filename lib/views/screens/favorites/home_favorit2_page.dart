import 'package:flutter/material.dart';
import '../../../controllers/provider/favorite/favorite_provider.dart';
import '../../../models/favoritemodel/favorite_model.dart';
import 'home_favorite_page.dart';

class FavoriteScreenTwo extends StatefulWidget {
  const FavoriteScreenTwo({Key? key}) : super(key: key);

  @override
  _FavoriteScreenTwoState createState() => _FavoriteScreenTwoState();
}

class _FavoriteScreenTwoState extends State<FavoriteScreenTwo> {
  final FavoriteProvider favoriteProvider = FavoriteProvider();

  List<FavoriteModel> favorites = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final data = await favoriteProvider.getFavorites();
    setState(() {
      favorites = data;
      isLoading = false;
    });
  }

  Future<void> _deleteFavorite(FavoriteModel favorite) async {
    await favoriteProvider.toggleFavorite(favorite);
    setState(() {
      favorites.remove(favorite); // Instantly update the UI
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : favorites.isEmpty
          ?  FavoritePage()
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final favorite = favorites[index];
          return Card(
            elevation: 2,
            child: ListTile(
              leading: Image.network(
                favorite.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(favorite.name),
              subtitle: Text('\$${favorite.price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => _deleteFavorite(favorite),
              ),
            ),
          );
        },
      ),
    );
  }
}
