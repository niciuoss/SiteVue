export default ({ env }) => ({
	connection: {
		client: 'postgres',
		connection: {
		host: env('DATABASE_HOST', 'localhost'),
			port: env.int('DATABASE_PORT', 5432),
			database: env('DATABASE_NAME', 'telite_db'),
			user: env('DATABASE_USERNAME', 'telite_user'),
			password: env('DATABASE_PASSWORD', 'telite_password'),
			ssl: env.bool('DATABASE_SSL', false)
		}
	}
});
