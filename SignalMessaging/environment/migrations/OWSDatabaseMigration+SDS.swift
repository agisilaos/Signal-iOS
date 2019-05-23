//
//  Copyright (c) 2019 Open Whisper Systems. All rights reserved.
//

import Foundation
import GRDBCipher
import SignalCoreKit

// NOTE: This file is generated by /Scripts/sds_codegen/sds_generate.py.
// Do not manually edit it, instead run `sds_codegen.sh`.

// MARK: - Record

public struct DatabaseMigrationRecord: SDSRecord {
    public var tableMetadata: SDSTableMetadata {
        return OWSDatabaseMigrationSerializer.table
    }

    public static let databaseTableName: String = OWSDatabaseMigrationSerializer.table.tableName

    public var id: Int64?

    // This defines all of the columns used in the table
    // where this model (and any subclasses) are persisted.
    public let recordType: SDSRecordType
    public let uniqueId: String

    public enum CodingKeys: String, CodingKey, ColumnExpression, CaseIterable {
        case id
        case recordType
        case uniqueId
    }

    public static func columnName(_ column: DatabaseMigrationRecord.CodingKeys, fullyQualified: Bool = false) -> String {
        return fullyQualified ? "\(databaseTableName).\(column.rawValue)" : column.rawValue
    }
}

// MARK: - StringInterpolation

public extension String.StringInterpolation {
    mutating func appendInterpolation(databaseMigrationColumn column: DatabaseMigrationRecord.CodingKeys) {
        appendLiteral(DatabaseMigrationRecord.columnName(column))
    }
    mutating func appendInterpolation(databaseMigrationColumnFullyQualified column: DatabaseMigrationRecord.CodingKeys) {
        appendLiteral(DatabaseMigrationRecord.columnName(column, fullyQualified: true))
    }
}

// MARK: - Deserialization

// TODO: Rework metadata to not include, for example, columns, column indices.
extension OWSDatabaseMigration {
    // This method defines how to deserialize a model, given a
    // database row.  The recordType column is used to determine
    // the corresponding model class.
    class func fromRecord(_ record: DatabaseMigrationRecord) throws -> OWSDatabaseMigration {

        guard let recordId = record.id else {
            throw SDSError.invalidValue
        }

        switch record.recordType {
        case ._100RemoveTSRecipientsMigration:

            let uniqueId: String = record.uniqueId

            return OWS100RemoveTSRecipientsMigration(uniqueId: uniqueId)

        case ._101ExistingUsersBlockOnIdentityChange:

            let uniqueId: String = record.uniqueId

            return OWS101ExistingUsersBlockOnIdentityChange(uniqueId: uniqueId)

        case ._102MoveLoggingPreferenceToUserDefaults:

            let uniqueId: String = record.uniqueId

            return OWS102MoveLoggingPreferenceToUserDefaults(uniqueId: uniqueId)

        case ._103EnableVideoCalling:

            let uniqueId: String = record.uniqueId

            return OWS103EnableVideoCalling(uniqueId: uniqueId)

        case ._104CreateRecipientIdentities:

            let uniqueId: String = record.uniqueId

            return OWS104CreateRecipientIdentities(uniqueId: uniqueId)

        case ._105AttachmentFilePaths:

            let uniqueId: String = record.uniqueId

            return OWS105AttachmentFilePaths(uniqueId: uniqueId)

        case ._107LegacySounds:

            let uniqueId: String = record.uniqueId

            return OWS107LegacySounds(uniqueId: uniqueId)

        case ._108CallLoggingPreference:

            let uniqueId: String = record.uniqueId

            return OWS108CallLoggingPreference(uniqueId: uniqueId)

        case ._109OutgoingMessageState:

            let uniqueId: String = record.uniqueId

            return OWS109OutgoingMessageState(uniqueId: uniqueId)

        case .databaseMigration:

            let uniqueId: String = record.uniqueId

            return OWSDatabaseMigration(uniqueId: uniqueId)

        case .resaveCollectionDBMigration:

            let uniqueId: String = record.uniqueId

            return OWSResaveCollectionDBMigration(uniqueId: uniqueId)

        default:
            owsFailDebug("Unexpected record type: \(record.recordType)")
            throw SDSError.invalidValue
        }
    }
}

