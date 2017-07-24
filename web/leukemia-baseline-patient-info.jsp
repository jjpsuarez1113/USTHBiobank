<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<jsp:useBean id="leukemiaPatientsList" type="java.sql.ResultSet" scope="request"/>
<jsp:useBean id="patientInfo" type="java.sql.ResultSet" scope="request"/>
<jsp:useBean id="generalData" type="java.sql.ResultSet" scope="request"/>
<jsp:useBean id="address" type="java.sql.ResultSet" scope="request"/>
<jsp:useBean id="clinicalData" type="java.sql.ResultSet" scope="request"/>
<jsp:useBean id="physicalExam" type="java.sql.ResultSet" scope="request"/>
<jsp:useBean id="laboratoryProfile" type="java.sql.ResultSet" scope="request"/>
<jsp:useBean id="hematology" type="java.sql.ResultSet" scope="request"/>
<jsp:useBean id="bloodChemistry" type="java.sql.ResultSet" scope="request"/>
<jsp:useBean id="imagingStudies" type="java.sql.ResultSet" scope="request"/>
<jsp:useBean id="boneMarrowAspirate" type="java.sql.ResultSet" scope="request"/>
<jsp:useBean id="flowCytometry" type="java.sql.ResultSet" scope="request"/>
<jsp:useBean id="cytogeneticAndMolecularAnalysis" type="java.sql.ResultSet" scope="request"/>
<jsp:useBean id="therapyAndResponse" type="java.sql.ResultSet" scope="request"/>

<%patientInfo.first();%>
<%generalData.first();%>
<%address.first();%>
<%clinicalData.first();%>
<%physicalExam.first();%>
<%laboratoryProfile.first();%>
<%hematology.first();%>
<%bloodChemistry.first();%>
<%imagingStudies.first();%>
<%boneMarrowAspirate.first();%>
<%flowCytometry.first();%>
<%cytogeneticAndMolecularAnalysis.first();%>
<%therapyAndResponse.first();%>

