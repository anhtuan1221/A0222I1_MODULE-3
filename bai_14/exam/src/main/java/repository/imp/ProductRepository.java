package repository.imp;

import Model.Product;
import repository.BaseRepository;
import repository.IProductRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String UPDATE_PRODUCT = "update `product` set  `name`=?,price=?,quantity=?,color=?,`describe`=?,category=? where id=?";
    public static final String DELETE_BY_ID = "delete from product where id = ?;";
    public static final String INSERT_PRODUCT = "insert into product(`name`,price,quantity,color,`describe`,category) values(?,?,?,?,?,?)";
    public static final String SELECT_BY_ID = "select * from product where id =?;";
    public static final String SELECT_ALL = "select*from product;";
    public static final String SEARCH = "select * from product where name like ?;";

    @Override
    public boolean insertProduct(Product product) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setInt(3, product.getQuantity());
            preparedStatement.setString(4, product.getColor());
            preparedStatement.setString(5, product.getDescribe());
            preparedStatement.setInt(6, product.getCategory_id());
            int update = preparedStatement.executeUpdate();
            if (update != 0) {
                return true;
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return false;
    }

    @Override
    public Product selectProduct(int id) {
        Product product = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String describe = resultSet.getString("describe");
                int category_id = resultSet.getInt("category");
                product = new Product(name, price, quantity, color, describe, category_id);

            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return product;
    }

    @Override
    public List<Product> selectAllProduct() {
        List<Product> productList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String describe = resultSet.getString("describe");
                int category_id = resultSet.getInt("category");
                productList.add(new Product(id, name, price, quantity, color, describe, category_id));
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return productList;
    }

    @Override
    public boolean delete(int id) {
        boolean deleteRow = false;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);
            preparedStatement.setInt(1, id);
            deleteRow = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return deleteRow;
    }

    @Override
    public boolean updateProduct(Product product)  {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCT);
            statement.setString(1,product.getName());
            statement.setDouble(2,product.getPrice());
            statement.setInt(3,product.getQuantity());
            statement.setString(4,product.getColor());
            statement.setString(5,product.getDescribe());
            statement.setInt(6,product.getCategory_id());
            statement.setInt(7,product.getId());
            int update = statement.executeUpdate();
            if(update!=0){
                return  true;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public Product findById(int id) {
        Product product = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_BY_ID);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                int category_id = resultSet.getInt("category");
                product = new Product(name, price, quantity, color, category_id);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return product;
    }

    @Override
    public List<Product> search(String name) {
//        int id, String name, double price, int quantity, String color, String describe, int category_id
        List<Product> productList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nameSearch = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String describe = resultSet.getString("describe");
                int category_id = resultSet.getInt("category");
                productList.add(new Product(id, nameSearch, price, quantity, color, describe, category_id));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productList;
    }


}
