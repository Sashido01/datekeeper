import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'error_state.dart';
import 'loading_indicator.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final Widget? loading;
  final Widget Function(Object error, StackTrace? stackTrace)? error;
  final Widget? empty;
  final VoidCallback? onRetry;

  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.loading,
    this.error,
    this.empty,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: (dataValue) {
        if (empty != null && dataValue == null) return empty!;
        if (empty != null && dataValue is Iterable && dataValue.isEmpty) return empty!;
        return data(dataValue);
      },
      loading: () => loading ?? const LoadingIndicator(),
      error: (err, stack) =>
          error?.call(err, stack) ??
          ErrorState(
            message: err.toString(),
            onRetry: onRetry,
          ),
    );
  }
}