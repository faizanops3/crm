const bcrypt = require('bcryptjs');

const password = 'admin1234'; // Replace with the password you want to hash
bcrypt.hash(password, 10).then((hashedPassword) => {
	console.log(hashedPassword);
}).catch((err) => {
	console.error(err);
});
