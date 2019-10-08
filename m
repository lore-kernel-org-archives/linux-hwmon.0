Return-Path: <SRS0=43k4=YB=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D297ECE58E
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Oct 2019 14:20:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8B7820815
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Oct 2019 14:20:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="XG03DsY3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbfJHOUq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Oct 2019 10:20:46 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:44240 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725935AbfJHOUp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 8 Oct 2019 10:20:45 -0400
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x98E7qxK000891;
        Tue, 8 Oct 2019 10:20:05 -0400
Received: from nam01-bn3-obe.outbound.protection.outlook.com (mail-bn3nam01lp2054.outbound.protection.outlook.com [104.47.33.54])
        by mx0b-00128a01.pphosted.com with ESMTP id 2vemxauuyv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 08 Oct 2019 10:20:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8GivcKGYxaEWSLMc8XYNBjFv+y6Fc5uyo49WfQ2vPYRJ77hLYhhY6J0pT/EotDY4BznNPzw9EqlLh9nEqcqE64hD+RfYBX4vLNj46GAVdxCzGslUKSySsLF10Pn8OrOt2+5yW74cFTfrRAwAvzQCKkyuuEpGoPOdydnOMIg6aD8zicMM/gGa7kPXPtoytZbv2TfpGMF0QEFhHSp8uTiPQU4dGwLye3NNIMaRapn461F0bnhPL0AElMTDMnSzsPfjXj+9jCqe3TEewEkBzzJLXtQ7VsLFF6LCbRPzoYwcL9uf23VAqsDTwCZMJwKNTHt5oUtTtAc621fL/frSy985w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKqSrRWKkPD0pxUkxAcQvPv8vAXufS0Mc4Tb7opitD8=;
 b=YUrWw4q9VGLxaZgHPQhJsr9t5F1mFjvtNlRYvlGJE2Zr5HzCvtANjf0dJx8e6enmgSRdfNroX+yRYHAL8fAKzDZ8xfRYnHHANb2+CzXjWx+Nlnn4ZibTXM24KKIl3wekcG1K1VItOklFocGrmhbKj6tM/qVWmst3Ed3sxcPsru33l0lBfa2YmGgkx9CXEdwqjH4CTN3WjjNtkuUIZiNquYVFS8CcxMQCgVQZVHVYniPpQ8xRCYygS5zwKvKI58hlZGWqMHBcjxSo4oGlMpVJLKckpJy/RETt8Dhd94dCIGpOm9YJFaJMwkCR6Ig2pPTyZUXDsPmmffQPFr+XnuOodA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKqSrRWKkPD0pxUkxAcQvPv8vAXufS0Mc4Tb7opitD8=;
 b=XG03DsY3vs/dmgepWeBDwX0HAbNCOYWqBPRhax3Xpipjiqe2drNsUdCWHVtsRgPGuODLNTkbBLOKRmTEi6unybOV09IZN2wugh76C+Xod5aNhz8ph5Wuw7yxxTAoFgLVv0NbjLUUjJEK3n3WN6r2E1LuZ1j19h5gjdKkSi+EScY=
Received: from MN2PR03MB5117.namprd03.prod.outlook.com (52.132.171.137) by
 MN2PR03MB4880.namprd03.prod.outlook.com (20.179.83.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 14:20:03 +0000
Received: from MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::8c20:8f3b:b536:dca5]) by MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::8c20:8f3b:b536:dca5%7]) with mapi id 15.20.2327.025; Tue, 8 Oct 2019
 14:20:03 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: [PATCH 3/3] dt-bindings: iio: Add ltc2947 documentation
