import XCTest
@testable import Query

class QueryTests: XCTestCase {
    
    func testQueryValues() {
        var query = Query(1050)
        
        guard case .int = query.type else {
            XCTFail("query should have int type")
            return
        }
        
        XCTAssertEqual(query.data, "1050".data(using: .utf8))
        XCTAssertEqual(query.object as? Int, 1050)
        XCTAssertEqual(query.int, 1050)
        XCTAssertEqual(query.double, 1050)
        XCTAssertEqual(query.string, "1050")
        XCTAssertNil(query.array)
        XCTAssertNil(query.dictionary)
        XCTAssertEqual(query.bool, true)
        XCTAssertEqual(query.count, 0)
        XCTAssertEqual(query.description, "1050")
        XCTAssertFalse(query.isNull)
        
        query = Query(10.5)
        
        guard case .double = query.type else {
            XCTFail("query should have double type")
            return
        }
        
        XCTAssertEqual(query.data, "10.5".data(using: .utf8))
        XCTAssertEqual(query.object as? Double, 10.5)
        XCTAssertEqual(query.int, 10)
        XCTAssertEqual(query.double, 10.5)
        XCTAssertEqual(query.string, "10.5")
        XCTAssertNil(query.array)
        XCTAssertNil(query.dictionary)
        XCTAssertNil(query.bool)
        XCTAssertEqual(query.count, 0)
        XCTAssertFalse(query.isNull)
        
        query = Query("10501")
        
        guard case .int = query.type else {
            XCTFail("query should have int type")
            return
        }
        
        XCTAssertEqual(query.object as? Int, 10501)
        XCTAssertEqual(query.int, 10501)
        XCTAssertEqual(query.double, 10501)
        XCTAssertEqual(query.string, "10501")
        XCTAssertNil(query.array)
        XCTAssertNil(query.dictionary)
        XCTAssertEqual(query.bool, true)
        XCTAssertEqual(query.count, 0)
        XCTAssertFalse(query.isNull)
        
        query = Query("10.501")
        
        guard case .double = query.type else {
            XCTFail("query should have double type")
            return
        }
        
        XCTAssertEqual(query.object as? Double, 10.501)
        XCTAssertEqual(query.int, 10)
        XCTAssertEqual(query.double, 10.501)
        XCTAssertEqual(query.string, "10.501")
        XCTAssertNil(query.array)
        XCTAssertNil(query.dictionary)
        XCTAssertNil(query.bool)
        XCTAssertEqual(query.count, 0)
        XCTAssertFalse(query.isNull)
        
        query = Query(false)
        
        guard case .bool = query.type else {
            XCTFail("query should have bool type")
            return
        }
        
        XCTAssertEqual(query.data, "false".data(using: .utf8))
        XCTAssertEqual(query.object as? Bool, false)
        XCTAssertEqual(query.int, 0)
        XCTAssertNil(query.double)
        XCTAssertEqual(query.string, "false")
        XCTAssertNil(query.array)
        XCTAssertNil(query.dictionary)
        XCTAssertEqual(query.bool, false)
        XCTAssertEqual(query.count, 0)
        XCTAssertFalse(query.isNull)
        
        query = Query("true")
        
        guard case .bool = query.type else {
            XCTFail("query should have bool type")
            return
        }
        
        XCTAssertEqual(query.object as? Bool, true)
        XCTAssertEqual(query.int, 1)
        XCTAssertNil(query.double)
        XCTAssertEqual(query.string, "true")
        XCTAssertNil(query.array)
        XCTAssertNil(query.dictionary)
        XCTAssertEqual(query.bool, true)
        XCTAssertEqual(query.count, 0)
        XCTAssertFalse(query.isNull)
        
        query = Query("text")
        
        guard case .string = query.type else {
            XCTFail("query should have string type")
            return
        }
        
        XCTAssertEqual(query.data, "text".data(using: .utf8))
        XCTAssertEqual(query.object as? String, "text")
        XCTAssertNil(query.int)
        XCTAssertNil(query.double)
        XCTAssertEqual(query.string, "text")
        XCTAssertNil(query.array)
        XCTAssertNil(query.dictionary)
        XCTAssertNil(query.bool)
        XCTAssertEqual(query.count, 0)
        XCTAssertFalse(query.isNull)
        
        query = Query([1, 2, 3])
        
        guard case .array = query.type else {
            XCTFail("query should have array type")
            return
        }
        
        XCTAssertEqual(query.data, String(describing: [1, 2, 3]).data(using: .utf8))
        XCTAssertEqual((query.object as? [Int])!, [1, 2, 3])
        XCTAssertNil(query.int)
        XCTAssertNil(query.double)
        XCTAssertNil(query.string)
        XCTAssertEqual((query.array as? [Int])!, [1, 2, 3])
        XCTAssertNil(query.dictionary)
        XCTAssertNil(query.bool)
        XCTAssertEqual(query.count, 3)
        XCTAssertFalse(query.isNull)
        
        query = Query(["1" : 1])
        
        guard case .dictionary = query.type else {
            XCTFail("query should have dictionary type")
            return
        }
        
        XCTAssertEqual(query.data, String(describing: ["1" : 1]).data(using: .utf8))
        XCTAssertEqual((query.object as? [String : Int])!, ["1" : 1])
        XCTAssertNil(query.int)
        XCTAssertNil(query.double)
        XCTAssertNil(query.string)
        XCTAssertNil(query.array)
        XCTAssertEqual((query.dictionary as? [String : Int])!, ["1" : 1])
        XCTAssertNil(query.bool)
        XCTAssertEqual(query.count, 1)
        XCTAssertFalse(query.isNull)
        
        struct null: CustomStringConvertible {
            
            var value: Int
            
            var description: String {
                return "\(self.value)"
            }
        }
        
        query = Query(null(value: 10))
        
        guard case .null = query.type else {
            XCTFail("query should have null type")
            return
        }
        
        XCTAssertEqual(query.data, "10".data(using: .utf8))
        XCTAssertEqual((query.object as? null)?.value, 10)
        XCTAssertNil(query.int)
        XCTAssertNil(query.double)
        XCTAssertNil(query.string)
        XCTAssertNil(query.array)
        XCTAssertNil(query.dictionary)
        XCTAssertNil(query.bool)
        XCTAssertEqual(query.count, 0)
        XCTAssertTrue(query.isNull)
        
        
        query = Query("10".data(using: .utf8)!)
        
        guard case .data = query.type else {
            XCTFail("query should have data type")
            return
        }
        
        XCTAssertEqual(query.object as? Data, "10".data(using: .utf8))
        XCTAssertEqual(query.data, "10".data(using: .utf8))
    }
    
