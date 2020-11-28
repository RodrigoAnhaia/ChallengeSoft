//
//  Result.swift
//  CodeTest
//
//  Created by Rodrigo de Anhaia on 26/11/20.
//  Copyright © 2020 Rodrigo de Anhaia. All rights reserved.
//

import Foundation

enum Result<T> {
 case success(T)
 case failure(Error)
}
