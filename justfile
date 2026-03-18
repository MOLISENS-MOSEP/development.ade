# MOSEP Development Environment

set dotenv-load := false

# Default: list available recipes
default:
    @just --list

# Detect architecture and return the appropriate COMPOSE_FILE value
[private]
compose_file := if arch() == "aarch64" {
    "compose.yaml:compose.aarch64.yaml"
} else {
    "compose.yaml"
}

export COMPOSE_FILE := compose_file
export USER := `whoami`
export GROUP := `id -gn`
export USER_ID := `id -u`
export GROUP_ID := `id -g`
export VIDEO_GROUP_ID := `getent group video | cut -d: -f3 || echo 44`

# Enter the development container (starts it if needed)
enter:
    docker compose up -d
    docker compose exec --user {{USER}} mosep bash -l

# Stop the development container
stop:
    docker compose down

# Pull latest images and restart the container
update:
    docker compose pull
    docker compose up -d

# Show container logs
logs:
    docker compose logs -f

# Show container status
status:
    docker compose ps
