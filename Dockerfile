FROM mongo:4.4.3
VOLUME mongo_vol:data/db
ENV MONGO_INITDB_ROOT_USERNAME=mongouser
ENV MONGO_INITDB_ROOT_PASSWORD=mongopwd
EXPOSE 27017