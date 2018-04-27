package com.primedroid.mylibrary

import org.junit.Assert
import org.junit.Test

class MonthUnitTest {
  @Test
  fun addition_isCorrect() {
    Assert.assertEquals(4, MonthUtil().addition(2, 2))
  }
}