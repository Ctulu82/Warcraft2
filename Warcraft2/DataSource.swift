//
//  DataSource.swift
//  Warcraft2
//
//  Created by Justin Jia on 1/18/17.
//  Copyright © 2017 UC Davis. All rights reserved.
//

import Foundation

class DataSource {

    func read(data _: UnsafeMutablePointer<Any>, length _: Int) {
        fatalError("You need to override this method.")
    }

    func container() -> DataContainer? {
        return nil
    }
}
