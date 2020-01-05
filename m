Return-Path: <SRS0=lfVP=22=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942D1C33C8C
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 16:44:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3A6022077B
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 16:44:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=Mellanox.com header.i=@Mellanox.com header.b="cnuZaxs/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgAEQo3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jan 2020 11:44:29 -0500
Received: from mail-eopbgr00050.outbound.protection.outlook.com ([40.107.0.50]:44674
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726260AbgAEQo3 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 5 Jan 2020 11:44:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGjIbKYya/sGGEdFgLgfyjUFVzdpVjPVTnD1Wj9JzwNfJj2vx3jOPfqTP/ct9VUs2PsKusQ81zmReu9EojS3nnhW0I+om4ZL1AIchzvYWFBgh37lxunIXPS56I7lL2O0MM8W8uuBm4WV2074HWd8kyqiay3E+BwxDpg6HukTSbOAF0e5+CgKPi0+222q2+p2MoUCAMxqBdCPvFNO9c283nuIkAX8W2aQ/PK8yIP2YzG3mVZMXHCH/B0mNHyth1YhH50ljaOkCThHfIvHYUdUJTN3gJVq+7oPqjFnhY/tqEqf8w0/+1i0rACXiQM1eTk8x4UpkvsfLSvZtUrNxkFP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGqmw+9HtyH42UYUn5yzS3oDCuMZRjTZuF/PBk+x9UE=;
 b=l5AiskCGHHm4ctTqW3tyq31m4HA8mOf86PB6hSTKQH+lLDLKonZs53I3odWd4Gkq4ZhsKi5k9911n8L/DPnxU+joxCmbxuM/6xTZ4K0/bJJ4SaNpmVI5Nhr+fp20NsEeda8p4ssRtso+IME0M8EILdQlXH5Va6DNUazBDYoHbeeJ20mr1pUzpGKgfDiB+szqqtHWuE6PR1Cn61Pdq9TKieFzpR9tZ9X6XIYkFcy8W7l3vRw8E/i3N5f7xqI62mr0a3mDNAkspizLpQInJNwD/4rc8dPeL6dc/IzmSWhSkAysOxzhQ4HSik7a5laPx1dnPRLpGcE+Kp88oJVc5Oddgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGqmw+9HtyH42UYUn5yzS3oDCuMZRjTZuF/PBk+x9UE=;
 b=cnuZaxs/KANCTPK6wCXzRvuvUrA4wjdyC+nAO5AQEGsEEhh0cZP4PuXIoRwjMQUzkOWvpRYhYM5+fBuhQRHf1Q8sXujyCOPtcIxMX4rXQNfX4dh3smkwFwN9rbDSzzUW4v+1ncubaPOwvs6AvDbpwRFiQmRYnLnz0NUabIdYqas=
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com (20.177.196.210) by
 AM6PR05MB5942.eurprd05.prod.outlook.com (20.179.1.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11; Sun, 5 Jan 2020 16:44:25 +0000
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::44ac:7bce:8f7c:3e6d]) by AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::44ac:7bce:8f7c:3e6d%3]) with mapi id 15.20.2602.012; Sun, 5 Jan 2020
 16:44:25 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "vijaykhemka@fb.com" <vijaykhemka@fb.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
 device list supported by driver
Thread-Topic: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
 device list supported by driver
Thread-Index: AQHVw7ccUo77+1Sy70mxGafA8mf8l6fcO+2AgAAG1qA=
Date:   Sun, 5 Jan 2020 16:44:25 +0000
Message-ID: <AM6PR05MB5224F444CBAC5A0503AFBB83A23D0@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <20200105105833.30196-1-vadimp@mellanox.com>
 <20200105105833.30196-6-vadimp@mellanox.com>
 <567ebd26-529e-6b2a-2f07-cfaf0f2217a9@roeck-us.net>
