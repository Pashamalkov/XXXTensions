//
//  Optional+extension.swift
//  VTBMed
//
//  Created by malkov.pavel on 03.08.2018.
//  Copyright © 2018 alina.usmanova. All rights reserved.
//

import Foundation

extension Optional
{
    @discardableResult
    func ifSome(_ handler: (Wrapped) -> Void) -> Optional {
        switch self {
        case .some(let wrapped): handler(wrapped); return self
        case .none: return self
        }
    }
    @discardableResult
    func ifNil(_ handler: () -> Void) -> Optional {
        switch self {
        case .some: return self
        case .none: handler(); return self
        }
    }
}
