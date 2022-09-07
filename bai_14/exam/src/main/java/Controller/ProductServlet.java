package Controller;

import Model.Category;
import Model.Product;
import service.ICategoryService;
import service.IProductService;
import service.imp.CategoryService;
import service.imp.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controller.StudentServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {
    public ICategoryService categoryService = new CategoryService();
    public IProductService productService = new ProductService();
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
                showDeleteForm(request, response);
                break;
            case "search":
                searchByName(request, response);
            default:
                listProducts(request, response);
                break;
        }
    }

    private void searchByName(HttpServletRequest request, HttpServletResponse response) {
        String nameSearch = request.getParameter("nameSearch");
        List<Product> productList = productService.search(nameSearch);
        List<Category> categoryList = categoryService.findListCategory();
        request.setAttribute("nameSearch", nameSearch);
        request.setAttribute("productList", productList);
        request.setAttribute("categoryList", categoryList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<Category> categoryList = categoryService.findListCategory();

        request.setAttribute("categoryList", categoryList);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.selectProduct(id);
        List<Category> categoryList = categoryService.findListCategory();
        request.setAttribute("product", product);
        request.setAttribute("categoryList", categoryList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        boolean flag = productService.delete(id);
        if (flag) {
            request.setAttribute("mess", " xoá thành công ");
        } else {
            request.setAttribute("mess", " xoá thất bại ");
        }
        List<Product> productList = productService.selectAllProduct();
        List<Category> categoryList = categoryService.findListCategory();
        request.setAttribute("productList", productList);
        request.setAttribute("categoryList", categoryList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.selectAllProduct();
        List<Category> categoryList = categoryService.findListCategory();
        request.setAttribute("productList", productList);
        request.setAttribute("categoryList", categoryList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
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
            default:
                break;
        }
    }

    private void createNewProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String describe = request.getParameter("describe");
        int category = Integer.parseInt(request.getParameter("categoryId"));
        Product product = new Product(name, price, quantity, color, describe, category);
        boolean flag = productService.insertProduct(product);
        if (flag) {
            List<Product> productList = productService.selectAllProduct();
            List<Category> categoryList = categoryService.findListCategory();
            request.setAttribute("productList", productList);
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("message", "thêm mới thành công");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("message", "thêm mới thất bại");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/crete.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String describe = request.getParameter("describe");
        int category = Integer.parseInt(request.getParameter("typeId"));
        Product product = new Product(id, name, price, quantity, color, describe, category);
        boolean flg = false;
        try {
            flg = productService.updateProduct(product);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        if (flg) {
            List<Product> productList = productService.selectAllProduct();
            List<Category> categoryList = categoryService.findListCategory();
            request.setAttribute("product", product);
            request.setAttribute("productList", productList);
            request.setAttribute("categoryList", categoryList);
            request.setAttribute("message", "edit  thành công");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("message", "edit thất bại");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/crete.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }
}
