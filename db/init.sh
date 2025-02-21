#!/usr/bin/env sh

psql -U postgres -c "create database netzwerk;"
psql -U postgres -d netzwerk -c "create user netzwerk with password 'netzwerk' nosuperuser nocreaterole nocreatedb;"
psql -U postgres -d netzwerk -c "create schema if not exists netzwerk authorization netzwerk;"
psql -U postgres -d netzwerk -c "alter role netzwerk in database netzwerk set search_path = 'netzwerk';"
psql -U postgres -d netzwerk -c "create extension pg_trgm with schema netzwerk;"
