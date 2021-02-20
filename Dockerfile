FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
ARG RELEASE

COPY ["jenkins.csproj", "./"]
RUN dotnet restore "jenkins.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "jenkins.csproj" ${RELEASE} -o /app/build

FROM build AS publish
ARG PROFILE

RUN echo ${PROFILE}
RUN echo ${RELEASE}

RUN ASPNETCORE_ENVIRONMENT=${PROFILE} dotnet publish "jenkins.csproj" ${RELEASE} -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
CMD ["dotnet", "jenkins.dll"]
