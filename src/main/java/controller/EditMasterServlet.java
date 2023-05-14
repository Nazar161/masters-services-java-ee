package controller;

import dao.ConnectionProperty;
import dao.EmpConnBuilder;
import domain.Master;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/editmaster")
public class EditMasterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ConnectionProperty prop;

    String select_all_master = "SELECT id, full_name, post, phone FROM master ORDER BY id";
    String select_master_ById = "SELECT id, full_name, post, phone FROM master WHERE id = ?";
    String edit_master = "UPDATE master SET full_name = ?, post = ?, phone = ? WHERE id = ?";

    ArrayList<Master> masters = new ArrayList<Master>();
    ArrayList<Master> mastersEdit = new ArrayList<Master>();
    String userPath;

    public EditMasterServlet() throws FileNotFoundException, IOException {
        super();
        prop = new ConnectionProperty();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        EmpConnBuilder builder = new EmpConnBuilder();
        try (Connection conn = builder.getConnection()) {
            String strId = request.getParameter("id");
            Long id = null;
            if (strId != null) {
                id = Long.parseLong(strId);
            }
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(select_all_master);
            if (rs != null) {
                masters.clear();
                while (rs.next()) {
                    masters.add(new Master(
                            rs.getLong("id"),
                            rs.getString("full_name"),
                            rs.getString("post"),
                            rs.getString("phone")));
                }
                rs.close();
                request.setAttribute("masters", masters);
            } else {
                System.out.println("Ошибка загрузки master");
            }

            try (PreparedStatement preparedStatement = conn.prepareStatement(select_master_ById)) {
                preparedStatement.setLong(1, id);
                rs = preparedStatement.executeQuery();
                if (rs != null) {
                    mastersEdit.clear();
                    while (rs.next()) {
                        mastersEdit.add(new Master(
                                rs.getLong("id"),
                                rs.getString("full_name"),
                                rs.getString("post"),
                                rs.getString("phone")));
                    }
                    rs.close();
                    request.setAttribute("mastersEdit", mastersEdit);
                } else {
                    System.out.println("Ошибка загрузки master");
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        userPath = request.getServletPath();
        if ("/editmaster".equals(userPath)) {
            request.getRequestDispatcher("/views/edit-master.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmpConnBuilder builder = new EmpConnBuilder();
        try (Connection conn = builder.getConnection()){
            String strId = request.getParameter("id");
            Long id = null;
            if (strId != null) {
                id = Long.parseLong(strId);
            }

            String fullName = request.getParameter("fullName");
            String post = request.getParameter("post");
            String phone = request.getParameter("phone");

            try (PreparedStatement preparedStatement = conn.prepareStatement(edit_master)){
                preparedStatement.setString(1, fullName);
                preparedStatement.setString(2, post);
                preparedStatement.setString(3, phone);
                preparedStatement.setLong(4, id);
                int result = preparedStatement.executeUpdate();
            }catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        doGet(request, response);
    }
}