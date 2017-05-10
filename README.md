# tdd-swift-barebone

This introduction to BDD in Swift is a follow-up exercise from the basic Objective C example [here](https://github.com/connected-swu/tdd-objc-barebone).

- [Setting Up](#setting-up)
- [The BDD Exercise](#the-bdd-exercise)
- [Helpful Tips](#helpful-tips)
    - [Boiler plate & auto-completion](#boiler-plate-and-auto-completion)
    - [The anatomy of a spec](https://github.com/connected-swu/tdd-objc-barebone/blob/master/README.md#the-anatomy-of-a-spec)
- [Other Resources](#other-resources) related to,
    - BDD in Objective-C
    - Quick documentation
    - Example of how to use Quick is used with libraries like `RxSwift` and `Moya`
    - Writing shared examples (reusable tests)
    - Choosing matchers
- [A Few Notes on Tooling](#a-few-notes-on-tooling)

## Setting Up

1. `pod install` at project root
2. `open tddSwiftBlank.xcworkspace`
3. Hit `⌘`+`U` to run the tests.  You should see something like,
```
Test Suite 'All tests' passed at 2017-05-10 06:41:26.186.
	 Executed 0 tests, with 0 failures (0 unexpected) in 0.000 (0.005) seconds
```

and voila!  You're good to go!

## The BDD Exercise

> Build a **password verifier** that computes the strength of a password.  The ideal password should,  
>   1. _be 8 characters or longer_  
>   2. _contain at least 1 uppercase and 1 lowercase character_  
>   3. _contain at least 1 number_  

> A **password**'s **strength** is,
>   * _strong if it satisfies all 3 conditions_
>   * _weak if it does not satisfy:  condition 1 and at least 1 other condition_
>   * _medium if it is neither strong nor weak_


In this exercise, we've decided to split the feature into the stories **A**, **B**, **C**, and **D** below.

Begin by opening `tddSwiftBlankTests/PasswordVerifierSpec.swift` and writing a failing test for the first story.  Then continue to `tddSwiftBlank/PasswordVerifier.swift` to fill out the passing implementation.

**==================== UPDATE THESE INSTRUCTIONS HERE ====================**
Don't forget to check out [these tips](#helpful-tips).  Go [here](#a-few-notes-on-tooling) if you're interested in learning a bit more about the TDD framework.

**Story A**

> **Given:**  Jane wishes to create a password long enough to protect her personal data.  
> **When:**  Jane asks the verifier to check her password.  
> **Then:**  Jane's password is turned down if it is shorter than 8 characters.  

How can **story A** be worded better to more clearly reflect _input_/_output_?

**Story B**

> **Given:**  Jane wishes to create a password that has a bit of variety to help protect her data.  
> **When:**  Jane asks the verifier to check:  (1) password with only lowercase characters, (2) password with both uppercase and lowercase characters, (3) password with only uppercase characters.  
> **Then:**  Jane's password is accepted in case (2), but turned down in cases (1), (3).  

Should **story B** be 2 or 3 stories?  (`describe`'s vs. `context`'s?)

**Story C**

> **Given:**  Jane wishes to create a password that has 1337 speak in it - because she ain't safe.  
> **When:**  Jane asks the verifier to check:  (1) password with a number character, (2) password containing no number character.  
> **Then:**  Jane's password is accepted in case (1), but turned down in case (2).  

**Story D**

> **Given:**  Jane wants to know if her password is strong.  
> **When:**  Jane supplies a password acceptable by all conditions in stories **A**, **B**, and **C**.  
> **Then:**  Jane is reassured about her safety.  

**Story E**

> **Given:**  Jane wants to know if she's living life dangerously.  
> **When:**  Jane provides a password:  (1) unaccepted by story **A**, (2) accepted by story **A**, but unaccepted by neither stories **B** or **C**, (3) accepted by stories **A** and one of stories **B**, **C**, or both.  
> **Then:**  Jane is told that she is safe in cases (3), and that she's living life on the edge in cases (1), (2).  

**Story F**
> **Given:**  Jane wants to know if she's wasting her life in mediocrity.  
> **When:**  Jane provides neither a safe nor weak password.  
> **Then:**  Jane is reassured about her balanced lifestyle.  

A set of solutions to this exercise can be found under the `tddSwiftBlankTests/SwuPasswordVerifierSpec.swift` and `tddSwiftBlank/SwuPasswordVerifier.swift`.  To run the tests, simply remove the `x` from `xdescribe` in the spec.

## Helpful Tips

- `⌘`+`U` to run tests.
- prefix `f` to focus the test (on a `describe`, `context`, or `it`)
- prefix `x` to exclude the test (on a `describe`, `context`, or `it`)

### Boiler plate and auto-completion

You may want to,
- install the [quick templates](https://github.com/Quick/Quick/blob/master/Documentation/en-us/InstallingFileTemplates.md) to create new spec files faster.
- use `cdes`, `cccont`, and `cit` to quickly write tests.  If you don't have these snippets, install them [here](#boiler-plate-and-auto-completion) - these are `Cedar` templates, but they work for Quick!

## Other Resources

This tutorial only covers testing in Swift and assumes some basic knowledge about TDD & BDD.  For a more basic tutorial in Objective-C, visit [tdd-swift-barebone](https://github.com/connected-swu/tdd-objc-barebone).

A wealth of knowledge exists at [Quick documentation](https://github.com/Quick/Quick/tree/master/Documentation/en-us).  This includes,
- [Further resources](https://github.com/Quick/Quick/blob/master/Documentation/en-us/MoreResources.md) about how Quick is used for testing thing such as networking with libraries like RxSwit, Moya, etc.
- How to write [shared examples](https://github.com/Quick/Quick/blob/master/Documentation/en-us/SharedExamples.md) - perhaps you'd like to try writing protocol level tests?  Use with caution though, you can easily end up with spaghetti tests by over-prioritizing reusability.
- The importance of [choosing correct matchers](https://github.com/Quick/Quick/blob/master/Documentation/en-us/NimbleAssertions.md)

## A Few Notes on Tooling

In this example, the test frameworks we are are [Quick](https://github.com/Quick/Quick) and [Nimble](https://github.com/Quick/Nimble).  Quick provides a BDD-styled way of writing tests in iOS, and Nimble comes with a helpful set of matchers.

This tutorial only covers testing in Objective-C, for Swift, visit [tdd-swift-barebone](https://github.com/connected-swu/tdd-swift-barebone).


