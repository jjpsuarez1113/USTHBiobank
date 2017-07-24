<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:useBean id="coagulationPatientsList" type="java.sql.ResultSet" scope="request"/>

<!DOCTYPE html>
<html>
  <head>

    <title>USTH-BCI Biobank - Coagulation Disease</title>
    
    <!-- CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="vendor/formvalidation/dist/css/formValidation.min.css">

    <!-- JS -->
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="vendor/formvalidation/dist/js/formValidation.min.js"></script>
  
  </head>

  <body>

    <!-- Main container -->
    <div class="container-fluid main-container">

      <!-- Header -->
      <div class="navbar navbar-default navbar-fixed-top">

        <!-- Banner -->
        <div class="row header bg-navyblue">
          <div class="col-sm-1">
            <img src="images/usthlogo.png" width="90%">
          </div>
          <div class="col-sm-10">
            <h4>UST-BCI Section of Clinical Hematology</h4>
            <p>Hematologic Disease Database</p>
          </div>
          <div class="col-sm-1">
            <img src="images/ustlogo.png" width="90%">
          </div>
        </div>
        <!-- End of Banner -->
         <!-- Navbar -->
        <div class="nav-collapse">
          <ul class="nav navbar-nav">
            <li><a href="aaphsmds-baseline.html">AA, PHS, MDS</a></li>
            <li class="active"><a href="coagulationdisease-baseline.html">Coagulation Disease</a></li>
            <li><a href="leukemia-baseline.html">Leukemia</a></li>
            <li><a href="lymphoma-baseline.html">Lymphoma</a></li>
            <li><a href="myelo-baseline.html">Myeloproliferative Neoplasm</a></li>
            <li><a href="plasmacell-baseline.html">Plasma Cell Disorder</a></li>
            <li><a href="plateletdisorder-baseline.html">Platelet Disorder</a></li>
            <li><a href="settings.html">Settings</a></li>
          </ul>
        </div>
        <!-- End of Navbar -->

      </div>
      <!-- End of header -->

      <!-- Main Content -->
      <main class="container-fluid bg-grey">

        <!-- Sidebar -->
        <div class="row affix sidebar-container">
          <div class="col-sm-12 sidebar">

            <!-- Search Box -->
            <div class="row">
              <div class="col-sm-12 search-box">
                <div>
                  <input type="text" placeholder="Search..">
                </div>
              </div>
            </div>
            <!-- End of Search Box -->

            <!-- Sidenav -->
            <div class="row">
              <ul id="sidebar" class="nav nav-stacked col-sm-12">
                <%while(coagulationPatientsList.next()) {%>
                	<li><a href="getcoagulationpatientservlet.html?patientId=<%=coagulationPatientsList.getInt("patientId")%>"><%=coagulationPatientsList.getInt("patientId")%></a></li>
                <%}%>
              </ul>
            </div>
            <!-- End of Sidenav -->

            <!-- Add box -->
            <div class="row">
              <div class="col-sm-12 add-box">
                <button type="button" class="btn bg-yellow">Add Patient</button>
              </div>
            </div>
            <!-- End of Add box -->

          </div>
        </div>
        <!-- End of Sidebar -->

        <!-- Forms Container -->
        <div class="row">
          <div class="col-sm-10 offset-sm-2 pull-right forms">

            <!-- Buttons Container -->
            <div class="row button-container">
              <div class="col-sm-4">
                <a href="coagulationdisease-baseline.html" type="button" class="btn bg-yellow" style="visibility: hidden;">Baseline</a>
                <a href="coagulationdisease-followup.html" type="button" class="btn bg-yellow" style="visibility: hidden;">Follow Up</a>
              </div>
            </div>
            <!-- End of Buttons Container -->
			<form action="AddCoagulationBaselineServlet" method="post">
            <!-- Forms -->
            <div class="row">

              <!-- General -->
              <div class="col-sm-4">

                <!-- General Tab -->
                <ul class="nav nav-tabs">
                  <li class="active"><a data-toggle="tab" href="#general">General</a></li>
                </ul>
                <!-- End of General Tab -->

                <!-- General Tab Content -->
                <div class="tab-content">
				
                  <!-- Form -->
                  <div id="general" class="tab-pane fade in active">

                    <!-- Form -->
                    <div class="form-horizontal"> 

                      <!-- Patient ID Number -->
                      <div class="form-group">
                        <label class="control-label col-sm-5">Patient ID Number</label>
                        <div class="col-sm-7">
                          <input type="text" class="form-control" name="patientIDNumber">
                        </div>
                      </div>

                      <!-- Last Name -->
                      <div class="form-group">
                        <label class="control-label col-sm-5">Last Name</label>
                        <div class="col-sm-7">
                          <input type="text" class="form-control" name="lastName">
                        </div>
                      </div>

                      <!-- First Name -->
                      <div class="form-group">
                        <label class="control-label col-sm-5">First Name</label>
                        <div class="col-sm-7">
                          <input type="text" class="form-control" name="firstName">
                        </div>
                      </div>

                      <!-- Middle Initial -->
                      <div class="form-group">
                        <label class="control-label col-sm-5">Middle Initial</label>
                        <div class="col-sm-7">
                          <input type="text" class="form-control" name="middleInitial">
                        </div>
                      </div>

                      <!-- Gender -->
                      <div class="form-group">
                        <label class="control-label col-sm-5">Gender</label>
                        <div class="col-sm-7">
                          <div class="radio">
                            <label><input type="radio" name="gender" value="1">Male</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="gender" value="2">Female</label>
                          </div>
                        </div>
                      </div>

                      <!-- DOB -->
                      <div class="form-group">
                        <label class="control-label col-sm-5">Date of Birth</label>
                        <div class="col-sm-7">
                          <input type="date" class="form-control" name="dateOfBirth">
                        </div>
                      </div>

                      <!-- Address -->
                      <div class="form-group">
                        <label class="control-label col-sm-5">Address</label>
                        <div class="col-sm-7">
                          <input type="text" class="form-control" name="address">
                        </div>
                      </div>

                      <!-- Civil Status -->
                      <div class="form-group">
                        <label class="control-label col-sm-5">Civil Status</label>
                        <div class="col-sm-7">
                          <input type="text" class="form-control" name="civilStatus">
                        </div>
                      </div>

                      <!-- DOE -->
                      <div class="form-group">
                        <label class="control-label col-sm-5">Date of Entry</label>
                        <div class="col-sm-7">
                          <input type="date" class="form-control" name="dateOfEntry">
                        </div>
                      </div>

                    </div>
                    <!-- End of form -->

                  </div>
                </div>
                <!-- End of General Tab Content-->

              </div>
              <!-- End of General -->

              <!-- CLT -->
              <div class="col-sm-8">

                <!-- CLT Navtabs -->
                <ul class="nav nav-tabs">
                  <li class="active"><a data-toggle="tab" href="#clinical">Clinical</a></li>
                  <li><a data-toggle="tab" href="#laboratory">Laboratory</a></li>
                  <li><a data-toggle="tab" href="#therapy">Therapy and Response</a></li>
                </ul>
                <!-- End of CLT Navtabs -->

                <!-- CLT Tab Content -->
                <div class="tab-content">

                  <!-- Clinical -->
                  <div id="clinical" class="tab-pane fade in active">

                    <!-- Form -->
                    <div class="form-horizontal">

                      <!-- Date of Visit -->
                      <div class="form-group">
                        <label class="control-label col-sm-3">Date of Visit</label>
                        <div class="col-sm-9">
                          <input type="date" class="form-control" name="dateOfVisit">
                        </div>
                      </div>

                      <!-- Diagnosis -->
                      <div class="form-group">
                        <label for="diagnosis" class="control-label col-sm-3">Diagnosis</label>
                        <div class="col-sm-9">
                          <select class="form-control" name="diagnosis">
                            <option selected="selected" disabled="disabled">Select</option>
                            <option value="D66 Hemophilia A">D66 Hemophilia A</option>
                            <option value="D67 Hemophilia B">D67 Hemophilia B</option>
                          </select>
                        </div>
                      </div>

                      <!-- Others -->
                      <div class="form-group">
                        <label class="control-label col-sm-3">Others Please Specify</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="diagnosisOthers">
                        </div>
                      </div>

                      <!-- Severity -->
                      <div class="form-group">
                        <label for="severity" class="control-label col-sm-3">Severity</label>
                        <div class="col-sm-9">
                          <select class="form-control" name="severity">
                            <option value="1">Low</option>
                            <option value="2">Moderate</option>
                            <option value="3">Severe</option>
                            <option value="4">Not Applicable</option>
                          </select>
                        </div>
                      </div>

                      <!-- Chief Complaint -->
                      <div class="form-group">
                        <label class="control-label col-sm-3">Chief Complaint</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="chiefComplaint">
                        </div>
                      </div>

                      <!-- Other Symptoms -->
                      <div class="form-group">
                        <label class="control-label col-sm-3">Other Symptoms</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="otherSymptoms">
                        </div>
                      </div>

                      <!-- Family History of Bleeding Diathesis -->
                      <div class="form-group">
                        <label class="control-label col-sm-3">Family History of Bleeding Diathesis</label>
                        <div class="col-sm-9">
                          <div class="radio">
                            <label><input type="radio" name="familyHistoryOfBleedingDiathesis" value="1">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="familyHistoryOfBleedingDiathesis" value="0">No</label>
                          </div>
                        </div>
                      </div>

                      <!-- Relationship to Patient -->
                      <div class="form-group">
                        <label class="control-label col-sm-3">Relationship to Patient</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="relationshipToPatient">
                        </div>
                      </div>

                      <!-- Other Diseases in the Family -->
                      <div class="form-group">
                        <label class="control-label col-sm-3">Other Diseases in the Family</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="otherDiseasesInTheFamily">
                        </div>
                      </div>

                      <!-- Comorbidities -->
                      <div class="form-group">
                        <label class="control-label col-sm-3">Comorbidities</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="comorbidities">
                        </div>
                      </div>

                      <!-- Concomitant Medications -->
                      <div class="form-group">
                        <label class="control-label col-sm-3">Concomitant Medications</label>
                        <div class="col-sm-9">
                          <div class="radio">
                            <label><input type="radio" name="concomitantMedications" value="1">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="concomitantMedications" value="0">No</label>
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="row">
                          <div class="col-sm-3"></div>
                          <label class="control-label col-sm-3" style="text-align:left;">Generic Name</label>
                          <label class="control-label col-sm-3" style="text-align:left;">Dose</label>
                          <label class="control-label col-sm-3" style="text-align:left;">Frequency</label>
                        </div>
                        <div class="row">
                          <div class="col-sm-3"></div>
                          <div class="col-sm-3">
                            <input type="text" class="form-control" name="genericName">
                          </div>
                          <div class="col-sm-3">
                            <input type="text" class="form-control" name="dose">
                          </div>
                          <div class="col-sm-3">
                            <input type="text" class="form-control" name="frequency">
                          </div>
                        </div>
                      </div>

                      <!-- Smoking History -->
                      <div class="form-group">
                        <label class="control-label col-sm-3">Smoking History</label>
                        <div class="col-sm-9">
                          <div class="radio">
                            <label><input type="radio" name="smokingHistory" value="1">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="smokingHistory" value="0">No</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-3">Specify:</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="smokingHistorySpecify">
                        </div>
                      </div>

                      <!-- Alcohol Intake History -->
                      <div class="form-group">
                        <label class="control-label col-lg-3">Alcohol intake history </label>
                        <div class="col-sm-9">
                          <div class="radio">
                            <label><input type="radio" name="alcoholIntakeHistory" value="1">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="alcoholIntakeHistory" value="0">No</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-3">Specify</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="alcoholIntakeSpecify"/>
                        </div>
                      </div>

                      <!-- Chemical Exposure -->
                      <div class="form-group">
                        <label class="control-label col-lg-3">Chemical exposure</label>
                        <div class="col-sm-9">
                          <div class="radio">
                            <label><input type="radio" name="chemicalExposureHistory" value="1">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="chemicalExposureHistory" value="0">No</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-3">Specify</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="chemicalExposureSpecify"/>
                        </div>
                      </div>
                      
                      <br/>
                      <!-- Physical Exam -->
                      <h3>Physical Exam</h3>
                      <div class="form-group">
                        <label class="control-label col-lg-3">Height</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="height"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-3">Weight</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="weight"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-3">Presence of Hemarthroses</label>
                        <div class="col-sm-9">
                          <div class="radio">
                            <label><input type="radio" name="presenceOfHemarthroses" value="1">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="presenceOfHemarthroses" value="0">No</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-3">Presence of contractures and muscle atrophy</label>
                        <div class="col-sm-9">
                          <div class="radio">
                            <label><input type="radio" name="presenceOfContracturesAndMuscleAtrophy" value="1">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="presenceOfContracturesAndMuscleAtrophy" value="0">No</label>
                          </div>
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="control-label col-lg-3">Other findings</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="otherFindings"/>
                        </div>
                      </div>

                    </div>
                    <!-- End of form -->
                  </div>
                  <!-- End of Clinical -->

                  <!-- Laboratory -->
                  <div id="laboratory" class="tab-pane fade">
                    
                    <!-- Form -->
                    <div class="form-horizontal">

                      <!-- Date of Bloog Collection -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Date of blood collection</label>
                        <div class="col-lg-8">
                          <input type="date" class="form-control" name="dateOfBloodCollection"/>
                        </div>
                      </div>

                      <br/>
                      <!-- Hematology -->
                      <h3 class="text-center">Hematology</h3>

                        <!-- Labels -->
                        <div class="form-group">
                          <label class="control-label col-sm-4">Laboratory Parameter</label>
                          <label class="col-sm-4" style="text-align: left;">Result</label>
                          <div class="col-sm-4"><input type="checkbox"> <label>Not done</label></div>
                        </div>
                        <!-- End of labels -->

                        <!-- Fields -->
                        <div class="form-group">
                          <label class="control-label col-sm-4">Hemoglobin (g/L)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="hemoglobin"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Hematocrit (%)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="hematocrit"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">White blood cells (x10 ^9/L)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="whiteBloodCells"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Neutrophils (%)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="neutrophils"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Lymphocytes (%)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="lymphocytes"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Monocytes (%)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="monocytes"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Eosinophils (%)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="eosinophils"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Basophils (%)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="basophils"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Platelet count (x 10^9/L)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="plateletCount"/>
                          </div>
                        </div>
                        <!-- End of fields -->

                        <br/>
                        <!-- Coagulation Testing -->
                        <h3 class="text-center">Coagulation Testing</h3>

                          <!-- Labels -->
                          <div class="form-group">
                            <label class="control-label col-sm-4">Laboratory Parameter</label>
                            <label class="col-lg-4" style="text-align: left;">Result</label>
                            <div class="col-lg-4"><input type="checkbox"> <label>Not done</label></div>
                          </div>
                          <!-- End of labels -->

                          <!-- Fields -->
                          <div class="form-group">
                            <label class="control-label col-sm-4">Factor VIII level</label>
                            <div class="col-lg-4">
                              <input type="text" class="form-control" name="factorVIIILevel"/>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-sm-4">Factor IX level</label>
                            <div class="col-lg-4">
                              <input type="text" class="form-control" name="factorIXLevel"/>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-sm-4">Inhibitor Assay</label>
                            <div class="col-lg-4">
                              <input type="text" class="form-control" name="inhibitorAssay"/>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-sm-4">Bethesda Units</label>
                            <div class="col-lg-4">
                              <input type="text" class="form-control" name="bethesdaUnits"/>
                            </div>
                          </div>
                          <!-- End of fields -->

                          <!-- Blood Chemistry -->
                          <h3 class="text-center">Blood Chemistry</h3>

                            <!-- Labels -->
                            <div class="form-group">
                              <label class="control-label col-sm-4">Laboratory Parameter</label>
                              <label class="col-lg-4" style="text-align: left;">Result</label>
                              <div class="col-lg-4"><input type="checkbox"> <label>Not done</label></div>
                            </div>
                            <!-- End of labels -->

                            <!-- Fields -->
                            <div class="form-group">
                              <label class="control-label col-sm-4">Creatinine (mg/dl)</label>
                              <div class="col-sm-4">
                                <input type="text" class="form-control" name="creatine"/>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-sm-4">Uric acid</label>
                              <div class="col-sm-4">
                                <input type="text" class="form-control" name="uricAcid"/>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-sm-4">Na</label>
                              <div class="col-sm-4">
                                <input type="text" class="form-control" name="na"/>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-sm-4">K</label>
                              <div class="col-sm-4">
                                <input type="text" class="form-control" name="k"/>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-sm-4">SGOT (U/L)</label>
                              <div class="col-sm-4">
                                <input type="text" class="form-control" name="sgot"/>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-sm-4">SGPT (U/L)</label>
                              <div class="col-sm-4">
                                <input type="text" class="form-control" name="sgpt"/>
                              </div>
                            </div>
                            <div class="form-group">
                              <label class="control-label col-sm-4">LDH (U/L)</label>
                              <div class="col-sm-4">
                                <input type="text" class="form-control" name="ldh"/>
                              </div>
                            </div>
                            <!-- End of fields -->

                        <br/>
                        <!-- Imaging Studies -->
                        <div class="form-group">
                          <label class="control-label col-sm-4">Imaging Studies</label>
                          <div class="col-sm-8">
                            <div class="radio">
                              <label><input type="radio" name="imagingStudies" value="yes">Yes</label>
                            </div>
                            <div class="radio">
                              <label><input type="radio" name="imagingStudies" value="no">No</label>
                            </div>
                            <div class="radio">
                              <label><input type="radio" name="imagingStudies" value="notApplicable">Not Applicable</label>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Result</label>
                          <div class="col-lg-5">
                            <input type="text" class="form-control" name="imagingStudiesResult"/>
                          </div>
                        </div>
                        <!-- End of Imaging Studies -->

                    </div>
                    <!-- end of form -->
                  </div>
                  <!-- End of Laboratory -->

                  <!-- Therapy -->
                  <div id="therapy" class="tab-pane fade">

                    <!-- Form -->
                    <div class="form-horizontal">

                      <!-- Treatment -->
                      <div class="form-group">
                        <label for="severity" class="control-label col-sm-3">Treatment</label>
                        <div class="col-sm-9">
                          <select class="form-control" name="treatment">
                            <option value="8">Factor Concentrates</option>
                            <option value="9">Blood Component</option>
                            <option value="others">Others</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-3">Specify</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="treatmentSpecify"/>
                        </div>
                      </div>

                    </div>
                    <!-- End of Form -->
                  </div>
                  <!-- End of Therapy -->

                </div>
                <!-- End of CLT Tab Content -->

              <input type="submit" class="btn bg-yellow col-sm-4 pull-right">
              </div>
              <!-- End of CLT -->
            
            </div>
            <!-- End of Forms -->
			</form>
      </main>
      <!-- End of Main Content -->

    </div>
    <!-- End of main container -->
    
  </body>
</html>