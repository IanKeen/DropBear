func +=<Key, Value>(lhs: inout [Key: Value], rhs: [Key: Value]) {
    for (key, value) in rhs {
        lhs[key] = value
    }
}
