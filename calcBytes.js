const fs = require("fs");

// Check if a file path argument was provided
if (process.argv.length !== 3) {
  console.error("Usage: node script.js <file_path>");
  process.exit(1);
}

// Get the file path from the command-line argument
const filePath = process.argv[2];
// Read the data from the text file
fs.readFile(filePath, "utf-8", (err, data) => {
  if (err) {
    console.error(`Error reading file: ${err}`);
    return;
  }

  // Encode the data using UTF-8 encoding (default)
  const buffer = Buffer.from(data);

  // Calculate memory size in bytes
  const memorySizeBytes = buffer.length;

  //Check if the number of bytes is divisible by 32
  const isDivisibleBy32 = memorySizeBytes % 32 === 0;
  const remainder = memorySizeBytes % 32;

  //raw
  const raw = memorySizeBytes / 32;

  // Calculate memory size in 32-byte words
  const memorySizeWords = Math.ceil(raw);

  // Check if the number of words is odd or even
  const isOddWords = memorySizeWords % 2 === 1;

  // Convert to kilobytes (KB) or megabytes (MB) if desired
  const memorySizeKB = memorySizeBytes / 1024;
  const memorySizeMB = memorySizeBytes / (1024 * 1024);

  //print filepath
  console.log(`File path: ${filePath}`);

  console.log(`Memory size (bytes): ${memorySizeBytes}`);
  console.log(`Memory size (KB): ${memorySizeKB}`);
  console.log(`Memory size (MB): ${memorySizeMB}`);
  console.log(`Memory size is divisible by 32: ${isDivisibleBy32}`);
  console.log(`Remainder: ${remainder}`);
  console.log(`number of word raw: ${raw}`);
  console.log(`Number of words: ${memorySizeWords}`);
  console.log(`Number of words is odd: ${isOddWords}`);
});
