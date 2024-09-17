library repository;

abstract class LocalRepository<T> {
  Future<void> add(T value);
  Future<List<T>> getAll();
  Future<void> remove(T value);
}
