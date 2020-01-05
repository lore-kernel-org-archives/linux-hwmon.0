Return-Path: <SRS0=lfVP=22=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8100FC3F68F
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 17:15:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4432C20866
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 17:15:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=Mellanox.com header.i=@Mellanox.com header.b="ArDX4N2t"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgAERPW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jan 2020 12:15:22 -0500
Received: from mail-eopbgr50058.outbound.protection.outlook.com ([40.107.5.58]:20546
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726368AbgAERPV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 5 Jan 2020 12:15:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lh0acTE/mUSJWKbmvNWMUBMeckDCArKoUBPMMgZNqupcjOdt/OWhsHwTN59NHPCEn7eCjFEnlqV9F0TlZ+yNp7HSwL69NERd4nM2pwdjPUA3nvjzLJCjSmNHxn56vJEWjxGKUGIn01fONxkNEcEBOfIMukN686aUL4r335J3dOwtVNwQn7UIfGphlBmOhGbOZdSz4esGHf+Fzrz70WEWGao6FCUZ8ofq8bykdXlK5Iddt4jz2I2CQFIYjvRZrN+L95beKYy4POXYejEI5BwS/EpvWwn0INn07wrwn2so/JW/WQWvSsPIz7IevHBtDZ4qq7rR5mp9jMuABKFlScq9zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5z2HDUCZKRBu+cdxcWPz1poDh9abrENnh/M6Z33WMSw=;
 b=mjRKokRjQrmLTctcKdocpUHJ+TCGuTAn+OzBpECFuNGkmJbMhffA0rjQ9f5AcaiRPSn2ctk9kqo2JzAtYm6vKsBMA6bDyhAMxDgKVrF7IPvw2oULumQqKmelz2HYxcXTforNCqlvrWTRuSUY1O+D2Ohc2Y1toJxUAIKOaEYir8ycM8//8WXbuhtxG2ExpOtMAR2ZZY6AepqjyUvctSaXUqyI6UWXBmjV9Y+ae8OS1IRAAOmAqNPPJwhPpUjNQqPBby2qBEAEojrEVPquPGQJXTUHI8DYFtJ8x4+LXhxX/TK+qXFQAIEwVwvXJaTBBBAo6WxvA2wW1LYY8ebljlWFMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5z2HDUCZKRBu+cdxcWPz1poDh9abrENnh/M6Z33WMSw=;
 b=ArDX4N2tPkA3wlcbSbf/AhAjQssE/rwgFcQHEhyPYxCcvBSHO0vnqksQ/IEZ/wYoMTcMGrqrF4adaYpMwK5BWO50C2+3/xbYdCFU3t8QoxIAqz5PGyFKh4TqhaZ0KNOPYTDIewzS6KyzyZGR/nCGlJkNOuKA5EL/DIm77qbewJs=
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com (20.177.196.210) by
 AM6PR05MB4917.eurprd05.prod.outlook.com (20.177.36.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11; Sun, 5 Jan 2020 17:15:16 +0000
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::44ac:7bce:8f7c:3e6d]) by AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::44ac:7bce:8f7c:3e6d%3]) with mapi id 15.20.2602.012; Sun, 5 Jan 2020
 17:15:16 +0000
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
Thread-Index: AQHVw7caoz8ATu4i5UC27i3RYk3A16fcQjwAgAALVmA=
Date:   Sun, 5 Jan 2020 17:15:16 +0000
Message-ID: <AM6PR05MB5224334DACD40B34C32DF1E7A23D0@AM6PR05MB5224.eurprd05.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: d9ad567d-708b-491c-988a-08d79202d588
x-ms-traffictypediagnostic: AM6PR05MB4917:
x-microsoft-antispam-prvs: <AM6PR05MB4917A49CBC5A36E4C50244BCA23D0@AM6PR05MB4917.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 027367F73D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(13464003)(189003)(199004)(76116006)(66946007)(66476007)(66446008)(66556008)(53546011)(6506007)(64756008)(86362001)(71200400001)(5660300002)(8936002)(52536014)(55016002)(9686003)(26005)(478600001)(7696005)(110136005)(8676002)(33656002)(186003)(4326008)(81156014)(81166006)(316002)(2906002)(54906003);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB4917;H:AM6PR05MB5224.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2f9+w3M+KwJS/RQG63Pl7dQddqViiIIC3aujqmAEDs6hxDW1S6yu3QfU7AduadMcqLau5mcszR/8l4D3C7auONTr14RkdheiLuFDqn1dxRnJx7ekh1bXbSq/SanZbM49l4hTGjwecHpVDmr4Rp8o044xf7wmwZbz1+AosNAZnpxb+cN0lyOQ5FMuUo5DYuKybl/yq6lBHuRUDa7jhqti/zoCC6+L2oggBUeq2xNGSXG1WFAB8Su3WiYvx46LS0xA+v5fykOLebA8FI4yexfAIGS4ikADtRBrWIibyMSEZDtGW25/SDqpZfg7XbxpAcVBwc6W4SdlroLIcP8CufTzXOi6GAFfqM9lJoigkd+w61c53gfPbXYiIFZD/77qEE39RPuo6mA9ifzlFdYO1Th4EDYXdW8hHddnswRnkjMMbhlWUYBmIwSbB2nv83wOO9cEOAhnPEhO+JF1iNd62Wp560ojOTETk0M7SilpvLrFVDtCNYVk3yjAkamk5GWJZ0MN
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ad567d-708b-491c-988a-08d79202d588
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2020 17:15:16.5333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yX8jm0MoCvxnXUmo84VSkIH6wnh7ZVR6UBXnt0Z8YYs8mWm6An2ZiZ0Wleoj4352ABTtTigW1hmg6J0sJNu8kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB4917
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
dSBjaGVjayA/DQoNClN1cmUsIEknbGwgY2hlY2sgaXQgd2l0aCBvdXIgaHcgZ3V5cy4NCg0KPiAN
Cj4gVGhhbmtzLA0KPiBHdWVudGVyDQo+IA0KPiA+ICAgCX0NCj4gPiAgIAlyZXR1cm4gcnY7DQo+
ID4gICB9DQo+ID4NCg0K
