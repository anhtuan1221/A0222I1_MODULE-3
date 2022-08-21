import Model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customer"})
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer("Hải", "12-12-1212", "hue", "https://scontent.fdad3-6.fna.fbcdn.net/v/t1.18169-9/11043260_1547176045564105_7002491094055394926_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=IFFjebmU1nIAX-aQ6d1&_nc_ht=scontent.fdad3-6.fna&oh=00_AT_jvUSht5KP2qA0kyF4vsa5bsPq_3Ub_YsmLCbtill_1Q&oe=63248A1A"));
        customerList.add(new Customer("Nguyễn Anh Tuấn", "12-12-1212", "Da Nang", "https://scontent.fdad3-6.fna.fbcdn.net/v/t1.18169-9/11043260_1547176045564105_7002491094055394926_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=IFFjebmU1nIAX-aQ6d1&_nc_ht=scontent.fdad3-6.fna&oh=00_AT_jvUSht5KP2qA0kyF4vsa5bsPq_3Ub_YsmLCbtill_1Q&oe=63248A1A"));
        customerList.add(new Customer("Tường", "12-12-1212", "Ha Noi", "https://scontent.fdad3-6.fna.fbcdn.net/v/t1.18169-9/11043260_1547176045564105_7002491094055394926_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=IFFjebmU1nIAX-aQ6d1&_nc_ht=scontent.fdad3-6.fna&oh=00_AT_jvUSht5KP2qA0kyF4vsa5bsPq_3Ub_YsmLCbtill_1Q&oe=63248A1A"));
        customerList.add(new Customer("Thuận", "12-12-1212", "HCM", "https://scontent.fdad3-6.fna.fbcdn.net/v/t1.18169-9/11043260_1547176045564105_7002491094055394926_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=IFFjebmU1nIAX-aQ6d1&_nc_ht=scontent.fdad3-6.fna&oh=00_AT_jvUSht5KP2qA0kyF4vsa5bsPq_3Ub_YsmLCbtill_1Q&oe=63248A1A"));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/list.jsp");
        request.setAttribute("customerList", customerList);
        requestDispatcher.forward(request, response);
    }

}
