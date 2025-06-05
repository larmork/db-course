import java.sql.*;

public class JDBCExample {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5434/education";
        String user = "postgres";
        String password = "password";

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            System.out.println("✅ Connected to PostgreSQL education_db");

            String query = """
                SELECT SUM(cnt) AS completed_lessons FROM (
                    SELECT count(*) AS cnt FROM education_db.progress_shard_1 WHERE completed = true
                    UNION ALL
                    SELECT count(*) FROM education_db.progress_shard_2 WHERE completed = true
                ) AS combined;
                """;

            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    int completedLessons = rs.getInt("completed_lessons");
                    System.out.println("✅ Completed lessons: " + completedLessons);
                }
            }
        } catch (SQLException e) {
            System.err.println("❌ Connection error: " + e.getMessage());
        }
    }
}
