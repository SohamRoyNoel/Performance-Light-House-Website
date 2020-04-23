package queryLibrary;

public class Queries {

	// Application Queries
	public static String getAllApplications = "select * from Application_Master";
	public static String getAppIds(String appName) {
		String getAllApplicationname = "select Application_ID from Application_Master where Application_Name='"+appName+"'";
		return getAllApplicationname;
	}
	public static String getAppIds1(String appName) {
		String getAllApplicationname = "select * from Application_Master where Application_Name='"+appName+"'";
		return getAllApplicationname;
	}
	public static String getAllApplications(int UID) {
		String getAllApplication = "select a.Application_Name, a.Application_Id from Application_Master a left join Application_User_Mapper b on a.Application_ID=b.App_Application_ID where b.App_user_Reg_ID="+UID;
		return getAllApplication;
	}
	public static String addNewApplicationRequest = "insert into [PerformanceFinal].[dbo].[Application_Request_Mapper] ([Request_App_Name],[Request_App_By_Reg_UserID], [Request_App_ApprovedBy_Reg_UserID], [Request_Status]) values (?,?,?,?)";
	public static String getAppNameWithStatus(int UID) {
		String q = "select Application_ID, Application_Name,Status from ("+
				"select Application_ID, Application_Name,Status, ROW_NUMBER() over (partition by Application_Name  order by Status) as row_num  from (SELECT a.application_id,a.application_name,"+
				"case when (Request_App_By_Reg_UserID="+UID+") then "+
				"b.request_status else 'take Access'"+
				"end as status from application_master a "+
				"left join Application_Request_Mapper b on "+
				"a.Application_Name=b.Request_App_Name) x )b where row_num=1 order by Application_Name";
		return q;
	}
	
	// Test cases
	public static String getTestCaseNamesByApplicationName = "select * from TestScenario_Master where TS_Application_ID=";
	public static String addTestCases = "insert into TestScenario_Master ([TS_Name], [TS_Application_ID], [TS_Reg_UserID], [TS_CreationTime]) values(?,?,?,?)";
	public static String insertIntoTestScenarioHistory = "insert into TestScenario_Master_History ([TS_U_TS_ID], [TS_U_TS_Name], [TS_U_TS_Application_ID], [TS_U_TS_Reg_UserID], [TS_U_Status], [TS_U_CreationTime]) values (?,?,?,?,?,?)";
	public static String getTestScenarioId(String timestamp, int uid, int appId, String Tsname) {
		String Id = "select TS_ID from TestScenario_Master where TS_Application_ID="+appId+ " and TS_Reg_UserID="+uid+ " and TS_CreationTime='"+timestamp+"' and TS_Name='"+Tsname+"'";
		return Id;
	}
	public static String getTestScenarioId(int appId, String Tsname) {
		String Id = "select TS_ID from TestScenario_Master where TS_Application_ID="+appId+" and TS_Name='"+Tsname+"'";
		return Id;
	}
	public static String updateTsMaster(int appId, int uid) {
		String ts = "update TestScenario_Master set TS_Reg_UserID="+uid+" where TS_ID="+appId;
		return ts;
	}
	public static String populateTableId(int Aid) {
		String r = "select a.TS_ID, a.TS_Name, b.Reg_UserName, a.TS_CreationTime from TestScenario_Master a left join User_Registration b on a.TS_Reg_UserID = b.Reg_UserID where a.TS_Application_ID ="+Aid;
		return r;
	}
	public static String ifUserHasAccessWhileBulkUpload = "select * from Application_User_Mapper where App_user_Reg_ID=";
	public static String updateTestScenarioByUser(int tsID, String oldTSName, String newTSName, int UserID) {
		String s = "update TestScenario_Master set TS_Name='"+newTSName+"' , TS_Reg_UserID="+UserID+" where TS_ID = "+ tsID +" and TS_Name='"+oldTSName+"'";
		return s;
	}
	public static String authenticateUserName(int id) {
		String getUserId = "select * from [PerformanceFinal].[dbo].[User_Registration] where Reg_UserID="+id;
		return getUserId;
	}
	public static String authTS = "select * from TestScenario_Master";
	//public static String userNameById = "select Reg_UserName from User_Registration where Reg_UserID=";

