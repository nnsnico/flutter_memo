// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_note.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addNoteHash() => r'8377908380390cccd9372dfccc7b8b5e93554086';

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

/// See also [addNote].
@ProviderFor(addNote)
const addNoteProvider = AddNoteFamily();

/// See also [addNote].
class AddNoteFamily extends Family<AsyncValue<void>> {
  /// See also [addNote].
  const AddNoteFamily();

  /// See also [addNote].
  AddNoteProvider call(
    Note target,
  ) {
    return AddNoteProvider(
      target,
    );
  }

  @override
  AddNoteProvider getProviderOverride(
    covariant AddNoteProvider provider,
  ) {
    return call(
      provider.target,
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
  String? get name => r'addNoteProvider';
}

/// See also [addNote].
class AddNoteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addNote].
  AddNoteProvider(
    Note target,
  ) : this._internal(
          (ref) => addNote(
            ref as AddNoteRef,
            target,
          ),
          from: addNoteProvider,
          name: r'addNoteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addNoteHash,
          dependencies: AddNoteFamily._dependencies,
          allTransitiveDependencies: AddNoteFamily._allTransitiveDependencies,
          target: target,
        );

  AddNoteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.target,
  }) : super.internal();

  final Note target;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddNoteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddNoteProvider._internal(
        (ref) => create(ref as AddNoteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        target: target,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddNoteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddNoteProvider && other.target == target;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, target.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddNoteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `target` of this provider.
  Note get target;
}

class _AddNoteProviderElement extends AutoDisposeFutureProviderElement<void>
    with AddNoteRef {
  _AddNoteProviderElement(super.provider);

  @override
  Note get target => (origin as AddNoteProvider).target;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
