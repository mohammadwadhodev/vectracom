class GetPostsModel {
  String? name;
  String? latinName;
  String? animalType;
  String? activeTime;
  String? lengthMin;
  String? lengthMax;
  String? weightMin;
  String? weightMax;
  String? lifespan;
  String? habitat;
  String? diet;
  String? geoRange;
  String? imageLink;
  int? id;

  GetPostsModel(
      {this.name,
        this.latinName,
        this.animalType,
        this.activeTime,
        this.lengthMin,
        this.lengthMax,
        this.weightMin,
        this.weightMax,
        this.lifespan,
        this.habitat,
        this.diet,
        this.geoRange,
        this.imageLink,
        this.id});

  GetPostsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    latinName = json['latin_name'];
    animalType = json['animal_type'];
    activeTime = json['active_time'];
    lengthMin = json['length_min'];
    lengthMax = json['length_max'];
    weightMin = json['weight_min'];
    weightMax = json['weight_max'];
    lifespan = json['lifespan'];
    habitat = json['habitat'];
    diet = json['diet'];
    geoRange = json['geo_range'];
    imageLink = json['image_link'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['latin_name'] = latinName;
    data['animal_type'] = animalType;
    data['active_time'] = activeTime;
    data['length_min'] = lengthMin;
    data['length_max'] = lengthMax;
    data['weight_min'] = weightMin;
    data['weight_max'] = weightMax;
    data['lifespan'] = lifespan;
    data['habitat'] = habitat;
    data['diet'] = diet;
    data['geo_range'] = geoRange;
    data['image_link'] = imageLink;
    data['id'] = id;
    return data;
  }
}
