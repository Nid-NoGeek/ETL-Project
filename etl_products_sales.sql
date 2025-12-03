SELECT
    p.product_id,
    p.product_name,
    COALESCE(SUM(s.quantity * s.price), 0) AS total_sales,
    COALESCE(SUM(s.quantity * s.price * 0.9), 0) AS discounted_price,
    CASE
        WHEN COALESCE(SUM(s.quantity * s.price * 0.9), 0) >= 50000 THEN 'High'
        WHEN COALESCE(SUM(s.quantity * s.price * 0.9), 0) >= 10000 THEN 'Medium'
        WHEN COALESCE(SUM(s.quantity * s.price * 0.9), 0) > 0 THEN 'Low'
        ELSE 'No Sales'
    END AS sales_category
FROM Products p
LEFT JOIN Sales s
    ON p.product_id = s.product_id
GROUP BY
    p.product_id,
    p.product_name;
