Return-Path: <SRS0=dESa=X3=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B127C35280
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Oct 2019 15:09:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4ADFC21A4C
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Oct 2019 15:09:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="2USKZucf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728252AbfJBPJq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Oct 2019 11:09:46 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:10236 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727389AbfJBPJp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 2 Oct 2019 11:09:45 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x92F36ha009030;
        Wed, 2 Oct 2019 11:09:14 -0400
Received: from nam03-by2-obe.outbound.protection.outlook.com (mail-by2nam03lp2057.outbound.protection.outlook.com [104.47.42.57])
        by mx0a-00128a01.pphosted.com with ESMTP id 2va4e845wf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 02 Oct 2019 11:09:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajaNXBgtgqfHPYhaAJDJhneQpi4HSjkX4dkQAGHoT6W28dAtaIaO74weH6QFDP+Q9k5N9CsijgwJdutL/4Mvfra9Au3Km7ek5RAZcf1/79HbYlRtk1ZyxFGv2U65ICqoiPakBueCztx8zlyd1PFt4C7IRCesFGwMg4JwSMxfxD+c2821QRYtkZf+FG7wIs4SmJeKKu1/4tUCqjPr/xyZJ70d+S537KmNpCRYI34319kMVYYRfvdg8qzccNnwgAjiSpJ6Dizv6c/H2TUN/YZ3+yqv4pnySwPp/fH5BNDbiXGJ5Lxdp0+Z9Sze7xxUOYyKA6J2FEHVGam5/QTG0p3YLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ef7+k0BNKEDWnbojXuSC+JrVTVlvyydGOuPHwY0aliM=;
 b=UUAj8IRtC9Hxrq3rxzH3pSJgCZdR6rNd43BQw0MqDrS2WEwuTAD721p5aiWyvi89IzS1MxiBqlWBusxrO9F47g2/R9xMixuYeRG5BvIIWncM8iQ5Z5V42KoQ04ySeqvpCQJQsDPvsG/2a4UtJuNf+MX6aivi4/tnBtyOPdlhKjitrrTfsXEpxYTtwk8kDqQ8gPhV4oWreSHWd5Uiz15ANoab1+F4qvi6S0HrGDEK6TPld0DKas93wF0dmnFFQ5KYJwVLZjhSZV86zVCQeOFhmtLpvCK5Ph8o8fIEtAhZioGHBMjGeyOTAwOLRarOQ3KQHPk691VqjXf1tks/qd8G3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ef7+k0BNKEDWnbojXuSC+JrVTVlvyydGOuPHwY0aliM=;
 b=2USKZucfMfARzEIp1ykX+/BUkPzHCcSt5KB3XNMcbxxT0Hsabk9wJL+Tt+HCB9qX6B+jprSB9wVXbbXqNi/jnFfB53POix5JXa5NCyVvE9aBS5OsT0DL8vPONsVfTk0pNi+F7y+z4Svjf0cszLIP1kyCRMJ1rmEdg/IBL89qF4w=
Received: from MN2PR03MB5117.namprd03.prod.outlook.com (52.132.171.137) by
 MN2PR03MB5070.namprd03.prod.outlook.com (52.132.168.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 15:09:13 +0000
Received: from MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::6006:4c13:a8c1:b359]) by MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::6006:4c13:a8c1:b359%4]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 15:09:13 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: [PATCH 3/3] dt-bindings: iio: Add ltc2947 documentation
Thread-Topic: [PATCH 3/3] dt-bindings: iio: Add ltc2947 documentation
Thread-Index: AQHVctabt7hELzS5OkeFI3rzndaj3qdHcx6AgAAOBQA=
Date:   Wed, 2 Oct 2019 15:09:12 +0000
Message-ID: <a85b33d3cd24b4225e4be3a25221f9c56cdcca5c.camel@analog.com>
References: <20190924124945.491326-1-nuno.sa@analog.com>
         <20190924124945.491326-4-nuno.sa@analog.com> <20191002002331.GA17502@bogus>
