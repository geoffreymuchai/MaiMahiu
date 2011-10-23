<html>
    <head>
        <title>VoiceH20</title>
        <meta name="layout" content="styled" />
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">
              // Load the Visualization API and the piechart package.
          google.load('visualization', '1.0', {'packages':['corechart', 'geomap']});

// Set a callback to run when the Google Visualization API is loaded.
              google.setOnLoadCallback(drawVizualization);

              function drawVizualization() {
                  drawChart();
                  drawMap();
              }
              // Callback that creates and populates a data table,
              // instantiates the pie chart, passes in the data and
              // draws it.
              function drawChart() {

                  // Create the data table.
                  var data = new google.visualization.DataTable();
                  data.addColumn('string', 'Complaint Type');
                  data.addColumn('number', 'Number');

                  var rows = [];
                  <g:each in="${resultsInstance}" var="result">
                      rows[rows.length] = ['${result[0]}', ${result[1]}];
                  </g:each>

                  data.addRows(rows);

                  // Set chart options
                  var options = {'title':'Complaints lodged by Type',
                                 'width':400,
                                 'height':300};

                  // Instantiate and draw our chart, passing in some options.
                  var chart = new google.visualization.PieChart(document.getElementById('issues-chart'));
                  chart.draw(data, options);
              }

                function drawMap() {
                      var data = new google.visualization.DataTable();
                      data.addRows(6);
                      data.addColumn('string', 'Country');
                      data.addColumn('number', 'Number Of Complaints');
//                      data.setValue(0, 0, 'Nairobi');
//                      data.setValue(0, 1, 200);
//                      data.setValue(1, 0, 'Mombasa');
//                      data.setValue(1, 1, 300);
//                      data.setValue(2, 0, 'Kisumu');
//                      data.setValue(2, 1, 400);
//                      data.setValue(3, 0, 'Moyale');
//                      data.setValue(3, 1, 500);
//                      data.setValue(4, 0, 'Kajiado');
//                      data.setValue(4, 1, 600);
//                      data.setValue(5, 0, 'Kakamega');
//                      data.setValue(5, 1, 700);

                        var idx = 0;
                        <g:each in="${geoResults}" status="i" var="result">
                            data.setValue(${i}, 0, "${result.location}");
                            data.setValue(${i}, 1, ${result.issues});
                        </g:each>

                      var options = {};
                      options['dataMode'] = 'markers';
                      options['region'] = 'KE';
                      options['title'] = 'Complaints by Region';

                      var container = document.getElementById('geo-chart');
                      var geomap = new google.visualization.GeoMap(container);
                      geomap.draw(data, options);
                  };
        </script>
    </head>
    <body>
    <div>

            <!-- Column I. -->
          <div style="float:right;">


            %{--<div class="col-more"><a href="#"><img src="design/cols3-more.gif" alt="" /></a></div>--}%
                <h5>Complaints by Region</h5>
                <div id="geo-chart" style="width:300; height:300">

                </div>
            </div> <!-- /col -->

            %{--<hr class="noscreen" />--}%

            <!-- Column II. -->
            <div style="float:left;">


                %{--<div class="col-more"><a href="#"><img src="design/cols3-more.gif" alt="" /></a></div>--}%

                <div id="issues-chart" style="width:300; height:300">

                </div>

            </div> <!-- /col -->

            <hr class="noscreen" />
        </div>

    </body>
</html>
