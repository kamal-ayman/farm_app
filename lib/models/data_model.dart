class DataModel {
  Data? data;
  Power? power;

  DataModel({this.data, this.power});

  DataModel.fromJson(Map<dynamic, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    power = json['power'] != null ? new Power.fromJson(json['power']) : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    if (this.power != null) {
      data['power'] = this.power!.toJson();
    }
    return data;
  }
}

class Data {
  String? airHumidity;
  String? temperature;
  String? warningSystem;
  String? soilHumidity;

  Data(
      {this.airHumidity,
        this.temperature,
        this.warningSystem,
        this.soilHumidity});

  Data.fromJson(Map<dynamic, dynamic> json) {
    airHumidity = json['airHumidity'];
    temperature = json['temperature'];
    warningSystem = json['warningSystem'];
    soilHumidity = json['soilHumidity'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['airHumidity'] = this.airHumidity;
    data['temperature'] = this.temperature;
    data['warningSystem'] = this.warningSystem;
    data['soilHumidity'] = this.soilHumidity;
    return data;
  }
}

class Power {
  String? Default;
  String? ultraSonic;
  String? pump;

  Power({this.Default, this.ultraSonic, this.pump});

  Power.fromJson(Map<dynamic, dynamic> json) {
    Default = json['default'];
    ultraSonic = json['ultraSonic'];
    pump = json['pump'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['default'] = this.Default;
    data['ultraSonic'] = this.ultraSonic;
    data['pump'] = this.pump;
    return data;
  }
}
