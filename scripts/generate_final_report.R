#!/usr/bin/env Rscript

library(rmarkdown)

cat("Generating RNAFlowX final report...\n")

render(
  input = "results/final_report/RNAFlowX_Final_Report.Rmd",
  output_file = "RNAFlowX_Final_Report.html",
  output_dir = "results/final_report"
)

cat("Report generation completed successfully!\n")
