xtendjunit
==========

Xtend + JUnit 

```java
// Object 
// assertEquals("c", "abc".substring(2));
"abc".substring(2).is("c")

// List
// assertEquals(#[0, 1, 2, 3, 4], (0..<5).toList);
(0..<5).toList.is(#[0, 1, 2, 3, 4])

// Array
val int[] actual = #[1, 2, 3]
// assertArrayEquals(#[1, 2, 3] as int[], actual)
actual.is(#[1, 2, 3])
```

```java
@Data class EqualsOverride {
  int id
  String name
}
class NotEqualsOverride {
  @Porperty int id
  @Property String name
  new(int id, String name) {
    this.id = id
    this.name = name
  ]
}

assertEquals(new EqualsOverride(1, "abc"), new EqualsOverride(1, "abc")) // success
new EqualsOverride(1, "abc").is(new EqualsOverride(1, "abc")) // success

assertEquals(new NotEqualsOverride(1, "abc"), new NotEqualsOverride(1, "abc")) // fail
new NotEqualsOverride(1, "abc").is(new NotEqualsOverride(1, "abc") // success. use org.apache.commons.lang3.builder.EqualsBuilder.reflectionEquals

#[
  new EqualsOverride(1, "aaa"), 
  new EqualsOvereide(2, "bbb")
].is(#[
  new EqualsOverride(1, "aaa"), 
  new EqualsOvereide(2, "bbb")
]) // success

#[
  new NotEqualsOverride(1, "aaa"), 
  new NotEqualsOverride(2, "bbb")
].is(#[
  new NotEqualsOverride(1, "aaa"), 
  new NotEqualsOverride(2, "bbb")
]) // success. use org.apache.commons.lang3.builder.EqualsBuilder.reflectionEquals
```

```java
// is(T actual, T expected, Function2<T, T, Boolean> predicate)
new NotEqualsOverride(1, "aaa").is(new NotEqualsOverride(1, "bbb") [e, a | e.id == a.id] // success
```

AssertionError convert to ComparisonFailure.
Eclipse JUnit Failuer Trace is cool!
