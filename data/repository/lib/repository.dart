library repository;

abstract class Repository<T> {
  Future<void> add(T value);
  Future<List<T>> getAll();
  Future<void> remove(T value);
}
