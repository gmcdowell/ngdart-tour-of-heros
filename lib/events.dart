/**
 * This is an example of how to set up the [EventBus] and its events.
 */
import 'package:event_bus/event_bus.dart';

/// The global [EventBus] object.
EventBus eventBus = new EventBus();

class EventA {
  String text;

  EventA(this.text);
}