Thread-Topic: [PATCH 3/3] dt-bindings: iio: Add ltc2947 documentation
Thread-Index: AQHVctabt7hELzS5OkeFI3rzndaj3qdHcx6AgAAOBQCAAEIMgIAC37qAgAAGo4CABjfXAA==
Date:   Tue, 8 Oct 2019 14:20:03 +0000
Message-ID: <3b9f5fd1923231e8f7efc28ce76d8d1b6d845a7e.camel@analog.com>
References: <20190924124945.491326-1-nuno.sa@analog.com>
         <20190924124945.491326-4-nuno.sa@analog.com> <20191002002331.GA17502@bogus>
         <a85b33d3cd24b4225e4be3a25221f9c56cdcca5c.camel@analog.com>
         <CAL_JsqJPFfUmOOQ-f_ibbTXdzgYxYMf2+7HCq2eBn_MkfRsdbQ@mail.gmail.com>
         <eec33c7156674770ca2f3033baed76c0e05a8587.camel@analog.com>
         <CAL_JsqK6oC1VFb4ni9pn9a=sfxWK9pAmBBgajpZwad5udFkPoA@mail.gmail.com>
In-Reply-To: <CAL_JsqK6oC1VFb4ni9pn9a=sfxWK9pAmBBgajpZwad5udFkPoA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3931d41a-a790-447c-1551-08d74bfa9c8c
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR03MB4880:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <MN2PR03MB48808D25042F10D6F7F17699999A0@MN2PR03MB4880.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(346002)(136003)(376002)(396003)(39860400002)(189003)(199004)(14454004)(86362001)(102836004)(26005)(8936002)(476003)(966005)(486006)(2616005)(11346002)(71200400001)(2906002)(186003)(81166006)(71190400001)(8676002)(1730700003)(81156014)(118296001)(478600001)(229853002)(446003)(6436002)(6306002)(6486002)(5640700003)(36756003)(6512007)(25786009)(6246003)(6506007)(5660300002)(91956017)(7736002)(66066001)(2501003)(2351001)(53546011)(76116006)(99286004)(6916009)(66946007)(6116002)(256004)(64756008)(3846002)(54906003)(4326008)(66446008)(66476007)(66556008)(305945005)(76176011)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR03MB4880;H:MN2PR03MB5117.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p7tno4aPtcPwdXRLi0QUY36uXFuTQ2i6DIF56iid+4h7lfvecgDqVE1YUmU+aJDyBBmb80/TYAxJfMhcCKECkDtje7UDm/GPctya8zdPFIB2tcQKe2tqYAAIcYJMFMXg7HOWVGVbOY4SncUqAUSltQK7nPgGf3URf+HF2AvpGQiWbvyFcpsnTnDUr0cajQXZcreQO1fVYrcWhR3uh+8PNpM6o4fTsixwfW5vvb5/RqOgdpXtRHNwNDbCdIcIF1XuJ2hlspc2WWjGbosdowVVr1dWq4zD5+zaTQ8pUEVkJ0m23lgeVnd9elzxO+plfYBV9bLp5I0jLTFADZWm2KuDHdgovudWDGltg4GeJ8m/33EzEcQ4/XWCxtAms1dLY7iPJdYG3+W48Ebn4ySAMTyWlguUA785QhEyq1K3XyXyFb+Y42xracsOqPUQj6wviyEFuwE1nZhzl4vrELq6xVSELw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1391A078B03D79418FD7BD8B2BE92FA5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3931d41a-a790-447c-1551-08d74bfa9c8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 14:20:03.5860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8XsZZBtk9O9YFLP7JRKtst7qt8KVso00kaDvtRlPbljXGkNM10DhSD9AnQ1Uaa+q2woJIa/5pFYgsu626h1NKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4880
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-08_05:2019-10-08,2019-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910080132
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

