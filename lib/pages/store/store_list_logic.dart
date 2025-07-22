import 'package:get/get.dart';
import 'store_list_state.dart';

class StoreListLogic extends GetxController {
  StoreListState state = StoreListState();

  /// 模拟加载成都热门店铺数据
  Future<void> loadStores() async {
    state.isLoading = true;
    update();
    await Future.delayed(const Duration(seconds: 1));
    state.storeList = [
      StoreItem(
        id: '1',
        name: '熊猫咖啡',
        imageUrl: 'https://cdn.pixabay.com/photo/2021/08/17/01/55/chengdu-6551721_1280.jpg',
        userAvatarUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
        userName: '小熊猫',
        likeCount: 128,
      ),
      StoreItem(
        id: '2',
        name: '宽窄巷子·川味小馆',
        imageUrl: 'https://cdn.pixabay.com/photo/2022/09/02/09/40/chengdu-7427127_1280.jpg',
        userAvatarUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
        userName: '川菜达人',
        likeCount: 256,
      ),
      StoreItem(
        id: '3',
        name: '成都记忆书店',
        imageUrl: 'https://cdn.pixabay.com/photo/2017/08/10/20/19/anshun-bridge-2627415_640.jpg',
        userAvatarUrl: 'https://randomuser.me/api/portraits/women/3.jpg',
        userName: '书香成都',
        likeCount: 98,
      ),
      StoreItem(
        id: '4',
        name: '春熙路潮玩',
        imageUrl: 'https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?auto=format&fit=crop&w=400&q=80',
        userAvatarUrl: 'https://randomuser.me/api/portraits/men/4.jpg',
        userName: '潮玩小哥',
        likeCount: 187,
      ),
      StoreItem(
        id: '5',
        name: '锦里古风茶社',
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/f/f9/%E7%9A%87%E8%8C%B6%E5%9B%AD.JPG', // 替换为古风茶馆图片
        userAvatarUrl: 'https://randomuser.me/api/portraits/women/5.jpg',
        userName: '茶香四溢',
        likeCount: 210,
      ),
      StoreItem(
        id: '6',
        name: '太古里潮饮',
        imageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80', // 替换为潮流饮品店图片
        userAvatarUrl: 'https://randomuser.me/api/portraits/men/6.jpg',
        userName: '饮品控',
        likeCount: 175,
      ),
      StoreItem(
        id: '7',
        name: 'IFS屋顶花园',
        imageUrl: 'https://images.unsplash.com/photo-1465101046530-73398c7f28ca?auto=format&fit=crop&w=400&q=80',
        userAvatarUrl: 'https://randomuser.me/api/portraits/women/7.jpg',
        userName: '花园女孩',
        likeCount: 143,
      ),
      StoreItem(
        id: '8',
        name: '望平街夜市',
        imageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80',
        userAvatarUrl: 'https://randomuser.me/api/portraits/men/8.jpg',
        userName: '夜市达人',
        likeCount: 222,
      ),
      StoreItem(
        id: '9',
        name: '玉林串串香',
        imageUrl: 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?auto=format&fit=crop&w=400&q=80',
        userAvatarUrl: 'https://randomuser.me/api/portraits/women/9.jpg',
        userName: '串串妹',
        likeCount: 199,
      ),
      StoreItem(
        id: '10',
        name: '东郊记忆LiveHouse',
        imageUrl: 'https://images.unsplash.com/photo-1500534314209-a25ddb2bd429?auto=format&fit=crop&w=400&q=80',
        userAvatarUrl: 'https://randomuser.me/api/portraits/men/10.jpg',
        userName: '音乐青年',
        likeCount: 134,
      ),
    ];
    state.isLoading = false;
    update();
  }
} 