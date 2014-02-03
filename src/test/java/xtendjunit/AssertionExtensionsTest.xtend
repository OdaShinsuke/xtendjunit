package xtendjunit

import static org.junit.Assert.*
import static extension xtendjunit.AssertExtensions.*
import org.junit.Test
import org.junit.ComparisonFailure
import org.junit.Ignore

class AssertionExtensionsTest {
	@Test @Ignore def void basicConfirmMessage() {
		val actual = new NoOverrideEquals => [id = 1 name = "bbb"]
		val expected = new NoOverrideEquals => [id = 1 name = "ddd"]
		assertEquals("message", expected, actual)
	}
	@Test @Ignore def void confirmMessage() {
		val actual = new NoOverrideEquals => [id = 1 name = "bbb"]
		val expected = new NoOverrideEquals => [id = 1 name = "ddd"]
		actual.is("message", expected)
	}
	@Test @Ignore def void confirmMessage_List() {
		val actual = #[
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 2 name = "bbb"], 
			new NoOverrideEquals => [id = 3 name = "ccc"]
		]
		val expected = #[
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 2 name = "ddd"], 
			new NoOverrideEquals => [id = 3 name = "ccc"]
		]
		
		actual.is("message", expected)
	}
	
	@Test def void is_fail() {
		val actual = new NoOverrideEquals => [id = 1 name = "bbb"]
		val expected = new NoOverrideEquals => [id = 1 name = "ddd"]
		try {
			actual.is(expected)
			fail("例外が発生しない")
		} catch (ComparisonFailure e) {
			assertEquals(actual.toString, e.actual)
			assertEquals(expected.toString, e.expected)
		}
	}
	@Test def void is() {
		val actual = new NoOverrideEquals => [id = 1 name = "bbb"]
		val expected = new NoOverrideEquals => [id = 1 name = "bbb"]
		actual.is(expected)
	}
	
	@Test def void is_List_Fail() {
		val actual = #[
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 2 name = "bbb"], 
			new NoOverrideEquals => [id = 3 name = "ccc"]
		]
		val expected = #[
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 2 name = "ddd"], 
			new NoOverrideEquals => [id = 3 name = "ccc"]
		]
		try {
			actual.is(expected)
			fail("例外が発生しない")
		} catch (ComparisonFailure e) {
			assertEquals(actual.toString, e.actual)
			assertEquals(expected.toString, e.expected)
		}
	}
	@Test def void is_List() {
		val actual = #[
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 2 name = "bbb"], 
			new NoOverrideEquals => [id = 3 name = "ccc"]
		]
		val expected = #[
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 2 name = "bbb"], 
			new NoOverrideEquals => [id = 3 name = "ccc"]
		]
		actual.is(expected)
	}
	
	@Test def void is_Array_Fail() {
		val NoOverrideEquals[] actual = #[
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 2 name = "bbb"], 
			new NoOverrideEquals => [id = 3 name = "ccc"]
		]
		val NoOverrideEquals[] expected = #[
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 2 name = "ddd"], 
			new NoOverrideEquals => [id = 3 name = "ccc"]
		]
		try {
			actual.is(expected)
			fail("例外が発生しない")
		} catch (ComparisonFailure e) {
			assertEquals(actual.toString, e.actual)
			assertEquals(expected.toString, e.expected)
		}
	}
	@Test def void is_Array() {
		val NoOverrideEquals[] actual = #[
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 2 name = "bbb"], 
			new NoOverrideEquals => [id = 3 name = "ccc"]
		]
		val NoOverrideEquals[] expected = #[
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 2 name = "bbb"], 
			new NoOverrideEquals => [id = 3 name = "ccc"]
		]
		actual.is(expected)
	}
	
	@Test def void is_Predicate_fail() {
		val actual = new NoOverrideEquals => [id = 1 name = "bbb"]
		val expected = new NoOverrideEquals => [id = 2 name = "ddd"]
		try {
			actual.is(expected) [e, a | e.id == a.id]
			fail("例外が発生しない")
		} catch (ComparisonFailure e) {
			assertEquals(actual.toString, e.actual)
			assertEquals(expected.toString, e.expected)
		}
	}
	@Test def void is_Predicate() {
		val actual = new NoOverrideEquals => [id = 1 name = "bbb"]
		val expected = new NoOverrideEquals => [id = 1 name = "ddd"]
		actual.is(expected)  [e, a | e.id == a.id]
	}
	
	@Test def void is_Predicate_List_Fail() {
		val actual = #[
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 2 name = "bbb"], 
			new NoOverrideEquals => [id = 3 name = "ccc"]
		]
		val expected = #[
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 2 name = "ddd"], 
			new NoOverrideEquals => [id = 4 name = "ccc"]
		]
		try {
			actual.is(expected) [e, a | e.id == a.id]
			fail("例外が発生しない")
		} catch (ComparisonFailure e) {
			assertEquals(actual.toString, e.actual)
			assertEquals(expected.toString, e.expected)
		}
	}
	@Test def void is_Predicate_List() {
		val actual = #[
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 2 name = "bbb"], 
			new NoOverrideEquals => [id = 3 name = "ccc"]
		]
		val expected = #[
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 2 name = "ddd"], 
			new NoOverrideEquals => [id = 3 name = "ccc"]
		]
		actual.is(expected) [e, a | e.id == a.id]
	}
	
	@Test def void is_Predicate_Array_Fail() {
		val NoOverrideEquals[] actual = #[
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 2 name = "bbb"], 
			new NoOverrideEquals => [id = 3 name = "ccc"]
		]
		val NoOverrideEquals[] expected = #[
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 2 name = "ddd"], 
			new NoOverrideEquals => [id = 4 name = "ccc"]
		]
		try {
			actual.is(expected) [e, a | e.id == a.id]
			fail("例外が発生しない")
		} catch (ComparisonFailure e) {
			assertEquals(actual.toList.toString, e.actual)
			assertEquals(expected.toString, e.expected)
		}
	}
	@Test def void is_Predicate_Array() {
		val NoOverrideEquals[] actual = #[
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 2 name = "bbb"], 
			new NoOverrideEquals => [id = 3 name = "ccc"]
		]
		val NoOverrideEquals[] expected = #[
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 2 name = "ddd"], 
			new NoOverrideEquals => [id = 3 name = "ccc"]
		]
		actual.is(expected) [e, a | e.id == a.id]
	}
}