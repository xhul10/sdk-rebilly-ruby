# RebillySdk::Stairstep

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**formula** | **String** | The price formula determines what algorithm is used to calculate the invoice price based on a few factors, - the quantity in the order (which may be variable if usage pricing, otherwise determined when creating the order) - the price brackets data  To determine which formula is correct, please [see the price formula documentation](https://www.rebilly.com/docs/billing/pricing-formulas/).  | 
**brackets** | [**Array&lt;StairstepBrackets&gt;**](StairstepBrackets.md) | The price brackets, along with the price formula, is used to calculate the amount to charge for the product on this plan on the invoice.  The \&quot;stairstep\&quot; example:  Price total | Max quantity | Description ------------|--------------|------------ $5          | 1            | 1 $13         | 5            | 2 to 5 $30         | null         | 6 or more  If someone bought 1 apple, it would be $5.  If someone bought 2 apples, it would be $13. For 2 to 5 apples, the price is $13 in any case.  | 

