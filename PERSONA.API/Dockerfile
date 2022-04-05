#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["PERSONA.API/PERSONA.API.csproj", "PERSONA.API/"]
RUN dotnet restore "PERSONA.API/PERSONA.API.csproj"
COPY . .
WORKDIR "/src/PERSONA.API"
RUN dotnet build "PERSONA.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "PERSONA.API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "PERSONA.API.dll"]