// MARK: - SDSModel

extension OWSDatabaseMigration: SDSModel {
    public var serializer: SDSSerializer {
        // Any subclass can be cast to it's superclass,
        // so the order of this switch statement matters.
        // We need to do a "depth first" search by type.
        switch self {
        case let model as OWS109OutgoingMessageState:
            assert(type(of: model) == OWS109OutgoingMessageState.self)
            return OWS109OutgoingMessageStateSerializer(model: model)
        case let model as OWSResaveCollectionDBMigration:
            assert(type(of: model) == OWSResaveCollectionDBMigration.self)
            return OWSResaveCollectionDBMigrationSerializer(model: model)
        case let model as OWS108CallLoggingPreference:
            assert(type(of: model) == OWS108CallLoggingPreference.self)
            return OWS108CallLoggingPreferenceSerializer(model: model)
        case let model as OWS107LegacySounds:
            assert(type(of: model) == OWS107LegacySounds.self)
            return OWS107LegacySoundsSerializer(model: model)
        case let model as OWS105AttachmentFilePaths:
            assert(type(of: model) == OWS105AttachmentFilePaths.self)
            return OWS105AttachmentFilePathsSerializer(model: model)
        case let model as OWS104CreateRecipientIdentities:
            assert(type(of: model) == OWS104CreateRecipientIdentities.self)
            return OWS104CreateRecipientIdentitiesSerializer(model: model)
        case let model as OWS103EnableVideoCalling:
            assert(type(of: model) == OWS103EnableVideoCalling.self)
            return OWS103EnableVideoCallingSerializer(model: model)
        case let model as OWS102MoveLoggingPreferenceToUserDefaults:
            assert(type(of: model) == OWS102MoveLoggingPreferenceToUserDefaults.self)
            return OWS102MoveLoggingPreferenceToUserDefaultsSerializer(model: model)
        case let model as OWS101ExistingUsersBlockOnIdentityChange:
            assert(type(of: model) == OWS101ExistingUsersBlockOnIdentityChange.self)
            return OWS101ExistingUsersBlockOnIdentityChangeSerializer(model: model)
        case let model as OWS100RemoveTSRecipientsMigration:
            assert(type(of: model) == OWS100RemoveTSRecipientsMigration.self)
            return OWS100RemoveTSRecipientsMigrationSerializer(model: model)
        default:
            return OWSDatabaseMigrationSerializer(model: self)
        }
    }

    public func asRecord() throws -> SDSRecord {
        return try serializer.asRecord()
    }
}

// MARK: - Table Metadata

extension OWSDatabaseMigrationSerializer {

    // This defines all of the columns used in the table
    // where this model (and any subclasses) are persisted.
    static let recordTypeColumn = SDSColumnMetadata(columnName: "recordType", columnType: .int, columnIndex: 0)
    static let idColumn = SDSColumnMetadata(columnName: "id", columnType: .primaryKey, columnIndex: 1)
    static let uniqueIdColumn = SDSColumnMetadata(columnName: "uniqueId", columnType: .unicodeString, columnIndex: 2)

    // TODO: We should decide on a naming convention for
    //       tables that store models.
    public static let table = SDSTableMetadata(tableName: "model_OWSDatabaseMigration", columns: [
        recordTypeColumn,
        idColumn,
        uniqueIdColumn
        ])
}

// MARK: - Save/Remove/Update

@objc
extension OWSDatabaseMigration {
    public func anyInsert(transaction: SDSAnyWriteTransaction) {
        sdsSave(saveMode: .insert, transaction: transaction)
    }

    public func anyUpdate(transaction: SDSAnyWriteTransaction) {
        sdsSave(saveMode: .update, transaction: transaction)
    }

