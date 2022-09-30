fetch("https://movies-tvshows-data-imdb.p.rapidapi.com/?type=get-show-season-episodes&imdb=tt2098220&season=1", {
	"method": "GET",
	"headers": {
		"x-rapidapi-host": "movies-tvshows-data-imdb.p.rapidapi.com",
		"x-rapidapi-key": "682b5985b8msh790c120c551f8cap11a7e6jsnb229edb4bf6a"
	}
})
.then(response => {
	console.log(response);
})
.catch(err => {
	console.error(err);
});