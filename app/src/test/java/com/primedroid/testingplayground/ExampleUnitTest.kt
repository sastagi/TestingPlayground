package com.primedroid.testingplayground

import com.nhaarman.mockito_kotlin.doReturn
import com.nhaarman.mockito_kotlin.mock
import org.junit.Test

import org.junit.Assert.*
import org.mockito.Mockito.mock

class ExampleUnitTest {
  @Test
  fun addition_isCorrect() {
    assertEquals(4, PersonUtil().addition(2,2))
    /*val person: Person = mock(Person::class.java)

    val mock = mock<Person> {
      on { name } doReturn "text"
    }*/


  }
}
