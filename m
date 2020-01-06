Return-Path: <SRS0=XbaA=23=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D5BC33C8C
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jan 2020 12:14:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E574E2072E
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jan 2020 12:14:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=Mellanox.com header.i=@Mellanox.com header.b="QEKlLkM4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgAFMOW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jan 2020 07:14:22 -0500
Received: from mail-db8eur05on2089.outbound.protection.outlook.com ([40.107.20.89]:6041
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725787AbgAFMOW (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 6 Jan 2020 07:14:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGoc+l9uSyLBK7uJRXa3RPT74MUZKgyqv/T3gtFdHyh1klfoZUfWuQmIu/dAl6bie/S3YaNmhjeg/uzP30o10fqDUnThcGbw1bWCPtLwWFc8z07QcV/+4m0IxQsVu66zyBSty6DK4tUtouwDL6hjuLcUG8GMNhWODipolUFzTAeSHPiETtot4I+BR0jSqqlaVDklgGL4CiYK0fnRl7D+2KywD+POeXuu5g2XtM6T+w1CPmrTCjUkaWilhEDepzlIhOABydpxMD6Sq0Lh3Z/ImzyKYXX7wmlSFQTc8uezOVjDdOmQuySlhhMffQFaJF6tKRilfuD64vwcbDNOa1DBZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omlx2rmWvqG47SVw3mW873i9S1uAX4bV0/3W5Ez4140=;
 b=Uohm4KMB162cLfWpROcsyMyOAmf1dhVdLsRe/UricTAOZjnVkDKVkgV4tDgZssA0XRXVqsyN1hGyLsPWOM1CvovcCaES4ljPJF42y+z/UY+AX9DihJMo8z6LKu2DrUbaq5zvykeBJBcbnTvrJFmj8W96selmg3A94e4fbanvNV6eFcd7QByd/gqUPvSr7pOwS7sWXQaiHl0sS+0ODrfqR9mbUUL13BMpOQji2P/8ppGkr0YX/dKx5YHkxfPyGPktaxi4KnaK81b9LSiA3DIZsSTcIXWQoLxYbS4piSPdgrXtACLbssvsJcA9ZKD5h41vXK2TcXL1c9TWEJ8GXx3ivg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omlx2rmWvqG47SVw3mW873i9S1uAX4bV0/3W5Ez4140=;
 b=QEKlLkM4ILLCuijYzCtqcqBRrb5OjONbH5GEq5j/FVL5kQYDoVP4WZyRgHidYWzOrr3qPTdO5bvKmuDVfiOHHpddgtCOrkNJoUct5U+kDU9VuFu0mjnuFokmL7BnZ45fR8o5DFrgTQ2eSwzIv6jceDcBKt6/rn8kWGWAWTPpaIk=
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com (20.177.196.210) by
 AM6PR05MB5078.eurprd05.prod.outlook.com (20.177.36.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12; Mon, 6 Jan 2020 12:14:19 +0000
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::44ac:7bce:8f7c:3e6d]) by AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::44ac:7bce:8f7c:3e6d%3]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 12:14:19 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "vijaykhemka@fb.com" <vijaykhemka@fb.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [RFC PATCH hwmon-next v1 2/5] hwmon: (pmbus/core) Add support for
 Intel IMVP9 specification
Thread-Topic: [RFC PATCH hwmon-next v1 2/5] hwmon: (pmbus/core) Add support
 for Intel IMVP9 specification
Thread-Index: AQHVw7caoz8ATu4i5UC27i3RYk3A16fcQjwAgAEgd0A=
Date:   Mon, 6 Jan 2020 12:14:19 +0000
Message-ID: <AM6PR05MB522432BAECB79FB87D6DDA2DA23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <20200105105833.30196-1-vadimp@mellanox.com>
 <20200105105833.30196-3-vadimp@mellanox.com>
 <0be6b849-939d-49a7-476e-62bf201fdd93@roeck-us.net>
