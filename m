Return-Path: <SRS0=NWL2=XV=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE14AC432C2
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Sep 2019 10:17:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86B7F20872
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Sep 2019 10:17:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="g6EW2o/h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbfIZKRz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Sep 2019 06:17:55 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:22410 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726520AbfIZKRz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Sep 2019 06:17:55 -0400
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x8QAD77A013210;
        Thu, 26 Sep 2019 06:17:18 -0400
Received: from nam05-co1-obe.outbound.protection.outlook.com (mail-co1nam05lp2053.outbound.protection.outlook.com [104.47.48.53])
        by mx0b-00128a01.pphosted.com with ESMTP id 2v6hkcq1nr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 Sep 2019 06:17:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMgL6LZTy753z2vtUMUvUZZuNwsx4qvIQRmjXtVYkJHUqSAxFPd4eXkBp4s8s3DUpaJvYkSuBDxX7sTvmc4IRK5cleenLOGJX1NBELdPws1KD6ig4gZ7Cncc6F1+iHVF7VCsOVE53jatzsHWu0GR84bx6Uj68uy2rZ9OeKe32c4/37QOJgHERdfJ3MK3cY9+V6mmphkZ3hF19l4/XSgEYF13jVO2Phnv7PZMDE/duVMO5/nlHV+bEFMq0K4YVykXiLp9UWK0CJQ+4b16PR4AGJJDLLUaqwaUOD7D5NVoeeGAl66UTu8lXFHq0ehQ/DNPjHKyWiMYLZLB9KvJJyaLDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIcIT2r8DIW2C3qXtZFveXdYWvbQL4Aq9ugLNLXT1QM=;
 b=QwKk3l7di2c27AGTplOttAsaBd+JmHP626KykbRBZ6YEpyTdztqT9a5VZVArAKmhnQt9+GTU/Qu2+25iUnMPq7fNbvH9AEKColwk+lR481V2JOECciNXnMha2OBL5UpWQlakqINEvnaiB5GeU5sGNJZFk3VF9vJxO7bgWEiYeiu/iN0DOa1JKFK5uG4R1dv8Dq/LmQvZQwT0fW/xZfcFgGVT61CkPh+12KSODdsxM3kBc2Vop1/SCAYOB4U9bQ0EQXIBWgVR8oAK37r4rHdC4zz9xJ05Tbb7nyfiu03WyTcg8LIUmOJyscg5zSfvLvzIT9nNtgCMbNGoFJwWzIfYsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIcIT2r8DIW2C3qXtZFveXdYWvbQL4Aq9ugLNLXT1QM=;
 b=g6EW2o/hFV9gR4+uTMg7EL3Ci+Zo67yFDYqBMsvI35T1F+wDEs475wRx3Wq5xhBikX/mA5nN9C5fFw9jtQUG6DoBEteIU7z3cqqsloEX+HbWEy5VuT3rkssTTpW3Zep9+Kj3zHpJVCQCmKJC7NGyDh4ga+gnElQGspncmfVywWU=
Received: from MN2PR03MB5117.namprd03.prod.outlook.com (52.132.171.137) by
 MN2PR03MB5087.namprd03.prod.outlook.com (52.132.169.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 26 Sep 2019 10:17:14 +0000
Received: from MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::9db6:a133:7d27:643]) by MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::9db6:a133:7d27:643%4]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 10:17:14 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: [PATCH 0/3] LTC2947 support
Thread-Topic: [PATCH 0/3] LTC2947 support
Thread-Index: AQHVctaYm6ZaYzcfm0mzoiGNZr08w6c9wZKA
Date:   Thu, 26 Sep 2019 10:17:14 +0000
Message-ID: <67d13d31e7ed90c08a181422c9b72e6a68ad7c39.camel@analog.com>
References: <20190924124945.491326-1-nuno.sa@analog.com>
In-Reply-To: <20190924124945.491326-1-nuno.sa@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 273c8fc3-4b63-4a44-f215-08d7426ab3df
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:MN2PR03MB5087;
x-ms-traffictypediagnostic: MN2PR03MB5087:
x-microsoft-antispam-prvs: <MN2PR03MB5087FA9D63DA8777435B3E7499860@MN2PR03MB5087.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(396003)(346002)(136003)(39860400002)(366004)(199004)(189003)(2501003)(6486002)(81166006)(14444005)(81156014)(6436002)(14454004)(6512007)(86362001)(256004)(305945005)(3846002)(478600001)(186003)(6246003)(71200400001)(2906002)(71190400001)(99286004)(36756003)(26005)(2201001)(446003)(66946007)(316002)(110136005)(7736002)(5660300002)(66476007)(11346002)(4326008)(8676002)(102836004)(6116002)(66446008)(66556008)(66066001)(91956017)(64756008)(76176011)(6506007)(54906003)(118296001)(76116006)(476003)(2616005)(8936002)(486006)(25786009)(229853002);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR03MB5087;H:MN2PR03MB5117.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AD1sfgrkBPdbN6qn3OngG4nc+kZpL7ZlD519hdDqdV167X8fYgWlX+ywnrLVC4WtSWdgXopqqjMb+6GSssn54CKeqvuPUlixVIJ9y4Y2I5jBnZ9N1PTa+MPycB0W29Y1K7TG0JvZJ8knI0JS0oxukammH9fw2PieCiX1IB2EDgiv0fZdZXx0QF01V2diVMi5TNU4L/hoKaC44WsLMe/A/LuBWYNYAxSB8n6zNFpev7/c7fuQ2A9nCXS+xa88vVpYsXYyPRanccSO5YXFOgThpfF0D8E4lldLOt7xHkzsG9BF2W8RbO8HBaMDOjqvGCLhZS/O04aukvccbqKliZNCC4OO5YOs9CalTTMSfnWLxvSQNLElDztMC0T+skoOksKfPyuJLHp314sUF4RJQ/JYsVdX6990LJ3BSpiZafGr/AU=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABCF6EB5A47B6246B78700CB695B564C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273c8fc3-4b63-4a44-f215-08d7426ab3df
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 10:17:14.7258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x0V+SbP2i/KDon5Arr/1BEGR02lUNduhkU9a1CgXs1rPjgnHiuyc7jMVK+l7Km2zYZ19VKhm9bMlyDPZN5GH4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5087
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-26_04:2019-09-25,2019-09-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909260096
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

