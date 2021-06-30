// First macro
// Selects area to be cropped
waitForUser("Select rectangle to be cropped","Use the selection tool, then click OK");
getSelectionBounds(x, y, width, height);// Gets values from selection
coords = newArray(x, y, width, height);// Saves coordinates as an array
coord_string = String.join(coords, ",");
coord_path = getDirectory("image")+"coords.txt";
File.saveString(coord_string, coord_path);// Saves string with coordinates as text file
waitForUser("Coordinates " + coord_string + " saved to path " + coord_path);// Displays message
