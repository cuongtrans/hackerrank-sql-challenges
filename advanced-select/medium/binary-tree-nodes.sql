-- Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:
-- + Root: If node is root node.
-- + Leaf: If node is leaf node.
-- + Inner: If node is neither root nor leaf node.
SELECT B1.N,
CASE WHEN B1.P IS NULL THEN 'Root'
     WHEN (SELECT COUNT(P) 
           FROM BST B2 
           WHERE B2.P = B1.N) >0 THEN 'Inner'        
    ELSE 'Leaf'
END
FROM BST AS B1 
ORDER BY B1.N ASC;
