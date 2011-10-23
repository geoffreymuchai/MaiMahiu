<html>
    <head>
        <title>VoiceH20</title>
        <meta name="layout" content="styled" />
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">
              // Load the Visualization API and the piechart package.
          google.load('visualization', '1.0', {'packages':['corechart']});

// Set a callback to run when the Google Visualization API is loaded.
              google.setOnLoadCallback(drawChart);


              // Callback that creates and populates a data table,
              // instantiates the pie chart, passes in the data and
              // draws it.
              function drawChart() {

              // Create the data table.
              var data = new google.visualization.DataTable();
//              data.addColumn('string', 'Topping');
//              data.addColumn('number', 'Slices');
//              data.addRows([
//                ['Mushrooms', 3],
//                ['Onions', 1],
//                ['Olives', 1],
//                ['Zucchini', 1],
//                ['Pepperoni', 2]
//              ]);
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
        </script>
    </head>
    <body>
    <div id="cols3" class="box">

            <!-- Column I. -->
          <div class="col">


            <div class="col-more"><a href="#"><img src="design/cols3-more.gif" alt="" /></a></div>

            </div> <!-- /col -->

            <hr class="noscreen" />

            <!-- Column II. -->
            <div class="col">


                %{--<div class="col-more"><a href="#"><img src="design/cols3-more.gif" alt="" /></a></div>--}%

                <div id="issues-chart" style="width:400; height:300">

                </div>

            </div> <!-- /col -->

            <hr class="noscreen" />
        </div>

    </body>
</html>
