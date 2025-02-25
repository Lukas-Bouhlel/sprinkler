import 'dart:async';
import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

void connectToMqtt() async {
  final client = MqttServerClient('192.168.238.56', 'client_id');
  client.logging(on: true);
  client.keepAlivePeriod = 20; // Intervalle de keep alive en secondes
  client.onDisconnected = onDisconnected;

  final connMessage = MqttConnectMessage()
      .withClientIdentifier('client_id')
      .withWillQos(MqttQos.exactlyOnce);
  client.connectionMessage = connMessage;

  try {
    await client.connect();
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('MQTT client connected');
    } else {
      print('MQTT client connection failed - disconnecting, state is ${client.connectionStatus!.state}');
      client.disconnect();
    }
  } catch (e) {
    print('Exception: $e');
    client.disconnect();
  }
}

void onDisconnected() {
  print('MQTT client disconnected');
}
