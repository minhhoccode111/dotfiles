const fs = require("fs");
const path = require("path");

// get the absolute path to the folder containing the script
const scriptDirectory = __dirname;

// define the folder name relative to the script directory
const folderName = "folder name"; // replace with the actual folder name

// construct the absolute path to the folder
const folderPath = path.join(scriptDirectory, folderName);

// we can list files to delete like this or use conditional delete in the loop below
const filesToDelete = ["1.md", "1a.md", "1b.md", "1c.md", "1e.md", "2.md"];

fs.readdir(folderPath, (err, files) => {
  if (err) {
    console.error("Error reading folder: ", err);
    return;
  }
  files.forEach((file) => {
    const filePath = path.join(folderPath, file);
    // condition to delete
    if (filesToDelete.includes(file)) {
      // delete with unlink
      // the callback will be called once the file is successfully deleted or if an error occurs during the deletion process
      fs.unlink(filePath, (unlinkErr) => {
        if (unlinkErr) {
          console.error("Error deleting file: ", unlinkErr);
        } else {
          console.log("Deleted: " + filePath);
        }
      });
    }
  });
});
