package Service;

import Model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    public List<User> searchUser(String name);

    public List<User> sortByName();

    User getUserById(int id);

    void insertUserStore(User user) throws SQLException;

    public List<User> selectUser_procedure();

    public boolean updateUser_store_procedure(User user) throws SQLException;

    public boolean deleteUser_store(int id) throws SQLException;

}
