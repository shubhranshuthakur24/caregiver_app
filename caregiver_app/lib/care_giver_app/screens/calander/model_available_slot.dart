class ModelAvailableSlot {
  ModelAvailableSlot({
    required this.availableSlots,
    required this.label,
    required this.date,
    this.bookedSlots,
    required this.availabilityId,
  });

  late final List<AvailableSlots> availableSlots;
  late final String label;
  late final String date;
  late final Null bookedSlots;
  late final int availabilityId;

  ModelAvailableSlot.fromJson(Map<String, dynamic> json) {
    availableSlots = List.from(json['available_slots']).map((e) => AvailableSlots.fromJson(e)).toList();
    label = json['label'] ?? "";
    date = json['date'];
    bookedSlots = null;
    availabilityId = json['availability_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['available_slots'] = availableSlots.map((e) => e.toJson()).toList();
    _data['label'] = label;
    _data['date'] = date;
    _data['booked_slots'] = bookedSlots;
    _data['availability_id'] = availabilityId;
    return _data;
  }
}

class AvailableSlots {
  AvailableSlots({
    required this.slotEndTime,
    required this.slotStartTime,
    required this.slotid,
  });

  late final String slotEndTime;
  late final String slotStartTime;
  late final int slotid;

  AvailableSlots.fromJson(Map<String, dynamic> json) {
    slotEndTime = json['slot_end_time'];
    slotStartTime = json['slot_start_time'];
    slotid = json['slotid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['slot_end_time'] = slotEndTime;
    _data['slot_start_time'] = slotStartTime;
    _data['slotid'] = slotid;
    return _data;
  }
}
