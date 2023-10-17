job "deploy-relay-registry-stage" {
    datacenters = ["ator-fin"]
    type = "batch"

    reschedule {
        attempts = 0
    }

    task "deploy-relay-registry-task" {
        driver = "docker"

        config {
            network_mode = "host"
            image = "ghcr.io/ator-development/smart-contracts:0.1.24"
            entrypoint = ["npm"]
            command = "run"
            args = ["deploy"]
            volumes = [
                "local/relay-registry-init-state.json:/usr/src/app/smartweave/dist/contracts/relay-registry-init-state.json"
            ]
        }

        vault {
            policies = ["relay-registry-stage"]
        }

        template {
            data = <<EOH
            {{with secret "kv/relay-registry/stage"}}
                DEPLOYER_PRIVATE_KEY="{{.Data.data.RELAY_REGISTRY_OWNER_KEY}}"
                CONSUL_TOKEN="{{.Data.data.CONSUL_TOKEN}}"
            {{end}}
            EOH
            destination = "secrets/file.env"
            env         = true
        }

        template {
            data = <<EOH
            {{with secret "kv/relay-registry/stage"}}
{
    "claimable":{},
    "owner":"{{.Data.data.RELAY_REGISTRY_OWNER_ADDRESS}}",
    "verified":{
"05532D97C632B62DF89E783BBF0A02BB2A192179":"0x8343541e84d3994DCfE77fcFf779E96E58E23e5F",
"065624A930062AB264E96CD524BD9F5BAD339BA8":"0xE2f4b4106C227613DAf4116881811c1745d2cd0f",
"082A9668B82BC67DAB81819F5B1C9F5A48049FB3":"0x7b24318F2E4E2a4F68d2c03C020f399f7c92011c",
"094F7556A5F07F5662C9E4EFA6CD9D41A2D5B29F":"0xa4B70e53F4868A18d9a386e01918039CccCB5b98",
"09DC138DAEDD1CC461950E9FAA7779586E429974":"0x4e6585c9553842C448C5B9a6F2907E3AC2e87239",
"0B4A2A488E2B5772A1FB96638C7FAA7F790117B2":"0x6093B4B8C11EBDa4763f06D988eBC160a4DcD683",
"0B72FE559B08D65B9ED64936EB52D28DD2C12B4D":"0x98Ed3B4B81AC60F8f23F47811BA52d0a3de7F081",
"0C7C783A1B8CA59C6E7336F0CA3686DC20E7C8DC":"0xdB13f6F9BccF5ac30378Ea6DfBCA45eec35AfA33",
"0DE9BB713F628E5AAC0300B7C4CD5365589B4DFC":"0x79B4E22F291d18116B70199C62A8c360ad248c93",
"1119479099A2CB33CEF47DE40986ED79D8BC9065":"0x7f34907d02CC0CCd334ee76044da10e7388FDc53",
"123B0957B74759A3AF6524E257E29D3708109B1B":"0x7E0781f0e035a16F5F3cf833d99D69E1e0036039",
"16C5FBF55A56D9CEF98E94930BE5F23C45E5C6EA":"0xC4e1d4CDf842c19503280dA5db7A4C3761305f88",
"17DA905ADD643D74A2213229C2DDD65C5DEAD8AE":"0x3941578e47Bcb7AC5f006488De8D0CA8461bB0b5",
"192329D17E32F62C9C79D7386AC5B9890FDC9D0C":"0x9Cb10817CAe852C45D8D602097a76a932f6185E6",
"1A82EB4EB4768102F706FD2A6ED466D068CE3F9E":"0x54a1354F615D464F7739d515598DB4e6315Ddc4B",
"1B64F0AF1F1D84D0153EA7D445249CCB6F1E11DE":"0xe328D2460EFD9F0F887F09A82a2aeBb457fdbDe5",
"1CBB8CF10565C007861B66B5764FD88DF6F850BB":"0xb2A35680dB7dAe518b058213B629d7a8658163b9",
"1CC8501EF03C3006A9DA76BA0D15ECC7FA8C34E8":"0x9aDE33Cf4ca08E46c7f84f82A82FCF5d8A4adA55",
"1E9582E86DA4469541A572EBBAD731A391EB61EC":"0x0e8D6c66CF65Ff3553B5cfFF7F937E51CEAea1D4",
"20BA368772D88F21B9B10BA598068DBF719D6C44":"0xD9B42068EFa61f19eF4E02CbC6Ec0C54b4e3f479",
"220BB45F6720C30BD11CCA35E63194360F412256":"0x7Add71Ad0477D36F45f849b7a81c7d2Ba4543cfF",
"25280148FEF4E800FD179082D9E23276C7199E9D":"0xa2AA87bE9FaaE25F1aC6E6846eC9589b03625ce0",
"25EDE81A1550F7072636C6A9D1485F75A9C60458":"0xf2948eDD428305D28DcBd6C284470e3823ee182b",
"284C217B14811520C0586CFACEAA984ADA6C1F88":"0x172253954c395832a9e264FbD8f248221d4a92B6",
"2A58523BA6DEFD0D4640499874EECEADF9AC49CE":"0x6d525E918432c486618E3eb106703acECC795a43",
"2BBD14694BD7FBDCB3F5C7A79526CE687FBC3F92":"0xdA0955B495f3F181c282f5D1b05168706EaF0455",
"2CAC5BA69A56809C6F6D71A34929B2FF8C35CA9B":"0xDD3A2390CeFa80c1eCF5771636A4F49F2B8956C8",
"2FFD767BABE25856580BE057FD7708F9D2E1C479":"0xFA579D17a320AA2B226aD068B5597aaFd493a56d",
"306463A7CB9A07FB0AF0809A356BEB7A2F52183C":"0xF3117E9F6115289CBE3E408e55c33F5d987250dF",
"312B484FCD2BFADDA2E12F88B0249D30AF92AFAC":"0x94AcDF394C14232aca203b4D1f1854Bc40582878",
"331EDCF3B51D31160958689706E983D6293F9A73":"0x448Cc1ca7b315a465bB9e20f8e49E0062f4BD331",
"342066443F2AFA27F0E515DAFBCBD0510957F7F5":"0xc93473826F40100aE06E2E02F351C30c7f985bf7",
"36F9DF56CE9CC42466D7B6E5DAF22BEC40756B5C":"0x5dda24beBeD6031D08D8DF4B5Ae54b1e8FE88e6a",
"372FA2A17AD589982CC41F7BDA0EDFD5488B24D1":"0x8D03A395CD9E68409967e4957D6B85ADaF288687",
"393AB3EECB137E91DB3EE1A336B06A2B671CB383":"0x448Cc1ca7b315a465bB9e20f8e49E0062f4BD331",
"39433EE37BB67ED5207284FBD3A0E2681256E32F":"0x26f02066f0cec08F815F4144b95fA8E62C22c7f2",
"3AB8AD860A2BD006840C48E71455C4742EFB8A3C":"0xDf548c35DBA62A1B0A5FB1E365E2539935487408",
"3EDD864DC20CBF7CF971980696D08B082C93A33F":"0xdF60b603671bd2d2F014fd4e4d6a3657823Df567",
"405B3563D5393E24C3CAACF9E299A11AA8B0671E":"0x53731C988E8dD4013cDc0D848Fd18f565141B400",
"40970B5B9C3FA1CE3293BD4826256CF488865B39":"0x9E18437AD074B1cf1B72C50fD7e060d7Df71915B",
"414B00316959CF5478DF551A64E9A21BAEFF47E1":"0x9D0caC8351BD51D5BC537bD62c0410a8DBc78B74",
"41DC8255F0EAB3E34265B243C177CA1E84947065":"0x653aC1ED2E637a4f1cc61Ff5F039a8d806D3e272",
"42449D01D4052169541A3315F18179EAB8F923A9":"0x3ceb890224dAaB095745d3fa18e17F83699705ad",
"43F6A8A19EBA132A6831EC284E4910FAC0D3E8A0":"0x4A84876a30B9e0cb3f75a5F69FF282649Dab05a4",
"4423B4748F312C60A04B0B89D6A7E03634521BB7":"0xFF391FEB9094EE5454eB73e0B3785D59730668f1",
"472675903E7266492985C8F2331DFE91D5064904":"0x4f485910CC79F27D85591b65e42d890136F3fdE3",
"4AE8B398D5C2C1F4AED80AF99F519F8274295798":"0x586bAB70B10d50Dd1aF1C200E47e3a368B7bE3ce",
"4C78CA89BCE131F064FAC276B089FFE311F62E96":"0xE1Fe60B2cD9afC03FCFa1Ef7cA0B27F4E087e5bb",
"4E964214C20D2CBA0859EBB06514DBDBFD3A2F72":"0xe8Bdc142fd025da1D757f1991BC08799d9719C56",
"519262BF20AC9CF2753DED331C145BC6F315C7B5":"0x605782a5D874cB2B8b25B0D72CD111e468a0068b",
"51DA31A6EC1B33AA087BCE11B169178547BF470F":"0x54a1354F615D464F7739d515598DB4e6315Ddc4B",
"54790AF4A4EF9EBDE7D7DE834E09562B7A915156":"0x79B4E22F291d18116B70199C62A8c360ad248c93",
"56D16B8CF83778F1ABD1B2F144CA7BDC717C2AB7":"0x448Cc1ca7b315a465bB9e20f8e49E0062f4BD331",
"59D9D32B3F650CA02DFCA69DB64CC0EDD4973784":"0x6BdF570Bfa23469E050E4deb7154fea4f36c0eb8",
"5B10C41026A53B2F1E78542C2F0FF9B1FD4E2744":"0x772136cCDF6653499b9b49b877eEf048752D2ed4",
"5B765D3A887033AE487817090BF87C65B4536F6D":"0x0A393A0dFc3613eeD5Bd2A0A56d482351f4e3996",
"5B7B4594C2F098B128A6BB58F9A7411BD770F5B8":"0xCBb7352fa31681749a9DB14E14aE80f8AE9A4B3f",
"5CA07B48E4BD11F78DD5A795FA0ADBD382A85FB5":"0x3d1123CCd5E035d5009Abf16870e0877fdFA7e3E",
"5E3EC290182D744BE1A05580431E81400B1DC431":"0xF56AB9Af9c118C2A05b528927158Af2e216d7638",
"5F4B3CCFBF1CE7268DE704E817B6D887C8E84AA5":"0x79E85c7Aa3C289021048B598Be347e3F5CF1F3B7",
"60CCE755BD6B7410C70A16B4204D13A986437FDA":"0xa2AA87bE9FaaE25F1aC6E6846eC9589b03625ce0",
"6165EBEB3F76E843E8E568DD3C0E7EA97C99DCED":"0x1cfAda52854e07371D7212ce4a80751828594f6a",
"64AC588E781DD8598C189E2B3E4E656A3BA86C39":"0x06032e6a223c791DaADf89e4ACf5415eC7384a3B",
"69C5A55DBA5724290689644F42A8DC129503F5DF":"0xA8790E0f56AECa3B550A52E0f8dbD171718Cd3B2",
"6AAFCA940AF45837A312034ED84AADC081520DB1":"0x7Fa0963a8CB41d12C0bBa4286141dd71Ba158F44",
"6C3390A5D5B1FCB1F2C132DCEF8DDACEAB4C6CB1":"0x5FC599567CDdD85a04F2789BFED8602F8065ABAC",
"6D6A78A9DEB46FC4911FEEE3FD0384FB09225B10":"0x4ff2Edb4076830b3f6Aa538B09bCA861f63Eab29",
"6DB809941E8156AA78DBCB87C114B9C68CC79BE2":"0x8484D2156b0E9C6ea1D9c149579fE9738efb9118",
"6EFF5149ECC089638F5A3ECBDACACB31B0219E09":"0xf27dB164e0EAA0d0419D44323d1AA79e122988E3",
"6F230469A5D07CF24361A4546E709AE52C6EBE4F":"0xAbcd54201697adC79bD0d012E0Bb8bC4c9572eF9",
"70003522A2178F4FA21C55DAD1C8CF0345BA27DB":"0xd45d35bC22c19a9979184fC146108eaB0B6AD41c",
"70D1EB563BBB10F1EE62E537BB9F3BD7419EE11E":"0x4768acafFB3aCd3D8Ae4798d423088F8366Bd8Ca",
"710B72A4F80354C033792F813C9FC71BAFC2EAA1":"0xf0Ca6fE447d26489BfC712A41835BBC7dD69dED6",
"71994F7E2A7B740424DB4356BC1D50B748C26568":"0xFe1c9385784Db958057BCA11D8f59762Eb4d4D35",
"742622D69C66EF602367967F8E26847C66FC9308":"0x85Bd2dEE3233A1469E2217ee9520a39A2137d442",
"74D0083A550B009B4E5C91A2BB577236F0C7AF9B":"0xBbbB5ABEC6730e96Da0e7E91564E4090117c39Cd",
"74D8A5F71A0966C0097A37734EC65967D8854E4D":"0xfb4f7203fF6118E49F77DFEaeE7D1F9F3d3A4603",
"7588BD9451FAC3AFADE97B31C0C1DC017F9DB2C3":"0x4ED816a923c4D9CEF68002642b08120083E076FB",
"76FFB75E358D50868E5D5042AF77BDC38C39C45A":"0xDf548c35DBA62A1B0A5FB1E365E2539935487408",
"7914ACDDAF064384DF9D13DF6209C376005E10DB":"0x5B29f4E4918f5Dc436C8A12f807869aD063d0B3a",
"79D4CF6171A4C6D9A9EB9FFDEE037E89D0AE2EAA":"0x8aCE7EB84412bD73485518C3B5ECB8856931c0bB",
"7A3D6ECE5C38D65F9022FDBE8F36A7C794B3661E":"0xA0f166b408316C01c778Ea51A35991CbeD0630B2",
"7CAA543175753FB53BDD87C1048837B9157D82A8":"0x0f67593B4C7A9CF726208a840804185Da0Ba372A",
"7E52E9D36C6EF42F7A9F1B2B39B84CA24EA8E4D9":"0x1B64D3Bd427f36e2860716820ACE9D64CEE85547",
"7E87FACC9F2D502C5D92EC32B3A78F75232FF9F9":"0xa6458774ceD3af1A705b6466F01f5EbF8F1bd661",
"7F54724CB9E0567BC4A538556DF25A4FD6DC7F5E":"0xf2948eDD428305D28DcBd6C284470e3823ee182b",
"80091027A368B886658AA0A89A75FBDE0BF7A5BC":"0xCd5D478686c6fA5E47Fc457F16E04224cD012690",
"8039F20131CBDFB792BA9C9FC0D45018F8A0D3F0":"0x8e8644FAA2Bf53e3f854Ee472BF08B92CC6a7aa7",
"80F84367A3BBEC36B4BAC2D37BCE8086469F15B7":"0xCB0C27769f8DB5640E49F058b72E029047D8ef74",
"8129FD4C085A9F9BDEE1330BD32CE2B8B14DC8A2":"0x6c8C7a143792eDC723A2eA27B1c3f2235882189d",
"83931E18F087E8848E9E90A555F588ABFA7B7FFF":"0x981F118EdbD9e360863dFA283f05200804825b1A",
"8691B128DB758DA9D625648597B30D828C298AD1":"0xF955c822D7151Bf32362aF5cc8f3f283871D3465",
"86AFBAEAC67CFCCED2A21717BE09FC7D3D78E731":"0x4B1202F567155524264f1E26Eeb35617BC4fB0df",
"87B569D9DB1B812944CFBF41DE696B1E6A2F62DD":"0x778B01147C894C76909D9C889e8F9e0D55328FA9",
"893A110668CEE347DE6F54705A300488EBCF4B5A":"0x0a14181c3845c0C4eE574C2564B01affA400242F",
"8BA51CF4D3F3140592A14088CBE49CB4EE38A415":"0x8ce3456193Eabc7fa2Cd6f3660CA6eBf9f69E63b",
"8C6F44DF49DA4AB4BD254ED1CD2F391FA9BC66F8":"0x52285B51Fb4E0Ac159AC46aD12Ef792E02cD214d",
"8C9ADE699D1923728893A16657D8299EC3084992":"0x555eBA6E5A1A848DA4d1B04946B679A07BBdB3AC",
"8D543BCFCC18BF2189DE740D95F70B25EBA3BB0C":"0xDd29C85d9FDe419dcaF7cB3eCba603f1328eeF32",
"8E1A82EDB2CFE72E765C98F1FE810539F8B8FC1A":"0xe3e34172823cf2E7F03CC2474758A0A4aefa2506",
"8EADCF09FC8F816BB2C8F7F7B3D4CBDDF4C7DDFE":"0xBEd5edF3A75F1c132fd913006CD9840D288d2cA9",
"918CC33E7BE9685404288B05EB481BAA12528FD1":"0x7B507FbbA9FC5d03d41e18D63a4633f68bb93136",
"94C674BD456A41E48BB147E8F3C4A2A9462D7AD6":"0xaF044B784D6f7CB3D3d0938f568dE1F3E05E8145",
"9607723EA326414B57940E5695AC37F0956E8BC9":"0x9b38E17c23673471547d8b031e0EFebB666C985A",
"98D05C6209E88A45E55AE1A9BF983BF2906AF54E":"0x2eF461FdBEcc607d0b0cA27106C683a8F64468A4",
"990A2D419C4100954EA3E329DA39BBA6B866A74A":"0x5261b4A50F081b65b8f02C7e4388C2086B064236",
"99BFBEE8C437604EAD059B95D490FE4E2F9EE70C":"0x448Cc1ca7b315a465bB9e20f8e49E0062f4BD331",
"9AAF00DBD867A8312E54B2ADC4177B1707D25794":"0xa6458774ceD3af1A705b6466F01f5EbF8F1bd661",
"9BA30444BC2C42EAD4542E031904B0CDA677A366":"0x180401CaBa07a348FaA85E138d7B7BeD24d79775",
"9C8EFE139C445174069E6D2542ED884D7B5448B9":"0x4e6585c9553842C448C5B9a6F2907E3AC2e87239",
"9CED2F3B8196D66BE1220185F0DED44C0FB90291":"0xc7b4bE28e73481e968934CF085b8f1d406688833",
"9D1D415000C0E3CCAF64C282541C1CA0710F1660":"0x6F46735673bbBE1Ff346B1a0Aa45fd2B611216dB",
"A1BBF90FAEA682A5C96B7B36A6AA27ABE56C4AA7":"0xF94C4F7e890Bc437137eCCF8bF58C5c842A3cC03",
"A2A2E867F8F5191A8A48C8C5360C2764C7E82262":"0x2cb5330285A053110d901E605A6F8FFE244fb9f7",
"A2FCBB258D2D8C89B4B52F70C41880C61392A236":"0x7828a2e11bec453E69232B636668CE6e10774055",
"A30C4C285B182A5B8D6DE27E3F425835D21780A5":"0x41f171ffBfe44a3674bF9f30B47693b9bc62E9b7",
"A3289048EF75669242A2DE6212D4307CDE211520":"0x43420789E9C75CBa5375d401f74c1cAB186d6D15",
"A456F6D86F812024FCD50E0C3005AE02F3080897":"0xF41A5f015C90Aa260A5F501Ba09e8d00495B6221",
"A5CB3F546D4AC98B4A59131690E4A583B9D8851E":"0x2c1A5e2ca4d585d4d863d7b3f4ee6ba02B466dcf",
"A9231EA60B8A9EC29B85B02D2C38397338F80097":"0x3b9089785C4e941342cf348BC160caDb7D90f2Dc",
"AABC9B22A6A85F700B80EC3A6D140A08EC1590BB":"0x9Cb10817CAe852C45D8D602097a76a932f6185E6",
"AAE4C700E63F21FAAAA44C5E6851C4CF0581C215":"0x818b13A69a72D02903d593844aEE5AF552Cc6Cd4",
"ADE33C3288B9D754BC0EE7FA49036309639F05DE":"0x72724e620586e440253cB8579A0B28ef9487b039",
"B0D63EE880C6D031F6977FB582253D0AB0FB87E1":"0x44E11e790bE68A2378b9343E59F6C2Ae6342E442",
"B0D745A63E20214DD3B0F551D3A10D14D66616FE":"0x5B5378870b6A52588e65c914a487F083a2193281",
"B0DA63A0E893B85877B6A0190E0280F12F4CBEA2":"0x90057271e03ED6737B5A52A0CbD2239Aea811f94",
"B43EB281C8D96C035A395A0D215CC1C2EF5B8D46":"0x898A9Eb0f6e49c8f5D33E678dd4bEfDCff77552A",
"B7B9943D39D291E92D9362A1B4BE13871BF3F80E":"0xeA7C91110cc49f97F74f7725BB5148aC9CE7dF51",
"B838FEA01718A56EFA36B4547BACB3406871F017":"0x54a1354F615D464F7739d515598DB4e6315Ddc4B",
"B86208962AEE9DC6B116E49A5AAFF076CA0F0D11":"0xda2091ecf0E91992b0156F0Dd3799b4320df4F05",
"BB05DF5D23D225F1B9ED82796D8194257706B2E5":"0x0a14181c3845c0C4eE574C2564B01affA400242F",
"BC14319205C5BDF45282C830E0CEB6B3C53D62B1":"0x1DfC09e0Aef1d576edfa4fFD71FC4cAeaC911d4E",
"BCCA31EC30093D0FA657A75A4FEB559473FDDD50":"0x887b7E335f75E69ecaf1376F057667562269d7DC",
"BE1F76841DB89C3D34FE9235BC8594E109951960":"0xCd5D478686c6fA5E47Fc457F16E04224cD012690",
"BE62F9855E9143A3D15C98739800A2DCBAF7A76D":"0x0184FC55d9AC8856Fc365BDc70825756c9D438fc",
"BF4EB653F28CF9C958C3232D54B1FC29B4B12F17":"0x77B789133012751720cF50781d31Bb56Fb4B97dA",
"BF70C16886ED6D70E1E103566314359AD95AA660":"0x688143644F42A247DE67bfAD8fB9FBFBbA7Ee021",
"C047FF5FBE7ECA5F3FFF289E5C70DA17AAA5946C":"0x3eB74a37451737D6a432b192358739ad6Ff4fb39",
"C109B67B7C4A08B13EDB3EBB0CF317E72B6716FD":"0x98Ed3B4B81AC60F8f23F47811BA52d0a3de7F081",
"C321BFBA1DFD87061B7C8306AE62D972F7B59376":"0xa4392b4220EafcF6AF73881991ea7254e392D31a",
"C38E150919A7C01D4849E0782AD2D8C4A74EAB34":"0xf2948eDD428305D28DcBd6C284470e3823ee182b",
"C54C12A5D21E95C1627ADE9D43432CB828E4DB48":"0x14EE8817b5De0849ED7cE0E699BD19EDE7ec5e95",
"C58BB1A08CC76E46F16101E7DE5D323AA3B34F6E":"0xDf548c35DBA62A1B0A5FB1E365E2539935487408",
"C9B4D5154450ACAB3A81548DE5E383378B0328E4":"0xe486d9D3b99a0B9CD35a511401D928E527844b43",
"CB11AD937DE2F01B830782A218DEEF096AE7B47D":"0xa594dc6755fDF82dF1ddB20cd8DE2c04Faa6a5a9",
"CC0016D16E2E2EE08631E797D7A1F2208A540DC2":"0xcb8518C21dB38ef37fF0Bf39Fe95b24D0959C355",
"CF14AC60C0DB1C4331E5E93314EBD23B96B11A31":"0x72724e620586e440253cB8579A0B28ef9487b039",
"CF66C81AB64ACA1EC95E1F10B75721F4DE0AEE57":"0x4dCDb1BEa466136C287D1C522db829571F93b62f",
"D26B9006B579F8914C70EBDFD1C876E864386970":"0x42a9CF0F0F8cF73F1bc34A62e934f244bC00fE35",
"D2870D5A1B2325DFC7E539A45A3B01AF488310BD":"0x8824F0091D6d6Ee3beD0645eCBC0E2d8c9c47942",
"D40ACFCA44CAFB6DEE053F0CB18CD40D1232C780":"0x3eF27C8EEe8261fb5906B2e40daEDFC8E7B3f055",
"D53735422CB4036A80F91837B7EE9747F5B5C9F1":"0xf4743bf3d7Aa0Cd2d6f2a5fB634B401D8db60987",
"D59557BD37EA06BF78436E4DED157716CAD88029":"0x40A35FdE2bA34B29FBe699C6A43A6d6690e4345C",
"D60941A928090AADF96AD6481B974D79AA6048E2":"0xd045A4344362A3CD187bd7e2277Fae8BA067EFd5",
"D87507E1F107F84FDE784EEF17E6F610EB2176A1":"0x9454d413886A3737c06b10dE11360669C56D5f24",
"D8BA267DE758586462486E7DF7C5FB9556404D5F":"0x8E02Ff09b8Fa6047122c2adBB40029cA444F5974",
"DB0528013E24EDCDA7B213F3B70321A62C701CCB":"0x5190Efc20E1Ac0D4B5eCe5f6E8D5529925557C90",
"DBC2D22FFB25E6E2F054E562772DAE4CE61D5A4D":"0x8ce3456193Eabc7fa2Cd6f3660CA6eBf9f69E63b",
"DBF5432BF07BC1F9B6E6E1FE7389BA41008363D8":"0x3c78053528cCbD382C90A13233c509965fe3451A",
"DEE60B40AE194A1731FC5104C4825948EB60A9CF":"0x4e6585c9553842C448C5B9a6F2907E3AC2e87239",
"E009249FAB98FE52826642391DA33E125869C63F":"0x002Eb755BD82B99F052D2cCe67EA4ED10561E49c",
"E0611546A9ABC8A3BFF82D4EB035F972F93B6661":"0x8e8f2F0bcFab3a53b6d82e299C3d5f6397579e53",
"E097F5F0D539E69BCF8AAFBD0F333AB1D4FB70C0":"0xdF60b603671bd2d2F014fd4e4d6a3657823Df567",
"E12F6A339B7434D720F00C2EA35B9085EA729D93":"0x9f6C41276989252B785E56aff8e051d2Ec4F5E19",
"E3299F9CC495E19C6B3C39D58B714D18DAB6DDCF":"0x477E84277727279FB51E39cdB61642CC8d6B02BA",
"E43915989E01BE6840D5C82B11B95885ED8CB81F":"0x85Bd2dEE3233A1469E2217ee9520a39A2137d442",
"E47DADDAC2A5EC1E5851AA65802180429817B3F4":"0x39f438BbB019Ea3Ab114b2c42064efB1b389b89e",
"E616E560EB2F9E380C7DE8506D8EB075517E76DA":"0xa3EE387E97fbeC75A2623A809726c38f6ac19B2D",
"E6CFF9FD7ACFF8015604931A134AB66A1AE72E8A":"0xf2948eDD428305D28DcBd6C284470e3823ee182b",
"E7D161A93D2FCFAF53CA35B9AB07F734ECC7D5B5":"0x9DCA83E91041222D20c491F5b25ddC7Ac79Ee53B",
"E96BA73676476F68DCCDE99A383E114A33432B04":"0xF8Ae447F48af3748d64C509B20Be78C512292DB1",
"EA50D08EC10EE837B8A1719AC4447547712EDB66":"0x7f85F0E167Cc229A7eB9B41221D9D8a7965f2949",
"EB0F5258EA351742DB9D79BB8697640658F1D9CF":"0xC2c58DaFE37Ccf2D0bdB0a90194bE969aD05CFFc",
"EB80D5F8239D189EE4649BDA645C3732C02B6519":"0xdC2daEccA2007B169b8B332db531bCf69aE1f74C",
"ECE5E96F86D53782AC41FFB5ECD7F11BBEA60CD4":"0xD3ac40ba686AA050396d41E39E328F02cf05f15f",
"EE83DD28254EE2DE0AF8E45BB6C5449B056EF4D9":"0xe1aF18F9e5810A80365Ae7B89919540c01184dAc",
"EFEDE66D3F4E36963EA643212C82C1C01681C593":"0xB456a8673d19a6FaA5991e4f9169240f1b0ee3f2",
"F080167CEC9667F54BF51BC0B31C5314E9C2A63F":"0x283C184c920102372b5FCD94807675D50A74e668",
"F0CD20C309BEFF257A6A94B252C8C897C87EF91B":"0x9D0caC8351BD51D5BC537bD62c0410a8DBc78B74",
"F14F5730747ACC3F9E7F4D13EEE2059DAFED7CC9":"0x493e5f463feB5B13259214E81cF229c5B28303EC",
"F3B98E0782873410FD0F754C479C877CC1D2DCED":"0x2f5f379033a0e35e784928288E122E7508570D4B",
"F6E2B85D48B9D38C1C8EB19A938EADC822902E94":"0x2Edd67E13e1e84337A8D0E908Eae83091Bd54945",
"F854C03E30EE8CE697454DEA04A1BA2113B31D10":"0xaA491150D2db572F0C445B89A153217815C0E85E",
"F8C6CE08E91B09D7068F782F37DE756984237DBC":"0xcb7a940167172CE2c6E4EaD25FD0ff1cede432A6",
"F94A6BE3AEBB1892674D6A14B708026A734200B8":"0x7bDAE3be9CB620822C576af1fD437056131E341a",
"F94D6191BA227409F520483FEB2965BEB277B74D":"0x96f3F2f5Ca72863605B2977a26Aff2B86C4e19D6",
"F987F6092D765D99B00BBFE1C6AC5F662FB1A941":"0x9D0caC8351BD51D5BC537bD62c0410a8DBc78B74",
"FA266D7B780F5052747DAC15A990FE3DFB5063EA":"0x22e2AA15d09A30Df7AF620D119806Aec826a55A7",
"FA37D7D451A03FC7CA7FA023EFA67E8B3D7CBBEF":"0xB09Bdac8b7a4faE53EAC7D2F5e2E99A8170Cb817",
"FA3DB534B688D91FE2E8E0215B7714C0C33012BB":"0xc60048Fd2bccd82da8A1C0d06B3CF1Bfd7D740A2",
"FAE2B62C2A081FB5F6959773E7DD7068C3A8C822":"0x32c4e3A20c3fb085B4725fcF9303A450e750602A",
"FD0D7535C9BB69C7F4F4A17149526EF97F4553FC":"0xBB1973a07b9802bD1bb2B868c96d6C8a6BB0Ac50",
"FEB46CD11650B98C5268F2196BBDBFA37291A4FC":"0x9Cb10817CAe852C45D8D602097a76a932f6185E6"
    }
}

            {{end}}
            EOH
            destination = "local/relay-registry-init-state.json"
            env         = false
        }

        env {
            PHASE="stage"
            CONSUL_IP="127.0.0.1"
            CONSUL_PORT="8500"
            CONSUL_KEY="smart-contracts/stage/relay-registry-address"
            CONTRACT_SRC="../dist/contracts/relay-registry.js"
            INIT_STATE="../dist/contracts/relay-registry-init-state.json"
        }

        restart {
            attempts = 0
            mode = "fail"
        }

        resources {
            cpu    = 4096
            memory = 4096
        }
    }
}
