package controller;

import entity.Employee;
import service.EmployeeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/")
public class ServletController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        System.out.println(action);
        switch (action) {
            case "/":
                System.out.println("Employee Adding Form");
                break;
            case "/add":
                insertData(request,response);
                break;
            case "/list":
                listData(request,response);
                break;
            case "/delete":
                deleteData(request,response);
                break;
            case "/edit":
                editData(request,response);
                break;
            default:
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    private void insertData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        try{
            Employee employee =new Employee(request.getParameter("firstName"), request.getParameter("lastName"),
                    request.getParameter("address"),request.getParameter("mobileNo"),
                    Integer.parseInt(request.getParameter("age")));
            EmployeeService service=new EmployeeService();
            service.insertData(employee);
            response.sendRedirect(request.getContextPath() + "/EmployeeList.jsp");
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }
    private void viewData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        EmployeeService service=new EmployeeService();
        System.out.println(service.listAllData());
    }

    private void listData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmployeeService service=new EmployeeService();
        List<Employee> listEmployee = service.listAllData();
        request.setAttribute("listEmployee", listEmployee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("EmployeeList.jsp");
        dispatcher.forward(request, response);
    }
    private void deleteData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmployeeService service=new EmployeeService();
        service.deleteData(Integer.parseInt(request.getParameter("id")));
//        Redirect to the given URL
        response.sendRedirect("list");
    }
    private void editData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        EmployeeService service=new EmployeeService();
        service.updateData(new Employee(Integer.parseInt(request.getParameter("empId")), request.getParameter("firstName"),request.getParameter("lastName")
                ,request.getParameter("address"),request.getParameter("mobileNo"),
                Integer.parseInt(request.getParameter("age"))));
        response.sendRedirect("list");
    }
}
