class SearchOverviewModel {
  final PaginatedList<ProjectModel>? projects;
  final PaginatedList<PropertyModel>? properties;

  SearchOverviewModel({
     this.projects,
     this.properties,
  });

  factory SearchOverviewModel.fromJson(Map<String, dynamic> json) {
    return SearchOverviewModel(
      projects: PaginatedList<ProjectModel>.fromJson(
        json['projects'],
            (data) => ProjectModel.fromJson(data),
      ),
      properties: PaginatedList<PropertyModel>.fromJson(
        json['properties'],
            (data) => PropertyModel.fromJson(data),
      ),
    );
  }
}

class PaginatedList<T> {
  final int? currentPage;
  final List<T>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  PaginatedList({
     this.currentPage,
     this.data,
     this.firstPageUrl,
     this.from,
     this.lastPage,
     this.lastPageUrl,
     this.nextPageUrl,
     this.path,
     this.perPage,
     this.prevPageUrl,
     this.to,
     this.total,
  });

  factory PaginatedList.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return PaginatedList(
      currentPage: json['current_page'],
      data: List<T>.from(json['data'].map((x) => fromJsonT(x))),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }
}
class ProjectModel {
  final int? id;
  final int? vendorId;
  final int? agentId;
  final String? featuredImage;
  final String? minPrice;
  final String? maxPrice;
  final String? latitude;
  final String? longitude;
  final String? videoLink;
  final String? bannerImage;
  final String? projectPdf;
  final int? featured;
  final int? status;
  final String? stateId;
  final String? cityId;
  final String? createdAt;
  final String? updatedAt;
  final int? approveStatus;
  final String? title;
  final String? slug;
  final String? address;

  ProjectModel({
     this.id,
     this.vendorId,
     this.agentId,
     this.featuredImage,
     this.minPrice,
     this.maxPrice,
    this.latitude,
    this.longitude,
     this.videoLink,
     this.bannerImage,
    this.projectPdf,
     this.featured,
     this.status,
     this.stateId,
     this.cityId,
     this.createdAt,
     this.updatedAt,
     this.approveStatus,
     this.title,
     this.slug,
     this.address,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      vendorId: json['vendor_id'],
      agentId: json['agent_id'],
      featuredImage: json['featured_image'],
      minPrice: json['min_price'],
      maxPrice: json['max_price'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      videoLink: json['video_link'],
      bannerImage: json['banner_image'],
      projectPdf: json['project_pdf'],
      featured: json['featured'],
      status: json['status'],
      stateId: json['state_id'],
      cityId: json['city_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      approveStatus: json['approve_status'],
      title: json['title'],
      slug: json['slug'],
      address: json['address'],
    );
  }
}
class PropertyModel {
  final int? id;
  final int? vendorId;
  final int? agentId;
  final int? categoryId;
  final int? countryId;
  final int? stateId;
  final int ?cityId;
  final String? featuredImage;
  final String? floorPlanningImage;
  final String? videoImage;
  final String? price;
  final String? purpose;
  final String ?type;
  final int? beds;
  final int? bath;
  final int? area;
  final String? videoUrl;
  final String? propertyPdf;
  final int? status;
  final String? latitude;
  final String? longitude;
  final String? createdAt;
  final String ?updatedAt;
  final int? approveStatus;
  final int? featuredId;
  final String? slug;
  final String? title;
  final String? address;
  final int? languageId;

  PropertyModel({
     this.id,
     this.vendorId,
    this.agentId,
     this.categoryId,
    this.countryId,
     this.stateId,
     this.cityId,
     this.featuredImage,
     this.floorPlanningImage,
    this.videoImage,
     this.price,
     this.purpose,
     this.type,
     this.beds,
     this.bath,
     this.area,
    this.videoUrl,
    this.propertyPdf,
     this.status,
    this.latitude,
    this.longitude,
     this.createdAt,
     this.updatedAt,
     this.approveStatus,
    this.featuredId,
     this.slug,
     this.title,
     this.address,
     this.languageId,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      vendorId: json['vendor_id'],
      agentId: json['agent_id'],
      categoryId: json['category_id'],
      countryId: json['country_id'],
      stateId: json['state_id'],
      cityId: json['city_id'],
      featuredImage: json['featured_image'],
      floorPlanningImage: json['floor_planning_image'],
      videoImage: json['video_image'],
      price: json['price']??"0",
      purpose: json['purpose'],
      type: json['type'],
      beds: json['beds'],
      bath: json['bath'],
      area: json['area'],
      videoUrl: json['video_url'],
      propertyPdf: json['property_pdf'],
      status: json['status'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      approveStatus: json['approve_status'],
      featuredId: json['featured_id'],
      slug: json['slug'],
      title: json['title'],
      address: json['address'],
      languageId: json['language_id'],
    );
  }
}

