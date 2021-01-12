var cp = require('child_process');
var priv;
var USER = process.env.GITLAB_USERNAME;
//var API_ENDPOINT = process.env.GITLAB_API_ENDPOINT;
//var API_PRIVATE_TOKEN = process.env.GITLAB_API_PRIVATE_TOKEN || 'GITLAB_API_PRIVATE_TOKEN';

module.exports = {
	name: prompt('name', basename),
	version: '0.0.1',
	private: prompt('private', 'true', function(val) {
		return priv = (typeof val === 'boolean') ? val : !!val.match('true')
	}),

	create: prompt('create gitlab repo', 'yes', function(val) {
		val = val.indexOf('y') !== -1 ? true : false;

	if(val) {
		cp.execSync("curl -X POST -H 'PRIVATE-TOKEN:" + API_PRIVATE_TOKEN + "' -d '{\"name\": \""+basename+"\", \"private\": "+ ((priv) ? 'true' : 'false') +"}' https://gitlab.com/api/v3/projects");
		//cp.execSync('git remote add origin '+ 'https://gitlab.com/'+USER+'/' + basename + '.git');
		//cp.execSync("curl -u '"+USER+"' https://api.github.com/user/repos -d " + "'{\"name\": \""+basename+"\", \"private\": "+ ((priv) ? 'true' : 'false') +"}' ");
		//cp.execSync('git remote add origin '+ 'https://github.com/'+USER+'/' + basename + '.git');
		}
	return undefined;
}),

main: prompt('entry point', 'index.js'),

repository: {
	type: 'git', url: 'git://gitlab.com/'+USER+'/' + basename + '.git' },
	bugs: { url: 'https://gitlab.com/'+USER+'/' + basename + '/issues' },
	homepage: 'https://gitlab.com/'+USER+'/' + basename,
	keywords: prompt(function (s) { return s.split(/\s+/) }),
	license: 'MIT',
	cleanup: function(cb) {
		cb(null, undefined)
	}
}
