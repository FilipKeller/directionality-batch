// Macro suitable for batch mode
// performs direciotnality analysis on cropped images and calls for Python script

run("32-bit"); // No need for RGB information
mainFolder = getDirectory("image"); // Identifies the directory from which image was opened
source = getTitle(); // Saves the filename of source image for further use

run("BatchDirectionality ", "method=[Fourier components] nbins=91 histogram_start=-90 histogram_end=90 build"); // Requires modified version of java-based plugin, creates Orientation map
mapTitle = getTitle();

if (File.exists(mainFolder +"Output")) {
      } else {
      	File.makeDirectory(mainFolder +"Output");
      }
// Checks whether Output subfolder exists; if not, creates one
saveAs(mainFolder + "Output/" + mapTitle); // Saves Orientation map into subfolder

imageCalculator("Subtract create 32-bit", source, mapTitle);
// Creates Difference image
run("Invert");
// Inverts pixel values

diffTitle = getTitle();
saveAs("png", mainFolder + "Output/" + diffTitle);

// Defines path to text file to store results
output_path = mainFolder + "Output/" + "output.txt";

if (File.exists(output_path)) {
	}else {
		header = "Filename,Direction,Dispersion,GoF";
		File.saveString(header, output_path);
           }
// Checks if results file exists; if not, creates an empty one with header

run("DirOutput.py"); // Run python script
run("Close All");
print("Script finished for "+source);