    public func anyUpsert(transaction: SDSAnyWriteTransaction) {
        sdsSave(saveMode: .upsert, transaction: transaction)
    }

    // This method is used by "updateWith..." methods.
    //
    // This model may be updated from many threads. We don't want to save
    // our local copy (this instance) since it may be out of date.  We also
    // want to avoid re-saving a model that has been deleted.  Therefore, we
    // use "updateWith..." methods to:
    //
    // a) Update a property of this instance.
    // b) If a copy of this model exists in the database, load an up-to-date copy,
    //    and update and save that copy.
    // b) If a copy of this model _DOES NOT_ exist in the database, do _NOT_ save
    //    this local instance.
    //
    // After "updateWith...":
    //
    // a) Any copy of this model in the database will have been updated.
    // b) The local property on this instance will always have been updated.
    // c) Other properties on this instance may be out of date.
    //
    // All mutable properties of this class have been made read-only to
    // prevent accidentally modifying them directly.
    //
    // This isn't a perfect arrangement, but in practice this will prevent
    // data loss and will resolve all known issues.
    public func anyUpdate(transaction: SDSAnyWriteTransaction, block: (OWSDatabaseMigration) -> Void) {
        guard let uniqueId = uniqueId else {
            owsFailDebug("Missing uniqueId.")
            return
        }

        block(self)

        guard let dbCopy = type(of: self).anyFetch(uniqueId: uniqueId,
                                                   transaction: transaction) else {
            return
        }

        block(dbCopy)

        dbCopy.anyUpdate(transaction: transaction)
    }

    public func anyRemove(transaction: SDSAnyWriteTransaction) {
        switch transaction.writeTransaction {
        case .yapWrite(let ydbTransaction):
            remove(with: ydbTransaction)
        case .grdbWrite(let grdbTransaction):
            do {
                let record = try asRecord()
                record.sdsRemove(transaction: grdbTransaction)
            } catch {
                owsFail("Remove failed: \(error)")
            }
        }
    }
}

// MARK: - OWSDatabaseMigrationCursor

@objc
public class OWSDatabaseMigrationCursor: NSObject {
    private let cursor: RecordCursor<DatabaseMigrationRecord>?

    init(cursor: RecordCursor<DatabaseMigrationRecord>?) {
        self.cursor = cursor
    }

    public func next() throws -> OWSDatabaseMigration? {
        guard let cursor = cursor else {
            return nil
        }
        guard let record = try cursor.next() else {
            return nil
        }
        return try OWSDatabaseMigration.fromRecord(record)
    }

    public func all() throws -> [OWSDatabaseMigration] {
        var result = [OWSDatabaseMigration]()
        while true {
            guard let model = try next() else {
                break
            }
            result.append(model)
        }
        return result
    }
}

// MARK: - Obj-C Fetch

// TODO: We may eventually want to define some combination of:
//
// * fetchCursor, fetchOne, fetchAll, etc. (ala GRDB)
// * Optional "where clause" parameters for filtering.
// * Async flavors with completions.
//
// TODO: I've defined flavors that take a read transaction.
//       Or we might take a "connection" if we end up having that class.
@objc
extension OWSDatabaseMigration {
    public class func grdbFetchCursor(transaction: GRDBReadTransaction) -> OWSDatabaseMigrationCursor {
        let database = transaction.database
        do {
            let cursor = try DatabaseMigrationRecord.fetchCursor(database)
            return OWSDatabaseMigrationCursor(cursor: cursor)
        } catch {
            owsFailDebug("Read failed: \(error)")
            return OWSDatabaseMigrationCursor(cursor: nil)
        }
    }

    // Fetches a single model by "unique id".
    public class func anyFetch(uniqueId: String,
                               transaction: SDSAnyReadTransaction) -> OWSDatabaseMigration? {
        assert(uniqueId.count > 0)

        switch transaction.readTransaction {
        case .yapRead(let ydbTransaction):
            return OWSDatabaseMigration.fetch(uniqueId: uniqueId, transaction: ydbTransaction)
        case .grdbRead(let grdbTransaction):
            let sql = "SELECT * FROM \(DatabaseMigrationRecord.databaseTableName) WHERE \(databaseMigrationColumn: .uniqueId) = ?"
            return grdbFetchOne(sql: sql, arguments: [uniqueId], transaction: grdbTransaction)
        }
    }

