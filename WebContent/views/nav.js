/**
 * 
 */
var teamDropdown = $("#teams-dropdown");

$.getJSON("list-teams", function(teams) {
	$.each(teams, function(num, team) {
//		console.log(team);
		var id = team.ID;
		var name = team.teamname;
		teamDropdown.append("<a class=\"dropdown-item\" href=\"" + contextPath + "/team?id=" + id + "\">" + name + "</a>");
	});
});