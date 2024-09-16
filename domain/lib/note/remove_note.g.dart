// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_note.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$removeNoteHash() => r'b8a642ed8a9e9c59103c66a7168cb03da198b759';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [removeNote].
@ProviderFor(removeNote)
const removeNoteProvider = RemoveNoteFamily();

/// See also [removeNote].
class RemoveNoteFamily extends Family<AsyncValue<void>> {
  /// See also [removeNote].
  const RemoveNoteFamily();

  /// See also [removeNote].
  RemoveNoteProvider call(
    Note note,
  ) {
    return RemoveNoteProvider(
      note,
    );
  }

  @override
  RemoveNoteProvider getProviderOverride(
    covariant RemoveNoteProvider provider,
  ) {
    return call(
      provider.note,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'removeNoteProvider';
}

/// See also [removeNote].
class RemoveNoteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [removeNote].
  RemoveNoteProvider(
    Note note,
  ) : this._internal(
          (ref) => removeNote(
            ref as RemoveNoteRef,
            note,
          ),
          from: removeNoteProvider,
          name: r'removeNoteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$removeNoteHash,
          dependencies: RemoveNoteFamily._dependencies,
          allTransitiveDependencies:
              RemoveNoteFamily._allTransitiveDependencies,
          note: note,
        );

  RemoveNoteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.note,
  }) : super.internal();

  final Note note;

  @override
  Override overrideWith(
    FutureOr<void> Function(RemoveNoteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RemoveNoteProvider._internal(
        (ref) => create(ref as RemoveNoteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        note: note,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _RemoveNoteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemoveNoteProvider && other.note == note;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, note.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RemoveNoteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `note` of this provider.
  Note get note;
}

class _RemoveNoteProviderElement extends AutoDisposeFutureProviderElement<void>
    with RemoveNoteRef {
  _RemoveNoteProviderElement(super.provider);

  @override
  Note get note => (origin as RemoveNoteProvider).note;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
