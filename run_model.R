# Load necessary libraries
library(TDCM)
library(readxl)  # To read Excel files
#"C:\Users\amehrabi\OneDrive - purdue.edu\Purdue\articles and talks\Confrence article\ASEE\2025 asee\engineering_related_rows.xlsx"


# Load necessary libraries
library(readxl)
library(dplyr)

# Read in the data for Time 1
data_t1 <- read_excel(
  path = "C:/Users/amehrabi/OneDrive - purdue.edu/Purdue/articles and talks/Confrence article/ASEE/2025 asee/engineering_related_rows.xlsx",
  sheet = "pre"
)

# Select the relevant columns
data_t1 <- data_t1 %>% select(starts_with("pre_c_"))

# Invert the responses (1 -> 0 and 0 -> 1)
data_t1 <- 1 - data_t1

# Read in the data for Time 2
data_t2 <- read_excel(
  path = "C:/Users/amehrabi/OneDrive - purdue.edu/Purdue/articles and talks/Confrence article/ASEE/2025 asee/engineering_related_rows.xlsx",
  sheet = "post"
)

# Select the relevant columns
data_t2 <- data_t2 %>% select(starts_with("post_c_"))

# Invert the responses (1 -> 0 and 0 -> 1)
data_t2 <- 1 - data_t2

# Combine data for both time points
data <- cbind(data_t1, data_t2)
colnames(data) <- c(paste0("t1item", 1:ncol(data_t1)), paste0("t2item", 1:ncol(data_t2)))

# Read the Q-matrix from the Excel file (assuming it's the first sheet)
q_matrix_path <- "C:/Users/amehrabi/OneDrive - purdue.edu/Purdue/articles and talks/Confrence article/ASEE/2025 asee/Misconception Q Matrix.xlsx"  # Use the correct path
q_matrix <- read_excel(q_matrix_path, sheet = "Sheet3")

# Convert the Q-matrix into a format suitable for the model
q.matrix <- as.matrix(q_matrix[, -1])  # Remove the first column (row numbers)
colnames(q.matrix) <- c("Force and Motion", "Vector Addition", "Friction", "Acceleration and Velocity")

# Estimate the LCDM model using the DINO rule for wrong beliefs
model <- tdcm(data, q.matrix, num.time.points = 2, rule = "DINO")

# Summarize the results
results <- tdcm.summary(model, num.time.points = 2, attribute.names = colnames(q.matrix))

# View the item parameters and transition probabilities
item_parameters <- results$item.parameters
transition_probabilities <- results$transition.probabilities
transition_posteriors <- results$transition.posteriors
reliability <- results$reliability

# Print summary outputs
print(item_parameters)
print(transition_probabilities)
print(transition_posteriors)
print(reliability)

# Plot the results
tdcm.plot(results, attribute.names = colnames(q.matrix))

# File path to save the results
file_path <- "all_data_DINO_model.txt"

# Write data to the same text file
write("Q Matrix\n", file = file_path)
write.table(q.matrix, file = file_path, sep = "\t", row.names = FALSE, col.names = TRUE, quote = FALSE, append = TRUE)

# Write each part of the results separately
write("\nItem Parameters\n", file = file_path, append = TRUE)
write.table(results$item.parameters, file = file_path, sep = "\t", row.names = FALSE, col.names = TRUE, append = TRUE, quote = FALSE)

write("\nTransition Probabilities\n", file = file_path, append = TRUE)
write.table(results$transition.probabilities, file = file_path, sep = "\t", row.names = FALSE, col.names = TRUE, append = TRUE, quote = FALSE)

write("\nTransition Posteriors\n", file = file_path, append = TRUE)
write.table(results$transition.posteriors, file = file_path, sep = "\t", row.names = FALSE, col.names = TRUE, append = TRUE, quote = FALSE)

write("\nReliability\n", file = file_path, append = TRUE)
write.table(t(results$reliability), file = file_path, sep = "\t", row.names = FALSE, col.names = TRUE, append = TRUE, quote = FALSE)

# Handle any additional components of 'results' if they exist
if (!is.null(results$additional_component)) {
  write("\nAdditional Component\n", file = file_path, append = TRUE)
  write.table(results$additional_component, file = file_path, sep = "\t", row.names = FALSE, col.names = TRUE, append = TRUE, quote = FALSE)
}
