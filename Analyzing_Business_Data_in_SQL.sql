/*        

        DATE_TRUNC(date_part, date)
        
        To remove the unwanted detail of a timestamp, feed it into the DATE_TRUNC(‘[interval]’, time_column) function. 
        time_column is the database column that contains the timestamp you'd like to round, and ‘[interval]’ dictates your desired precision level.
        
        example:
              DATE_TRUNC('week', '2018-06-12') :: DATE→'2018-06-11'
              DATE_TRUNC('month', '2018-06-12') :: DATE→'2018-06-01'
              DATE_TRUNC('quarter', '2018-06-12') :: DATE→'2018-04-01'
              DATE_TRUNC('year', '2018-06-12') :: DATE→'2018-01-01'


*/



SELECT DATE_TRUNC('week', order_date) :: DATE AS delivr_week,
       -- Calculate revenue
       SUM(meals.meal_price * orders.order_quantity) AS revenue
  FROM meals
  JOIN orders ON meals.meal_id = orders.meal_id
-- Keep only the records in June 2018
WHERE DATE_TRUNC('month', order_date) = '2018-06-01'
GROUP BY delivr_week
ORDER BY delivr_week ASC;


Note: Don't be surprised if you get a date in May in the result. DATE_TRUNC('week', '2018-06-02') returns '2018-05-28', since '2018-06-02' is a Saturday and the preceding Monday is on '2018-05-28'.



