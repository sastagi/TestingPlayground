package com.primedroid.testingplayground

import android.support.test.espresso.Espresso.onView
import android.support.test.espresso.assertion.ViewAssertions.matches
import android.support.test.espresso.matcher.ViewMatchers.*
import android.support.test.filters.LargeTest
import android.support.test.rule.ActivityTestRule
import org.junit.Rule
import android.support.test.runner.AndroidJUnit4
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(AndroidJUnit4::class)
@LargeTest
class EspressoTests {

  @Rule @JvmField
  val mActivityRule = ActivityTestRule(MainActivity::class.java)

  @Test
  fun helloWorldIsDisplayed() {
    onView(withId(R.id.textViewHelloWorld)).check(matches(withText("Hello World!")))
  }

  @Test
  fun helloTestingIsDisplayed() {
    onView(withId(R.id.textViewHelloTesting)).check(matches(withText("Hello Testing!")))
  }
}

