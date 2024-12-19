//
//  DBhelper.swift
//  Fitbud
//
//  Created by Joshua Lai on 11/19/24.
//

import Foundation
import SQLite3

class DatabaseHelper {
    var db: OpaquePointer?
    
    var exerciseData: [String: Int32] = [
        "Push Ups": 1,
        "Dips": 2,
        "Squats": 3,
        "Lunges": 4,
        "Calf Raises": 5,
        "Crunches": 6,
        "Bicycles": 7,
        "Supermans": 8,
        "Jumping Jacks": 9,
    ]

    func openDatabase() -> OpaquePointer? {
        var db: OpaquePointer?
        let filePath = getDatabasePath()

        if sqlite3_open(filePath, &db) == SQLITE_OK {
            print("Successfully opened database.")
            return db
        } else {
            print("Failed to open database: \(String(cString: sqlite3_errmsg(db)))")
            return nil
        }
    }
    
    func closeDatabase(_ db: OpaquePointer?) {
        if let db = db {
            if sqlite3_close(db) == SQLITE_OK {
                print("Successfully closed database.")
            } else {
                print("Failed to close database: \(String(cString: sqlite3_errmsg(db)))")
            }
        } else {
            print("Database connection was already nil.")
        }
    }
    
    func getDatabasePath() -> String? {
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destinationURL = documentsURL.appendingPathComponent("Exercises.db")

        if !fileManager.fileExists(atPath: destinationURL.path) {
            if let bundleURL = Bundle.main.url(forResource: "Exercise", withExtension: "db") {
                do {
                    try fileManager.copyItem(at: bundleURL, to: destinationURL)
                    print("Database copied to Documents directory")
                } catch {
                    print("Error copying database: \(error)")
                }
            } else {
                print("Database file not found in bundle")
                return nil
            }
        }
        return destinationURL.path
    }
    
    func updateTotal(forTitle title: String, newTotal: Int, db: OpaquePointer) {
        let updateQuery = "UPDATE Exercise SET total = ? WHERE id = ?"
        var updateStmt: OpaquePointer?

        if sqlite3_prepare_v2(db, updateQuery, -1, &updateStmt, nil) == SQLITE_OK {
            sqlite3_bind_int(updateStmt, 1, Int32(newTotal))
            sqlite3_bind_int(updateStmt, 2, exerciseData[title] ?? 0)

            if sqlite3_step(updateStmt) == SQLITE_DONE {
                print("Total updated successfully for title: \(title)")
            } else {
                print("Failed to update total: \(String(cString: sqlite3_errmsg(db)))")
            }
        } else {
            print("Failed to prepare update statement: \(String(cString: sqlite3_errmsg(db)))")
        }

        sqlite3_finalize(updateStmt)
    }
    
    func retrieveRow(byID id: Int, title: String? = nil, db: OpaquePointer) -> [String: Any]? {
        let selectQuery = "SELECT * FROM Exercise WHERE id = ?"
        var selectStmt: OpaquePointer?
        var identifier: Int32

        if sqlite3_prepare_v2(db, selectQuery, -1, &selectStmt, nil) == SQLITE_OK {
            
            if title != nil {
                identifier = exerciseData[title!]!
            } else {
                identifier = Int32(id)
            }
            sqlite3_bind_int(selectStmt, 1, identifier)

            if sqlite3_step(selectStmt) == SQLITE_ROW {
                var row = [String: Any]()
                
                row["id"] = Int(sqlite3_column_int(selectStmt, 0))
                row["title"] = String(cString: sqlite3_column_text(selectStmt, 1))
                row["description"] = String(cString: sqlite3_column_text(selectStmt, 2))
                row["sets"] = Int(sqlite3_column_int(selectStmt, 3))
                row["reps"] = Int(sqlite3_column_int(selectStmt, 4))
                row["total"] = Int(sqlite3_column_int(selectStmt, 5))

                print("Row Data: \(row)")
                sqlite3_finalize(selectStmt)
                return row
            } else {
                print("No row found with ID \(id)")
            }
        } else {
            print("Failed to prepare select statement: \(String(cString: sqlite3_errmsg(db)))")
        }

        sqlite3_finalize(selectStmt)
        return nil
    }
    
    func retrieveMetrics() -> [Int] {
        guard let db = openDatabase() else {
            print("Database connection failed")
            return []
        }
        var result: [Int] = []
        let updateQuery = "SELECT total FROM Exercise ORDER BY id"
        var selectStmt: OpaquePointer?

        if sqlite3_prepare_v2(db, updateQuery, -1, &selectStmt, nil) == SQLITE_OK {
            while sqlite3_step(selectStmt) == SQLITE_ROW {
                let total = sqlite3_column_int(selectStmt, 0)
                result.append(Int(total))
                print("Total: \(total)")
            }
        } else {
            print("Failed to prepare update statement: \(String(cString: sqlite3_errmsg(db)))")
        }

        sqlite3_finalize(selectStmt)
        sqlite3_close(db)
        return result
    }



}