    // Traverses all records.
    // Records are not visited in any particular order.
    // Traversal aborts if the visitor returns false.
    public class func anyVisitAll(transaction: SDSAnyReadTransaction, visitor: @escaping (OWSDatabaseMigration) -> Bool) {
        switch transaction.readTransaction {
        case .yapRead(let ydbTransaction):
            OWSDatabaseMigration.enumerateCollectionObjects(with: ydbTransaction) { (object, stop) in
                guard let value = object as? OWSDatabaseMigration else {
                    owsFailDebug("unexpected object: \(type(of: object))")
                    return
                }
                guard visitor(value) else {
                    stop.pointee = true
                    return
                }
            }
        case .grdbRead(let grdbTransaction):
            do {
                let cursor = OWSDatabaseMigration.grdbFetchCursor(transaction: grdbTransaction)
                while let value = try cursor.next() {
                    guard visitor(value) else {
                        return
                    }
                }
            } catch let error as NSError {
                owsFailDebug("Couldn't fetch models: \(error)")
            }
        }
    }

    // Does not order the results.
    public class func anyFetchAll(transaction: SDSAnyReadTransaction) -> [OWSDatabaseMigration] {
        var result = [OWSDatabaseMigration]()
        anyVisitAll(transaction: transaction) { (model) in
            result.append(model)
            return true
        }
        return result
    }
}

// MARK: - Swift Fetch

extension OWSDatabaseMigration {
    public class func grdbFetchCursor(sql: String,
                                      arguments: [DatabaseValueConvertible]?,
                                      transaction: GRDBReadTransaction) -> OWSDatabaseMigrationCursor {
        var statementArguments: StatementArguments?
        if let arguments = arguments {
            guard let statementArgs = StatementArguments(arguments) else {
                owsFailDebug("Could not convert arguments.")
                return OWSDatabaseMigrationCursor(cursor: nil)
            }
            statementArguments = statementArgs
        }
        let database = transaction.database
        do {
            let statement: SelectStatement = try database.cachedSelectStatement(sql: sql)
            let cursor = try DatabaseMigrationRecord.fetchCursor(statement, arguments: statementArguments)
            return OWSDatabaseMigrationCursor(cursor: cursor)
        } catch {
            Logger.error("sql: \(sql)")
            owsFailDebug("Read failed: \(error)")
            return OWSDatabaseMigrationCursor(cursor: nil)
        }
    }

    public class func grdbFetchOne(sql: String,
                                   arguments: StatementArguments,
                                   transaction: GRDBReadTransaction) -> OWSDatabaseMigration? {
        assert(sql.count > 0)

        do {
            guard let record = try DatabaseMigrationRecord.fetchOne(transaction.database, sql: sql, arguments: arguments) else {
                return nil
            }

            return try OWSDatabaseMigration.fromRecord(record)
        } catch {
            owsFailDebug("error: \(error)")
            return nil
        }
    }
}

// MARK: - SDSSerializer

// The SDSSerializer protocol specifies how to insert and update the
// row that corresponds to this model.
class OWSDatabaseMigrationSerializer: SDSSerializer {

    private let model: OWSDatabaseMigration
    public required init(model: OWSDatabaseMigration) {
        self.model = model
    }

    // MARK: - Record

    func asRecord() throws -> SDSRecord {
        let id: Int64? = nil

        let recordType: SDSRecordType = .databaseMigration
        guard let uniqueId: String = model.uniqueId else {
            owsFailDebug("Missing uniqueId.")
            throw SDSError.missingRequiredField
        }

        return DatabaseMigrationRecord(id: id, recordType: recordType, uniqueId: uniqueId)
    }
}