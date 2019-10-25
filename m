Return-Path: <SRS0=zGwX=YS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47652CA9EA0
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Oct 2019 10:32:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14B5220663
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Oct 2019 10:32:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="EPpRWgSw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439373AbfJYKcu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 25 Oct 2019 06:32:50 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:28016 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2438055AbfJYKcu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Oct 2019 06:32:50 -0400
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9PASKKP024315;
        Fri, 25 Oct 2019 06:32:23 -0400
Received: from nam02-cy1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2056.outbound.protection.outlook.com [104.47.37.56])
        by mx0b-00128a01.pphosted.com with ESMTP id 2vt9t2a8tu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 25 Oct 2019 06:32:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKJGMRWre/ua0XPFteQ8xSqom7cF5dBxHrPc55GY3rbPNIzP8wDLcqdG3UthwmhevHGNmMcQx8dF3fXL/L2WsFs1GtEdxdk4T/7KkDUmB7NpCKD+hsUGPIBGnpv+PVnNe9o2kc7JusqTQeDQSpt6vnubWyCIcS8uJ9NB+qRRCkwm3Aq9s1c0ycxzuqPZlXDiCdJ9Mt+af/ongarZXOSvnXDwe9/FUoS7k3meLi/qkeJ3hBYil2nCmpTfVlcsPnPz0LTX6w8AMvVIVh8qfVBWeBb4RTIHrv/DnaYVEfZHIEM3ZMxLxPkmq7Mx1cZTBeGn3SvHuKo+8HVxW6WulwlvBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cpn5B3bN8fcUHjEerdoGX7tDmyr9CP37nhIcvQudAIU=;
 b=as3Yw4U8rZNENoN6gfAoqlyOhCmATwA3/0J3qq59d8rVZKdFLS90MJl9Y6uaOWO1g20RUvoj/qCwtFOj7Vh/qNbxOqqXZ8DXdGDBUrta00w6qkOPqDasHWtpYY3LK5k0bPr2N90vcOtwrA8aM9k+XchNBModrzrOIE7eGEF9b4HQuGap9U/Nczk2yCzjahyiEn7btkgusC09/AbJNv6XtXyXc6Bwv323BHEWO5OmgQ61ox6a8YeTFS3j7p5yLiX9PBeJ44LigHFshzVVtACTeUETEdmI65vhpIsL8dA/9wP3vgbEG2H0I1m6tB2Z/2f0dvvvQcygu3XzjJR3Mqm2Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cpn5B3bN8fcUHjEerdoGX7tDmyr9CP37nhIcvQudAIU=;
 b=EPpRWgSwK+rm30ZoDHEpJQps/YQChL45wIWFTEQD5HdaKnM//HABvNAqGCv0v1T8XCLNmZpkyE41X0GaAmmzmX/SEgZgYojiTbXlkGmgCT+q5tlO3VB5lVGe7WdKQ8QSqzdLCTKAndbCfDUDCZO4xaheZtvikBKKXGfl8DnXF7o=
Received: from MN2PR03MB5117.namprd03.prod.outlook.com (52.132.170.142) by
 MN2PR03MB4894.namprd03.prod.outlook.com (20.179.80.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Fri, 25 Oct 2019 10:32:21 +0000
Received: from MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::158d:8806:418d:5b34]) by MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::158d:8806:418d:5b34%7]) with mapi id 15.20.2387.025; Fri, 25 Oct 2019
 10:32:21 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: hwmon: Add ltc2947 documentation
Thread-Topic: [PATCH v3 2/2] dt-bindings: hwmon: Add ltc2947 documentation
Thread-Index: AQHViCX/PA7EFiXLfUuu+ROCmMXoQ6dqaXqAgADFVIA=
Date:   Fri, 25 Oct 2019 10:32:21 +0000
Message-ID: <c88593b6c3b0b2cfe9bf3f8decbbf08820a6ae88.camel@analog.com>
References: <20191021154115.319073-1-nuno.sa@analog.com>
         <20191021154115.319073-2-nuno.sa@analog.com> <20191024224635.GA6747@bogus>
