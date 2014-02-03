package xtendjunit

import org.junit.ComparisonFailure

package class ComparisonFailureEx extends ComparisonFailure {
	val AssertionError _base
	new(String message, String expected, String actual, AssertionError base) {
		super(message, expected, actual)
		if (base === null) throw new NullPointerException("base")
		_base = base
	}
	
	override getMessage() {
		_base.message
	}
}