// Second Macro
  if (File.exists(getDirectory("image")+"coords.txt")) {
      import_string = File.openAsString(getDirectory("image")+"coords.txt");
      coord_array = split(import_string, ",");// Splits loaded string into array
      x = coord_array[0];
      y = coord_array[1];
      width = coord_array[2];
      height = coord_array[3];
      makeRectangle(x, y, width, height);// Makes rectangulare selection of size defined by input data
      run("Crop");
      if (File.exists(getDirectory("image") + File.getName(getDir("image")) + "_cropped/")) {
      	save(getDirectory("image") + File.getName(getDir("image")) + "_cropped/" + "crop_" + File.name);
      } else {
      	File.makeDirectory(getDirectory("image") + File.getName(getDir("image")) + "_cropped/");// Creates subfolder only if needed
      	save(getDirectory("image") + File.getName(getDir("image")) + "_cropped/" + "crop_" + File.name);
      }
      close();
   } else {
      waitForUser("No file with coordinates found");// Displays message
   }