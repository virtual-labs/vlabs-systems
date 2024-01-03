# FATAL ERROR: Ineffective mark-compacts near heap limit Allocation failed - JavaScript heap out of memory issue

## Introduction 
When hosting the lab on AWS and building it using the `npm labgen` command, users may encounter the following issue: **FATAL ERROR: Ineffective mark-compacts near heap limit Allocation failed - JavaScript heap out of memory.**

## Purpose of the Document
This document guides users through the troubleshooting process for resolving the "FATAL ERROR: Ineffective mark-compacts near heap limit Allocation failed - JavaScript heap out of memory" issue during the hosting of labs for Virtual Labs experiments. By providing clear and comprehensive solutions, this guide aims to empower developers to swiftly address and resolve issues related to lab hosting.

## Who Should Use This Guide?
This guide is intended for:

- **Developers:** Individuals actively contributing to or managing code repositories.
- **Project Managers:** Those overseeing collaborative projects and hosting of labs.
- **Anyone Utilizing GitHub:** Whether you're a beginner or an experienced user, this guide caters to a diverse audience.

## Step by Step Solutions
To resolve the JavaScript heap out of memory issue, follow these steps:

1. Open your terminal.
2. Enter the following code to increase the memory for JavaScript:
   ```bash
   export NODE_OPTIONS=--max_old_space_size=4096


