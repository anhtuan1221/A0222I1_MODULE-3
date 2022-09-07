package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
///               showDeleteForm(request, response);
                break;
            case "view":
                viewProducts(request, response);
                break;
            default:
                listProducts(request, response);
                break;
        }

    }

    private void viewProducts(HttpServletRequest request, HttpServletResponse response) {
    }

//    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
//        int id = Integer.parseInt(request.getParameter("id"));
//        Product product = this.productService.findById(id);
//        RequestDispatcher requestDispatcher;
//        if (product == null) {
//            requestDispatcher = request.getRequestDispatcher("view/error.jsp");
//        } else {
//            request.setAttribute("products", product);
//            requestDispatcher = request.getRequestDispatcher("view/delete.jsp");
//        }
//        try {
//            requestDispatcher.forward(request, response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        RequestDispatcher requestDispatcher;
        if (product == null) {
            requestDispatcher = request.getRequestDispatcher("view/error.jsp");
        } else {
            request.setAttribute("products", product);
            requestDispatcher = request.getRequestDispatcher("view/edit.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
        request.setAttribute("productList", this.productService.findAll());
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createNewProduct(request, response);
                break;
            case "edit":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            default:
                break;
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        productService.remove(id);
//        response.sendRedirect("/product");
        int id = Integer.parseInt(request.getParameter("deleteId"));
        Product product = this.productService.findById(id);
        boolean check = productService.remove(id);
        String message = "Xoá thành công ";
        if (!check) {
            message = "Xoá không thành công";
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
        request.setAttribute("productList", this.productService.findAll());
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        Product product = this.productService.findById(id);
        RequestDispatcher requestDispatcher;
        if (product == null) {
            requestDispatcher = request.getRequestDispatcher("view/error.jsp");
        } else {
            product.setName(name);
            product.setPrice(price);
            product.setDescription(description);
            product.setManufacturer(manufacturer);
            productService.update(id, product);
            productService.remove(id);
            request.setAttribute("product", product);
            request.setAttribute("message", "Product information was updated");
            requestDispatcher = request.getRequestDispatcher("view/edit.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        Product product = new Product(name, price, description, manufacturer);
        boolean check = productService.save(product);
        String message = "A new product was not created";
        if (check) {
            message = "A new product was  created";
        }
        request.setAttribute("message", message);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
