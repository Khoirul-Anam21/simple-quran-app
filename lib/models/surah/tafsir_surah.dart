class DataTafsir {
    DataTafsir({
        this.id,
    });

    String? id;

    factory DataTafsir.fromJson(Map<String, dynamic> json) => DataTafsir(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}