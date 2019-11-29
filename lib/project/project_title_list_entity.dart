class ProjectTitleListEntity {
	List<ProjectTitleListData> data;
	int errorCode;
	String errorMsg;

	ProjectTitleListEntity({this.data, this.errorCode, this.errorMsg});

	ProjectTitleListEntity.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = new List<ProjectTitleListData>();(json['data'] as List).forEach((v) { data.add(new ProjectTitleListData.fromJson(v)); });
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

class ProjectTitleListData {
	int visible;
	List<Null> children;
	String name;
	bool userControlSetTop;
	int id;
	int courseId;
	int parentChapterId;
	int order;

	ProjectTitleListData({this.visible, this.children, this.name, this.userControlSetTop, this.id, this.courseId, this.parentChapterId, this.order});

	ProjectTitleListData.fromJson(Map<String, dynamic> json) {
		visible = json['visible'];
		if (json['children'] != null) {
			children = new List<Null>();
		}
		name = json['name'];
		userControlSetTop = json['userControlSetTop'];
		id = json['id'];
		courseId = json['courseId'];
		parentChapterId = json['parentChapterId'];
		order = json['order'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['visible'] = this.visible;
		if (this.children != null) {
      data['children'] =  [];
    }
		data['name'] = this.name;
		data['userControlSetTop'] = this.userControlSetTop;
		data['id'] = this.id;
		data['courseId'] = this.courseId;
		data['parentChapterId'] = this.parentChapterId;
		data['order'] = this.order;
		return data;
	}
}
