//
//  Data2.swift
//  TikiVN
//
//  Created by Quang Bao on 31/10/2021.
//

import SwiftUI
import Foundation

// MARK: - Welcome
struct Data: Codable {
    let status: Int?
    let data: DataClass?
}

// MARK: - DataClass
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

// MARK: - Datum
struct Datum: Codable, Identifiable {
    let badges: [Badge]?
    let badgesNew: [BadgesNew]?
    let brandName: String?
    let discount, discountRate, favouriteCount: Int?
    let hasEbook: Bool?
    let id: Int?
    let inventory: Inventory?
//    let inventoryStatus: InventoryStatus?
    let inventoryStatus: String?
    let isFlower, isGiftCard: Bool?
    let listPrice: Int?
    let name: String?
    let orderCount, originalPrice, price, productsetID: Int?
    let quantitySold: QuantitySold?
    let ratingAverage: Double?
    let reviewCount: Int?
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
    let bundleDeal: Bool?
    let freegiftItems: [FreegiftItem]?

    enum CodingKeys: String, CodingKey {
        case badges
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
        case bundleDeal = "bundle_deal"
        case freegiftItems = "freegift_items"
    }
}

// MARK: - Badge
struct Badge: Codable {
//    let code, text: Code?
    let code, text: String?
}

//enum Code: String, Codable {
//    case exclusivePrice = "exclusive_price"
//    case freeshipTikifast = "freeship_tikifast"
//    case isBestPriceGuaranteed = "is_best_price_guaranteed"
//    case tikinow = "tikinow"
//}

// MARK: - BadgesNew
struct BadgesNew: Codable {
//    let code: Code?
    let code: String?
    let icon: String?
    let iconHeight, iconWidth: Int?
//    let placement: Placement?
    let placement: String?
//    let text: Text?
    let text: String?
//    let textColor: TextColor?
    let textColor: String?
//    let type: BadgesNewType?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case code, icon
        case iconHeight = "icon_height"
        case iconWidth = "icon_width"
        case placement, text
        case textColor = "text_color"
        case type
    }
}

//enum Placement: String, Codable {
//    case benefits = "benefits"
//    case bottom = "bottom"
//    case service = "service"
//    case underPrice = "under_price"
//}

//enum Text: String, Codable {
//    case empty = ""
//    case giáHộiViênTikiNOW233730 = "Giá hội viên TikiNOW: 233.730 ₫"
//    case giáHộiViênTikiNOW398400 = "Giá hội viên TikiNOW: 398.400 ₫"
//}

//enum TextColor: String, Codable {
//    case the009900 = "#009900"
//}

//enum BadgesNewType: String, Codable {
//    case benefitsBadge = "benefits_badge"
//    case iconBadge = "icon_badge"
//    case serviceBadge = "service_badge"
//    case underPriceIcon = "under_price_icon"
//}

// MARK: - FreegiftItem
struct FreegiftItem: Codable {
    let id, masterID: Int?
    let name: String?
    let thumbnail: String?

    enum CodingKeys: String, CodingKey {
        case id
        case masterID = "masterId"
        case name, thumbnail
    }
}

// MARK: - Inventory
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

// MARK: - QuantitySold
struct QuantitySold: Codable {
    let text: String?
    let value: Int?
}

// MARK: - StockItem
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
//    case simple = "simple"
//}

// MARK: - MetaData
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

// MARK: - Item
struct Item: Codable, Identifiable {
    let id = UUID()
    let title: String?
    let categoryID: Int?
    let images: [String]?

    enum CodingKeys: String, CodingKey {
        case title
        case categoryID = "category_id"
        case images
    }
}

// MARK: - TitleIcon
//struct TitleIcon: Codable {
//}
