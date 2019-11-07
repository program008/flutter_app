class PersonEntity {
	String name;
	String email;

	PersonEntity({this.name, this.email});

	PersonEntity.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		email = json['email'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['email'] = this.email;
		return data;
	}
}