	// BasePage Queries
	public static String baseTableOnload() {
		String authenticationTest = "select a.TestScenarioName, b.Application_NAME from TestScenario a inner join Application_Name b on a.TestScenarioID=b.TestScenarioID";
		return authenticationTest;
	}


	// Security Questions
	public static String askSecurityQuestion = "select * from [PerformanceFinal].[dbo].[Security_Questions]";

	// Register an User
	public static String askRegisterUser = "select * from [PerformanceFinal].[dbo].[User_Registration]";
	public static String registerUser() {
		String r = "INSERT INTO [PerformanceFinal].[dbo].[User_Registration] ([Reg_F_Name],[Reg_L_Name],[Reg_UserName],[Reg_Email],[Reg_Password],[Reg_API_KEY],[Reg_Security_Qus_ID],[Reg_Security_Qus_Ans], [Reg_User_Type])VALUES(?,?,?,?,?,?,?,?,?)";
		return r;
	}

	// Login an User
	public static String loginUser(String email, String password) {
		String r = "select * from [PerformanceFinal].[dbo].[User_Registration] where Reg_Email='"+email+"' and Reg_Password='"+password+"'";
		return r;
	}



	// DropDown Queries
	public static String askApplicationname = "select * from [Performance].[dbo].[Application_Name]";
	public static String askPageName = "select * from [Performance].[dbo].[Page_Name] where Application_ID=";
	public static String askTestScenerioName = "select * from [Performance].[dbo].[TestScenario] where TestScenarioID=";

	// Navigation Graph query
	public static String askNavGraphQuery(String applicationNo, String pageNO, String testCsNO,String dtStart,String dtEnd) {
		String q = "select AVG(CONVERT(FLOAT,Nav_UnloadEvent)), AVG(CONVERT(FLOAT,Nav_RedirectEvent)), AVG(CONVERT(FLOAT,Nav_AppCache)), AVG(CONVERT(FLOAT,Nav_TTFB)),AVG(CONVERT(FLOAT,Nav_Processing)),AVG(CONVERT(FLOAT,Nav_DomInteractive)),AVG(CONVERT(FLOAT,Nav_DomComplete)),AVG(CONVERT(FLOAT,Nav_ContentLoad)),AVG(CONVERT(FLOAT,Nav_PageLoad)) from [Performance].[dbo].[Navigation] where TestScenarioID="+testCsNO+" and Application_ID="+applicationNo+" and Page_ID="+pageNO+" and convert(Date,Nav_DateTimes) between '" + dtStart +"' and '"+dtEnd+"'";
		return q;
	}

	// Page Load Event Queries
	public static String askAveragePageLoad(String applicationNo, String pageNO, String testCsNO,String dtStart,String dtEnd) {
		String q = "select AVG(CONVERT(FLOAT,Nav_PageLoad)) from [Performance].[dbo].[Navigation] where TestScenarioID="+ testCsNO+" and Application_ID="+applicationNo+" and Page_ID="+pageNO+" and convert(Date,Nav_DateTimes) between '"+dtStart+"' and '"+dtEnd+"'";
		return q;
	}
	public static String askMaximumPageLoad(String applicationNo, String pageNO, String testCsNO,String dtStart,String dtEnd) {
		String q = "select MAX(CONVERT(FLOAT,Nav_PageLoad)) from [Performance].[dbo].[Navigation] where TestScenarioID="+ testCsNO+" and Application_ID="+applicationNo+" and Page_ID="+pageNO+" and convert(Date,Nav_DateTimes) between '"+dtStart+"' and '"+dtEnd+"'";
		return q;
	}
	public static String askMinimumPageLoad(String applicationNo, String pageNO, String testCsNO,String dtStart,String dtEnd) {
		String q = "select MIN(CONVERT(FLOAT,Nav_PageLoad)) from [Performance].[dbo].[Navigation] where TestScenarioID="+ testCsNO+" and Application_ID="+applicationNo+" and Page_ID="+pageNO+" and convert(Date,Nav_DateTimes) between '"+dtStart+"' and '"+dtEnd+"'";
		return q;
	}
}
