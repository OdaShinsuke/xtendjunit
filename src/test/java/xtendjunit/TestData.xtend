package xtendjunit

import org.eclipse.xtext.xbase.lib.util.ToStringHelper

package abstract class TestData {
	@Property int id
	@Property String name
	
	override toString() {
		new ToStringHelper().toString(this)
	}
}

final class OverrideEquals extends TestData {
	override equals(Object arg0) {
		switch (arg0) {
			OverrideEquals case true: arg0.id == id // id だけで比較
			default: false
		}
	}
}
final class NoOverrideEquals extends TestData {}