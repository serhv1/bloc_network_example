// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyConnectionState {
  final bool isConnected;

  MyConnectionState(this.isConnected);
}

class ConnectionCubit extends Cubit<MyConnectionState> {
  late StreamSubscription<ConnectivityResult> _subscription;
  ConnectionCubit() : super(MyConnectionState(false)) {
    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      emit(MyConnectionState(result != ConnectivityResult.none));
    });

    // ignore: unused_element
    @override
    Future<void> close() {
      _subscription.cancel();
      return super.close();
    }
  }
}
