//
//  ConfigurationManager.swift
//  BhagavadGita
//
//  Created by 山本響 on 2023/03/10.
//

import Foundation

private enum BuildConfiguration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        throw Error.missingKey
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
        }

        switch object {
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}

enum API {
    static var baseURL: String {
        do {
            return try BuildConfiguration.value(for: "BASE_URL")
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

enum ConfigurationManager {
    enum Enviroment {
        case dev
        case qa
        case prod
    }
    
    static var enviroment: Environment {
        #if DEV
        return .dev
        #elseif QA
        return .qa
        #elseif PROD
        return .prod
        #endif
    }
}
