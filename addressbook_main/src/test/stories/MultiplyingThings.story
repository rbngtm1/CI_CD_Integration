scenario 'Multiplying two integers', {
    given 'two integer values of 2 and 3', {
        a = 2
        b = 3
    }
    when 'we calculate the product of the two values', {
        mult = a * b
    }
    then 'the product should be 6', {
        mult.shouldBe 6
    }
}