package repository.imp;

import Model.Category;
import repository.BaseRepository;
import repository.ICategoryRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository implements ICategoryRepository {
    public static final String FIND_LIST_CATEGORY = "select * from category;";

    @Override
    public List<Category> findListCategory() {
        List<Category> categoryList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_LIST_CATEGORY);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                categoryList.add(new Category(id, name));
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return categoryList;
    }
}
