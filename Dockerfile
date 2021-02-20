FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS build-env
WORKDIR /app
EXPOSE 80
EXPOSE 5000
ARG enviroment

RUN echo ${enviroment}

COPY . .

RUN dotnet restore "jenkins.csproj"

RUN ASPNETCORE_ENVIRONMENT=${enviroment} dotnet publish "./jenkins.csproj" -o out

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS runtime
WORKDIR /app
COPY --from=build-env /app/out .

CMD [ "dotnet", "jenkins.dll" ]
