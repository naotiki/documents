FROM rust:1.86-slim AS build
RUN cargo install --git https://github.com/andreasKroepelin/polylux/ --branch release

FROM mcr.microsoft.com/devcontainers/base:debian

COPY --from=ghcr.io/typst/typst:latest /bin/typst /bin
COPY --from=build /usr/local/cargo/bin/polylux2pdfpc /bin

# https://code.visualstudio.com/remote/advancedcontainers/sharing-git-credentials
RUN apt update && apt install -y gnupg2
