FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as sdk
WORKDIR /code
COPY *.csproj .
RUN dotnet restore

COPY . .
RUN dotnet publish -o output -c Release
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 as runtime
RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser

WORKDIR /app
COPY --from=sdk /code/output .
EXPOSE 80
#ENTRYPOINT [ "dotnet", "values-api.dll" ]