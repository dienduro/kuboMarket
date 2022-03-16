// To parse this JSON data, do
//
//     final products = productsFromMap(jsonString);

import 'dart:convert';

final descripcionPromoValues = EnumValues({"-": DescripcionPromo.EMPTY});

class Datum {
  final String categoria;

  final String cliente;
  final String colores;
  final String descripcion;
  final String disponible;
  final String estado;
  final DateTime? fechaCreacion;
  final String id;
  final String nombre;
  final String precio;
  final String tallas;
  final DescripcionPromo? video;
  final DescripcionPromo? descripcionPromo;
  final String idPromocion;
  final String valorPromo;
  final String idProductoPromo;
  final DateTime? fechaPromo;
  final String estadoPromo;
  final String likes;
  final String megusta;
  final String galeria;
  final String imagen;
  Datum({
    required this.categoria,
    required this.cliente,
    required this.colores,
    required this.descripcion,
    required this.disponible,
    required this.estado,
    required this.fechaCreacion,
    required this.id,
    required this.nombre,
    required this.precio,
    required this.tallas,
    required this.video,
    required this.descripcionPromo,
    required this.idPromocion,
    required this.valorPromo,
    required this.idProductoPromo,
    required this.fechaPromo,
    required this.estadoPromo,
    required this.likes,
    required this.megusta,
    required this.galeria,
    required this.imagen,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        categoria: json["categoria"] ?? null,
        cliente: json["cliente"] ?? null,
        colores: json["colores"] ?? null,
        descripcion: json["descripcion"] ?? null,
        disponible: json["disponible"] ?? null,
        estado: json["estado"] ?? null,
        fechaCreacion: json["fecha_creacion"] == null
            ? null
            : DateTime.parse(json["fecha_creacion"]),
        id: json["id"] ?? null,
        nombre: json["nombre"] ?? null,
        precio: json["precio"] ?? null,
        tallas: json["tallas"] ?? null,
        video: json["video"] == null
            ? null
            : descripcionPromoValues.map[json["video"]],
        descripcionPromo: json["descripcion_promo"] == null
            ? null
            : descripcionPromoValues.map[json["descripcion_promo"]],
        idPromocion: json["id_promocion"] ?? null,
        valorPromo: json["valor_promo"] ?? null,
        idProductoPromo: json["id_producto_promo"] ?? null,
        fechaPromo: json["fecha_promo"] == null
            ? null
            : DateTime.parse(json["fecha_promo"]),
        estadoPromo: json["estado_promo"] ?? null,
        likes: json["likes"] ?? null,
        megusta: json["megusta"] ?? null,
        galeria: json["galeria"] ?? null,
        imagen: json["imagen"] ?? null,
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "categoria": categoria ?? null,
        "cliente": cliente ?? null,
        "colores": colores ?? null,
        "descripcion": descripcion ?? null,
        "disponible": disponible ?? null,
        "estado": estado ?? null,
        "fecha_creacion": fechaCreacion == null
            ? null
            : "${fechaCreacion!.year.toString().padLeft(4, '0')}-${fechaCreacion!.month.toString().padLeft(2, '0')}-${fechaCreacion!.day.toString().padLeft(2, '0')}",
        "id": id ?? null,
        "nombre": nombre ?? null,
        "precio": precio ?? null,
        "tallas": tallas ?? null,
        "video": video == null ? null : descripcionPromoValues.reverse[video],
        "descripcion_promo": descripcionPromo == null
            ? null
            : descripcionPromoValues.reverse[descripcionPromo],
        "id_promocion": idPromocion ?? null,
        "valor_promo": valorPromo ?? null,
        "id_producto_promo": idProductoPromo ?? null,
        "fecha_promo": fechaPromo == null ? null : fechaPromo.toString(),
        "estado_promo": estadoPromo ?? null,
        "likes": likes ?? null,
        "megusta": megusta ?? null,
        "galeria": galeria ?? null,
        "imagen": imagen ?? null,
      };
}

enum DescripcionPromo { EMPTY }

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => new MapEntry(v, k));
    return reverseMap;
  }
}

class Products {
  final String code;

  final List<Datum>? data;
  Products({
    required this.code,
    required this.data,
  });

  factory Products.fromJson(String str) => Products.fromMap(json.decode(str));

  factory Products.fromMap(Map<String, dynamic> json) => Products(
        code: json["code"] ?? null,
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "code": code ?? null,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}
