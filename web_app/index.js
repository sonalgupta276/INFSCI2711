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


$.ajax({
    url : 'http://localhost:3000/getAttackTarget',
    type : 'GET',
    data : {
    },
    dataType:'json',
    success : function(data) {      
        buildGraph4(data)
    },
    error : function(request,error)
    {
        alert("Request: "+JSON.stringify(request));
    }
});


$.ajax({
    url : 'http://localhost:3000/getYearWiseAttack',
    type : 'GET',
    data : {
    },
    dataType:'json',
    success : function(data) {      
        buildGraph5(data)
    },
    error : function(request,error)
    {
        alert("Request: "+JSON.stringify(request));
    }
});


$.ajax({
    url : 'http://localhost:3000/getterrorGroups',
    type : 'GET',
    data : {
    },
    dataType:'json',
    success : function(data) {      
        console.log(data)        
        buildGraph3(data.groups, data.casualities)
    },
    error : function(request,error)
    {
        alert("Request: "+JSON.stringify(request));
    }
});


$.ajax({
    url : 'http://localhost:3000/getRegionAttacks',
    type : 'GET',
    data : {
    },
    dataType:'json',
    success : function(data) {      
        buildGraph2(data)
    },
    error : function(request,error)
    {
        alert("Request: "+JSON.stringify(request));
    }
});






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


function buildGraph3(groups, casualities){
    Highcharts.chart('container3', {
        chart: {
            type: 'column',
            options3d: {
                enabled: true,
                alpha: 10,
                beta: 25,
                depth: 80
            }
        },
        title: {
            text: 'Top 10 Terror Groups'
        },
        subtitle: {
            text: ''
        },
        plotOptions: {
            column: {
                depth: 30
            },
            series: {
                dataLabels: {
                    enabled: true
                }
            }
        },
        xAxis: {
            categories: groups,
    
            labels: {
                skew3d: true,
                autoRotationLimit: 40,
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

function buildGraph2(data){
Highcharts.chart('container2', {
    chart: {
        type: 'column'
    },
    title: {
        text: 'No. of Casualities in different Regions Based on Attack Type'
    },
    subtitle: {
        text: ''
    },
    xAxis: {
        categories:  data.regions,
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
            '<td style="padding:0"><b>{point.y:.0f} </b></td></tr>',
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
        data: data.armedAssault

    }, {
        name: 'Assassination',
        data: data.assassination
    }, {
        name: 'Bombing/Explosion',
        data: data.bombing

    }, {
        name: 'Facility/Infrastructure Attack',
        data: data.facInfraAttack

    }, {
        name: 'Hijacking',
        data: data.hijacking

    }, {
        name: 'Hostage Taking (Barricade Incident)',
        data: data.hostBarricade

    }, {
        name: 'Hostage Taking (Kidnapping)',
        data: data.hostKid
    }, {
        name: 'Unarmed Assault',
        data: data.unarmedAssault

    }]
});
}

function buildGraph4(data){
    Highcharts.chart('container4', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'No. of Casualities Based on Attack and Target Type'
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            categories: data.targets,
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
                '<td style="padding:0"><b>{point.y:.0f} </b></td></tr>',
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
            data: data.armedAssault
    
        }, {
            name: 'Assassination',
            data: data.assassination
        }, {
            name: 'Bombing/Explosion',
            data: data.bombing
    
        }, {
            name: 'Facility/Infrastructure Attack',
            data: data.facInfraAttack
    
        }, {
            name: 'Hijacking',
            data: data.hijacking
    
        }, {
            name: 'Hostage Taking (Barricade Incident)',
            data: data.hostBarricade
    
        }, {
            name: 'Hostage Taking (Kidnapping)',
            data: data.hostKid
        }, {
            name: 'Unarmed Assault',
            data: data.unarmedAssault
    
        }]
    });
}


function buildGraph5(data){
    Highcharts.chart('container5', {
        chart: {
            type: 'line'
        },
        title: {
            text: 'Trend of Number of Casualities Based on Region over Years'
        },
        subtitle: {
            text: ''
        },
        xAxis: {
            categories: data.year,
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
                '<td style="padding:0"><b>{point.y:.0f} </b></td></tr>',
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
            name: 'Australasia & Oceania',
            data: data.australia
    
        }, {
            name: 'Central America & Caribbean',
            data: data.centralAmerica
        }, {
            name: 'East Asia',
            data: data.eastAsia
    
        }, {
            name: 'Eastern Europe',
            data: data.eEurope
    
        }, {
            name: 'Middle East & North Africa',
            data: data.meNAfrica
    
        }, {
            name: 'North America',
            data: data.nAmerica
    
        }, {
            name: 'South America',
            data: data.sAmerica
        }, {
            name: 'South Asia',
            data: data.sAsia
    
        }, {
            name: 'Southeast Asia',
            data: data.sEastAsia
    
        }, {
            name: 'Sub-Saharan Africa',
            data: data.subSaAfrica 
    
        }, {
            name: 'Western Europe',
            data: data.westEurope
    
        }]
    });
}