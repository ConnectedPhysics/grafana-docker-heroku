FROM hasura/graphql-engine:v1.1.0

# Enable the console
ENV HASURA_GRAPHQL_ENABLE_CONSOLE=true
ENV HASURA_GRAPHQL_CORS_DOMAIN="*"
ENV HASURA_GRAPHQL_UNAUTHORIZED_ROLE=anonymous
ENV HASURA_GRAPHQL_ADMIN_SECRET=$GRAPHQL_ADMIN_SECRET

RUN echo $GRAPHQL_ADMIN_SECRET

# uncomment to enable firebase auth
#ENV HASURA_GRAPHQL_JWT_SECRET='{"type":"RS256","jwk_url":"https://www.googleapis.com/service_accounts/v1/jwk/securetoken@system.gserviceaccount.com","audience":"creative-store-authentication","issuer":"https://securetoken.google.com/creative-store-authentication"}'

# Change $DATABASE_URL to your heroku postgres URL if you're not using
# the primary postgres instance in your app
CMD graphql-engine \
    --database-url $DATABASE_URL \
    serve \
    --server-port $PORT

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
