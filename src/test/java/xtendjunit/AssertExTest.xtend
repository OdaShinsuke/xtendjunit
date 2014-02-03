package xtendjunit

import static org.junit.Assert.*
import org.junit.Test

class AssertExTest {
	@Test def void assertEquals_NoOverrideEquals_Fail() {
		var failFlg = false
		try {
			AssertEx.assertEquals(
				new NoOverrideEquals => [id = 1 name = "aaa"], 
				new NoOverrideEquals => [id = 1 name = "bbb"]
			)
		} catch (AssertionError e) {
			failFlg = true
		}
		
		assertTrue(failFlg)
	}
	@Test def void assertEquals_NoOverrideEquals() {
		AssertEx.assertEquals(
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 1 name = "aaa"]
		)
	}
	
	@Test def void assertEquals_OverrideEquals_Fail() {
		var failFlg = false
		try {
			AssertEx.assertEquals(
				new OverrideEquals => [id = 1 name = "aaa"], 
				new OverrideEquals => [id = 2 name = "aaa"]
			)
		} catch (AssertionError e) {
			failFlg = true
		}
		
		assertTrue(failFlg)
	}
	@Test def void assertEquals_OverrideEquals() {
		AssertEx.assertEquals(
			new OverrideEquals => [id = 1 name = "aaa"], 
			new OverrideEquals => [id = 1 name = "bbb"]
		)
	}
	
	@Test def void assertArrayEquals_NoOverrideEquals_Fail() {
		var failFlg = false
		try {
			AssertEx.assertArrayEquals(#[
					new NoOverrideEquals => [id = 1 name = "aaa"], 
					new NoOverrideEquals => [id = 2 name = "bbb"] 
				], #[
					new NoOverrideEquals => [id = 1 name = "aaa"], 
					new NoOverrideEquals => [id = 2 name = "ddd"] 
				]
			)
		} catch (AssertionError e) {
			failFlg = true
		}
		
		assertTrue(failFlg)
	}
	@Test def void assertArrayEquals_NoOverrideEquals() {
		AssertEx.assertArrayEquals(#[
				new NoOverrideEquals => [id = 1 name = "aaa"], 
				new NoOverrideEquals => [id = 2 name = "bbb"] 
			], #[
				new NoOverrideEquals => [id = 1 name = "aaa"], 
				new NoOverrideEquals => [id = 2 name = "bbb"] 
			]
		)
	}
	
	@Test def void assertArrayEquals_OverrideEquals_Fail() {
		var failFlg = false
		try {
			AssertEx.assertArrayEquals(#[
					new OverrideEquals => [id = 1 name = "aaa"], 
					new OverrideEquals => [id = 2 name = "bbb"] 
				], #[
					new OverrideEquals => [id = 1 name = "aaa"], 
					new OverrideEquals => [id = 3 name = "ddd"] 
				]
			)
		} catch (AssertionError e) {
			failFlg = true
		}
		
		assertTrue(failFlg)
	}
	@Test def void assertArrayEquals_OverrideEquals() {
		AssertEx.assertArrayEquals(#[
				new OverrideEquals => [id = 1 name = "aaa"], 
				new OverrideEquals => [id = 2 name = "bbb"] 
			], #[
				new OverrideEquals => [id = 1 name = "aaa"], 
				new OverrideEquals => [id = 2 name = "ddd"] 
			]
		)
	}
	
	@Test def void assertEquals_List_NoOverrideEquals_Fail() {
		var failFlg = false
		try {
			AssertEx.assertEquals(#[
					new NoOverrideEquals => [id = 1 name = "aaa"], 
					new NoOverrideEquals => [id = 2 name = "bbb"] 
				], #[
					new NoOverrideEquals => [id = 1 name = "aaa"], 
					new NoOverrideEquals => [id = 2 name = "ddd"] 
				]
			)
		} catch (AssertionError e) {
			failFlg = true
		}
		
		assertTrue(failFlg)
	}
	@Test def void assertEquals_List_NoOverrideEquals() {
		AssertEx.assertEquals(#[
				new NoOverrideEquals => [id = 1 name = "aaa"], 
				new NoOverrideEquals => [id = 2 name = "bbb"] 
			], #[
				new NoOverrideEquals => [id = 1 name = "aaa"], 
				new NoOverrideEquals => [id = 2 name = "bbb"] 
			]
		)
	}
	
	@Test def void assertEquals_List_OverrideEquals_Fail() {
		var failFlg = false
		try {
			AssertEx.assertEquals(#[
					new OverrideEquals => [id = 1 name = "aaa"], 
					new OverrideEquals => [id = 2 name = "bbb"] 
				], #[
					new OverrideEquals => [id = 1 name = "aaa"], 
					new OverrideEquals => [id = 3 name = "ddd"] 
				]
			)
		} catch (AssertionError e) {
			failFlg = true
		}
		
		assertTrue(failFlg)
	}
	@Test def void assertEquals_List_OverrideEquals() {
		AssertEx.assertEquals(#[
				new OverrideEquals => [id = 1 name = "aaa"], 
				new OverrideEquals => [id = 2 name = "bbb"] 
			], #[
				new OverrideEquals => [id = 1 name = "aaa"], 
				new OverrideEquals => [id = 2 name = "ddd"] 
			]
		)
	}
	
	@Test def void assertPredicateEquals_Fail() {
		var failFlg = false
		try {
			AssertEx.assertPredicateEquals(
				new NoOverrideEquals => [id = 1 name = "aaa"], 
				new NoOverrideEquals => [id = 2 name = "bbb"]
			) [e, a | e.id == a.id]
		} catch (AssertionError e) {
			failFlg = true
		}
		
		assertTrue(failFlg)
	}
	@Test def void assertPredicateEquals() {
		AssertEx.assertPredicateEquals(
			new NoOverrideEquals => [id = 1 name = "aaa"], 
			new NoOverrideEquals => [id = 1 name = "bbb"]
		) [e, a | e.id == a.id]
	}
	
	@Test def void assertArrayPredicateEquals_Fail() {
		var failFlg = false
		try {
			AssertEx.assertArrayPredicateEquals(#[
					new NoOverrideEquals => [id = 1 name = "aaa"], 
					new NoOverrideEquals => [id = 2 name = "bbb"] 
				], #[
					new NoOverrideEquals => [id = 1 name = "aaa"], 
					new NoOverrideEquals => [id = 3 name = "ddd"] 
				]
			)[e, a| e.id == a.id]
		} catch (AssertionError e) {
			failFlg = true
		}
		
		assertTrue(failFlg)
	}
	@Test def void assertArrayPredicateEquals() {
		AssertEx.assertArrayPredicateEquals(#[
				new NoOverrideEquals => [id = 1 name = "aaa"], 
				new NoOverrideEquals => [id = 2 name = "bbb"] 
			], #[
				new NoOverrideEquals => [id = 1 name = "aaa"], 
				new NoOverrideEquals => [id = 2 name = "ddd"] 
			]
		)[e, a|e.id == a.id]
	}
	
	@Test def void assertPredicateEquals_List_Fail() {
		var failFlg = false
		try {
			AssertEx.assertPredicateEquals(#[
					new NoOverrideEquals => [id = 1 name = "aaa"], 
					new NoOverrideEquals => [id = 2 name = "bbb"] 
				], #[
					new NoOverrideEquals => [id = 1 name = "aaa"], 
					new NoOverrideEquals => [id = 3 name = "ddd"] 
				]
			)[e, a| e.id == a.id]
		} catch (AssertionError e) {
			failFlg = true
		}
		
		assertTrue(failFlg)
	}
	@Test def void assertPredicateEquals_List() {
		AssertEx.assertPredicateEquals(#[
				new NoOverrideEquals => [id = 1 name = "aaa"], 
				new NoOverrideEquals => [id = 2 name = "bbb"] 
			], #[
				new NoOverrideEquals => [id = 1 name = "aaa"], 
				new NoOverrideEquals => [id = 2 name = "ddd"] 
			]
		)[e, a|e.id == a.id]
	}
}