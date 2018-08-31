#This Makefile is used to automate the terraform execution process . And it make it easier to isolate the different config file so the we don't have single config file.

.ONESHELL:
SHELL := /bin/bash
.PHONY: init plan apply destroy

init:
	@echo -e "\nRemoving existing .terraform file from local directory\n"
	@cd ./$(dir); rm -rf .terraform/*
	@cd ./$(dir); terraform init

plan: init
	@echo -e "\n Creating terraform plan for the updates\n"
	@echo -e "\n using aws okta to login in to the $(dir) account\n"
	@cd ./$(dir); terraform plan

apply: init plan
	@echo -e "\n applying the new plan\n"
	@echo -e "\n using aws okta to login in to the $(dir) account\n"
	@cd ./$(dir); terraform apply

destroy:
	@echo -e "\n destroy existing infrastructure\n"
	@echo -e "\n please be carefull while using this command\n"
	@echo -e "\n using aws okta to login in to the $(dir) account\n"
	@cd ./$(dir); terraform destroy
