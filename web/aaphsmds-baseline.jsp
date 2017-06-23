<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:useBean id="aaphsmdsPatientsList" type="java.sql.ResultSet" scope="request"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>

    <title>USTH-BCI Biobank - AA, PHS, MDS</title>
    
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
            <li class="active"><a href="aaphsmds-baseline.html">AA, PHS, MDS</a></li>
            <li><a href="coagulationdisease-baseline.html">Coagulation Disease</a></li>
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
                <%while(aaphsmdsPatientsList.next()) {%>
                	<li><a href="getaapnhmdspatientservlet.html?patientId=<%=aaphsmdsPatientsList.getInt("patientId")%>"><%=aaphsmdsPatientsList.getInt("patientId")%></a></li>
                <%}%>
                <!-- 
                <li><a href="#">CD001</a></li>
                <li><a href="#">CD002</a></li>
                <li><a href="#">CD003</a></li>
                <li><a href="#">CD004</a></li>
                <li><a href="#">CD005</a></li>
                <li><a href="#">CD006</a></li>
                <li><a href="#">CD003</a></li>
                <li><a href="#">CD004</a></li>
                <li><a href="#">CD005</a></li>
                <li><a href="#">CD006</a></li>
                <li><a href="#">CD003</a></li>
                <li><a href="#">CD004</a></li>
                <li><a href="#">CD005</a></li>
                <li><a href="#">CD006</a></li>
                 -->
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
		
		<form action="AddAAPHSMDSBaselineServlet" method="post">
        <!-- Forms Container -->
        <div class="row">
          <div class="col-sm-10 offset-sm-2 pull-right forms">

            <!-- Buttons Container -->
            <div class="row button-container">
              <div class="col-sm-4">
                <a href="aaphsmds-baseline.html" type="button" class="btn bg-yellow">Baseline</a>
                <a href="aaphsmds-followup.html" type="button" class="btn bg-yellow">Follow Up</a>
              </div>
            </div>
            <!-- End of Buttons Container -->

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

                      <!-- Tissue Specimen Collected -->
                      <div class="form-group">
                        <label class="control-label col-sm-5">Tissue Specimen Collected</label>
                        <div class="col-sm-7">
                          <div class="radio">
                            <label><input type="radio" name="tissueSpecimenCollected" value="1">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="tissueSpecimenCollected" value="0">No</label>
                          </div>
                        </div>
                      </div>

                      <!-- Specimen Type -->
                      <div class="form-group">
                        <label class="control-label col-sm-5">Specimen Type</label>
                        <div class="col-sm-7">
                          <select class="form-control" name="specimenType">
                            <option value="1">BMA</option>
                            <option value="2">BB</option>
                            <option value="2">LN</option>
                          </select>
                        </div>
                      </div>

                    </div>
                    <!-- End of form -->

                  </div>
                </div>
                <!-- End of General Tab Content -->
              </div>
              <!-- End of General -->

              <!-- CLT -->
              <div class="col-sm-8">

                <!-- CLT Navtabs-->
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
                        <label class="control-label col-sm-4">Date of Visit</label>
                        <div class="col-sm-8">
                          <input type="date" class="form-control" name="dateOfVisit">
                        </div>
                      </div>

                      <!-- Diagnosis -->
                      <div class="form-group">
                        <label for="diagnosis" class="control-label col-sm-4">Diagnosis</label>
                        <div class="col-sm-8">
                          <select class="form-control" name="diagnosis">
                            <option selected="selected" disabled="disabled">Select</option>
                            <option value="D61.0  Constitutional aplastic anaemia">D61.0  Constitutional aplastic anaemia</option>
                            <option value="D61.1  Drug-induced aplastic anaemia">D61.1  Drug-induced aplastic anaemia</option>
                            <option value="D61.2  Aplastic anaemia due to other external agents">D61.2  Aplastic anaemia due to other external agents</option>
                            <option value="D61.3  Idiopathic aplastic anaemia">D61.3  Idiopathic aplastic anaemia</option>
                            <option value="D61.8  Other specified aplastic anaemias">D61.8  Other specified aplastic anaemias</option>
                            <option value="D61.9  Aplastic anaemia, unspecified">D61.9  Aplastic anaemia, unspecified</option>
                            <option value="D46.0  Refractory anaemia without ring sideroblasts, so stated">D46.0  Refractory anaemia without ring sideroblasts, so stated</option>
                            <option value="D46.1  Refractory anaemia with ring sideroblasts">D46.1  Refractory anaemia with ring sideroblasts</option>
                            <option value="D46.2  Refractory anaemia with excess of blasts [RAEB]">D46.2  Refractory anaemia with excess of blasts [RAEB]</option>
                            <option value="D46.4  Refractory anaemia, unspecified">D46.4  Refractory anaemia, unspecified</option>
                            <option value="D46.5  Refractory anaemia with multi-lineage dysplasia">D46.5  Refractory anaemia with multi-lineage dysplasia</option>
                            <option value="D46.6  Myelodysplastic syndrome with isolated del(5q) chromosomal abnormality 5 q-minus syndrome">D46.6  Myelodysplastic syndrome with isolated del(5q) chromosomal abnormality 5 q-minus syndrome</option>
                            <option value="D46.7  Other myelodysplastic syndromes">D46.7  Other myelodysplastic syndromes</option>
                            <option value="D59.5  Paroxysmal Nocturnal Hemoglobinuria">D59.5  Paroxysmal Nocturnal Hemoglobinuria</option>
                            <option value="D59.6Haemoglobinuria due to haemolysis from other external causes">D59.6Haemoglobinuria due to haemolysis from other external causes</option>
                          </select>
                        </div>
                      </div>

                      <!-- Severity -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Classification/Risk Statification</label>
                        <div class="col-sm-8">
                          <select class="form-control" name="severity">
                            <option selected="selected" disabled="disabled">Select</option>
                            <option value="1">AA Moderately Severe</option>
                            <option value="2">AA Severe</option>
                            <option value="3">AA Very Severe</option>
                            <option value="4">MDS Very Low</option>
                            <option value="5">MDS Low</option>
                            <option value="6">MDS Intermediate</option>
                            <option value="7">MDS High</option>
                            <option value="8">MDS Very High</option>
                          </select>
                        </div>
                      </div>

                      <!-- Chief Complaint -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Chief Complaint</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="chiefComplaint">
                        </div>
                      </div>

                      <!-- Other Symptoms -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Other Symptoms</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="otherSymptoms">
                        </div>
                      </div>

                      <!-- Family History of Cancer -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Family History of Cancer</label>
                        <div class="col-sm-8">
                          <div class="radio">
                            <label><input type="radio" name="familyHistoryOfCancer">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="familyHistoryOfCancer">No</label>
                          </div>
                        </div>
                      </div>

                      <!-- Relationship to Patient -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Relationship to Patient</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="relationshipToPatient">
                        </div>
                      </div>

                      <!-- Other Diseases in the Family -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Other Diseases in the Family</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="otherDiseasesInTheFamily">
                        </div>
                      </div>

                      <!-- Comorbidities -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Comorbidities</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="comorbidities">
                        </div>
                      </div>

                      <!-- Concomitant Medications -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Current/Past Medications</label>
                        <div class="col-sm-8">
                          <div class="radio">
                            <label><input type="radio" name="concomitantMedications" value="1">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="concomitantMedications" value="0">No</label>
                          </div>
                        </div>
                      </div>

                      <!-- Concomitant Medications Dynamic Tabs -->
                      <div class="form-group">
                        <div class="row">
                          <div class="col-sm-4"></div>
                          <label class="control-label col-sm-3" style="text-align:left;">Generic Name</label>
                          <label class="control-label col-sm-2" style="text-align:left;">Dose</label>
                          <label class="control-label col-sm-2" style="text-align:left;">Frequency</label>
                        </div>
                        <div class="row">
                          <div class="col-sm-4"></div>
                          <div class="col-sm-3">
                            <input type="text" class="form-control" name="genericName">
                          </div>
                          <div class="col-sm-2">
                            <input type="text" class="form-control" name="dose">
                          </div>
                          <div class="col-sm-2">
                            <input type="text" class="form-control" name="frequency">
                          </div>
                        </div>
                      </div>

                      <!-- Smoking History -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Smoking History</label>
                        <div class="col-sm-8">
                          <div class="radio">
                            <label><input type="radio" name="smokingHistory">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="smokingHistory">No</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-4">Specify:</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="smokingHistorySpecify">
                        </div>
                      </div>


                      <!-- Alcohol Intake History -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Alcohol intake history </label>
                        <div class="col-sm-8">
                          <div class="radio">
                            <label><input type="radio" name="alcoholIntakeHistory">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="alcoholIntakeHistory">No</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-4">Specify</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="alcoholIntakeSpecify"/>
                        </div>
                      </div>

                      <!-- Chemical Exposure -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Chemical exposure</label>
                        <div class="col-sm-8">
                          <div class="radio">
                            <label><input type="radio" name="chemicalExposureHistory">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="chemicalExposureHistory">No</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-4">Specify</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="chemicalExposureSpecify"/>
                        </div>
                      </div>

                      <!-- Previous Infection -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Previous Infection</label>
                        <div class="col-sm-8">
                          <div class="radio">
                            <label><input type="radio" name="previousInfection">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="previousInfection">No</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-4">Specify</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="previousInfectionSpecify"/>
                        </div>
                      </div>

                      <!-- Previous Hematologic Disorder -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Previous Hematologic Disorder</label>
                        <div class="col-sm-8">
                          <div class="radio">
                            <label><input type="radio" name="previousHematologicDisorder">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="previousHematologicDisorder">No</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-4">Specify</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="previousHematologicDisorderSpecify"/>
                        </div>
                      </div>
                      
                      <br/>
                      <!-- Physical Exam -->
                      <h3 class="text-center">Physical Exam</h3>
                      <div class="form-group">
                        <label class="control-label col-sm-4">Height</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="height"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-4">Weight</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="weight"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-4">ECOG</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="ecog"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-4">Other findings</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="otherFindings"/>
                        </div>
                      </div>

                    <!-- End of form -->
                    </div>
                  </div>
                  <!-- End of Clinical -->

                  <!-- Laboratory -->
                  <div id="laboratory" class="tab-pane fade">
                    
                    <!-- Form -->
                    <div class="form-horizontal">

                      <!-- Date of Blood Collection -->
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
                        <!-- End of Labels -->

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
                          <label class="control-label col-sm-4">Myelocytes (%)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="myelocytes"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Metamyelocytes (%)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="metamyelocytes"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Blasts (%)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="blasts"/>
                            
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Platelet count (x 10^9/L)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="plateletCount"/>
                          </div>
                        </div>
                        <!-- End of Fields -->


                      <!-- Other Lab -->
                      <h3>Other Laboratories</h3>

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
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="creatinine"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Uric acid mg/dl</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="uricAcid"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Reticulocyte Count</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="reticulocyteCount"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Serum iron</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="serumIron"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Iron-binding capacity</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="ironBindingCapacity"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Serum Ferritin</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="serumFerritin"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Direct antiglobulin (Coombs) test (+/++/+++/-)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="directAntiglobulin"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Indirect antiglobulin (Coombs) test(+/++/+++/-)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="indirectAntiglobulin"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">SGOT (U/L)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="sgot"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">SGPT (U/L)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="sgpt"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">LDH (U/L)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="ldh"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Screening tests for hepatitis viruses A, B, and C (+/-)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="screeningTestsForHepatitisVirusesABC"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Screening tests for EBV, cytomegalovirus (CMV), and HIV (+/-)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="screeningTestsForEBVCMVHIV"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Erythropoeitin level</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="erythropoeitinLevel"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Serum folic acid</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="serumFolicAcid"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Serum B12</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="serumB12"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">TSH</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="tsh"/>
                          </div>
                        </div>
                        <!-- End of fields -->
                        <br/>

                      <!-- Bone Marrow  -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Bone Marrow Aspirate and Biopsy result</label>
                        <div class="col-sm-8">
                          <div class="radio">
                            <label><input type="radio" name="boneMarrowAspirate" value="1">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="boneMarrowAspirate" value="0">No</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-4">Date Performed</label>
                        <div class="col-lg-8">
                          <input type="date" class="form-control" name="boneMarrowAspirateDatePerformed"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4">Description</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="boneMarrowAspirateDescription"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4">Attach scanned document</label>
                        <div class="col-sm-8">
                          <input type="file" class="form-control" name="boneMarrowAspirateAttachScannedDocument"/>
                        </div>
                      </div>

                      <!-- Flow cytometry -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Flow Cytometry</label>
                        <div class="col-sm-8">
                          <div class="radio">
                            <label><input type="radio" name="flowCytometry" value="1">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="flowCytometry" value="0">No</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="flowCytometry" value="2">Not Applicable</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4">Result</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="flowCytometryResult"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4">Attach scanned document</label>
                        <div class="col-sm-8">
                          <input type="file" class="form-control" name="flowCytometryAttachScannedDocument"/>
                        </div>
                      </div>

                      <!-- Cytogenetic and Molecular Analysis if for Aplastic Anemia and PNH -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Cytogenetic and Molecular Analysis if for Aplastic Anemia and PNH</label>
                        <div class="col-sm-8">
                          <div class="radio">
                            <label><input type="radio" name="cytogeneticAndMolecularAnalysisAAPNH" value="1">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="cytogeneticAndMolecularAnalysisAAPNH" value="0">Not Done</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4">Result</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="cytogeneticAndMolecularAnalysisAAPNHResult"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4">Attach scanned document</label>
                        <div class="col-sm-8">
                          <input type="file" class="form-control" name="cytogeneticAndMolecularAnalysisAAPNHAttachScannedDocument"/>
                        </div>
                      </div>

                      <!-- Cytogenetic and Molecular Analysis if for MDS -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Cytogenetic and Molecular Analysis if for MDS</label>
                        <div class="col-sm-8">
                          <div class="radio">
                            <label><input type="radio" name="cytogeneticAndMolecularAnalysisMDS" value="1">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="cytogeneticAndMolecularAnalysisMDS" value="0">Not Done</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4">Result</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="cytogeneticAndMolecularAnalysisMDSResult"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-4">Attach scanned document</label>
                        <div class="col-sm-8">
                          <input type="file" class="form-control" name="cytogeneticAndMolecularAnalysisMDSAttachScannedDocument"/>
                        </div>
                      </div>

                    </div>
                    <!-- end of form -->
                  </div>
                  <!-- End of Laboratory -->

                  <!-- Therapy -->
                  <div id="therapy" class="tab-pane fade">

                    <!-- Form -->
                    <div class="form-horizontal">

                      <!-- Transplant Candidate -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Transplant Candidate</label>
                        <div class="col-sm-8">
                          <div class="radio">
                            <label><input type="radio" name="transplantCandidate" value="1">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="transplantCandidate" value="0">No</label>
                          </div>
                        </div>
                      </div>

                      <!-- Treatment -->
                      <div class="form-group">
                        <label for="severity" class="control-label col-sm-4">Mode of Treatment</label>
                        <div class="col-sm-8">
                          <select class="form-control" name="modeOfTreament">
                            <option value="1">Hematopoietic Stem Cell Transplantation</option>
                            <option value="2">Pharmacologic Treatment</option>
                            <option value="3">Supportive</option>
                            <option value="4">Both Pharmacologic and Supportive</option>
                            <option value="10">Watch and Wait</option>
                          </select>
                        </div>
                      </div>

                      <!-- Medications -->
                      <div class="form-group">
                        <label class="control-label col-lg-4">Medications</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="medications"/>
                        </div>
                      </div>

                      <!-- Date Started -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Date Started</label>
                        <div class="col-lg-8">
                          <input type="date" class="form-control" name="dateStarted"/>
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