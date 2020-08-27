package Score.java;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Score extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static int a1 = 0, a2 = 0, a3 = 0, a4 = 0, a6 = 0;
	static int a_runs = 0, a_balls = 0;
	static int total_run = 0, total_balls = 0, wickets = 0;
	static String strike = null, batting = null, bowling = null, bowler = null, wonby = null;
	static int target = 0;
	static boolean firstHalf = false;

	public void variableinitA() {

		a1 = a2 = a3 = a4 = a6 = 0;
		a_runs = a_balls = 0;
		total_run = 0;
		total_balls = 0;
		wickets = 0;
		strike = null;
		batting = null;
		bowling = null;
		bowler = null;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = "jdbc:mysql://localhost:3306/userlogin";

		String driver = "com.mysql.jdbc.Driver";

		String username = "root";

		String password = "asdfghjkl0";

		Connection con = null;

		int runs = Integer.parseInt(request.getParameter("runs"));

		String extras = request.getParameter("extras");

		String status = request.getParameter("status");

		String fielder = request.getParameter("fielder");

		HttpSession sec = request.getSession(false);

		String overs1 = (String) sec.getAttribute("overs");

		int overs = Integer.parseInt(overs1);
		String team1 = (String) sec.getAttribute("team1");

		String team2 = (String) sec.getAttribute("team2");

		bowler = (String) sec.getAttribute("bowler");

		wonby = (String) sec.getAttribute("wonby");

		String optedto = (String) sec.getAttribute("optedto");

		if (firstHalf == false && wonby.equals(team1) && optedto.equals("batting")) {
			batting = team1;
			bowling = team2;
		} else {
			batting = team2;
			bowling = team1;
		}

		strike = request.getParameter("strike");

		int out = 0;

		try {

			Class.forName(driver);

			con = DriverManager.getConnection(url, username, password);

			if (runs == 0) {

				total_balls += 1;
				int e = 0;
				if (!extras.equals("no")) {
					total_run += 1;
					total_balls -= 1;
					e = 1;
				}

				String name = strike;

				String sql1 = "update battingScore set number_of_balls=number_of_balls+" + (e == 1 ? 0 : 1)
						+ " where batsman_name='" + name
						+ "' and match_id = (select match_id from matches where team1_name = '" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";

				String sql2 = "update bowlingScore set number_of_balls=number_of_balls+" + (e == 1 ? 0 : 1)
						+ ",extras=extras+" + e + " where bowler_name='" + bowler
						+ "' and match_id = (select match_id from matches where team1_name ='" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";

				PreparedStatement ps1 = con.prepareStatement(sql1);

				PreparedStatement ps2 = con.prepareStatement(sql2);

				ps1.executeUpdate();

				ps2.executeUpdate();

				ps1.close();

				ps2.close();

			}

			else if (runs == 1) {

				a1 = 1;
				a_balls = 1;
				total_run += 1;
				total_balls += 1;
				int e = 0;
				if (!extras.equals("no")) {
					total_run += 1;
					a1 -= 1;
					total_balls -= 1;
					a_balls -= 1;
					e = 1;
				}

				String name = strike;

				String sql1 = "update battingScore set number_of_1=number_of_1+" + a1
						+ ",number_of_balls=number_of_balls+" + a_balls + " ,total_runs=total_runs+" + (a1 == 0 ? 0 : 1)
						+ " where batsman_name='" + name
						+ "' and match_id = (select match_id from matches where team1_name = '" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";

				String sql2 = "update bowlingScore set number_of_1=number_of_1+" + a1
						+ ",number_of_balls=number_of_balls+" + a_balls + " ,total_runs=total_runs+" + (a1 == 0 ? 2 : 1)
						+ ",extras=extras+" + e + " where bowler_name='" + bowler
						+ "' and match_id = (select match_id from matches where team1_name ='" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";

				PreparedStatement ps1 = con.prepareStatement(sql1);

				PreparedStatement ps2 = con.prepareStatement(sql2);

				ps1.executeUpdate();

				ps2.executeUpdate();

				ps1.close();
				ps2.close();

			}

			else if (runs == 2) {

				a1 = 1;
				a_balls = 1;
				total_run += 2;
				total_balls += 1;
				int e = 0;
				if (!extras.equals("no")) {
					total_run += 1;
					a1 -= 1;
					total_balls -= 1;
					a_balls -= 1;
					e = 1;
				}

				String name = strike;

				String sql1 = "update battingScore set number_of_2=number_of_2+" + a1
						+ ",number_of_balls=number_of_balls+" + a_balls + " ,total_runs=total_runs+" + (a1 == 0 ? 0 : 2)
						+ " where batsman_name='" + name
						+ "' and match_id = (select match_id from matches where team1_name = '" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";

				String sql2 = "update bowlingScore set number_of_2=number_of_2+" + a1
						+ ",number_of_balls=number_of_balls+" + a_balls + " ,total_runs=total_runs+" + (a1 == 0 ? 3 : 2)
						+ ",extras=extras+" + e + " where bowler_name='" + bowler
						+ "' and match_id = (select match_id from matches where team1_name ='" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";

				PreparedStatement ps1 = con.prepareStatement(sql1);

				PreparedStatement ps2 = con.prepareStatement(sql2);

				ps1.executeUpdate();

				ps2.executeUpdate();

				ps1.close();
				ps2.close();

			}

			else if (runs == 3) {

				a1 = 1;
				a_balls = 1;
				total_run += 3;
				total_balls += 1;
				int e = 0;
				if (!extras.equals("no")) {
					total_run += 1;
					a1 -= 1;
					total_balls -= 1;
					a_balls -= 1;
					e = 1;
				}

				String name = strike;

				String sql1 = "update battingScore set number_of_3=number_of_3+" + a1
						+ ",number_of_balls=number_of_balls+" + a_balls + " ,total_runs=total_runs+" + (a1 == 0 ? 0 : 3)
						+ " where batsman_name='" + name
						+ "' and match_id = (select match_id from matches where team1_name = '" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";

				String sql2 = "update bowlingScore set number_of_3=number_of_3+" + a1
						+ ",number_of_balls=number_of_balls+" + a_balls + " ,total_runs=total_runs+" + (a1 == 0 ? 4 : 3)
						+ ",extras=extras+" + e + " where bowler_name='" + bowler
						+ "' and match_id = (select match_id from matches where team1_name ='" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";

				PreparedStatement ps1 = con.prepareStatement(sql1);

				PreparedStatement ps2 = con.prepareStatement(sql2);

				ps1.executeUpdate();

				ps2.executeUpdate();

				ps1.close();
				ps2.close();

			}

			else if (runs == 6) {

				a1 = 1;
				a_balls = 1;
				total_run += 6;
				total_balls += 1;
				int e = 0;
				if (!extras.equals("no")) {
					total_run += 1;
					a1 -= 1;
					total_balls -= 1;
					a_balls -= 1;
					e = 1;
				}

				String name = strike;

				String sql1 = "update battingScore set number_of_6=number_of_6+" + a1
						+ ",number_of_balls=number_of_balls+" + a_balls + " ,total_runs=total_runs+" + (a1 == 0 ? 0 : 6)
						+ " where batsman_name='" + name
						+ "' and match_id = (select match_id from matches where team1_name = '" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";

				String sql2 = "update bowlingScore set number_of_6=number_of_6+" + a1
						+ ",number_of_balls=number_of_balls+" + a_balls + " ,total_runs=total_runs+" + (a1 == 0 ? 7 : 6)
						+ ",extras=extras+" + e + " where bowler_name='" + bowler
						+ "' and match_id = (select match_id from matches where team1_name ='" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";

				PreparedStatement ps1 = con.prepareStatement(sql1);

				PreparedStatement ps2 = con.prepareStatement(sql2);

				ps1.executeUpdate();

				ps2.executeUpdate();

				ps1.close();
				ps2.close();

			}

			else if (runs == 4) {

				a1 = 1;
				a_balls = 1;
				total_run += 4;
				total_balls += 1;
				int e = 0;
				if (!extras.equals("no")) {
					total_run += 1;
					a1 -= 1;
					total_balls -= 1;
					a_balls -= 1;
					e = 1;
				}

				String name = strike;

				String sql1 = "update battingScore set number_of_4=number_of_4+" + a1
						+ ",number_of_balls=number_of_balls+" + a_balls + " ,total_runs=total_runs+" + (a1 == 0 ? 0 : 4)
						+ " where batsman_name='" + name
						+ "' and match_id = (select match_id from matches where team1_name = '" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";

				String sql2 = "update bowlingScore set number_of_4=number_of_4+" + a1
						+ ",number_of_balls=number_of_balls+" + a_balls + " ,total_runs=total_runs+" + (a1 == 0 ? 5 : 4)
						+ ",extras=extras+" + e + " where bowler_name='" + bowler
						+ "' and match_id = (select match_id from matches where team1_name ='" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";

				PreparedStatement ps1 = con.prepareStatement(sql1);

				PreparedStatement ps2 = con.prepareStatement(sql2);

				ps1.executeUpdate();

				ps2.executeUpdate();

				ps1.close();
				ps2.close();

			}

			if (!status.equals("notout")) {
				
				out = 1;
				wickets++;
				
				String name = strike;

				String sql1 = "update battingScore set Out_Status='Out',Fielder_Name='"
						+ fielder + "',bowler_name='" + bowler + "' where batsman_name='" + name
						+ "' and match_id = (select match_id from matches where team1_name ='" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";

				String sql2 = "update bowlingScore set total_wickets=total_wickets+1  where bowler_name='"
						+ bowler + "' and match_id = (select match_id from matches where team1_name ='" + team1
						+ "' and team2_name='" + team2 + "' order by match_id desc limit 1);";

				PreparedStatement ps1 = con.prepareStatement(sql1);

				PreparedStatement ps2 = con.prepareStatement(sql2);

				ps1.executeUpdate();
				ps2.executeUpdate();

				ps1.close();
				ps2.close();

			}

		}

		catch (Exception e) {

			e.printStackTrace();
		}

		if (firstHalf == true && total_run >= target && total_balls <= overs * 6) {
			String result = wonby+" Won the match by " + (11-wickets)+" wickets";
			int totalwickets = wickets;
			HttpSession session = request.getSession();
			session.setAttribute("target1", target);
			session.setAttribute("result", result);
			session.setAttribute("wickets", totalwickets);
			session.setAttribute("total_run", total_run);
			session.setAttribute("win", wonby);
			session.setAttribute("total_balls", total_balls);
			RequestDispatcher rd = request.getRequestDispatcher("boresult.jsp");
			rd.forward(request, response);
		}
		else if (firstHalf == true && total_run == target && total_balls == overs * 6) {
			String result = "Match draw";
			int totalwickets = wickets;
			HttpSession session = request.getSession();
			session.setAttribute("target1", target);
			session.setAttribute("result", result);
			session.setAttribute("wickets", totalwickets);
			session.setAttribute("total_balls", total_balls);
			session.setAttribute("total_run", total_run);
			RequestDispatcher rd = request.getRequestDispatcher("boresult.jsp");
			rd.forward(request, response);
		} 
		else if (firstHalf == true && total_run <= target && total_balls == overs * 6) {
			if (wonby.equals(team1)) {
				wonby = team2;
			} else {
				wonby = team1;
			}
			String result =  wonby + " won the match by " + (target-total_run) + " runs";
			int totalwickets = wickets;
			HttpSession session = request.getSession();
			session.setAttribute("target1", target);
			session.setAttribute("result", result);
			session.setAttribute("wickets", totalwickets);
			session.setAttribute("total_run", total_run);
			session.setAttribute("win", wonby);
			session.setAttribute("total_balls", total_balls);
			RequestDispatcher rd = request.getRequestDispatcher("boresult.jsp");
			rd.forward(request, response);
		}
		else if (total_balls == overs * 6) {
			
			if (wonby.equals(team1)) {
				wonby = team2;
			} else {
				wonby = team1;
			}
			target = total_run;
			int total_balls1 = total_balls;
			firstHalf = true;
			int totalwickets = wickets;
			variableinitA();
			HttpSession session = request.getSession();
			session.setAttribute("target1", target);
			session.setAttribute("wickets1", totalwickets);
			session.setAttribute("total_balls1", total_balls1);
			session.setAttribute("wonby", wonby);
			RequestDispatcher rd = request.getRequestDispatcher("Bresult.jsp");
			rd.forward(request, response);

		}

		else if (total_balls > 5 && total_balls % 6 == 0) {
			HttpSession session = request.getSession();
			session.setAttribute("bowler", bowler);
			RequestDispatcher rd = request.getRequestDispatcher("newbowler.jsp");
			rd.forward(request, response);

		} else if (out == 1) {

			HttpSession session = request.getSession();
			session.setAttribute("outbatsman", strike);
			RequestDispatcher rd = request.getRequestDispatcher("newbatsman.jsp");
			rd.forward(request, response);
		} else {

			HttpSession session = request.getSession();
			session.setAttribute("total_run", total_run);
			session.setAttribute("total_balls", total_balls);
			session.setAttribute("wickets", wickets);
			session.setAttribute("firsthalf", firstHalf);

			response.sendRedirect("score.jsp");

		}

	}

}
