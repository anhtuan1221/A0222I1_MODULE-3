package Repository.imp;

import Repository.BaseRepository;
import Repository.IProductRepository;
import model.Product;

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
    public static final String SEARCH = "select * from product where name like?;";

    @Override
    public boolean insertProduct(Product product) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(INSERT_PRODUCT);
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setInt(3, product.getQuantity());
            statement.setString(4, product.getColor());
            statement.setString(5, product.getDescribe());
            statement.setInt(6, product.getCategory_id());
            int update = statement.executeUpdate();
            if (update != 0) {
                return true;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public Product selectProduct(int id) {
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
                String describe = resultSet.getString("describe");
                int category = resultSet.getInt("category");
                product = new Product(name, price, quantity, color, describe, category);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return product;
    }

    @Override
    public List<Product> selectAllProduct() {
        List<Product> productList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String describe = resultSet.getString("describe");
                int category = resultSet.getInt("category");
                productList.add(new Product(id, name, price, quantity, color, describe, category));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return productList;
    }

    @Override
    public boolean delete(int id) {
        boolean deleteRow = false;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(DELETE_BY_ID);
            statement.setInt(1, id);
            deleteRow = statement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return deleteRow;
    }

    @Override
    public boolean update(Product product) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCT);
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setInt(3, product.getQuantity());
            statement.setString(4, product.getColor());
            statement.setString(5, product.getDescribe());
            statement.setInt(6, product.getCategory_id());
            statement.setInt(7, product.getId());
            int update = statement.executeUpdate();
            if (update != 0) {
                return true;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Product> search(String name) {
        List<Product> productList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(SEARCH);
            statement.setString(1,"%"+name+"%");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String nameSearch = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String describe = resultSet.getString("describe");
                int category = resultSet.getInt("category");
                productList.add(new Product(id, nameSearch, price, quantity, color, describe, category));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productList;
    }
}
