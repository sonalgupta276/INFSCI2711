$.ajax({
    url : 'http://localhost:3000/demo',
    type : 'GET',
    data : {
    },
    dataType:'json',
    success : function(data) {      
        console.log(data)        
        buildGraph(data.regions, data.casualities)
    },
    error : function(request,error)
    {
        alert("Request: "+JSON.stringify(request));
    }
});

// $.get("http://localhost:3000/demo").done(function (data) {
//     console.log(data);
// });





function buildGraph(regions, casualities){
Highcharts.chart('container', {
    chart: {
        type: 'column',
        options3d: {
            enabled: true,
            alpha: 10,
            beta: 25,
            depth: 70
        }
    },
    title: {
        text: 'Number of Casualities in different Regions'
    },
    subtitle: {
        text: ''
    },
    plotOptions: {
        column: {
            depth: 25
        },
        series: {
            dataLabels: {
                enabled: true
            }
        }
    },
    xAxis: {
        categories: regions,

        labels: {
            skew3d: true,
            style: {
                fontSize: '10px'
            }
        }
    },
    yAxis: {
        title: {
            text: 'No. of Casualities'
        }
    },
    series: [{
        name: 'No. of Casualities',
        data: casualities
    }]
});
}




Highcharts.chart('container2', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'No. of Casualities in different attacks and regions'
    },
    subtitle: {
        text: ''
    },
    xAxis: {
        categories: ['Australia and Oceania', 'Central America and Carribean', 'Central Asia', 'East Asia', 'Eastern Europe',  'Middle East & North Africa', 'North America',  'South America', 'South Asia', 'Southeast Asia', 'Sub-Saharan Africa',  'Western Europe'],
        crosshair: true
    },
    yAxis: {
        min: 0,
        title: {
            text: 'No. of Casualities'
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true
    },
    plotOptions: {
        column: {
            pointPadding: 0.2,
            borderWidth: 0
        }
    },
    series: [{
        name: 'Armed Assault',
        data: [24, 113, 37, 33, 104, 225, 36, 128, 111, 93, 367, 148]

    }, {
        name: 'Assassination',
        data: [15, 82, 30, 28, 76, 187, 27, 97, 87, 51, 205, 136]
    }, {
        name: 'Bombing/Explosion',
        data: [28, 131, 56, 44, 209, 279, 48, 150, 123, 116, 356, 245]

    }, {
        name: 'Facility/Infrastructure Attack',
        data: [26, 64, 16, 33, 82, 164, 37, 95, 94, 65, 203, 179]

    }, {
        name: 'Hijacking',
        data: [3, 13, 7, 5, 10, 61, 7, 25, 32, 25, 60, 29]

    }, {
        name: 'Hostage Taking (Barricade Incident)',
        data: [5, 31, 3, 3, 14, 62, 14, 48, 42, 24, 64, 50]

    }, {
        name: 'Hostage Taking (Kidnapping)',
        data: [8, 69, 20, 10, 41, 150, 22, 95, 89, 67, 255, 61]
    }, {
        name: 'Unarmed Assault',
        data: [7, 13, 5, 19, 37, 57, 33, 24, 49, 14, 43, 56]

    }, {
        name: 'Unknown',
        data: [9, 60, 12, 20, 32, 136, 14, 80, 83, 50, 208, 91]

    }]
});