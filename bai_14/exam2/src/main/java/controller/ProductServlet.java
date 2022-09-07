package controller;

import model.Category;
import model.Product;
import service.ICategoryService;
import service.IProductuService;
import service.imp.CategoryService;
import service.imp.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {
    private ICategoryService categoryService = new CategoryService();
    private IProductuService productService = new ProductService();

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

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        boolean flag = productService.delete(id);
        if(flag){
            request.setAttribute("message","Delete success");
        }else {
            request.setAttribute("message","Delete is not success");
        }
        List<Product> productList = productService.selectAllProduct();
        List<Category> categoryList = categoryService.findListCategory();
        request.setAttribute("productList",productList);
        request.setAttribute("categoryList",categoryList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchByName(HttpServletRequest request, HttpServletResponse response) {
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.selectAllProduct();
        List<Category> categoryList = categoryService.findListCategory();
        request.setAttribute("productList", productList);
        request.setAttribute("categoryList", categoryList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            dispatcher.forward(request,response);
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
            default:
                break;
        }
    }

    private void createNewProduct(HttpServletRequest request, HttpServletResponse response) {

    }
}
