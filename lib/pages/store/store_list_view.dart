import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'store_list_logic.dart';
import 'store_list_state.dart';
import 'store_detail/store_detail_view.dart';

class StoreListPage extends StatelessWidget {
  const StoreListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreListLogic>(
      init: StoreListLogic()..loadStores(),
      builder: (logic) {
        final state = logic.state;
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              '店铺列表',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF1A1A1A),
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F0),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 18,
                  color: Color(0xFF666666),
                ),
              ),
              onPressed: () => Get.back(),
            ),
          ),
          body: state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFe0c3fc),
                        Color(0xFF8ec5fc),
                        Color(0xFFf9d423),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 220,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: state.storeList.length,
                      itemBuilder: (context, index) {
                        final store = state.storeList[index];
                        return StoreCard(store: store);
                      },
                    ),
                  ),
                ),
        );
      },
    );
  }
}

class StoreCard extends StatelessWidget {
  final StoreItem store;
  const StoreCard({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Get.to(() => const StoreDetailPage());
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Image.network(
                store.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    store.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundImage: NetworkImage(store.userAvatarUrl),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          store.userName,
                          style: const TextStyle(fontSize: 12, color: Colors.black87),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(Icons.favorite_border, size: 16, color: Colors.redAccent),
                      const SizedBox(width: 2),
                      Text(
                        store.likeCount.toString(),
                        style: const TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 