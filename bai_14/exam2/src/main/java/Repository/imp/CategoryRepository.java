package Repository.imp;

import Repository.BaseRepository;
import Repository.ICategoryRepository;
import model.Category;

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
            PreparedStatement statement = connection.prepareStatement(FIND_LIST_CATEGORY);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                categoryList.add(new Category(id,name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return categoryList;
    }
}
