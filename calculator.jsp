<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Simple Calculator</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            color: #fff;
            margin: 0;
            padding: 50px;
        }
        .container {
            background: rgba(0, 0, 0, 0.8);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            display: inline-block;
        }
        h2 {
            color: #ffcc00;
        }
        input, select, button {
            margin: 10px;
            padding: 10px;
            font-size: 18px;
            border-radius: 5px;
            border: none;
        }
        input, select {
            background: #fff;
            color: #333;
        }
        button {
            background: #ffcc00;
            color: #000;
            cursor: pointer;
            font-weight: bold;
        }
        button:hover {
            background: #ff9900;
        }
        .result {
            margin-top: 20px;
            font-size: 22px;
            font-weight: bold;
            color: #ffcc00;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Simple Calculator</h2>
        <form method="post">
            <input type="number" name="num1" required placeholder="Enter first number">
            <select name="operation">
                <option value="add">+</option>
                <option value="subtract">-</option>
                <option value="multiply">×</option>
                <option value="divide">÷</option>
            </select>
            <input type="number" name="num2" required placeholder="Enter second number">
            <button type="submit">Calculate</button>
        </form>

        <div class="result">
            <% 
                String num1Str = request.getParameter("num1");
                String num2Str = request.getParameter("num2");
                String operation = request.getParameter("operation");
                
                if (num1Str != null && num2Str != null && operation != null) {
                    try {
                        double num1 = Double.parseDouble(num1Str);
                        double num2 = Double.parseDouble(num2Str);
                        double result = 0;
                        
                        switch (operation) {
                            case "add": result = num1 + num2; break;
                            case "subtract": result = num1 - num2; break;
                            case "multiply": result = num1 * num2; break;
                            case "divide": 
                                if (num2 != 0) {
                                    result = num1 / num2;
                                } else {
                                    out.println("Error: Division by zero!");
                                    return;
                                }
                                break;
                        }
                        out.println("Result: " + result);
                    } catch (NumberFormatException e) {
                        out.println("Invalid input. Please enter numbers.");
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
