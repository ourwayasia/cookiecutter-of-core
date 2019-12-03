FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-stretch-slim AS base
WORKDIR /app
COPY /OF.WebShell /app
EXPOSE 80
ENV TZ=Asia/Shanghai

ENTRYPOINT ["dotnet", "OF.WebShell.dll"]