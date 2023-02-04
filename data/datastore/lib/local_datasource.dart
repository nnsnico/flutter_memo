abstract class LocalDataSource<T> {
  Future<void> delete(T value);
  Future<void> insert(T value);
  Future<List<T>?> queryAll();
}
