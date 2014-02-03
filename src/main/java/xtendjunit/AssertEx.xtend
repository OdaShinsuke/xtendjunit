package xtendjunit

import org.junit.Assert
import org.apache.commons.lang3.builder.EqualsBuilder
import org.junit.internal.ComparisonCriteria
import java.util.List
import org.eclipse.xtext.xbase.lib.Functions.Function2

package class AssertEx {
	def static <T> void assertEquals(T expected, T actual) {
		assertEquals(null, expected, actual)
	}	
	def static <T> void assertEquals(String message, T expected, T actual) {
		if (expected === null) {
			Assert.assertNull(message, actual)
			return
		}
		
		val overrideEquals = try {
			expected.class.getDeclaredMethod("equals", Object)
			true
		} catch (NoSuchMethodException e) {
			false
		}
		if (overrideEquals) {
			Assert.assertEquals(message, expected, actual)
		} else {
			val msg = '''«message» «createMessage(expected, actual)»'''
			Assert.assertTrue(msg, EqualsBuilder.reflectionEquals(expected, actual, false))
		}
	}
	def static <T> void assertEquals(List<T> expected, List<T> actual) {
		assertEquals(null, expected, actual)
	}
	def static <T> void assertEquals(String message, List<T> expected, List<T> actual) {
		if (expected === null) {
			Assert.assertNull(message, actual)
			return
		}
		
		assertArrayEquals(message, expected, actual)
	}
	
	def static <T> void assertArrayEquals(T[] expected, T[] actual) {
		assertArrayEquals(null, expected, actual)
	}
	def static <T> void assertArrayEquals(String message, T[] expected, T[] actual) {
		if (expected === null) {
			Assert.assertNull(message, actual)
			return
		}
		
		new AssertExComparisonCriteria().arrayEquals(message, expected, actual)
	}
	
	def static <T> void assertPredicateEquals(T expected, T actual, Function2<? super T, ? super T, Boolean> predicate) {
		assertPredicateEquals(null, expected, actual, predicate)
	}
	def static <T> void assertPredicateEquals(String message, T expected, T actual, Function2<? super T, ? super T, Boolean> predicate) {
		if (predicate === null) {
			throw new NullPointerException("predicate")
		}
		
		Assert.assertTrue(message, predicate.apply(expected, actual))
	}
	def static <T> void assertPredicateEquals(List<T> expected, List<T> actual, Function2<? super T, ? super T, Boolean> predicate) {
		assertPredicateEquals(null, expected, actual, predicate)
	}
	def static <T> void assertPredicateEquals(String message, List<T> expected, List<T> actual, Function2<? super T, ? super T, Boolean> predicate) {
		if (predicate === null) {
			throw new NullPointerException("predicate")
		}
		
		assertArrayPredicateEquals(message, expected, actual, predicate)
	}
	
	def static <T> void assertArrayPredicateEquals(T[] expected, T[] actual, Function2<? super T, ? super T, Boolean> predicate) {
		assertArrayPredicateEquals(null, expected, actual, predicate)
	}
	def static <T> void assertArrayPredicateEquals(String message, T[] expected, T[] actual, Function2<? super T, ? super T, Boolean> predicate) {
		if (predicate === null) {
			throw new NullPointerException("predicate")
		}
		
		new PredicateComparisonCriteria(predicate).arrayEquals(message, expected, actual)
	}
	
	protected def static String createMessage(Object expected, Object actual) '''expected:<«expected»> but was:<«actual»>'''
}

package class AssertExComparisonCriteria extends ComparisonCriteria {
	override protected assertElementsEqual(Object expected, Object actual) {
		AssertEx.assertEquals(expected, actual)
	}
}
package class PredicateComparisonCriteria<T> extends ComparisonCriteria {
	Function2<? super T, ? super T, Boolean> _predicate
	new (Function2<? super T, ? super T, Boolean> predicate) {
		if (predicate === null) throw new NullPointerException("predicate")
		_predicate = predicate
	}
	override protected assertElementsEqual(Object expected, Object actual) {
		AssertEx.assertPredicateEquals(expected as T, actual as T, _predicate)
	}
}