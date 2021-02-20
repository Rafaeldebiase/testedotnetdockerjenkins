FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 5000

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src

COPY ["jenkins.csproj", "./"]
RUN dotnet restore "jenkins.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "jenkins.csproj" -c Release -o /app/build

FROM build AS publish
ARG enviroment=development
ARG release

RUN echo ${enviroment}
RUN if [ "${enviroment}" = "production" ]; then ${release}=-c Release; fi
RUN echo ${release}

RUN ASPNETCORE_ENVIRONMENT=${enviroment} dotnet publish "jenkins.csproj" ${release} -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

CMD [ "dotnet", "jenkins.dll" ]
