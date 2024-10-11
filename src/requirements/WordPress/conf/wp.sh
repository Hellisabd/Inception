#!/bin/bash
sleep 10

wp core install --url="http://localhost:8443" --title="Mon site WordPress" --admin_user="admin" --admin_password="admin_password" --admin_email="email@example.com" --allow-root 