In-Reply-To: <0be6b849-939d-49a7-476e-62bf201fdd93@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6c767b89-ef41-47bb-38b4-08d792a1f517
x-ms-traffictypediagnostic: AM6PR05MB5078:
x-microsoft-antispam-prvs: <AM6PR05MB507889BE6EBCA03D73C5B9E4A23C0@AM6PR05MB5078.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(199004)(189003)(13464003)(81156014)(86362001)(4326008)(7696005)(81166006)(33656002)(71200400001)(2906002)(316002)(110136005)(478600001)(55016002)(8936002)(26005)(9686003)(6506007)(53546011)(66476007)(66556008)(64756008)(66446008)(186003)(54906003)(66946007)(5660300002)(76116006)(8676002)(52536014);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB5078;H:AM6PR05MB5224.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tj3/7DbeugzwmDfdA30f9wrML0ahooKgkJefJbwPVLXyLPeBbcGB6I30DmXwBK3Zl93IR3pmFQsmfqLay/c9ZggOSWytOflvnTaadbkcJnnijgadRB/EhHrrLqpZrMK0xPhlcahEop75XEAyHM7+aE/oNx39dTvT6vtUHfIQ24IrJ1dDM3aIUUI2LUuZDhspS3R4Pds+QOzrcQ6gY+bbN1ae+htNtTR1CPcmGOXMKrpPIDSTbqP79eEZ5MWNMzbJrP/Ex/2Lyj4uH0FWymCqO7nhBBdGBCFTEBi54bstZ2uR3Rw8UgmAMa7QGqwUfR4sg5tH5nUR10yy3ZfFiyVR3Q40q20KtMYXDe/P6eTDyrq9mz3FHeDkQNyZiWxoLKItEQ9/2xmb3QbUPb6xPyYvP8SmHhMDY5oqgVdEw8Cd+oW3irVrHJBfi/34LD/I/0ZRfS7mdF6imY5q+ba54CH9aCAEEpLy3XQpZVmsoFi9uAt/fMNZVhZbDxjmcHHq6YV5
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c767b89-ef41-47bb-38b4-08d792a1f517
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 12:14:19.4864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sExfHYb2nKP2hi+kE3PzQYo6E/iMopf9hH7AmMWza0gKZBneIxaaDmARKgTEnjJzx9/gKLs5f07oD9dcT0AVbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5078
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayA8
Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+IFNlbnQ6IFN1
bmRheSwgSmFudWFyeSAwNSwgMjAyMCA2OjI2IFBNDQo+IFRvOiBWYWRpbSBQYXN0ZXJuYWsgPHZh
ZGltcEBtZWxsYW5veC5jb20+OyByb2JoK2R0QGtlcm5lbC5vcmc7DQo+IHZpamF5a2hlbWthQGZi
LmNvbQ0KPiBDYzogbGludXgtaHdtb25Admdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCBod21vbi1uZXh0IHYxIDIvNV0g
aHdtb246IChwbWJ1cy9jb3JlKSBBZGQgc3VwcG9ydA0KPiBmb3IgSW50ZWwgSU1WUDkgc3BlY2lm
aWNhdGlvbg0KPiANCj4gT24gMS81LzIwIDI6NTggQU0sIFZhZGltIFBhc3Rlcm5hayB3cm90ZToN
Cj4gPiBFeHRlbmQgInZybV92ZXJzaW9uIiB3aXRoIHN1cHBvcnQgZm9yIEludGVsIElNVlA5IHNw
ZWNpZmljYXRpb24uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBWYWRpbSBQYXN0ZXJuYWsgPHZh
ZGltcEBtZWxsYW5veC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2h3bW9uL3BtYnVzL3Bt
YnVzLmggICAgICB8IDIgKy0NCj4gPiAgIGRyaXZlcnMvaHdtb24vcG1idXMvcG1idXNfY29yZS5j
IHwgNCArKysrDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vcG1idXMvcG1idXMu
aCBiL2RyaXZlcnMvaHdtb24vcG1idXMvcG1idXMuaA0KPiA+IGluZGV4IDJiZGViZDBlYTljMS4u
YzZiMjQwMWYxYzZjIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaHdtb24vcG1idXMvcG1idXMu
aA0KPiA+ICsrKyBiL2RyaXZlcnMvaHdtb24vcG1idXMvcG1idXMuaA0KPiA+IEBAIC0zNzcsNyAr
Mzc3LDcgQEAgZW51bSBwbWJ1c19zZW5zb3JfY2xhc3NlcyB7DQo+ID4gICAjZGVmaW5lIFBNQlVT
X1BBR0VfVklSVFVBTAlCSVQoMzEpDQo+ID4NCj4gPiAgIGVudW0gcG1idXNfZGF0YV9mb3JtYXQg
eyBsaW5lYXIgPSAwLCBkaXJlY3QsIHZpZCB9OyAtZW51bQ0KPiA+IHZybV92ZXJzaW9uIHsgdnIx
MSA9IDAsIHZyMTIsIHZyMTMgfTsNCj4gPiArZW51bSB2cm1fdmVyc2lvbiB7IHZyMTEgPSAwLCB2
cjEyLCB2cjEzLCBpbXZwOSB9Ow0KPiA+DQo+ID4gICBzdHJ1Y3QgcG1idXNfZHJpdmVyX2luZm8g
ew0KPiA+ICAgCWludCBwYWdlczsJCS8qIFRvdGFsIG51bWJlciBvZiBwYWdlcyAqLw0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9uL3BtYnVzL3BtYnVzX2NvcmUuYw0KPiA+IGIvZHJpdmVy
cy9od21vbi9wbWJ1cy9wbWJ1c19jb3JlLmMNCj4gPiBpbmRleCA5ODIyNmU4NGIzNTEuLmE5Yjdi
NTU1Y2Y2ZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2h3bW9uL3BtYnVzL3BtYnVzX2NvcmUu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvaHdtb24vcG1idXMvcG1idXNfY29yZS5jDQo+ID4gQEAgLTcw
OSw2ICs3MDksMTAgQEAgc3RhdGljIGxvbmcgcG1idXNfcmVnMmRhdGFfdmlkKHN0cnVjdCBwbWJ1
c19kYXRhDQo+ICpkYXRhLA0KPiA+ICAgCQlpZiAodmFsID49IDB4MDEpDQo+ID4gICAJCQlydiA9
IDUwMCArICh2YWwgLSAxKSAqIDEwOw0KPiA+ICAgCQlicmVhazsNCj4gPiArCWNhc2UgaW12cDk6
DQo+ID4gKwkJaWYgKHZhbCA+PSAweDAxKQ0KPiA+ICsJCQlydiA9IDIwMCArICh2YWwgLSAxKSAq
IDEwOw0KPiA+ICsJCWJyZWFrOw0KPiANCj4gVGhlcmUgaXMgYWxzbyBJbnRlbCBWUjE0LCBhbmQg
dGhlcmUgaXMgc29tZSBpbmRpY2F0aW9uIHRoYXQgaXQgaXMgaWRlbnRpY2FsIHRvIGltdnA5Lg0K
PiBJZiB0aGF0IGlzIHRoZSBjYXNlLCBJIHdvdWxkIHByZWZlciB0byB1c2UgZXhpc3RpbmcgdGVy
bWlub2xvZ3kuDQo+IFVuZm9ydHVuYXRlbHksIEludGVsIGlzIGEgYml0IGNsb3NlLWxpcHBlZCBh
Ym91dCBib3RoLiBJZiB5b3UgaGF2ZSBhY2Nlc3MgdG8NCj4gZG9jdW1lbnRhdGlvbiwgY2FuIHlv
dSBjaGVjayA/DQoNCkhpIEd1ZW50ZXIsDQoNCkl0J3MgcmVhbGx5IHRyaWNreSB0byBmaW5kIHNv
bWUgY2xlYXIgSW50ZWwgZG9jIG9uIGZvciB0aGF0Lg0KSSBjaGVja2VkIGl0IHdpdGggb3VycyBh
bmQgSW5maW5lb24gSFcgZ3V5cy4NCg0KSU1WUDkgaGFzIGEgZGlmZmVyZW50IFZJRCB0YWJsZSB0
aGFuIFZSMTNIQy9WUjE0Lg0KDQpGb3IgdjE0IHdlIGNhbiB1c2UgdGhlIHNhbWUgZm9ybXVsYSBh
cyB3ZSBhcmUgdXNpbmcgZm9yIHZyMTMuDQoNCklNVlA5IGlzIGRpZmZlcmVudCBiZWNhdXNlIGl0
IGhhcyBhIGRpZmZlcmVudCB2b2x0YWdlIHJhbmdlLg0KDQpUaGUgNW1WIFZJRCB0YWJsZSBvZiBW
UjE0IHN1cHBvcnRzIGEgdm9sdGFnZSByYW5nZSBmcm9tDQowLjI1ViB0byAxLjUyVi4NClRoZSAx
MG1WIFZJRCB0YWJsZSBvZiBWUjE0IHN1cHBvcnRzIGEgdm9sdGFnZSByYW5nZSBmcm9tDQowLjVW
IHQwIDMuMDRWLg0KDQpUaGUgSU1WUDkgVklEIHRhYmxlIGFsc28gaGFzIGEgMTBtViBzdGVwLCBi
dXQgdGhlIHZvbHRhZ2UgcmFuZ2UNCmlzIGZyb20gMC4yIHRvIDIuNzRWLg0KDQpUaGFua3MsDQpW
YWRpbS4NCg0KPiANCj4gVGhhbmtzLA0KPiBHdWVudGVyDQo+IA0KPiA+ICAgCX0NCj4gPiAgIAly
ZXR1cm4gcnY7DQo+ID4gICB9DQo+ID4NCg0K
