class Source {
  String id;
  String name;

  Source(this.id, this.name);

  factory Source.fromJson(Map<String, dynamic> json){

    if(json["id"] == null){
      json["id"] = "unknown";
    }

    return Source(
      json["id"], 
      json["name"]
    );
  }
}