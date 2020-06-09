FROM hasura/graphql-engine:v1.2.2

# Change $DATABASE_URL to your heroku postgres URL if you're not using
# the primary postgres instance in your app
CMD graphql-engine \
    --database-url $DATABASE_URL \
    serve \
    --server-port $PORT \
    --admin-secret $GRAPHQL_ADMIN_SECRET \
    --jwt-secret $GRAPHQL_JWT_SECRET \
    --enable-console \
    --unauthorized-role anonymous \
    --cors-domain *

## Comment the command above and use the command below to
## enable an access-key and an auth-hook
## Recommended that you set the access-key as a environment variable in heroku
#CMD graphql-engine \
#    --database-url $DATABASE_URL \
#    serve \
#    --server-port $PORT \
#    --access-key XXXXX \
#    --auth-hook https://myapp.com/hasura-webhook 
#
# Console can be enable/disabled by the env var HASURA_GRAPHQL_ENABLE_CONSOLE
