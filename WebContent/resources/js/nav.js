/**
 * 
 */
var teamDropdown = $("#teams-dropdown");
var url = "http://" + domain + ":" + port + contextPath + "/list-teams"; 

$.getJSON(url, function(teams) {
	$.each(teams, function(num, team) {
//		console.log(team);
		var id = team.ID;
		var name = team.teamname;
		var link = "<a class=\"dropdown-item\" href=\"" + contextPath + "/team?id=" + id + "\">" + name + "</a>"
		teamDropdown.append(link);
	});
});