class WifiInfo {
  String identifierForVendor;
  String androidId;
  String wan;
  String lan;
  String wifiSSID;
  String wifiBSSID;

  WifiInfo({this.identifierForVendor,
    this.androidId,
    this.wan,
    this.lan,
    this.wifiSSID,
    this.wifiBSSID});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifierForVendor'] = this.identifierForVendor;
    data['androidId'] = this.androidId;
    data['wan'] = this.wan;
    data['lan'] = this.lan;
    data['wifiSSID'] = this.wifiSSID;
    data['wifiBSSID'] = this.wifiBSSID;
    return data;
  }
}