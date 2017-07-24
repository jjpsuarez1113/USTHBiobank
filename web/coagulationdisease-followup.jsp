<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:useBean id="coagulationPatientsList" type="java.sql.ResultSet" scope="request"/>
<jsp:useBean id="patientInfo" type="java.sql.ResultSet" scope="request"/>

<%patientInfo.first();%>
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
                <a href="getcoagulationpatientservlet.html?patientId=<%=patientInfo.getInt("patientId")%>" type="button" class="btn bg-yellow">Baseline</a>
                <a href="coagulationdisease-followup.html?patientId=<%=patientInfo.getInt("patientId")%>" type="button" class="btn bg-yellow">Follow Up</a>
              </div>
            </div>
            <!-- End of Buttons Container -->

            <!-- Forms -->
            <form action="AddCoagulationFollowUpServlet" method="post">
            <div class="row">

              <!-- Visit -->
              <div class="col-sm-3">

                <!-- Visit Tab -->
                <ul class="nav nav-tabs">
                  <li class="active"><a data-toggle="tab" href="#Visit">Visits</a></li>
                </ul>
                <!-- End of Visit Tab -->

                <!-- Visit Tab Content -->
                <div class="tab-content">
                  <div class="visit">
                    <ul>
                      <a href="#"><li>02-24-2017</li></a>
                      <a href="#"><li>02-24-2017</li></a>
                      <a href="#"><li>02-24-2017</li></a>
                      <a href="#"><li>02-24-2017</li></a>
                      <a href="#"><li>02-24-2017</li></a>
                    </ul>
                  </div>
                </div>
                <!-- End of Visit Tab Content -->
              </div>
              <!-- End of Visit -->

              <!-- Follow Up -->
              <div class="col-sm-9">

                <!-- Follow Up Navtabs-->
                <ul class="nav nav-tabs">
                  <li class="active"><a data-toggle="tab" href="#medicalEvents">Medical Events</a></li>
                </ul>
                <!-- End of Follow Up Navtabs -->

                <!-- Follow Up Tab Content -->
                <div class="tab-content">

                  <!-- Medical Events -->
                  <div id="medicalEvents" class="tab-pane fade in active">

                    <!-- Form -->
                    <div class="form-horizontal">

                      <!-- Date of Entry -->
                      <div class="form-group">
                        <label class="control-label col-sm-6">Date of Entry</label>
                        <div class="col-sm-6">
                          <input type="date" class="form-control" name="dateOfEntry">
                        </div>
                      </div>

                      <!-- Date of Visit -->
                      <div class="form-group">
                        <label class="control-label col-sm-6">Date of Visit</label>
                        <div class="col-sm-6">
                          <input type="date" class="form-control" name="dateOfVisit">
                        </div>
                      </div>

                      <!-- Questions -->
                      <br/>
                      <div class="form-group">
                        <label class="control-label col-sm-6">Did the patient self-administered factor concentrates at home from last visit?</label>
                        <div class="col-sm-6">
                          <div class="radio">
                            <label><input type="radio" name="">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="">No</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-6">Specify Reason</label>
                        <div class="col-sm-6">
                          <input type="text" class="form-control" name="specifyReason">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-6">Dates of Administration</label>
                        <div class="col-sm-6">
                          <input type="text" class="form-control" name="datesOfAdministration">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-6">Dose of Factor Concentrate</label>
                        <div class="col-sm-6">
                          <input type="text" class="form-control" name="doseOfFactorConcentrate">
                        </div>
                      </div>

                      <br/>
                      <div class="form-group">
                        <label class="control-label col-sm-6">Did the patient undergo any procedure or intervention?</label>
                        <div class="col-sm-6">
                          <div class="radio">
                            <label><input type="radio" name="">Yes</label>
                          </div>
                          <div class="radio">
                            <label><input type="radio" name="">No</label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-sm-6">Result</label>
                        <div class="col-sm-6">
                          <input type="text" class="form-control" name="specify">
                        </div>
                      </div>

                      <br/>
                      <div class="form-group">
                        <label class="control-label col-sm-6">Special Notes</label>
                        <div class="col-sm-6">
                          <input type="text" class="form-control" name="specialNotes">
                        </div>
                      </div>

                    </div>

                  </div>
                  <!-- End of Medical Events -->

                </div>
                <!-- End of Follow Up Tab Content -->

              <input type="submit" class="btn bg-yellow col-sm-4 pull-right">
              </div>
              <!-- End of Follow Up -->

            </div>
            </form>
            <!-- End of Forms -->
            
      </main>
          <!-- End of Main Content -->

    </div>
    <!-- End of main container -->
    
  </body>
</html>