In-Reply-To: <20191024224635.GA6747@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c5f70002-d22a-44fe-45b9-08d759369e50
x-ms-traffictypediagnostic: MN2PR03MB4894:
x-microsoft-antispam-prvs: <MN2PR03MB489479EB844147811217034F99650@MN2PR03MB4894.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(39860400002)(396003)(376002)(366004)(136003)(199004)(189003)(81166006)(71200400001)(1730700003)(6512007)(71190400001)(36756003)(305945005)(7736002)(66476007)(64756008)(66556008)(26005)(81156014)(8676002)(2906002)(76176011)(8936002)(476003)(3846002)(6116002)(4326008)(186003)(102836004)(6916009)(6506007)(6436002)(4001150100001)(5660300002)(229853002)(11346002)(446003)(2616005)(66066001)(6486002)(118296001)(25786009)(99286004)(2351001)(316002)(478600001)(486006)(76116006)(86362001)(6246003)(54906003)(256004)(91956017)(2501003)(66946007)(14454004)(5640700003)(66446008);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR03MB4894;H:MN2PR03MB5117.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kWrHKuihmLI/VyTDfTgMd0xfBgpJ5OlmuNq3j0NLC7duv6wG3FpZPkV8hugGYc0WV+Ay0tBdatgDIwUCPxCbEttl2yAF8zGOJoX6AwY30FLOURrYva74EEJZDO9lWOB7fuY4zX/azgzZwO9GJfbJvxq9V5+qokBjVWlTwQo+rMacVp1x/yCszG+q4ZafuX+PC3+RsYB86E3Q3h1sjmDegWNoqf/nFREiDMQV9ZQFktMNXHfOUQM21t1pNCGeLRUE9gZQdyZrsqCcylsjPfqLdhy2+sd3h62CtgdyL/l3bu62MKD+Anmzprhfi5fjctuzWTkLOFENG4a0Eg7HUGL15r4EsNfgYvdgiSTy8x2ExhwT/w+Z3RDNGkYoZeyErFUoPDyqTfWKtqGoLaXGCm4oqeSEqMfwZ+KcFE0un7Q7ThrXszayhlFlbUgcqgwJFB8O
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDFE7BBD50F16748BC90E2F2E3E332CB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f70002-d22a-44fe-45b9-08d759369e50
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 10:32:21.4933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V0iy45m3zM0GbTjKt4LFIisSK0CmQanzWMtE7yimX1pRzYT9E7Eg+PguC7el7u8Ze/A3lD0ts5nUtmvPwN18YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4894
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-25_06:2019-10-25,2019-10-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910250099
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

T24gVGh1LCAyMDE5LTEwLTI0IGF0IDE3OjQ2IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
DQo+IE9uIE1vbiwgMjEgT2N0IDIwMTkgMTc6NDE6MTUgKzAyMDAsID0/VVRGLTg/cT9OdW5vPTIw
Uz1DMz1BMT89IHdyb3RlOg0KPiA+IERvY3VtZW50IHRoZSBMVEMyOTQ3IGRldmljZSBkZXZpY2V0
cmVlIGJpbmRpbmdzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNh
QGFuYWxvZy5jb20+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiAgKiBBZGQgbGlj
ZW5zZSBpZGVudGlmaWVyOw0KPiA+ICAqIEZpeCB0aGUgdWludDMyLWFycmF5IHByb3BlcnRpZXM7
DQo+ID4gICogU2V0IG1heGltdW0gYXQgdGhlIHNhbWUgaW5kZW50IGFzIGFsbE9mIGluIGFkaSxh
Y2N1bXVsYXRpb24tDQo+ID4gZGVhZGJhbmQtbWljcm9hbXA7DQo+ID4gICogU2V0IGVudW0gYXQg
dGhlIHNhbWUgaW5kZW50IGFzIGFsbE9mIGluIGFkaSxncGlvLW91dC1wb2w7DQo+ID4gICogVXNl
IHNwaSBpbnN0ZWFkIG9mIHNwaTAgb24gdGhlIGV4YW1wbGU7DQo+ID4gDQo+ID4gQ2hhbmdlcyBp
biB2MzoNCj4gPiAgKiBOb3RoaW5nIGNoYW5nZWQuDQo+ID4gDQo+ID4gIC4uLi9iaW5kaW5ncy9o
d21vbi9hZGksbHRjMjk0Ny55YW1sICAgICAgICAgICB8IDEwNA0KPiA+ICsrKysrKysrKysrKysr
KysrKw0KPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDEgKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEwNSBpbnNlcnRpb25zKCspDQo+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9o
d21vbi9hZGksbHRjMjk0Ny55YW1sDQo+ID4gDQo+IA0KPiBQbGVhc2UgYWRkIEFja2VkLWJ5L1Jl
dmlld2VkLWJ5IHRhZ3Mgd2hlbiBwb3N0aW5nIG5ldyB2ZXJzaW9ucy4NCj4gSG93ZXZlciwNCj4g
dGhlcmUncyBubyBuZWVkIHRvIHJlcG9zdCBwYXRjaGVzICpvbmx5KiB0byBhZGQgdGhlIHRhZ3Mu
IFRoZQ0KPiB1cHN0cmVhbQ0KPiBtYWludGFpbmVyIHdpbGwgZG8gdGhhdCBmb3IgYWNrcyByZWNl
aXZlZCBvbiB0aGUgdmVyc2lvbiB0aGV5IGFwcGx5Lg0KPiANCj4gSWYgYSB0YWcgd2FzIG5vdCBh
ZGRlZCBvbiBwdXJwb3NlLCBwbGVhc2Ugc3RhdGUgd2h5IGFuZCB3aGF0IGNoYW5nZWQuDQoNClll
cywgc29ycnkgZm9yIHRoYXQuIENvbXBsZXRlbHkgZm9yZ290Lg0KDQpOdW5vIFPDoQ0K
