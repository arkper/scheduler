package com.modern.office.sns;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class SnsServiceTest {

	@Test
	void phoneMatch() {
		Assertions.assertTrue(SnsService.matchPhone("347-222-3434", "+13472223434"));
		Assertions.assertTrue(SnsService.matchPhone("1 (347) 222 3434", "+13472223434"));
		Assertions.assertFalse(SnsService.matchPhone("10 (347) 222 3434", "+13472223434"));
	}

}
