/// :nodoc:
public protocol _SQLExpressionVisitor {
    mutating func visit(_ dbValue: DatabaseValue) throws
    mutating func visit<Column: ColumnExpression>(_ column: Column) throws
    mutating func visit(_ column: _SQLQualifiedColumn) throws
    mutating func visit(_ expr: _SQLExpressionBetween) throws
    mutating func visit(_ expr: _SQLExpressionBinary) throws
    /// - precondition: expr.expressions.count > 1
    mutating func visit(_ expr: _SQLExpressionAssociativeBinary) throws
    /// Has a default implementation
    mutating func visit(_ expr: _SQLExpressionCollate) throws
    mutating func visit(_ expr: _SQLExpressionContains) throws
    mutating func visit(_ expr: _SQLExpressionCount) throws
    mutating func visit(_ expr: _SQLExpressionCountDistinct) throws
    mutating func visit(_ expr: _SQLExpressionEqual) throws
    mutating func visit(_ expr: _SQLExpressionFastPrimaryKey) throws
    mutating func visit(_ expr: _SQLExpressionFunction) throws
    mutating func visit(_ expr: _SQLExpressionIsEmpty) throws
    mutating func visit(_ expr: _SQLExpressionLiteral) throws
    mutating func visit(_ expr: _SQLExpressionNot) throws
    mutating func visit(_ expr: _SQLExpressionQualifiedFastPrimaryKey) throws
    mutating func visit(_ expr: _SQLExpressionTableMatch) throws
    mutating func visit(_ expr: _SQLExpressionUnary) throws
    mutating func visit<Request: SQLRequestProtocol>(_ request: Request) throws
}

/// :nodoc:
extension _SQLExpressionVisitor {
    /// Default implementation just forwards the collated expression
    mutating func visit(_ expr: _SQLExpressionCollate) throws {
        try expr.expression._accept(&self)
    }
}
