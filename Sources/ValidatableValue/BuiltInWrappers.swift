/*

 MIT License

 Copyright (c) 2016 Maxim Khatskevich (maxim@khatskevi.ch)

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.

 */

/**
 Value stored in this wrapper will be validated acording to the
 provided specification. When this wrapper is optional - the empty
 value ('nil') is considered to be valid.
 */
public
struct WrapperOf<T: ValueSpecification>: ValueWrapper,
    SingleValueCodable,
    AutoDisplayNamed,
    WithSpecification,
    AutoValidatable,
    AutoValidValue
{
    public
    typealias Specification = T

    public
    typealias Value = Specification.Value

    public
    var value: Value

    public
    init(wrappedValue: Value) { self.value = wrappedValue }
}

public
typealias NonRequired<T: ValueSpecification> = WrapperOf<T>

//---

/**
 Value stored in this wrapper will be validated acording to the
 provided specification. When this wrapper is optional - the empty
 value ('nil') is considered to be NOT valid.
 */
public
struct WrapperOfMandatory<T: ValueSpecification>: ValueWrapper,
    SingleValueCodable,
    AutoDisplayNamed,
    WithSpecification,
    AutoValidatable,
    AutoValidValue,
    Mandatory
{
    public
    typealias Specification = T

    public
    typealias Value = Specification.Value

    public
    var value: Value

    public
    init(wrappedValue: Value) { self.value = wrappedValue }
}

public
typealias Required<T: ValueSpecification> = WrapperOfMandatory<T>
