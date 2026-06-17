void main() {}


// ========= 146 
class LRUCache {
  LRUCache(this.capacity);

  final int capacity;

  final LinkedHashMap<int, int> _cache = LinkedHashMap<int, int>();

  int get(int key) {
    if (!_cache.containsKey(key)) {
      return -1;
    }

    final value = _cache[key]!;
 
    _cache.remove(key);
    _cache[key] = value;

    return value;
  }

  void put(int key, int value) {
    if (_cache.containsKey(key)) {
      _cache.remove(key);
    } else if (_cache.length >= capacity) {
      final oldestKey = _cache.keys.first;
      _cache.remove(oldestKey);
    }

    _cache[key] = value;
  }
}

// 49 

class Solution {
  List<List<String>> groupAnagrams(List<String> strs) {
    final Map<String, List<String>> map = {};

    for (final word in strs) {
      final chars = word.split('');
      chars.sort();

      final key = chars.join('');

      if (!map.containsKey(key)) {
        map[key] = [];
      }

      map[key]!.add(word);
    }

    return map.values.toList();
  }
}

// ==== 42

class Solution {
  int trap(List<int> height) {
    int left = 0;
    int right = height.length - 1;

    int leftMax = 0;
    int rightMax = 0;

    int water = 0;

    while (left < right) {
      if (height[left] < height[right]) {
        if (height[left] >= leftMax) {
          leftMax = height[left];
        } else {
          water += leftMax - height[left];
        }

        left++;
      } else {
        if (height[right] >= rightMax) {
          rightMax = height[right];
        } else {
          water += rightMax - height[right];
        }

        right--;
      }
    }

    return water;
  }
}

// 239

