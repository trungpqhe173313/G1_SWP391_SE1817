<%-- 
    Document   : UpdateLoyaltyPolicies
    Created on : Jul 7, 2024, 9:19:27 PM
    Author     : ducth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Loyalty Policies</title>
</head>
<body>
    <h1>Update Loyalty Policies</h1>
    
    <form action="updateloyaltypolicies" method="post">
        <label for="policyId">Policy ID:</label>
        <input type="text" id="policyId" name="policyId"><br><br>
        
        <label for="minAmount">Minimum Amount:</label>
        <input type="text" id="minAmount" name="minAmount"><br><br>
        
        <label for="pointsPerUnit">Points per Unit:</label>
        <input type="text" id="pointsPerUnit" name="pointsPerUnit"><br><br>
        
        <input type="submit" value="Update Policy">
    </form>
</body>
</html>