<html>
  <head>

    <title>USTH-BCI Biobank - Leukemia</title>
    
    <!-- CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="vendor/formvalidation/dist/css/formValidation.min.css">

    <!-- JS -->
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="vendor/formvalidation/dist/js/formValidation.min.js"></script>
  	<script src="js/input-toggle.js"></script>
	<script>
	$(document).ready(function(){
		//////SCRIPT FOR RADIOS AND SELECTS
		
		//Gender
		$("input[name=gender][value=<%=generalData.getInt("gender")%>]").prop('checked', true);
		
		//Specimen Type
		$("select[name=specimenType]").val(<%=generalData.getInt("tissueSpecimenId")%>);
	
		//Diagnosis
		$("select[name=diagnosis]").val("<%=clinicalData.getString("diagnosis")%>");
		
		//Classification/Risk
		$("select[name=severity]").val(<%=clinicalData.getString("classificationId")%>);
		
		//Diagnosis
		$("select[name=constitutionalSymptoms]").val("<%=clinicalData.getString("constitutionalSymptoms")%>");
		
		//Splenomegaly
		$("input[name=presenceOfSplenomegaly][value=<%=physicalExam.getInt("splenomegaly")%>]").prop('checked', true);
		
		//Hepatomegaly
		$("input[name=presenceOfHepatomegaly][value=<%=physicalExam.getInt("hepatomegaly")%>]").prop('checked', true);
		
		//Lymphadenopathies
		$("input[name=presenceOfLymphadenopathies][value=<%=physicalExam.getInt("lymphadenopathies")%>]").prop('checked', true);
		
		//Classification/Risk
		$("select[name=treatment]").val(<%=therapyAndResponse.getInt("modeOfTreatmentId")%>);
		
  	});
	</script>
  </head>

  <body>

    <!-- Main Container -->
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
            <li><a href="coagulationdisease-baseline.html">Coagulation Disease</a></li>
            <li class="active"><a href="leukemia-baseline.html">Leukemia</a></li>
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
                <%while(leukemiaPatientsList.next()) {%>
                	<li><a href="getleukemiapatientservlet.html?patientId=<%=leukemiaPatientsList.getInt("patientId")%>"><%=leukemiaPatientsList.getInt("patientId")%></a></li>
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
		
		<form action="AddLeukemiaBaselineServlet" method="post">
        <!-- Forms Container -->
        <div class="row">
          <div class="col-sm-10 offset-sm-2 pull-right forms">

            <!-- Buttons Container -->
            <div class="row button-container">
              <div class="col-sm-4">
                <a href="leukemia-baseline.html" type="button" class="btn bg-yellow">Baseline</a>
                <a href="leukemia-followup.html" type="button" class="btn bg-yellow">Follow Up</a>
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
                          <input type="text" class="form-control" name="patientIDNumber" value="<%=patientInfo.getInt("patientId")%>">
                        </div>
                      </div>

                      <!-- Last Name -->
                      <div class="form-group">
                        <label class="control-label col-sm-5">Last Name</label>
                        <div class="col-sm-7">
                          <input type="text" class="form-control" name="lastName" value="<%=generalData.getString("lastName")%>">
                        </div>
                      </div>

                      <!-- First Name -->
                      <div class="form-group">
                        <label class="control-label col-sm-5">First Name</label>
                        <div class="col-sm-7">
                          <input type="text" class="form-control" name="firstName" value="<%=generalData.getString("firstName")%>">
                        </div>
                      </div>

                      <!-- Middle Initial -->
                      <div class="form-group">
                        <label class="control-label col-sm-5">Middle Initial</label>
                        <div class="col-sm-7">
                          <input type="text" class="form-control" name="middleInitial" value="<%=generalData.getString("middleName")%>">
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
                          <input type="date" class="form-control" name="dateOfBirth" value="<%=generalData.getString("dateOfBirth")%>">
                        </div>
                      </div>
                      
                      <!-- Address -->
                      <div class="form-group">
                        <label class="control-label col-sm-5">Address</label>
                        <div class="col-sm-7">
                          <input type="text" class="form-control" name="address" value="<%=address.getString("streetAddress")%>, <%=address.getString("city")%>, <%=address.getString("zipCode")%>">
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
                          <input type="date" class="form-control" name="dateOfEntry" value="<%=generalData.getString("dateOfEntry")%>">
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
                            <label><input type="radio" name="tissueSpecimenCollected" value="2">No</label>
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
                            <option value="3">LN</option>
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

                      <!-- Date of Initial Diagnosis -->
                      <div class="form-group">
                        <label class="control-label col-sm-3">Date of Initial Diagnosis</label>
                        <div class="col-sm-9">
                          <input type="date" class="form-control" name="dateOfInitialDiagnosis" value="<%=clinicalData.getString("dateOfVisit")%>">
                        </div>
                      </div>

                      <!-- Diagnosis -->
                      <div class="form-group">
                        <label for="diagnosis" class="control-label col-sm-3">Diagnosis</label>
                        <div class="col-sm-9">
                          <select class="form-control" name="diagnosis">
                            <option selected="selected" disabled="disabled">Select</option>
                            <option value="C91    Lymphoid leukemia">C91    Lymphoid leukemia</option>
                            <option value="C91.0  Acute lymphoblastic leukemia [ALL]">C91.0  Acute lymphoblastic leukemia [ALL]</option>
                            <option value="C91.1  Chronic lymphocytic leukemia of B-cell type">C91.1  Chronic lymphocytic leukemia of B-cell type</option>
                            <option value="C91.3  Prolymphocytic leukemia of B-cell type">C91.3  Prolymphocytic leukemia of B-cell type</option>
                            <option value="C91.4  Hairy cell leukemia">C91.4  Hairy cell leukemia</option>
                            <option value="C91.5  Adult T-cell lymphoma/leukemia (HTLV-1-associated)">C91.5  Adult T-cell lymphoma/leukemia (HTLV-1-associated)</option>
                            <option value="C91.6 Prolymphocytic leukemia of T-cell type">C91.6 Prolymphocytic leukemia of T-cell type</option>
                            <option value="C91.A Mature B-cell leukemia Burkitt-type">C91.A Mature B-cell leukemia Burkitt-type</option>
                            <option value="C91.Z Other lymphoid leukemia">C91.Z Other lymphoid leukemia</option>
                            <option value="C91.9 Lymphoid leukemia, unspecified">C91.9 Lymphoid leukemia, unspecified</option>
                            <option value="C92 Myeloid leukemia">C92 Myeloid leukemia</option>
                            <option value="C92.0 Acute myeloblastic leukemia">C92.0 Acute myeloblastic leukemia</option>
                            <option value="C92.1 Chronic myeloid leukemia, BCR/ABL-positive">C92.1 Chronic myeloid leukemia, BCR/ABL-positive</option>
                            <option value="C92.2 Atypical chronic myeloid leukemia, BCR/ABL-negative">C92.2 Atypical chronic myeloid leukemia, BCR/ABL-negative</option>            
                            <option value="C92.3 Myeloid sarcoma">C92.3 Myeloid sarcoma</option>
                            <option value="C92.4 Acute promyelocytic leukemia">C92.4 Acute promyelocytic leukemia</option>
                            <option value="C92.5 Acute myelomonocytic leukemia">C92.5 Acute myelomonocytic leukemia</option>
                            <option value="C92.Z Other myeloid leukemia">C92.Z Other myeloid leukemia</option>
                            <option value="C92.9 Myeloid leukemia, unspecified">C92.9 Myeloid leukemia, unspecified</option>
                            <option value="C93 Monocytic leukemia">C93 Monocytic leukemia</option>
                            <option value="C93.0 Acute monoblastic/monocytic leukemia">C93.0 Acute monoblastic/monocytic leukemia</option>
                            <option value="C93.1 Chronic myelomonocytic leukemia">C93.1 Chronic myelomonocytic leukemia</option>
                            <option value="C93.3 Juvenile myelomonocytic leukemia">C93.3 Juvenile myelomonocytic leukemia</option>
                            <option value="C93.Z Other monocytic leukemia">C93.Z Other monocytic leukemia</option>
                            <option value="C93.9 Monocytic leukemia, unspecified">C93.9 Monocytic leukemia, unspecified</option>
                            <option value="C93.92 Monocytic leukemia, unspecified in relapse">C93.92 Monocytic leukemia, unspecified in relapse</option>
                            <option value="C94 Other leukemias of specified cell type">C94 Other leukemias of specified cell type</option>
                            <option value="C94.0 Acute erythroid leukemia">C94.0 Acute erythroid leukemia</option>
                            <option value="C942 Acute megakaryoblastic leukemia">C942 Acute megakaryoblastic leukemia</option>
                            <option value="C94.3 Mast cell leukemia">C94.3 Mast cell leukemia</option>
                          </select>
                        </div>
                      </div>

                      <!-- Classification/Risk Statification -->
                      <div class="form-group">
                        <label class="control-label col-sm-3">Classification/Risk Statification</label>
                        <div class="col-sm-9">
                          <select class="form-control" name="severity">
                            <option selected="selected" disabled="disabled">Select</option>
                            <option value="1">Low Risk</option>
                            <option value="4">Intermediate Risk</option>
                            <option value="5">High Risk</option>
                            <option value="6">Not Applicable</option>
                          </select>
                        </div>
                      </div>

                      <!-- Chief Complaint -->
                      <div class="form-group">
                        <label class="control-label col-sm-3">Chief Complaint</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="chiefComplaint" value="<%=clinicalData.getString("chiefComplaint")%>">
                        </div>
                      </div>

                      <!-- Constitutional Symptoms -->
                      <div class="form-group">
                        <label class="control-label col-sm-3">Constitutional Symptoms</label>
                        <div class="col-sm-9">
                          <select class="form-control" name="constitutionalSymptoms">
                            <option selected="selected" disabled="disabled">Select</option>
                            <option value="Fever">Fever</option>
                            <option value="Weight Loss">Weight Loss</option>
                            <option value="Night Sweats">Night Sweats</option>
                          </select>
                        </div>
                      </div>

                      <!-- Other Symptoms -->
                      <div class="form-group">
                        <label class="control-label col-sm-3">Other Symptoms</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="otherSymptoms" value="<%=clinicalData.getString("otherSymptoms")%>">
                        </div>

                      <!-- Family History of Cancer -->
                      <div class="form-group">
                        <label class="control-label col-sm-3">Family History of Cancer</label>
                        <div class="col-sm-9">
                          <div class="radio">
                            <label><input type="radio" name="familyHistoryOfCancer" value="1">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="familyHistoryOfCancer" value="2">No</label>
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
                          <input type="text" class="form-control" name="comorbidities" value="<%=clinicalData.getString("combordities")%>">
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
                            <label><input type="radio" name="concomitantMedications" value="2">No</label>
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
                            <label><input type="radio" name="smokingHistory" value="2">No</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-3">Specify:</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="smokingHistorySpecify" value="<%=clinicalData.getString("smokingHistory")%>">
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
                            <label><input type="radio" name="alcoholIntakeHistory" value="2">No</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-3">Specify</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="alcoholIntakeSpecify" value="<%=clinicalData.getString("alcoholIntakeHistory")%>"/>
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
                            <label><input type="radio" name="chemicalExposureHistory" value="2">No</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-3">Specify</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="chemicalExposureSpecify" value="<%=clinicalData.getString("chemicalExposure")%>"/>
                        </div>
                      </div>

                      <br/>
                      <!-- Physical Exam -->
                      <h3 class="text-center">Physical Exam</h3>
                      <div class="form-group">
                        <label class="control-label col-lg-3">Height</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="height" value="<%=physicalExam.getDouble("height")%>"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-3">Weight</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="weight" value="<%=physicalExam.getDouble("weight")%>"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-3">ECOG</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="ecog" value="<%=physicalExam.getDouble("ecog")%>"/>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-3">Presence of Splenomegaly</label>
                        <div class="col-sm-9">
                          <div class="radio">
                            <label><input type="radio" name="presenceOfSplenomegaly" value="1">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="presenceOfSplenomegaly" value="2">No</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-3">Presence of Hepatomegaly</label>
                        <div class="col-sm-9">
                          <div class="radio">
                            <label><input type="radio" name="presenceOfHepatomegaly" value="1">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="presenceOfHepatomegaly" value="2">No</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-3">Presence of Lymphadenopathies</label>
                        <div class="col-sm-9">
                          <div class="radio">
                            <label><input type="radio" name="presenceOfLymphadenopathies" value="1">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="presenceOfLymphadenopathies" value="2">No</label>
                          </div>
                        </div>
                      </div>
                      <br/>
                      <div class="form-group">
                        <label class="control-label col-lg-3">Other findings</label>
                        <div class="col-sm-9">
                          <input type="text" class="form-control" name="otherFindings" value="<%=physicalExam.getString("otherFindings")%>"/>
                        </div>
                      </div>
                      <!-- End of Physical Exam -->

                    </div>
                    <!-- End of form -->
                  </div></div>
                  <!-- End of Clinical -->

                  <!-- Laboratory -->
                  <div id="laboratory" class="tab-pane fade">
                    
                    <!-- Form -->
                    <div class="form-horizontal">

                      <!-- Date of Blood Collection -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Date of blood collection</label>
                        <div class="col-lg-8">
                          <input type="date" class="form-control" name="dateOfBloodCollection" value="<%=laboratoryProfile.getString("dateOfBloodCollection")%>"/>
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
                            <input type="text" class="form-control" name="hemoglobin" value="<%=hematology.getDouble("hemoglobin")%>"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Hematocrit (%)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="hematocrit" value="<%=hematology.getDouble("hematocrit")%>"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">White blood cells (x10 ^9/L)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="whiteBloodCells" value="<%=hematology.getDouble("whiteBloodCells")%>"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Neutrophils (%)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="neutrophils" value="<%=hematology.getDouble("neutrophils")%>"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Lymphocytes (%)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="lymphocytes" value="<%=hematology.getDouble("lymphocytes")%>"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Monocytes (%)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="monocytes" value="<%=hematology.getDouble("monocytes")%>"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Eosinophils (%)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="eosinophils" value="<%=hematology.getDouble("eosinophils")%>"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Basophils (%)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="basophils" value="<%=hematology.getDouble("basophils")%>"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Myelocytes (%)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="myelocytes" value="<%=hematology.getDouble("myelocytes")%>"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Metamyelocytes (%)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="metamyelocytes" value="<%=hematology.getDouble("metamyelocytes")%>"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Blasts (%)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="blasts" value="<%=hematology.getDouble("blasts")%>"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Platelet count (x 10^9/L)</label>
                          <div class="col-lg-4">
                            <input type="text" class="form-control" name="plateletCount" value="<%=hematology.getDouble("plateletCount")%>"/>
                          </div>
                        </div>
                        <!-- End of Labels -->

                        <!-- Other Lab -->
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
                            <div class="col-lg-4">
                              <input type="text" class="form-control" name="creatinine" value="<%=bloodChemistry.getDouble("creatinine")%>"/>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-sm-4">Uric acid (mg/dl)</label>
                            <div class="col-lg-4">
                              <input type="text" class="form-control" name="uricAcid" value="<%=bloodChemistry.getDouble("uricAcid")%>"/>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-sm-4">Na (meg/L)</label>
                            <div class="col-lg-4">
                              <input type="text" class="form-control" name="na"  value="<%=bloodChemistry.getDouble("na")%>"/>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-sm-4">K (me/dl)</label>
                            <div class="col-lg-4">
                              <input type="text" class="form-control" name="k"  value="<%=bloodChemistry.getDouble("k")%>"/>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-sm-4">SGOT (U/L)</label>
                            <div class="col-lg-4">
                              <input type="text" class="form-control" name="sgot"  value="<%=bloodChemistry.getDouble("sgot")%>"/>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-sm-4">SGPT (U/L)</label>
                            <div class="col-lg-4">
                              <input type="text" class="form-control" name="sgpt"  value="<%=bloodChemistry.getDouble("sgpt")%>"/>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="control-label col-sm-4">LDH (U/L)</label>
                            <div class="col-lg-4">
                              <input type="text" class="form-control" name="ldh"  value="<%=bloodChemistry.getDouble("ldh")%>"/>
                            </div>
                          </div>
                          <!-- End of fields -->

                        <!-- Imaging Studies -->
                        <div class="form-group">
                          <label class="control-label col-sm-4">Imaging Studies</label>
                          <div class="col-sm-8">
                            <div class="radio">
                              <label><input type="radio" name="imagingStudies" value="1">Yes</label>
                            </div>
                            <div class="radio">
                              <label><input type="radio" name="imagingStudies" value="2">No</label>
                            </div>
                            <div class="radio">
                              <label><input type="radio" name="imagingStudies" value="3">Not Applicable</label>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Result</label>
                          <div class="col-lg-5">
                            <input type="text" class="form-control" name="imagingStudiesResult" value="<%=imagingStudies.getString("results")%>"/>
                          </div>
                        </div>

                        <!-- Bone Marrow  -->
                        <div class="form-group">
                          <label class="control-label col-sm-4">Bone Marrow Aspirate and Biopsy result</label>
                          <div class="col-sm-8">
                            <div class="radio">
                              <label><input type="radio" name="boneMarrowAspirate" value="1">Yes</label>
                            </div>
                            <div class="radio">
                              <label><input type="radio" name="boneMarrowAspirate" value="2">No</label>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4">Date Performed</label>
                          <div class="col-lg-8">
                            <input type="date" class="form-control" name="boneMarrowAspirateDatePerformed" value="<%=boneMarrowAspirate.getString("datePerformed")%>"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-lg-4">Description</label>
                          <div class="col-sm-8">
                            <input type="text" class="form-control" name="boneMarrowAspirateDescription" value="<%=boneMarrowAspirate.getString("result")%>"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-lg-4">Attach scanned document</label>
                          <div class="col-sm-8">
                            <input type="file" class="form-control" name="attachScannedDocument"/>
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
                              <label><input type="radio" name="flowCytometry" value="2">No</label>
                            </div>
                            <div class="radio">
                              <label><input type="radio" name="flowCytometry" value="3">Not Applicable</label>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-lg-4">Result</label>
                          <div class="col-sm-8">
                            <input type="text" class="form-control" name="flowCytometryResult" value="<%=flowCytometry.getString("result")%>"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-lg-4">Attach scanned document</label>
                          <div class="col-sm-8">
                            <input type="file" class="form-control" name="flowCytometryAttachScannedDocument"/>
                          </div>
                        </div>

                        <!-- Cytogenetic and Molecular Analysis -->
                        <div class="form-group">
                          <label class="control-label col-sm-4">Cytogenetic and Molecular Analysis</label>
                          <div class="col-sm-8">
                            <div class="radio">
                              <label><input type="radio" name="cytogeneticAndMolecularAnalysis" value="1">Yes</label>
                            </div>
                            <div class="radio">
                              <label><input type="radio" name="cytogeneticAndMolecularAnalysis" value="2">Not Done</label>
                            </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-lg-4">Result</label>
                          <div class="col-sm-8">
                            <input type="text" class="form-control" name="cytogeneticAndMolecularAnalysisResult" value="<%=cytogeneticAndMolecularAnalysis.getString("result")%>"/>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-lg-4">Attach scanned document</label>
                          <div class="col-sm-8">
                            <input type="file" class="form-control" name="cytogeneticAndMolecularAnalysisAttachScannedDocument"/>
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

                      <!-- Treatment -->
                      <div class="form-group">
                        <label for="severity" class="control-label col-sm-4">Mode of Treatment</label>
                        <div class="col-sm-8">
                          <select class="form-control" name="treatment">
                            <option selected="selected" disabled="disabled">Select</option>
                            <option value="5">Pharmacologic 1st line</option>
                            <option value="6">Pharmacologic 2nd line/Salvage</option>
                            <option value="7">Supportive/Palliative Only</option>
                            <option value="10">Watch and Wait</option>
                            <option value="11">Others</option>
                          </select>
                        </div>
                      </div>

                      <!-- Regimen/Protocol -->
                      <div class="form-group">
                        <label class="control-label col-lg-4">Regimen/Protocol</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="regimenProtocol"/>
                        </div>
                      </div>

                      <!-- Medications -->
                      <div class="form-group">
                        <label class="control-label col-lg-4">Chemotherapy Medications</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="chemotherapyMedications"/>
                        </div>
                      </div>

                      <!-- Cycle Number -->
                      <div class="form-group">
                        <label class="control-label col-lg-4">Cycle Number</label>
                        <div class="col-sm-8">
                          <input type="text" class="form-control" name="cycleNumber" value="<%=therapyAndResponse.getInt("cycleNumber")%>"/>
                        </div>
                      </div>

                      <!-- Date Started -->
                      <div class="form-group">
                        <label class="control-label col-sm-4">Date Started</label>
                        <div class="col-lg-8">
                          <input type="date" class="form-control" name="dateStarted" value="<%=therapyAndResponse.getString("dateStarted")%>"/>
                        </div>
                      </div>

                      <!-- Disease Status -->
                      <div class="form-group">
                        <label class="control-label col-lg-4">Disease Status</label>
                        <div class="col-lg-8">
                          <select class="form-control" name="diseaseStatus">
                            <option selected="selected" disabled="disabled">Select</option>
                            <option value="Relapsed">Relapsed<option>
                            <option value="Refractory Disease">Refractory Disease<option>
                            <option value="CR (Complete Remission)">CR (Complete Remission)<option>
                            <option value="nCR (near CR)">nCR (near CR)<option>
                            <option value="PR (Partial Response)">PR (Partial Response)<option>
                            <option value="PD (Progressive Disease)">PD (Progressive Disease)<option>
                            <option value="SD Stable Disease)">SD Stable Disease)<option>
                            <option value="Complete Hematologic response">Complete Hematologic response<option>
                            <option value="Complete Cytogenetic Response">Complete Cytogenetic Response<option>
                            <option value="Major Molecular Response">Major Molecular Response<option>
                            <option value="Spleen response">Spleen response<option>
                            <option value="Symptom response">Symptom response<option>
                            <option value="Dead">Dead<option>
                            <option value="Others">Others<option>
                          </select>
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