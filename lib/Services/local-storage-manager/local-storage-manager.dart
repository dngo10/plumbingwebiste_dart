import 'dart:html';

class LocalStorageManager {
  static Storage storage = window.localStorage;

  static addToStorage(String key, String value) {
    storage[key] = value;
  }

  static String getValue(String key) {
    if(storage.containsKey(key)){
      return storage[key];
    }
    return null;
  }

  static void deleteValue(String key){
    storage.remove(key);
  }
}