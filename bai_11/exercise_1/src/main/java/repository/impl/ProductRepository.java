package repository.impl;

import model.Product;
import repository.BaseRepository;
import repository.IProductRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private final String DELETE_BY_ID = " delete from Procduct where id =?;";
    private final String SELECT_ALL = "select * from Procduct;";
    private final String ADD_NEW = "insert into Procduct(`name`,price,`description`,manufacturer) value(?,?,?,?);";

    @Override
    public List<Product> findAll() {
        List<Product> productList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String description = resultSet.getString("description");
                String manufacturer = resultSet.getString("manufacturer");
                Product product = new Product(id, name, price, description, manufacturer);
                productList.add(product);
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return productList;
    }

    @Override
    public boolean save(Product product) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_NEW);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setFloat(2, (float) product.getPrice());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setString(4, product.getManufacturer());
            preparedStatement.executeUpdate();
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return true;
    }

    @Override
    public void update(int id, Product product) {
        List<Product> productList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        productList.add(id, product);
    }

    @Override
    public boolean remove(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);
            preparedStatement.setInt(1, id);
            int num = preparedStatement.executeUpdate();
            return (num == 1);
//            if (num==1){
//                return true;
//            }else{
//                return false;
//            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return false;
    }


    @Override
    public Product findById(int id) {
//        List<Product> productList = new ArrayList<>();
//        for (int i = 0; i < productList.size(); i++) {
//            if (productList.get(i).getId() == id) {
//                return productList.get(i);
//            }
//        }
        return null;
    }

}

