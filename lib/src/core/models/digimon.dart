class Digimon {
  int? id;
  String? name;
  List<Images>? images;
  List<Levels>? levels;
  List<Types>? types;
  List<Attributes>? attributes;
  List<Fields>? fields;
  String? releaseDate;
  List<Descriptions>? descriptions;
  List<Skills>? skills;

  Digimon(
      {this.id,
      this.name,
      this.images,
      this.levels,
      this.types,
      this.attributes,
      this.fields,
      this.releaseDate,
      this.descriptions,
      this.skills,});

  Digimon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['levels'] != null) {
      levels = <Levels>[];
      json['levels'].forEach((v) {
        levels!.add(Levels.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
    if (json['fields'] != null) {
      fields = <Fields>[];
      json['fields'].forEach((v) {
        fields!.add(Fields.fromJson(v));
      });
    }
    releaseDate = json['releaseDate'];
    if (json['descriptions'] != null) {
      descriptions = <Descriptions>[];
      json['descriptions'].forEach((v) {
        descriptions!.add(Descriptions.fromJson(v));
      });
    }
    if (json['skills'] != null) {
      skills = <Skills>[];
      json['skills'].forEach((v) {
        skills!.add(Skills.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (levels != null) {
      data['levels'] = levels!.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    if (fields != null) {
      data['fields'] = fields!.map((v) => v.toJson()).toList();
    }
    data['releaseDate'] = releaseDate;
    if (descriptions != null) {
      data['descriptions'] = descriptions!.map((v) => v.toJson()).toList();
    }
    if (skills != null) {
      data['skills'] = skills!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? href;
  bool? transparent;

  Images({this.href, this.transparent});

  Images.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    transparent = json['transparent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    data['transparent'] = transparent;
    return data;
  }
}

class Levels {
  int? id;
  String? level;

  Levels({this.id, this.level});

  Levels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['level'] = level;
    return data;
  }
}

class Types {
  int? id;
  String? type;

  Types({this.id, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}

class Attributes {
  int? id;
  String? attribute;

  Attributes({this.id, this.attribute});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attribute = json['attribute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['attribute'] = attribute;
    return data;
  }
}

class Fields {
  int? id;
  String? field;
  String? image;

  Fields({this.id, this.field, this.image});

  Fields.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    field = json['field'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['field'] = field;
    data['image'] = image;
    return data;
  }
}

class Descriptions {
  String? origin;
  String? language;
  String? description;

  Descriptions({this.origin, this.language, this.description});

  Descriptions.fromJson(Map<String, dynamic> json) {
    origin = json['origin'];
    language = json['language'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['origin'] = origin;
    data['language'] = language;
    data['description'] = description;
    return data;
  }
}

class Skills {
  int? id;
  String? skill;
  String? translation;
  String? description;

  Skills({this.id, this.skill, this.translation, this.description});

  Skills.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    skill = json['skill'];
    translation = json['translation'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['skill'] = skill;
    data['translation'] = translation;
    data['description'] = description;
    return data;
  }
}

class PriorEvolutions {
  int? id;
  String? digimon;
  String? condition;
  String? image;
  String? url;

  PriorEvolutions(
      {this.id, this.digimon, this.condition, this.image, this.url});

  PriorEvolutions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digimon = json['digimon'];
    condition = json['condition'];
    image = json['image'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['digimon'] = digimon;
    data['condition'] = condition;
    data['image'] = image;
    data['url'] = url;
    return data;
  }
}