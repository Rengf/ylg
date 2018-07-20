$(document).ready(function() {
    $('.phone').click(function() {
        $('.addPhone').css("display", "block")
        $('.addComputer').css("display", "none")
        $('.addCamera').css("display", "none")
    })
    $('.computer').click(function() {
        $('.addComputer').css("display", "block")
        $('.addPhone').css("display", "none")
        $('.addCamera').css("display", "none")
    })
    $('.camera').click(function() {
        $('.addCamera').css("display", "block")
        $('.addComputer').css("display", "none")
        $('.addPhone').css("display", "none")
    })

    // 添加手机
    $('.addPhoneSure').click(function() {
            var PID = $('#PID').val();
            var result = $('input').map(function() {
                return $(this).val()
            }).get();
            $.ajax({
                url: 'phone/save.do',
                type: 'post',
                dataType: 'json',
                data: {
                	PID: PID,
                    goods_id: '1',
                    PName: result[2],
                    PPrice: result[3],
                    PPictureBig: result[4],
                    PPictureShiPai: result[5],
                    PBrand: result[6],
                    PKeys: result[7],
                    PBattery: result[8],
                    PSellTime: result[9],
                    PFCharge: result[10],
                    POS: result[11],
                    PSize: result[12],
                    PRam: result[13],
                    PRom: result[14],
                    PCPU: result[15],
                    PHPixel: result[16],
                    PBPixel: result[17],
                    PColour: result[18],
                    PNFC: result[19],
                    PBT: result[20],
                    PEarport: result[21],
                    PCport: result[22],
                    PZhiwen: result[23],
                    PGPS: result[24],
                    PDZLP: result[25],
                    PTLY: result[26],
                    PList: result[27],
                    PStock: result[28],
                    P3DTouch: result[29],
                    PNet: result[30],
                    SIM: result[31]

                },
                success: function() {
                    alert("添加成功");
                },
                error: function() {
                    alert('添加失败')
                }
            });
        })
        //添加电脑
    $('.addComputerSure').click(function() {
    	var COID = $('#COID').val();
        var result = $('input').map(function() {
            return $(this).val()
        }).get();
        $.ajax({
            url: 'computer/save.do',
            type: 'post',
            dataType: 'json',
            data: {
            	CID:COID,
            	goods_id:2,
            	CName:result[33],
            	CText:result[34],
            	CBrand:result[35],
            	CColour:result[36],
            	CSize:result[37],
            	CPBase:result[38],
            	CPShi:result[39],
            	CSellTime:result[40],
            	CPrice:result[41],
            	CCPU:result[42],
            	CCPUSpeed:result[43],
            	CVCard:result[44],
            	CFenbian:result[45],
            	COS:result[46],
            	CBType:result[47],
            	CMemoryCapacity:result[48],
            	CHDCapacity:result[49],
            	CXiancun:result[50],
            	CBattery:result[51],
            	CBaoxiu:result[52],
            	CD_ROM:result[53],
            	CSolidSDisk:result[54],
            	CSType:result[55],
            	CPort:result[56],
            	CAudio:result[57],
            	CPlist:result[58],
            	CWeight:result[59],
            	CStock:result[60]

            },
            success: function() {
                alert("添加成功");
            },
            error: function() {
                alert('添加失败')
            }
        });
    })
    
    //添加相机
    $('.addCameraSure').click(function() {
    	var CaID= $('#Cdid').val();
        var result = $('input').map(function() {
            return $(this).val()
        }).get();
        console.log(result.length);
        $.ajax({
            url: 'camera/save.do',
            type: 'post',
            dataType: 'json',
            data: {
            	CaID:CaID,
            	goods_id:3,
            	CaName:result[62],
            	CaPrice:result[63],
            	CaPicture:result[64],
            	CaProduce:result[65],
            	CaSLRLevel:result[66],
            	CaSize:result[67],
            	CaPixel:result[68],
            	CaStorageM:result[69],
            	CaWeatherStable:result[70],
            	CaBrand:result[71],
            	CaTimeToMarket:result[72],
            	CaSummary:result[73],
            	CaLenMount:result[74],
            	CaSType:result[75],
            	CaPort:result[76],
            	CaBT:result[77],
            	CaList:result[78],
            	CaStock:result[79],
            	CaSpeed:result[80],
            	CaKeys:result[81]

            },
            success: function() {
                alert("添加成功");
            },
            error: function() {
                alert('添加失败')
            }
        });
    })
})