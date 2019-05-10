FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-stretch-slim AS base
WORKDIR /app
COPY /OF.WebShell /app
EXPOSE 80
ENTRYPOINT ["dotnet", "OF.WebShell.dll"]


# docker build -t ts:v2 .
