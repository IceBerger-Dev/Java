<%@ page import="java.util.List" %>
<%@ page import="br.com.vinheiriaAgnello.carrinho.CartItem" %>
<%@ page import="br.com.vinheiriaAgnello.carrinho.ShoppingCart" %>

<%
    HttpSession session = request.getSession();
    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
    if (cart == null) {
        cart = new ShoppingCart();
        session.setAttribute("cart", cart);
    }
%>

<html>
<head>
    <title>Carrinho de Compras</title>
</head>
<body>
    <h1>Itens no Carrinho</h1>
    <ul>
        <%
            List<CartItem> items = cart.getItems();
            for (CartItem item : items) {
        %>
            <li><%= item.getName() %> - Quantidade: <%= item.getQuantity() %> - Preço: <%= item.getPrice() %></li>
        <%
            }
        %>
    </ul>
    <p>Total: <%= cart.getTotalPrice() %></p>

    <h2>Adicionar Item</h2>
    <form action="CartServlet" method="post">
        Nome: <input type="text" name="name"><br>
        Quantidade: <input type="number" name="quantity"><br>
        Preço: <input type="text" name="price"><br>
        <input type="submit" value="Adicionar ao Carrinho">
    </form>
</body>
</html>