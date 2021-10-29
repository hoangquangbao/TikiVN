//
//  Data.swift
//  TikiVN
//
//  Created by Quang Bao on 29/10/2021.
//

import SwiftUI
import Foundation

struct Data: Codable {
    let status: Int?
    let data: DataClass?
}

struct DataClass: Codable {
    let metaData: MetaData?
    let data: [Datum]?
    let nextPage: String?

    enum CodingKeys: String, CodingKey {
        case metaData = "meta_data"
        case data
        case nextPage = "next_page"
    }
}

struct Datum: Codable {
    let badgesNew: [BadgesNew]?
    let brandName: String?
    let discount, discountRate, favouriteCount: Double?
    let hasEbook: Bool?
    let id: Int?
    let inventory: Inventory?
//    let inventoryStatus: InventoryStatus?
    let inventoryStatus: String?
    let isFlower, isGiftCard: Bool?
    let listPrice: Double?
    let name: String?
    let optionColor: [OptionColor]?
    let orderCount, originalPrice, price, productsetID: Int?
    let quantitySold: QuantitySold?
    let ratingAverage: Double?
    let reviewCount: Int?
    //salable_type: Tất cả biến này đều emplty trong JSON file. Nhớ test thử xem nó có ảnh hưởng đến get data hay truy xuất trong App hay không?
    let salableType: String?
    let sellerProductID: Int?
    let shortDescription, sku: String?
    let stockItem: StockItem?
    let thumbnailHeight: Int?
    let thumbnailURL: String?
    let thumbnailWidth: Int?
//    let type: DatumType?
    let type: String?
    let urlAttendantInputForm, urlKey, urlPath: String?
    let badges: [Badge]?

    enum CodingKeys: String, CodingKey {
        case badgesNew = "badges_new"
        case brandName = "brand_name"
        case discount
        case discountRate = "discount_rate"
        case favouriteCount = "favourite_count"
        case hasEbook = "has_ebook"
        case id, inventory
        case inventoryStatus = "inventory_status"
        case isFlower = "is_flower"
        case isGiftCard = "is_gift_card"
        case listPrice = "list_price"
        case name
        case optionColor = "option_color"
        case orderCount = "order_count"
        case originalPrice = "original_price"
        case price
        case productsetID = "productset_id"
        case quantitySold = "quantity_sold"
        case ratingAverage = "rating_average"
        case reviewCount = "review_count"
        case salableType = "salable_type"
        case sellerProductID = "seller_product_id"
        case shortDescription = "short_description"
        case sku
        case stockItem = "stock_item"
        case thumbnailHeight = "thumbnail_height"
        case thumbnailURL = "thumbnail_url"
        case thumbnailWidth = "thumbnail_width"
        case type
        case urlAttendantInputForm = "url_attendant_input_form"
        case urlKey = "url_key"
        case urlPath = "url_path"
        case badges
    }
}

struct Badge: Codable {
//    let code, text: Code?
    let code, text: String?
}

//enum Code: String, Codable {
//    case freeshipTikifast = "freeship_tikifast"
//    case isBestPriceGuaranteed = "is_best_price_guaranteed"
//    case tikinow = "tikinow"
//}

struct BadgesNew: Codable {
    let code: String?
    let icon: String?
    let iconHeight, iconWidth: Int?
//    let placement: Placement?
    let placement: String?
//    let type: BadgesNewType?
    let type: String?
    let text, textColor: String?

    enum CodingKeys: String, CodingKey {
        case code, icon
        case iconHeight = "icon_height"
        case iconWidth = "icon_width"
        case placement, type, text
        case textColor = "text_color"
    }
}

//enum Placement: String, Codable {
//    case bottom = "bottom"
//    case service = "service"
//    case underPrice = "under_price"
//}

//enum BadgesNewType: String, Codable {
//    case iconBadge = "icon_badge"
//    case serviceBadge = "service_badge"
//    case underPriceIcon = "under_price_icon"
//}

struct Inventory: Codable {
//    let fulfillmentType: FulfillmentType?
    let fulfillmentType: String?

    enum CodingKeys: String, CodingKey {
        case fulfillmentType = "fulfillment_type"
    }
}

//enum FulfillmentType: String, Codable {
//    case dropship = "dropship"
//    case tikiDelivery = "tiki_delivery"
//}

//enum InventoryStatus: String, Codable {
//    case available = "available"
//}

struct OptionColor: Codable {
    let displayName: String?
    let isDefault, listPrice, originalPrice, price: Int?
    let smallThumbnail: String?
    let spid: Int?
    let thumbnail: String?
    let urlPath: String?

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case isDefault = "is_default"
        case listPrice = "list_price"
        case originalPrice = "original_price"
        case price
        case smallThumbnail = "small_thumbnail"
        case spid, thumbnail
        case urlPath = "url_path"
    }
}

struct QuantitySold: Codable {
    let text: String?
    let value: Int?
}

struct StockItem: Codable {
    let maxSaleQty, minSaleQty: Int?
    let preorderDate: Bool?
    let qty: Int?

    enum CodingKeys: String, CodingKey {
        case maxSaleQty = "max_sale_qty"
        case minSaleQty = "min_sale_qty"
        case preorderDate = "preorder_date"
        case qty
    }
}

//enum DatumType: String, Codable {
//    case configurable = "configurable"
//}

struct MetaData: Codable {
    let type, moreLinkText: String?
    let moreLink: String?
    let title, subTitle: String?
    let backgroundImage: String?
//    let titleIcon: TitleIcon?
    let items: [Item]?

    enum CodingKeys: String, CodingKey {
        case type
        case moreLinkText = "more_link_text"
        case moreLink = "more_link"
        case title
        case subTitle = "sub_title"
        case backgroundImage = "background_image"
//        case titleIcon = "title_icon"
        case items
    }
}

struct Item: Codable {
    let title: String?
    let categoryID: Double?
    let images: [String]?

    enum CodingKeys: String, CodingKey {
        case title
        case categoryID = "category_id"
        case images
    }
}

//struct TitleIcon: Codable {
//}




