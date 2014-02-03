package xtendjunit

import java.util.List
import org.eclipse.xtext.xbase.lib.Conversions
import org.eclipse.xtext.xbase.lib.Functions.Function2
import org.junit.ComparisonFailure

import static org.junit.Assert.*

class AssertExtensions {
	def static <T> void is(T actual, T expected) {
		is(actual, null, expected)
	}
	def static <T> void is(T actual, String message, T expected) {
		try {
			AssertEx.assertEquals(message, expected, actual)
		} catch (ComparisonFailure e) {
			throw e
		} catch (AssertionError e) {
			throw new ComparisonFailureEx(e.message, expected?.toString, actual?.toString, e)
		}
	}
	
	def static <T> void is(List<T> actual, List<T> expected) {
		is(actual, null, expected)
	}
	def static <T> void is(List<T> actual, String message, List<T> expected) {
		try {
			AssertEx.assertEquals(message, expected, actual)
		} catch (ComparisonFailure e) {
			throw e
		} catch (AssertionError e) {
			throw new ComparisonFailureEx(e.message, expected?.toString, actual?.toString, e)
		}
	}
	
	def static <T> is(T[] actual, T[] expected) {
		is(actual, null, expected)
	}
	def static <T> is(T[] actual, String message, T[] expected) {
		try {
			AssertEx.assertArrayEquals(message, expected, actual)
		} catch (ComparisonFailure e) {
			throw e
		} catch (AssertionError e) {
			throw new ComparisonFailureEx(e.message, expected?.toArrayString, actual?.toArrayString, e)
		}
	}
	private def static toArrayString(Object[] source) {
		Conversions.doWrapArray(source).toString
	}
	
	def static <T> void is(T actual, T expected, Function2<T, T, Boolean> predicate) {
		is(actual, null, expected, predicate)
	}
	def static <T> void is(T actual, String message, T expected, Function2<T, T, Boolean> predicate) {
		try {
			AssertEx.assertPredicateEquals(message, expected, actual, predicate)
		} catch (ComparisonFailure e) {
			throw e
		} catch (AssertionError e) {
			throw new ComparisonFailureEx(e.message, expected?.toString, actual?.toString, e)
		}
	}
	
	def static <T> void is(List<T> actual, List<T> expected, Function2<T, T, Boolean> predicate) {
		is(actual, null, expected, predicate)
	}
	def static <T> void is(List<T> actual, String message, List<T> expected, Function2<T, T, Boolean> predicate) {
		try {
			AssertEx.assertPredicateEquals(message, expected, actual, predicate)
		} catch (ComparisonFailure e) {
			throw e
		} catch (AssertionError e) {
			throw new ComparisonFailureEx(e.message, expected?.toString, actual?.toString, e)
		}
	}
	
	def static <T> void is(T[] actual, T[] expected, Function2<T, T, Boolean> predicate) {
		is(actual, null, expected, predicate)
	}
	def static <T> void is(T[] actual, String message, T[] expected, Function2<T, T, Boolean> predicate) {
		try {
			AssertEx.assertArrayPredicateEquals(message, expected, actual, predicate)
		} catch (ComparisonFailure e) {
			throw e
		} catch (AssertionError e) {
			throw new ComparisonFailureEx(e.message, expected?.toString, actual?.toString, e)
		}
	}
	
	/* Auto Generated Code
foreach ($val in ("int", "short", "byte", "long", "char")) {
  @"
  def static void is($val[] actual, $val[] expected) {
    if (expected === null) {
      assertNull(actual)
      return
    }
    assertArrayEquals(actual, expected)
  }
"@
}
*/
  def static void is(int[] actual, int[] expected) {
    if (expected === null) {
      assertNull(actual)
      return
    }
    assertArrayEquals(actual, expected)
  }
  def static void is(short[] actual, short[] expected) {
    if (expected === null) {
      assertNull(actual)
      return
    }
    assertArrayEquals(actual, expected)
  }
  def static void is(byte[] actual, byte[] expected) {
    if (expected === null) {
      assertNull(actual)
      return
    }
    assertArrayEquals(actual, expected)
  }
  def static void is(long[] actual, long[] expected) {
    if (expected === null) {
      assertNull(actual)
      return
    }
    assertArrayEquals(actual, expected)
  }
  def static void is(char[] actual, char[] expected) {
    if (expected === null) {
      assertNull(actual)
      return
    }
    assertArrayEquals(actual, expected)
  }
}