In-Reply-To: <20191002002331.GA17502@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7dc6af1e-e272-4921-78bb-08d7474a7c23
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR03MB5070:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <MN2PR03MB50707012476EAAA116F0C33A999C0@MN2PR03MB5070.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(136003)(346002)(39860400002)(366004)(199004)(189003)(476003)(81156014)(66066001)(8936002)(8676002)(71190400001)(81166006)(1730700003)(71200400001)(76116006)(91956017)(25786009)(99286004)(86362001)(76176011)(54906003)(4326008)(118296001)(66946007)(66556008)(66446008)(6506007)(64756008)(66476007)(316002)(6246003)(6306002)(6512007)(2351001)(256004)(2616005)(102836004)(5640700003)(486006)(6486002)(2501003)(36756003)(6436002)(446003)(11346002)(229853002)(478600001)(6916009)(5660300002)(3846002)(6116002)(186003)(2906002)(305945005)(14454004)(966005)(7736002)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR03MB5070;H:MN2PR03MB5117.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yG03tAA4sSiQZuMtsww6czSqSxKONjWs3C92JAApJ+SFnscrJ4I7pSqujXt/rvAVdm1vY3KH7pA3KFrRDDhQSbH5bmsNLOJz2VO4wNsARFPHL5hSQoGP6XL5G6gydjOmLsZ2npeRr1RNJMk98PtduWZVrAC3ginM5z1xGDvDUiGpw1Xn3B2qanLGkNPIKEyi3+KuZF+O7qHVyoHr4xNtn1zvQ+ep3uMvrE0VYceO4Er1pVTr0ItGlXPE4lSdMzAmc07h6Tt8ROmi472Gcd7yisRhEHX01eX+mRzQzJI7NS8QBP7eptXbu74blQw0xoq5Os+IyRquLHmJk2LSGwp/xgVcoL+hoKyhXz/d9p5w0jtymDWu62gmHq5EgP9QXiBJ21dRKbo1A8cHHcwUxWKQprCqtvw460YLxLN0DSv1Dibhm4Zw3WyT+EBrIWxkZSrjSYxmpsRPAjBRoSdivEVG2w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <89C8A2A4DB149E4CB73324AA1AAA5025@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc6af1e-e272-4921-78bb-08d7474a7c23
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 15:09:12.9564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /e+dLQYP6X1F5jbhAzRLLvu8mqVU1x8AzJgHhnErir7PDjCLhhfa6xf5MekXbIsNe1MMEI0G/YmGyS5zWsUbkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5070
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-02_07:2019-10-01,2019-10-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910020139
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

