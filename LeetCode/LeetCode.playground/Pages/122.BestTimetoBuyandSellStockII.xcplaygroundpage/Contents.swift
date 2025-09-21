// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/
/*
 You are given an integer array prices where prices[i] is the price of a given stock on the ith day.
 On each day, you may decide to buy and/or sell the stock. You can only hold at most one share of the stock at any time. However, you can buy it then immediately sell it on the same day.

 Find and return the maximum profit you can achieve.
 
 Example:
 Input: prices = [1,2,3,4,5]
 Output: 4
 Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
 Total profit is 4.
 */




func maxProfit(_ prices: [Int]) -> Int {
    var profit = 0
    for i in 1..<prices.count {
        let todaysPrice = prices[i]
        let yesterdayPrice = prices[i - 1]
        if todaysPrice < yesterdayPrice { continue }
        let todaysProfit = todaysPrice - yesterdayPrice
        profit += todaysProfit
    }
    return profit
}
maxProfit([7,1,5,3,6,4])
