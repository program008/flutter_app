class CommonSitesEntity {
	List<CommonSitesData> data;
	int errorCode;
	String errorMsg;

	CommonSitesEntity({this.data, this.errorCode, this.errorMsg});

	CommonSitesEntity.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = new List<CommonSitesData>();(json['data'] as List).forEach((v) { data.add(new CommonSitesData.fromJson(v)); });
		}
		errorCode = json['errorCode'];
		errorMsg = json['errorMsg'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] =  this.data.map((v) => v.toJson()).toList();
    }
		data['errorCode'] = this.errorCode;
		data['errorMsg'] = this.errorMsg;
		return data;
	}
}

class CommonSitesData {
	int visible;
	String icon;
	String link;
	String name;
	int id;
	int order;

	CommonSitesData({this.visible, this.icon, this.link, this.name, this.id, this.order});

	CommonSitesData.fromJson(Map<String, dynamic> json) {
		visible = json['visible'];
		icon = json['icon'];
		link = json['link'];
		name = json['name'];
		id = json['id'];
		order = json['order'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['visible'] = this.visible;
		data['icon'] = this.icon;
		data['link'] = this.link;
		data['name'] = this.name;
		data['id'] = this.id;
		data['order'] = this.order;
		return data;
	}
}