T24gV2VkLCAyMDE5LTEwLTAyIGF0IDA5OjE5IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
DQo+IE9uIFR1ZSwgU2VwIDI0LCAyMDE5IGF0IDAyOjQ5OjQ1UE0gKzAyMDAsIE51bm8gU8OhIHdy
b3RlOg0KPiA+IERvY3VtZW50IHRoZSBMVEMyOTQ3IGRldmljZSBkZXZpY2V0cmVlIGJpbmRpbmdz
Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+
DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9od21vbi9hZGksbHRjMjk0Ny55YW1sICAgICAg
ICAgICB8IDEwMQ0KPiA+ICsrKysrKysrKysrKysrKysrKw0KPiA+ICBNQUlOVEFJTkVSUyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDEwMiBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9hZGksbHRjMjk0Ny55YW1sDQo+ID4g
DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2h3bW9uL2FkaSxsdGMyOTQ3LnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9od21vbi9hZGksbHRjMjk0Ny55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjJlYTAxODc0MjFkNA0KPiA+IC0tLSAvZGV2L251bGwN
Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vYWRpLGx0
YzI5NDcueWFtbA0KPiA+IEBAIC0wLDAgKzEsMTAxIEBADQo+IA0KPiBNaXNzaW5nIGxpY2Vuc2Uu
IFBsZWFzZSBtYWtlIG5ldyBiaW5kaW5ncyAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLQ0KPiBDbGF1
c2UpDQoNCmFjay4NCg0KPiA+ICslWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDogDQo+ID4g
aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvYmluZGluZ3MvaHdtb24vYWRpLGx0YzI5NDcu
eWFtbCMNCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9j
b3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogQW5hbG9nIERldmljZXMgTFRDMjk0NyBoaWdo
IHByZWNpc2lvbiBwb3dlciBhbmQgZW5lcmd5DQo+ID4gbW9uaXRvcg0KPiA+ICsNCj4gPiArbWFp
bnRhaW5lcnM6DQo+ID4gKyAgLSBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPg0KPiA+ICsN
Cj4gPiArZGVzY3JpcHRpb246IHwNCj4gPiArICBBbmFsb2cgRGV2aWNlcyBMVEMyOTQ3IGhpZ2gg
cHJlY2lzaW9uIHBvd2VyIGFuZCBlbmVyZ3kgbW9uaXRvcg0KPiA+IG92ZXIgU1BJIG9yIEkyQy4N
Cj4gPiArDQo+ID4gKyAgDQo+ID4gaHR0cHM6Ly93d3cuYW5hbG9nLmNvbS9tZWRpYS9lbi90ZWNo
bmljYWwtZG9jdW1lbnRhdGlvbi9kYXRhLXNoZWV0cy9MVEMyOTQ3LnBkZg0KPiA+ICsNCj4gPiAr
cHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgZW51bToNCj4gPiArICAg
ICAgLSBhZGksbHRjMjk0Nw0KPiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBtYXhJdGVtczog
MQ0KPiA+ICsNCj4gPiArICBjbG9ja3M6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAg
ICAgVGhlIExUQzI5NDcgdXNlcyBlaXRoZXIgYSB0cmltbWVkIGludGVybmFsIG9zY2lsbGF0b3Ig
b3IgYW4NCj4gPiBleHRlcm5hbCBjbG9jaw0KPiA+ICsgICAgICBhcyB0aGUgdGltZSBiYXNlIGZv
ciBkZXRlcm1pbmluZyB0aGUgaW50ZWdyYXRpb24gcGVyaW9kIHRvDQo+ID4gcmVwcmVzZW50IHRp
bWUsDQo+ID4gKyAgICAgIGNoYXJnZSBhbmQgZW5lcmd5LiBXaGVuIGFuIGV4dGVybmFsIGNsb2Nr
IGlzIHVzZWQsIHRoaXMNCj4gPiBwcm9wZXJ0eSBtdXN0IGJlDQo+ID4gKyAgICAgIHNldCBhY2Nv
cmRpbmdseS4NCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGFkaSxhY2N1bXVs
YXRvci1jdGwtcG9sOg0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgIFRoaXMgcHJv
cGVydHkgY29udHJvbHMgdGhlIHBvbGFyaXR5IG9mIGN1cnJlbnQgdGhhdCBpcw0KPiA+IGFjY3Vt
dWxhdGVkIHRvDQo+ID4gKyAgICAgIGNhbGN1bGF0ZSBjaGFyZ2UgYW5kIGVuZXJneSBzbyB0aGF0
LCB0aGV5IGNhbiBiZSBvbmx5DQo+ID4gYWNjdW11bGF0ZWQgZm9yDQo+ID4gKyAgICAgIHBvc2l0
aXZlIGN1cnJlbnQgZm9yIGV4YW1wbGUuIFNpbmNlIHRoZXJlIGFyZSB0d28gc2V0cyBvZg0KPiA+
IHJlZ2lzdGVycyBmb3INCj4gPiArICAgICAgdGhlIGFjY3VtdWxhdGVkIHZhbHVlcywgdGhpcyBl
bnRyeSBjYW4gYWxzbyBoYXZlIHR3byBpdGVtcw0KPiA+IHdoaWNoIHNldHMNCj4gPiArICAgICAg
ZW5lcmd5MS9jaGFyZ2UxIGFuZCBlbmVyZ3kyL2NoYXJnZXIyIHJlc3BlY3RpdmVseS4gQ2hlY2sN
Cj4gPiB0YWJsZSAxMiBvZiB0aGUNCj4gPiArICAgICAgZGF0YXNoZWV0IGZvciBtb3JlIGluZm9y
bWF0aW9uIG9uIHRoZSBzdXBwb3J0ZWQgb3B0aW9ucy4NCj4gPiArICAgIGFsbE9mOg0KPiA+ICsg
ICAgICAtICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMi1hcnJh
eQ0KPiA+ICsgICAgICAtIGVudW06IFswLCAxLCAyLCAzXQ0KPiA+ICsgICAgICAtIG1pbkl0ZW1z
OiAyDQo+ID4gKyAgICAgIC0gbWF4SXRlbXM6IDINCj4gPiArICAgIGRlZmF1bHQ6IFswLCAwXQ0K
PiANCj4gVGhpcyBzaG91bGQgYmU6DQo+IA0KPiBhbGxPZjoNCj4gICAtICRyZWY6IC4uLg0KPiBp
dGVtczoNCj4gICBlbnVtOiBbMCwgMSwgMiwgM10NCj4gICBkZWZhdWx0OiAwDQo+IG1pbkl0ZW1z
OiAyDQo+IG1heEl0ZW1zOiAyDQoNCkkgd2FzIGV4cGVjdGluZyB0aGlzIGFscmVhZHkuIFdoZW4g
dXBzdHJlYW1pbmcgYW5vdGhlciBkZXZpY2UsIEkNCnJlYWxpemVkIHNvbWUgZXJyb3JzIHdpdGgg
YG1ha2UgZHRfYmluZGluZ19jaGVja2Agd2hlbiBldmFsdWF0aW5nIHRoZQ0KZXhhbXBsZS4gSnVz
dCBmb3IgbXkgdW5kZXJzdGFuZGluZywgaXMgdGhpcyBhbHNvIGluY29ycmVjdD8NCg0KYWxsT2Y6
DQogIC0gJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLWFycmF5
DQogIC0gbWluSXRlbXM6IDINCiAgICBtYXhJdGVtczogMg0KICAgIGl0ZW1zOg0KICAgICAgZW51
bTogWzAsIDEsIDIsIDNdDQogICAgZGVmYXVsdDogMA0KDQpJIHVzZWQgYSBzaW1pbGFyIHBhdHRl
cm4gaW4gYW5vdGhlciBkZXZpY2UgdGhhdCBpcyBhbHNvIHdhaXRpbmcgZm9yDQpyZXZpZXcgOiku
DQo+ID4gKw0KPiA+ICsgIGFkaSxhY2N1bXVsYXRpb24tZGVhZGJhbmQtbWljcm9hbXA6DQo+ID4g
KyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgVGhpcyBwcm9wZXJ0eSBjb250cm9scyB0aGUg
QWNjdW11bGF0aW9uIERlYWQgYmFuZCB3aGljaA0KPiA+IGFsbG93cyB0byBzZXQgdGhlDQo+ID4g
KyAgICAgIGxldmVsIG9mIGN1cnJlbnQgYmVsb3cgd2hpY2ggbm8gYWNjdW11bGF0aW9uIHRha2Vz
IHBsYWNlLg0KPiA+ICsgICAgYWxsT2Y6DQo+ID4gKyAgICAgIC0gJHJlZjogL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQo+ID4gKyAgICAgIC0gbWF4aW11bTogMjU1DQo+
IA0KPiBtYXhpbXVtIHNob3VsZCBiZSBhdCBzYW1lIGluZGVudCBhcyBhbGxPZi4gT3IgZGVmYXVs
dCBzaG91bGQgYmUgYXQNCj4gdGhlIA0KPiBzYW1lIGxldmVsIGFzIG1heGltdW0gKHVuZGVyIGEg
c2luZ2xlICctJyBsaXN0IGVudHJ5KS4NCg0KU28gaXQgc2hvdWxkIGJlPw0KDQphbGxPZjoNCiAg
LSAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCiAgLSBtYXhp
bXVtOiAyNTUNCiAgICBkZWZhdWx0OiAwDQoNCj4gPiArICAgIGRlZmF1bHQ6IDANCj4gPiArDQo+
ID4gKyAgYWRpLGdwaW8tb3V0LXBvbDoNCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAg
ICBUaGlzIHByb3BlcnR5IGNvbnRyb2xzIHRoZSBHUElPIHBvbGFyaXR5LiBTZXR0aW5nIGl0IHRv
IG9uZQ0KPiA+IG1ha2VzIHRoZSBHUElPDQo+ID4gKyAgICAgIGFjdGl2ZSBoaWdoLCBzZXR0aW5n
IGl0IHRvIHplcm8gbWFrZXRzIGl0IGFjdGl2ZSBsb3cuIFdoZW4NCj4gPiB0aGlzIHByb3BlcnR5
DQo+ID4gKyAgICAgIGlzIHByZXNlbnQsIHRoZSBHUElPIGlzIGF1dG9tYXRpY2FsbHkgY29uZmln
dXJlZCBhcyBvdXRwdXQNCj4gPiBhbmQgc2V0IHRvDQo+ID4gKyAgICAgIGNvbnRyb2wgYSBmYW4g
YXMgYSBmdW5jdGlvbiBvZiBtZWFzdXJlZCB0ZW1wZXJhdHVyZS4NCj4gPiArICAgIGFsbE9mOg0K
PiA+ICsgICAgICAtICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQz
Mg0KPiA+ICsgICAgICAtIGVudW06IFswLCAxXQ0KPiA+ICsgICAgZGVmYXVsdDogMA0KPiANCj4g
U2FtZSBoZXJlLg0KPiANCj4gPiArDQo+ID4gKyAgYWRpLGdwaW8taW4tYWNjdW06DQo+ID4gKyAg
ICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgV2hlbiBzZXQsIHRoaXMgcHJvcGVydHkgc2V0cyB0
aGUgR1BJTyBhcyBpbnB1dC4gSXQgaXMgdGhlbg0KPiA+IHVzZWQgdG8gY29udHJvbA0KPiA+ICsg
ICAgICB0aGUgYWNjdW11bGF0aW9uIG9mIGNoYXJnZSwgZW5lcmd5IGFuZCB0aW1lLiBUaGlzIGZ1
bmN0aW9uDQo+ID4gY2FuIGJlDQo+ID4gKyAgICAgIGVuYWJsZWQvY29uZmlndXJlZCBzZXBhcmF0
ZWx5IGZvciBlYWNoIG9mIHRoZSB0d28gc2V0cyBvZg0KPiA+IGFjY3VtdWxhdGlvbg0KPiA+ICsg
ICAgICByZWdpc3RlcnMuIENoZWNrIHRhYmxlIDEzIG9mIHRoZSBkYXRhc2hlZXQgZm9yIG1vcmUN
Cj4gPiBpbmZvcm1hdGlvbiBvbiB0aGUNCj4gPiArICAgICAgc3VwcG9ydGVkIG9wdGlvbnMuIFRo
aXMgcHJvcGVydHkgY2Fubm90IGJlIHVzZWQgdG9nZXRoZXINCj4gPiB3aXRoDQo+ID4gKyAgICAg
IGFkaSxncGlvLW91dC1wb2wuDQo+ID4gKyAgICBhbGxPZjoNCj4gPiArICAgICAgLSAkcmVmOiAv
c2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzItYXJyYXkNCj4gPiArICAgICAg
LSBlbnVtOiBbMCwgMSwgMl0NCj4gPiArICAgICAgLSBtaW5JdGVtczogMg0KPiA+ICsgICAgICAt
IG1heEl0ZW1zOiAyDQo+ID4gKyAgICBkZWZhdWx0OiBbMCwgMF0NCj4gDQo+IFNpbWlsYXIgaGVy
ZS4NCj4gDQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiAr
ICAtIHJlZw0KPiA+ICsNCj4gPiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsg
ICAgc3BpMCB7DQo+IA0KPiBKdXN0ICdzcGknDQoNCmFjay4NCg0KPiA+ICsgICAgICAgICAgICNh
ZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0K
PiA+ICsNCj4gPiArICAgICAgICAgICBsdGMyOTQ3X3NwaTogbHRjMjk0N0AwIHsNCj4gPiArICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYWRpLGx0YzI5NDciOw0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgcmVnID0gPDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgLyogYWNjdW11
bGF0aW9uIHRha2VzIHBsYWNlIGFsd2F5cyBmb3INCj4gPiBlbmVyZzEvY2hhcmdlMS4gKi8NCj4g
PiArICAgICAgICAgICAgICAgICAgIC8qIGFjY3VtdWxhdGlvbiBvbmx5IG9uIHBvc2l0aXZlIGN1
cnJlbnQgZm9yDQo+ID4gZW5lcmd5Mi9jaGFyZ2UyLiAqLw0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgYWRpLGFjY3VtdWxhdG9yLWN0bC1wb2wgPSA8MCAxPjsNCj4gPiArICAgICAgICAgICB9Ow0K
PiA+ICsgICAgfTsNCj4gPiArLi4uDQo+ID4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJ
TlRBSU5FUlMNCj4gPiBpbmRleCA4ODlmMzhjMWM5MzAuLjgyMGJkZGUyMDQ0YiAxMDA2NDQNCj4g
PiAtLS0gYS9NQUlOVEFJTkVSUw0KPiA+ICsrKyBiL01BSU5UQUlORVJTDQo+ID4gQEAgLTk1MDUs
NiArOTUwNSw3IEBAIEY6CWRyaXZlcnMvaHdtb24vbHRjMjk0Ny1jb3JlLmMNCj4gPiAgRjoJZHJp
dmVycy9od21vbi9sdGMyOTQ3LXNwaS5jDQo+ID4gIEY6CWRyaXZlcnMvaHdtb24vbHRjMjk0Ny1p
MmMuYw0KPiA+ICBGOglkcml2ZXJzL2h3bW9uL2x0YzI5NDcuaA0KPiA+ICtGOglEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vYWRpLGx0YzI5NDcueWFtbA0KPiA+ICANCj4g
PiAgTFRDNDMwNiBJMkMgTVVMVElQTEVYRVIgRFJJVkVSDQo+ID4gIE06CU1pY2hhZWwgSGVubmVy
aWNoIDxtaWNoYWVsLmhlbm5lcmljaEBhbmFsb2cuY29tPg0KPiA+IC0tIA0KPiA+IDIuMjMuMA0K
PiA+IA0KDQo=
