package queryLibrary;

public class Queries {

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
		String q = "select AVG(CONVERT(FLOAT,Nav_PageLoad)) from [Performance].[dbo].[Navigation] where TestScenarioID=10 and Application_ID=7 and Page_ID=10 and convert(Date,Nav_DateTimes) between '04/01/2020' and '04/04/2020'";
		return q;
	}
	public static String askMaximumPageLoad(String applicationNo, String pageNO, String testCsNO,String dtStart,String dtEnd) {
		String q = "select MAX(CONVERT(FLOAT,Nav_PageLoad)) from [Performance].[dbo].[Navigation] where TestScenarioID=10 and Application_ID=7 and Page_ID=10 and convert(Date,Nav_DateTimes) between '04/01/2020' and '04/04/2020'";
		return q;
	}
	public static String askMinimumPageLoad(String applicationNo, String pageNO, String testCsNO,String dtStart,String dtEnd) {
		String q = "select MIN(CONVERT(FLOAT,Nav_PageLoad)) from [Performance].[dbo].[Navigation] where TestScenarioID=10 and Application_ID=7 and Page_ID=10 and convert(Date,Nav_DateTimes) between '04/01/2020' and '04/04/2020'";
		return q;
	}
}