In-Reply-To: <567ebd26-529e-6b2a-2f07-cfaf0f2217a9@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d085004f-6ab0-4c7f-3f59-08d791fe8621
x-ms-traffictypediagnostic: AM6PR05MB5942:
x-microsoft-antispam-prvs: <AM6PR05MB59420B4CA5C9667302B8853AA23D0@AM6PR05MB5942.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 027367F73D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(199004)(189003)(13464003)(2906002)(86362001)(110136005)(55016002)(52536014)(8936002)(54906003)(478600001)(9686003)(8676002)(316002)(81156014)(81166006)(53546011)(6506007)(7696005)(66446008)(66476007)(186003)(33656002)(4326008)(26005)(71200400001)(5660300002)(66556008)(66946007)(64756008)(76116006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB5942;H:AM6PR05MB5224.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: abCznKD28NJ701iOij0ekbuyY95/8LPe0UPRsD7ylp7FsKnkzyduTWVOn69TdyJ/qq00vvvJh6ZXy4z8zPi39uYyUp92Cy1JGIvNSOGWoNZsKr2j/6O/SghMgE0p70x/d9vUOA77Wq2Vo+AFrtQltT5SLWbjR6xxlYgIzU58qeajBTc65En66TPjoJEQtO9704V073Z24/SWXOZjjlvqxU7RZCj0cj6XLNBaeU0Fd5XAzm8Jc7/1+giAvhV0sf0MCXjMbkVAYJMCRJ//Lc2br3eQmMBxJCZ6ViL0UsZFxuvPTjUoI70jFdNz3CJ3KLQHaB7+wru2ZRaRp8ZOm470OvWtvHmgvdyH4UmohcPaO8KBmdW7o7+27qMIueYE3wfARrxqsWnwu2BpNboAF33Lvp9tGVZOwXelgefP71V0Bo9Ez4pr5bkhlirg4aqm+qdCvdl6pkEMNo5OVpspmw+Xnyje8obLm0CZ6K1lHmCLUbdl7hvNS41WWSgxA0GsFsCj
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d085004f-6ab0-4c7f-3f59-08d791fe8621
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2020 16:44:25.2841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 81ujzwFpKUJWDOymnx3vnchn1D+a+jvXCQpqbY8AQL/3pt30pO/7s1tQvJis+8P0i3XF6Oce5/eAyCkec1fyVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5942
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayA8
Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+IFNlbnQ6IFN1
bmRheSwgSmFudWFyeSAwNSwgMjAyMCA2OjA0IFBNDQo+IFRvOiBWYWRpbSBQYXN0ZXJuYWsgPHZh
ZGltcEBtZWxsYW5veC5jb20+OyByb2JoK2R0QGtlcm5lbC5vcmc7DQo+IHZpamF5a2hlbWthQGZi
LmNvbQ0KPiBDYzogbGludXgtaHdtb25Admdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCBod21vbi1uZXh0IHYxIDUvNV0g
aHdtb246IChwbWJ1cy90cHM1MzY3OSkgRXh0ZW5kDQo+IGRldmljZSBsaXN0IHN1cHBvcnRlZCBi
eSBkcml2ZXINCj4gDQo+IE9uIDEvNS8yMCAyOjU4IEFNLCBWYWRpbSBQYXN0ZXJuYWsgd3JvdGU6
DQo+ID4gRXh0ZW5kcyBkcml2ZXIgd2l0aCBzdXBwb3J0IG9mIHRoZSBhZGRpdGlvbmFsIGRldmlj
ZXM6DQo+ID4gVGV4YXMgSW5zdHJ1bWVudHMgRHVhbCBjaGFubmVsIERDQVArIG11bHRpcGhhc2Ug
Y29udHJvbGxlcnM6IFRQUzUzNjg4LA0KPiA+IFNOMTkwNjAxNi4NCj4gPiBJbmZpbmVvbiBNdWx0
aS1waGFzZSBEaWdpdGFsIFZSIENvbnRyb2xsZXIgU2llcnJhIGRldmljZXMgWERQRTEyMjg2QywN
Cj4gPiBYRFBFMTIyODRDLCBYRFBFMTIyODNDLCBYRFBFMTIyNTRDIGFuZCBYRFBFMTIyNTBDLg0K
PiA+DQo+ID4gRXh0ZW5kIEtjb25maWcgd2l0aCBhZGRlZCBkZXZpY2VzLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbWVsbGFub3guY29tPg0KPiA+IC0t
LQ0KPiA+ICAgZHJpdmVycy9od21vbi9wbWJ1cy9LY29uZmlnICAgIHwgIDUgKysrLS0NCj4gPiAg
IGRyaXZlcnMvaHdtb24vcG1idXMvdHBzNTM2NzkuYyB8IDE0ICsrKysrKysrKysrKysrDQo+ID4g
ICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9wbWJ1cy9LY29uZmlnIGIvZHJpdmVycy9o
d21vbi9wbWJ1cy9LY29uZmlnDQo+ID4gaW5kZXggNTk4NTk5Nzk1NzFkLi45ZTNkMTk3ZDUzMjIg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9od21vbi9wbWJ1cy9LY29uZmlnDQo+ID4gKysrIGIv
ZHJpdmVycy9od21vbi9wbWJ1cy9LY29uZmlnDQo+ID4gQEAgLTIwMCwxMCArMjAwLDExIEBAIGNv
bmZpZyBTRU5TT1JTX1RQUzQwNDIyDQo+ID4gICAJICBiZSBjYWxsZWQgdHBzNDA0MjIuDQo+ID4N
Cj4gPiAgIGNvbmZpZyBTRU5TT1JTX1RQUzUzNjc5DQo+ID4gLQl0cmlzdGF0ZSAiVEkgVFBTNTM2
NzkiDQo+ID4gKwl0cmlzdGF0ZSAiVEkgVFBTNTM2NzksIFRQUzUzNjg4LCBTTjE5MDYwMTYsIElu
ZmluZW9uIFhEUEUxMjJ4eHgNCj4gZmFtaWx5Ig0KPiA+ICAgCWhlbHANCj4gPiAgIAkgIElmIHlv
dSBzYXkgeWVzIGhlcmUgeW91IGdldCBoYXJkd2FyZSBtb25pdG9yaW5nIHN1cHBvcnQgZm9yIFRJ
DQo+ID4gLQkgIFRQUzUzNjc5Lg0KPiA+ICsJICBUUFM1MzY3OSwgUFM1MzY4OCwgU04xOTA2MDE2
IGFuZCBJbmZpbmVvbiBYRFBFMTIyODZDLA0KPiBYRFBFMTIyODRDLA0KPiANCj4gVFBTNTM2ODgu
IEZvciB0aGUgb3RoZXJzLCBmb3Igc29tZSBJIGNhbid0IGV2ZW4gZGV0ZXJtaW5lIGlmIHRoZXkg
ZXhpc3QgaW4gdGhlDQo+IGZpcnN0IHBsYWNlIChlZyBTTjE5MDYwMTYsIFhQREUxMjI1MEMpIG9y
IGhvdyB0aGV5IHdvdWxkIGRpZmZlciBmcm9tIG90aGVyDQo+IHZhcmlhbnRzIChlZyBYUERFMTIy
ODRDIHZzLiBYUERFMTIyODRBKS4NCj4gQW5kIHdoeSB3b3VsZCB0aGV5IGFsbCB1c2UgdGhlIHNh
bWUgYml0IG1hcCBpbiB0aGUgVk9VVF9NT0RFIHJlZ2lzdGVyLCB0aGUNCj4gc2FtZSBudW1iZXIg
b2YgUE1CdXMgcGFnZXMgKHBoYXNlcyksIGFuZCB0aGUgc2FtZSBhdHRyaWJ1dGVzIGluIGVhY2gg
cGFnZSA/DQoNCkhpIEd1ZW50ZXIsDQoNClRoYW5rIHlvdSBmb3IgcmVwbHkuDQoNCk9uIG91ciBu
ZXcgc3lzdGVtIHdlIGhhdmUgZGV2aWNlIFhQREUxMjI4NEMgZXF1aXBwZWQuDQpJIHRlc3RlZCB0
aGlzIGRldmljZS4NCg0KSW5maW5lb24gZGF0YXNoZWV0IHJlZmVycyBhbGwgdGhlc2UgZGV2aWNl
IGFzIFhEUEUxMjJ4eEMNCmZhbWlseSBhbmQgaXQgZG9lc24ndCBzcGVjaWZ5IGFueSBkaWZmZXJl
bmNlcyBpbiByZWdpc3RlciBtYXANCmJldHdlZW4gdGhlc2UgZGV2aWNlcy4NClRvbW9ycm93IHdl
J2xsIGhhdmUgZ3V5cyBmcm9tIEluZmluZW9uIGluIG91ciBsYWIgYW5kIEknbGwNCnZlcmlmeSBp
ZiB0aGVyZSBpcyBhbnkgZGlmZmVyZW5jZS4NCklmIHllcywgSSdsbCBsZWF2ZSBvbmx5IFhQREUx
MjI4NEMuDQoNCj4gDQo+IFRoYW5rcywNCj4gR3VlbnRlcg0KPiANCj4gPiArCSAgWERQRTEyMjgz
QywgWERQRTEyMjU0QywgWERQRTEyMjUwQyBkZXZpY2VzLg0KPiA+DQo+ID4gICAJICBUaGlzIGRy
aXZlciBjYW4gYWxzbyBiZSBidWlsdCBhcyBhIG1vZHVsZS4gSWYgc28sIHRoZSBtb2R1bGUgd2ls
bA0KPiA+ICAgCSAgYmUgY2FsbGVkIHRwczUzNjc5Lg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2h3bW9uL3BtYnVzL3RwczUzNjc5LmMNCj4gPiBiL2RyaXZlcnMvaHdtb24vcG1idXMvdHBzNTM2
NzkuYyBpbmRleCA3Y2UyZmNhNGFjZGUuLmYzOGViMTE2NzM1Yg0KPiA+IDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvaHdtb24vcG1idXMvdHBzNTM2NzkuYw0KPiA+ICsrKyBiL2RyaXZlcnMvaHdt
b24vcG1idXMvdHBzNTM2NzkuYw0KPiA+IEBAIC04OSw2ICs4OSwxMyBAQCBzdGF0aWMgaW50IHRw
czUzNjc5X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50DQo+ID4gKmNsaWVudCwNCj4gPg0KPiA+ICAg
c3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkIHRwczUzNjc5X2lkW10gPSB7DQo+ID4g
ICAJeyJ0cHM1MzY3OSIsIDB9LA0KPiA+ICsJeyJ0cHM1MzY4OCIsIDB9LA0KPiA+ICsJeyJzbjE5
MDYwMTYiLCAwfSwNCj4gPiArCXsieGRwZTEyMjgzYyIsIDB9LA0KPiA+ICsJeyJ4ZHBlMTIyNTBj
IiwgMH0sDQo+ID4gKwl7InhkcGUxMjI1NGMiLCAwfSwNCj4gPiArCXsieGRwZTEyMjg0YyIsIDB9
LA0KPiA+ICsJeyJ4ZHBlMTIyODZjIiwgMH0sDQo+IA0KPiBBbHBoYWJldGljIG9yZGVyLCBwbGVh
c2UuDQo+IA0KPiA+ICAgCXt9DQo+ID4gICB9Ow0KPiA+DQo+ID4gQEAgLTk2LDYgKzEwMywxMyBA
QCBNT0RVTEVfREVWSUNFX1RBQkxFKGkyYywgdHBzNTM2NzlfaWQpOw0KPiA+DQo+ID4gICBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBfX21heWJlX3VudXNlZCB0cHM1MzY3OV9vZl9t
YXRjaFtdID0gew0KPiA+ICAgCXsuY29tcGF0aWJsZSA9ICJ0aSx0cHM1MzY3OSJ9LA0KPiA+ICsJ
ey5jb21wYXRpYmxlID0gInRpLHRwczUzNjg4In0sDQo+ID4gKwl7LmNvbXBhdGlibGUgPSAidGks
c24xOTA2MDE2In0sDQo+ID4gKwl7LmNvbXBhdGlibGUgPSAiaW5maW5lb24seGRwZTEyMjgzYyJ9
LA0KPiA+ICsJey5jb21wYXRpYmxlID0gImluZmluZW9uLHhkcGUxMjI1MGMifSwNCj4gPiArCXsu
Y29tcGF0aWJsZSA9ICJpbmZpbmVvbix4ZHBlMTIyNTRjIn0sDQo+ID4gKwl7LmNvbXBhdGlibGUg
PSAiaW5maW5lb24seGRwZTEyMjg0YyJ9LA0KPiA+ICsJey5jb21wYXRpYmxlID0gImluZmluZW9u
LHhkcGUxMjI4NmMifSwNCj4gPiAgIAl7fQ0KPiA+ICAgfTsNCj4gPiAgIE1PRFVMRV9ERVZJQ0Vf
VEFCTEUob2YsIHRwczUzNjc5X29mX21hdGNoKTsNCj4gPg0KDQo=