T24gVHVlLCAyMDE5LTA5LTI0IGF0IDE0OjQ5ICswMjAwLCBOdW5vIFPDoSB3cm90ZToNCj4gDQo+
IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIExUQzI5NDcgaHdtb24gZGV2aWNlLiBU
aGUgZGV2aWNlDQo+IHN1cHBvcnRzIHBvd2VyWzEtKl1fbWluX2FsYXJtLCBzbyB0aGF0IGl0IG1h
a2VzIHVzZSBvZg0KPiB0aGUgSFdNT05fUF9NSU5fQUxBUk0gbWFzay4gVGhpcyBicmluZ3MgbWUg
dG8gdGhlIGZpcnN0IHBhdGNoLCB3aGljaA0KPiBpcyBhDQo+IGZpeCBvbiB0aGUgaHdtb24gc3Vi
c3lzdGVtIGZvciB0aGUgSFdNT05fUF9NSU5fQUxBUk0gbWFzay4gSXQgd2FzDQo+IGRlZmluaW5n
DQo+IHRoZSBzYW1lIG1hc2sgYXMgSFdNT05fUF9NQVhfQUxBUk0uDQo+IFRoZSByZXN0IG9mIHRo
ZSBzZXJpZXMgaXMgdGhlIHVzdWFsIGZvciBhIG5ldyBkZXZpY2UuDQo+IA0KPiBOdW5vIFPDoSAo
Myk6DQo+ICAgaHdtb246IEZpeCBIV01PTl9QX01JTl9BTEFSTSBtYXNrDQo+ICAgaHdtb246IEFk
ZCBzdXBwb3J0IGZvciAgbHRjMjk0Nw0KPiAgIGR0LWJpbmRpbmdzOiBpaW86IEFkZCBsdGMyOTQ3
IGRvY3VtZW50YXRpb24NCg0KT2ssIEkgd2lsbCB3YWl0IGZvciBmdXJ0aGVyIHJldmlld3MsIGJ1
dCB0aGUgZHQtYmluZGluZ3MgcGF0Y2gNCmRlZmluaXRlbHkgbmVlZCB0byBiZSByZW5hbWVkIHRv
ICpkdC1iaW5kaW5nczogaHdtb24qIDooLg0KIA0KPiANCj4gIC4uLi9iaW5kaW5ncy9od21vbi9h
ZGksbHRjMjk0Ny55YW1sICAgICAgICAgICB8ICAxMDEgKysNCj4gIERvY3VtZW50YXRpb24vaHdt
b24vbHRjMjk0Ny5yc3QgICAgICAgICAgICAgICB8ICAxMTAgKysNCj4gIE1BSU5UQUlORVJTICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMTEgKw0KPiAgZHJpdmVycy9od21v
bi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyNyArDQo+ICBkcml2ZXJzL2h3
bW9uL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAzICsNCj4gIGRyaXZlcnMv
aHdtb24vbHRjMjk0Ny1jb3JlLmMgICAgICAgICAgICAgICAgICB8IDE0MjENCj4gKysrKysrKysr
KysrKysrKysNCj4gIGRyaXZlcnMvaHdtb24vbHRjMjk0Ny1pMmMuYyAgICAgICAgICAgICAgICAg
ICB8ICAgNDkgKw0KPiAgZHJpdmVycy9od21vbi9sdGMyOTQ3LXNwaS5jICAgICAgICAgICAgICAg
ICAgIHwgICA1MCArDQo+ICBkcml2ZXJzL2h3bW9uL2x0YzI5NDcuaCAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDEyICsNCj4gIGluY2x1ZGUvbGludXgvaHdtb24uaCAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgIDIgKy0NCj4gIDEwIGZpbGVzIGNoYW5nZWQsIDE3ODUgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9hZGksbHRjMjk0Ny55YW1sDQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9od21vbi9sdGMyOTQ3LnJzdA0KPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvaHdtb24vbHRjMjk0Ny1jb3JlLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2h3bW9uL2x0YzI5NDctaTJjLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2h3bW9uL2x0YzI5NDctc3BpLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2h3
bW9uL2x0YzI5NDcuaA0KPiANCg0K