T24gRnJpLCAyMDE5LTEwLTA0IGF0IDEwOjIzIC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
DQo+IE9uIEZyaSwgT2N0IDQsIDIwMTkgYXQgOTo1OSBBTSBTYSwgTnVubyA8TnVuby5TYUBhbmFs
b2cuY29tPiB3cm90ZToNCj4gPiBIaSBSb2IsDQo+ID4gDQo+ID4gSnVzdCB3YW50ZWQgdG8gY2xh
cmlmeSBzb21ldGhpbmcgd2hpY2ggSSBkb24ndCBrbm93IGlmIGlzIHNvbWV0aGluZw0KPiA+IEkn
bQ0KPiA+IGRvaW5nIHdyb25nIG9yIGlmIGl0IGlzIHNvbWUgaXNzdWUuDQo+ID4gDQo+ID4gT24g
V2VkLCAyMDE5LTEwLTAyIGF0IDE0OjA2IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4gPiA+
IE9uIFdlZCwgT2N0IDIsIDIwMTkgYXQgMTA6MDkgQU0gU2EsIE51bm8gPE51bm8uU2FAYW5hbG9n
LmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiBPbiBXZWQsIDIwMTktMTAtMDIgYXQgMDk6MTkg
LTA1MDAsIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiA+ID4gPiA+IE9uIFR1ZSwgU2VwIDI0LCAyMDE5
IGF0IDAyOjQ5OjQ1UE0gKzAyMDAsIE51bm8gU8OhIHdyb3RlOg0KPiA+ID4gPiA+ID4gRG9jdW1l
bnQgdGhlIExUQzI5NDcgZGV2aWNlIGRldmljZXRyZWUgYmluZGluZ3MuDQo+ID4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+
DQo+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+ICAuLi4vYmluZGluZ3MvaHdtb24vYWRpLGx0
YzI5NDcueWFtbCAgICAgICAgICAgfCAxMDENCj4gPiA+ID4gPiA+ICsrKysrKysrKysrKysrKysr
Kw0KPiA+ID4gPiA+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMSArDQo+ID4gPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMDIgaW5zZXJ0aW9u
cygrKQ0KPiA+ID4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiA+ID4gRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL2FkaSxsdGMyOTQ3LnlhbWwNCj4gPiA+
ID4gPiA+IA0KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdA0KPiA+ID4gPiA+ID4gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vYWRpLGx0YzI5NDcueWFtbA0KPiA+ID4gPiA+
ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vYWRpLGx0YzI5NDcu
eWFtbA0KPiA+ID4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+ID4gPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uMmVhMDE4NzQyMWQ0DQo+ID4gPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+
ID4gPiA+ID4gPiArKysNCj4gPiA+ID4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2h3bW9uL2FkaSxsdGMyOTQ3LnlhbWwNCj4gPiA+ID4gPiA+IEBAIC0wLDAgKzEsMTAx
IEBADQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gTWlzc2luZyBsaWNlbnNlLiBQbGVhc2UgbWFrZSBu
ZXcgYmluZGluZ3MgKEdQTC0yLjAtb25seSBPUg0KPiA+ID4gPiA+IEJTRC0yLQ0KPiA+ID4gPiA+
IENsYXVzZSkNCj4gPiA+ID4gDQo+ID4gPiA+IGFjay4NCj4gPiA+ID4gDQo+ID4gPiA+ID4gPiAr
JVlBTUwgMS4yDQo+ID4gPiA+ID4gPiArLS0tDQo+ID4gPiA+ID4gPiArJGlkOg0KPiA+ID4gPiA+
ID4gaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvYmluZGluZ3MvaHdtb24vYWRpLGx0YzI5
NDcueWFtbCMNCj4gPiA+ID4gPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICt0aXRsZTog
QW5hbG9nIERldmljZXMgTFRDMjk0NyBoaWdoIHByZWNpc2lvbiBwb3dlciBhbmQNCj4gPiA+ID4g
PiA+IGVuZXJneQ0KPiA+ID4gPiA+ID4gbW9uaXRvcg0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+
ID4gK21haW50YWluZXJzOg0KPiA+ID4gPiA+ID4gKyAgLSBOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPg0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4g
PiA+ID4gPiArICBBbmFsb2cgRGV2aWNlcyBMVEMyOTQ3IGhpZ2ggcHJlY2lzaW9uIHBvd2VyIGFu
ZCBlbmVyZ3kNCj4gPiA+ID4gPiA+IG1vbml0b3INCj4gPiA+ID4gPiA+IG92ZXIgU1BJIG9yIEky
Qy4NCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+IGh0dHBzOi8vd3d3
LmFuYWxvZy5jb20vbWVkaWEvZW4vdGVjaG5pY2FsLWRvY3VtZW50YXRpb24vZGF0YS1zaGVldHMv
TFRDMjk0Ny5wZGYNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICtwcm9wZXJ0aWVzOg0KPiA+
ID4gPiA+ID4gKyAgY29tcGF0aWJsZToNCj4gPiA+ID4gPiA+ICsgICAgZW51bToNCj4gPiA+ID4g
PiA+ICsgICAgICAtIGFkaSxsdGMyOTQ3DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArICBy
ZWc6DQo+ID4gPiA+ID4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+
ID4gPiArICBjbG9ja3M6DQo+ID4gPiA+ID4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ID4gPiA+
ID4gKyAgICAgIFRoZSBMVEMyOTQ3IHVzZXMgZWl0aGVyIGEgdHJpbW1lZCBpbnRlcm5hbA0KPiA+
ID4gPiA+ID4gb3NjaWxsYXRvciBvcg0KPiA+ID4gPiA+ID4gYW4NCj4gPiA+ID4gPiA+IGV4dGVy
bmFsIGNsb2NrDQo+ID4gPiA+ID4gPiArICAgICAgYXMgdGhlIHRpbWUgYmFzZSBmb3IgZGV0ZXJt
aW5pbmcgdGhlIGludGVncmF0aW9uDQo+ID4gPiA+ID4gPiBwZXJpb2QNCj4gPiA+ID4gPiA+IHRv
DQo+ID4gPiA+ID4gPiByZXByZXNlbnQgdGltZSwNCj4gPiA+ID4gPiA+ICsgICAgICBjaGFyZ2Ug
YW5kIGVuZXJneS4gV2hlbiBhbiBleHRlcm5hbCBjbG9jayBpcyB1c2VkLA0KPiA+ID4gPiA+ID4g
dGhpcw0KPiA+ID4gPiA+ID4gcHJvcGVydHkgbXVzdCBiZQ0KPiA+ID4gPiA+ID4gKyAgICAgIHNl
dCBhY2NvcmRpbmdseS4NCj4gPiA+ID4gPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiA+ID4gPiA+
ICsNCj4gPiA+ID4gPiA+ICsgIGFkaSxhY2N1bXVsYXRvci1jdGwtcG9sOg0KPiA+ID4gPiA+ID4g
KyAgICBkZXNjcmlwdGlvbjoNCj4gPiA+ID4gPiA+ICsgICAgICBUaGlzIHByb3BlcnR5IGNvbnRy
b2xzIHRoZSBwb2xhcml0eSBvZiBjdXJyZW50IHRoYXQNCj4gPiA+ID4gPiA+IGlzDQo+ID4gPiA+
ID4gPiBhY2N1bXVsYXRlZCB0bw0KPiA+ID4gPiA+ID4gKyAgICAgIGNhbGN1bGF0ZSBjaGFyZ2Ug
YW5kIGVuZXJneSBzbyB0aGF0LCB0aGV5IGNhbiBiZQ0KPiA+ID4gPiA+ID4gb25seQ0KPiA+ID4g
PiA+ID4gYWNjdW11bGF0ZWQgZm9yDQo+ID4gPiA+ID4gPiArICAgICAgcG9zaXRpdmUgY3VycmVu
dCBmb3IgZXhhbXBsZS4gU2luY2UgdGhlcmUgYXJlIHR3bw0KPiA+ID4gPiA+ID4gc2V0cw0KPiA+
ID4gPiA+ID4gb2YNCj4gPiA+ID4gPiA+IHJlZ2lzdGVycyBmb3INCj4gPiA+ID4gPiA+ICsgICAg
ICB0aGUgYWNjdW11bGF0ZWQgdmFsdWVzLCB0aGlzIGVudHJ5IGNhbiBhbHNvIGhhdmUgdHdvDQo+
ID4gPiA+ID4gPiBpdGVtcw0KPiA+ID4gPiA+ID4gd2hpY2ggc2V0cw0KPiA+ID4gPiA+ID4gKyAg
ICAgIGVuZXJneTEvY2hhcmdlMSBhbmQgZW5lcmd5Mi9jaGFyZ2VyMiByZXNwZWN0aXZlbHkuDQo+
ID4gPiA+ID4gPiBDaGVjaw0KPiA+ID4gPiA+ID4gdGFibGUgMTIgb2YgdGhlDQo+ID4gPiA+ID4g
PiArICAgICAgZGF0YXNoZWV0IGZvciBtb3JlIGluZm9ybWF0aW9uIG9uIHRoZSBzdXBwb3J0ZWQN
Cj4gPiA+ID4gPiA+IG9wdGlvbnMuDQo+ID4gPiA+ID4gPiArICAgIGFsbE9mOg0KPiA+ID4gPiA+
ID4gKyAgICAgIC0gJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMy
LQ0KPiA+ID4gPiA+ID4gYXJyYXkNCj4gPiA+ID4gPiA+ICsgICAgICAtIGVudW06IFswLCAxLCAy
LCAzXQ0KPiA+ID4gPiA+ID4gKyAgICAgIC0gbWluSXRlbXM6IDINCj4gPiA+ID4gPiA+ICsgICAg
ICAtIG1heEl0ZW1zOiAyDQo+ID4gPiA+ID4gPiArICAgIGRlZmF1bHQ6IFswLCAwXQ0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IFRoaXMgc2hvdWxkIGJlOg0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IGFs
bE9mOg0KPiA+ID4gPiA+ICAgLSAkcmVmOiAuLi4NCj4gPiA+ID4gPiBpdGVtczoNCj4gPiA+ID4g
PiAgIGVudW06IFswLCAxLCAyLCAzXQ0KPiA+ID4gPiA+ICAgZGVmYXVsdDogMA0KPiA+ID4gPiA+
IG1pbkl0ZW1zOiAyDQo+ID4gPiA+ID4gbWF4SXRlbXM6IDINCj4gPiANCj4gPiBXaGVuIHRyeWlu
ZyB0aGUgYWJvdmUgSSBnZXQ6DQo+ID4gDQo+ID4gImx0YzI5NDdAMDogYWRpLGFjY3VtdWxhdG9y
LWN0bC1wb2w6MDogWzAsIDFdIGlzIG5vdCB2YWxpZCB1bmRlcg0KPiA+IGFueSBvZg0KPiA+IHRo
ZSBnaXZlbiBzY2hlbWFzIg0KPiANCj4gSXMgZHRzY2hlbWEgdXAgdG8gZGF0ZSB3aXRoIHRoZSBs
YXRlc3QuIEkgdGhpbmsgSSBmaXhlZCB0aGlzIGNhc2UNCj4gcmVjZW50bHksIHRob3VnaCB3aXRo
IHRoZSB3b25kZXJmdWwganNvbi1zY2hlbWEgZXJyb3JzIGl0IGlzIGhhcmQgdG8NCj4gdGVsbC4N
Cg0KV2l0aCBsYXRlc3QgZHRzY2hlbWEgd29ya3MuDQoNClRoYW5rcyENCk51bm8gU2ENCg0KPiBS
b2INCg0KLS0gDQpBbmFsb2cgRGV2aWNlcyBHbWJIICAgICAgT3RsLUFpY2hlciBTdHJhc3NlIDYw
LTY0ICAgICAgODA4MDcgTcO8bmNoZW4NClNpdHogZGVyIEdlc2VsbHNjaGFmdCBNw7xuY2hlbiwg
UmVnaXN0ZXJnZXJpY2h0IE3DvG5jaGVuIEhSQiA0MDM2OCwNCkdlc2Now6RmdHNmw7xocmVyOiBT
dGVmYW4gU3RleWVybCwgVGhvbWFzIEVkd2FyZCBDcmliYmVuLCBNaWNoYWVsIFBhdWwNClNvbmRl
bA0K