    func testQueryParse() {
        var queryString = "q=1"
        
        var query = Query(percentEncodedQuery: queryString)
        XCTAssertEqual(query["q"].string, "1")
        
        queryString = "array=10&array=12"
        query = Query(percentEncodedQuery: queryString)
        XCTAssertEqual(query["array", 0].int, 10)
        XCTAssertEqual(query["array", 1].int, 12)
        
        queryString = "array=101,121"
        query = Query(percentEncodedQuery: queryString)
        XCTAssertEqual(query["array", 0].int, 101)
        XCTAssertEqual(query["array", 1].int, 121)
        
        queryString = "array[]=1&array[]=2"
        query = Query(percentEncodedQuery: queryString)
        XCTAssertEqual(query["array", 0].int, 1)
        XCTAssertEqual(query["array", 1].int, 2)
        
        queryString = "d[a]=1&d[b]=2"
        query = Query(percentEncodedQuery: queryString)
        XCTAssertEqual(query["d", "a"].int, 1)
        XCTAssertEqual(query["d", "b"].int, 2)
        
        queryString = "d=1&d[a]=1&d[b]=2"
        query = Query(percentEncodedQuery: queryString)
        XCTAssertEqual(query["d", 0].int, 1)
        XCTAssertEqual(query["d", 1, "a"].int, 1)
        XCTAssertEqual(query["d", 1, "b"].int, 2)
        
        queryString = "d[a]=1&d[b]=2&d=1"
        query = Query(percentEncodedQuery: queryString)
        XCTAssertEqual(query["d", 0, "a"].int, 1)
        XCTAssertEqual(query["d", 0, "b"].int, 2)
        XCTAssertEqual(query["d", 1].int, 1)
        
        
        queryString = "d[a]1&d[b]=2"
        query = Query(percentEncodedQuery: queryString)
        XCTAssertNil(query["d", "a"].int)
        XCTAssertEqual(query["d", "b"].int, 2)
        
        queryString = "=&a=&d[b]=2"
        query = Query(percentEncodedQuery: queryString)
        XCTAssertNil(query["d", "a"].int)
        XCTAssertEqual(query["d", "b"].int, 2)
        
        query = Query(percentEncodedQuery: nil)
        XCTAssertEqual(query.count, 0)
        XCTAssertNil(query.dictionary)
        XCTAssertTrue(query.isNull)
        guard case .null = query.type else {
            XCTFail("should be null type")
            return
        }
        
    }


    static var allTests : [(String, (QueryTests) -> () throws -> Void)] {
        return [
            ("testQueryValues", testQueryValues),
            ("testQueryParse", testQueryParse),
        ]
    }
}
