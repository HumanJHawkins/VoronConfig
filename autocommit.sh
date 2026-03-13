#!/bin/bash
cd ~/printer_data
git add .
git commit -m "Auto-backup: $(date)"
git push -u origin main
