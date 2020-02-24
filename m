Return-Path: <SRS0=BLaD=4M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B61CC11D2F
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 15:01:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0700A2072D
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 15:01:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=Mellanox.com header.i=@Mellanox.com header.b="EZP/9u7y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbgBXPBC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Feb 2020 10:01:02 -0500
Received: from mail-eopbgr80087.outbound.protection.outlook.com ([40.107.8.87]:20966
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727498AbgBXPBC (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Feb 2020 10:01:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HF+TmeYBJHRhmHbx8ZBmZgJIjszVRAGA7HlUcLGeqBT8uD4iWJlRotlhs8Js1cqh9c9g3H2sOVA4BsG7G0nyPcjQV7llyaVPSBFFS2x5YY0oaTY2qbpGzpR0j/88Hbqzys2BTWkyyr3lID3PMSZvYXP55NVZJeZdNCh9BVTcMYwlFh0pd7ROSzPQjikSuNBpEglRG1oNa7bAKkGD+qUP7s9cc3tGebNse2qHj2QxnnEmk5NrZxXbe+CykALKlPPc3IxQe7dshC/dRLpUKIrxqi7TdERwv8qYWkwMMfpiDKO+foMulesWkleMa7W+KTtSHoPFi4tCzJo+qt4xo6v9vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBbv7+casuuWVuLGLnT7nrZvTSgmOZzUhDEndwnGBlw=;
 b=OMcK364HJS5MLINl0YdkwJaSvbeDDW84toDGlh5rmdFJ77AUejEPXhSXp0PdOj298spgiSsGb4Qgvw0XsF8K4iwBWrrqd+7U0aKRcBHZ0QUWJy1VMdRA9vTtUxcoLrTlpnVCw1hQbymxRpOPyqWy6/NJtbUSfhsis4IJH+fJVr7BWaVkYou0BY8RBTDdhrAe85/Egh9/cKhpEoQP5dyWYyn04xeXyAFxBYLUmiJ1HnnQYSAzYdhVtQV7WxOvxdyZWZWMcLjKzcUhVjlcrgdGkQM2EhuvIpIGKKOMqdV3bOsSdf33anNN3h6F8aIWEATIiEItypAVXnxV1lAAiBh31Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBbv7+casuuWVuLGLnT7nrZvTSgmOZzUhDEndwnGBlw=;
 b=EZP/9u7yBJpDq7n2cCFPVSaUUuL0/6tySTJjqxY1vO0zeRWoF9kWUQL+3bvugXWuktAva4s6RpfdBPtMp1xCz7cDPvgSx/OpQSXyuawvj6F93aKsHUS4zPibiK6SqR/MCo0PBdOIYw2TyW4bW+XoLfq7kLPKJ+sOQfZVNk8d4BQ=
Received: from DB6PR0501MB2358.eurprd05.prod.outlook.com (10.168.57.146) by
 DB6PR0501MB2519.eurprd05.prod.outlook.com (10.168.71.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.22; Mon, 24 Feb 2020 15:00:44 +0000
Received: from DB6PR0501MB2358.eurprd05.prod.outlook.com
 ([fe80::5108:a8d6:5b9:45f4]) by DB6PR0501MB2358.eurprd05.prod.outlook.com
 ([fe80::5108:a8d6:5b9:45f4%10]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 15:00:44 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [hwmon-next v1 2/2] hwmon: (pmbus/xdpe12284) Add custom format
 for vout limits conversion
Thread-Topic: [hwmon-next v1 2/2] hwmon: (pmbus/xdpe12284) Add custom format
 for vout limits conversion
Thread-Index: AQHV6xQq194Dv2yQcE645Se1hRGW2KgqZuaAgAAIyPA=
Date:   Mon, 24 Feb 2020 15:00:44 +0000
Message-ID: <DB6PR0501MB23585DF7759762B47792767FA2EC0@DB6PR0501MB2358.eurprd05.prod.outlook.com>
References: <20200224131257.28176-1-vadimp@mellanox.com>
 <20200224131257.28176-3-vadimp@mellanox.com>
 <25433626-800a-b9f7-4b39-f49cadddacab@roeck-us.net>
In-Reply-To: <25433626-800a-b9f7-4b39-f49cadddacab@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d392dc6c-d4bd-441b-0655-08d7b93a5303
x-ms-traffictypediagnostic: DB6PR0501MB2519:
x-microsoft-antispam-prvs: <DB6PR0501MB2519855BDE1CFADF05EE9505A2EC0@DB6PR0501MB2519.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(199004)(189003)(6916009)(478600001)(4326008)(81156014)(81166006)(316002)(8676002)(7696005)(8936002)(71200400001)(55016002)(53546011)(86362001)(6506007)(52536014)(5660300002)(186003)(26005)(2906002)(76116006)(33656002)(9686003)(66556008)(64756008)(66476007)(66446008)(66946007);DIR:OUT;SFP:1101;SCL:1;SRVR:DB6PR0501MB2519;H:DB6PR0501MB2358.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W+JL2jIsXx7FzYhcoVq/57aZ1kcBYULFBeCLaWOXrTQxLy5iqqbeyF8XpUh+fofvWnIVCk0yGRBIRwLSmsluof0JX4xzC7SrQ5UdH27q/GqrLtUrVJG8noRKEPjXCEK/L86P1oQC9OwvblblQpRcwWXOUC/bLdIascehMLG+EY2cNJqf3n4XK+KklviM2dCkG/T7aSwwvzsEWtcBt0vOGljevJo9kWQxE2k0+4BKwewZN1wFWFX4+HycOPz4AEgSv72s7zSyjUrr2OKX5ekNwPKySDBb8gC15ePatQ//FQTgPBFqCWPLFVYhfbkHsBHLBO4ubUnN303wkvBDiAKOjYkL2WEOvd9v2W4byYgX+TI2jcoxq0W+y6SLhtPvNBVy0M/rA7q5ppwGaEDm3R8pUpj0psba7sMlOubpJCse7ZRAlvvopbblREppnYK8K6p8
x-ms-exchange-antispam-messagedata: WjQfjdksRBF5aHkRO0VwwHa5t+o0zzTNe7uQFA21oPI9fnq/dnVf32SyUktEIGCKdUhsFGB4oCIn91fC+Z0kNp0yRRhnXBdERMWyn3d5JgzsjQBXVnUxaAY8woFhDDVs8Vpqtj0udGitHVy+X1J21Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d392dc6c-d4bd-441b-0655-08d7b93a5303
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 15:00:44.6923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0zGwwDx+GE+O6xQvdmaeIbPxJLmAkn7xqVHCKOqjyLj5Kds4LXLgoQHDnOwuZhsb5B/HiAMYf5edaKCQ5RqdRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0501MB2519
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayA8
Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+IFNlbnQ6IE1v
bmRheSwgRmVicnVhcnkgMjQsIDIwMjAgNDoyNyBQTQ0KPiBUbzogVmFkaW0gUGFzdGVybmFrIDx2
YWRpbXBAbWVsbGFub3guY29tPg0KPiBDYzogbGludXgtaHdtb25Admdlci5rZXJuZWwub3JnDQo+
IFN1YmplY3Q6IFJlOiBbaHdtb24tbmV4dCB2MSAyLzJdIGh3bW9uOiAocG1idXMveGRwZTEyMjg0
KSBBZGQgY3VzdG9tDQo+IGZvcm1hdCBmb3Igdm91dCBsaW1pdHMgY29udmVyc2lvbg0KPiANCj4g
T24gMi8yNC8yMCA1OjEyIEFNLCBWYWRpbSBQYXN0ZXJuYWsgd3JvdGU6DQo+ID4gUHJvdmlkZSBj
YWxsYmFjayBmb3Igb3ZlcnZvbHRhZ2UgYW5kIHVuZGVydm9sdGFnZSBvdXRwdXQgcmVhZG91dHMN
Cj4gPiBjb252ZXJzaW9uLiBUaGVzZSByZWdpc3RlcnMgYXJlIHByZXNlbnRlZCBpbiAnc2xpbmVh
cjExJyBmb3JtYXQsIHdoaWxlDQo+ID4gZGVmYXVsdCBjb252ZXJzaW9uIGZvciAndm91dCcgY2xh
c3MgZm9yIHRoZSBkZXZpY2VzIGlzICd2aWQnLiBJdCBpcw0KPiA+IHJlc3VsdGVkIGluIHdyb25n
IGNvbnZlcnNpb24gaW4gcG1idXNfcmVnMmRhdGEoKSBmb3IgaW57My00fV9sY3JpdCBhbmQNCj4g
PiBpbnszLTR9X2NyaXQgYXR0cmlidXRlcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFZhZGlt
IFBhc3Rlcm5hayA8dmFkaW1wQG1lbGxhbm94LmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMv
aHdtb24vcG1idXMveGRwZTEyMjg0LmMgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKw0KPiA+
ICAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2h3bW9uL3BtYnVzL3hkcGUxMjI4NC5jDQo+ID4gYi9kcml2ZXJzL2h3bW9uL3Bt
YnVzL3hkcGUxMjI4NC5jIGluZGV4IGVjZDliNjU2MjdlYy4uNzUxYzhlMThjODgxDQo+ID4gMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9od21vbi9wbWJ1cy94ZHBlMTIyODQuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvaHdtb24vcG1idXMveGRwZTEyMjg0LmMNCj4gPiBAQCAtMTgsNiArMTgsMjggQEAN
Cj4gPiAgICNkZWZpbmUgWERQRTEyMl9BTURfNjI1TVYJCTB4MTAgLyogQU1EIG1vZGUgNi4yNW1W
ICovDQo+ID4gICAjZGVmaW5lIFhEUEUxMjJfUEFHRV9OVU0JCTINCj4gPg0KPiA+ICtzdGF0aWMg
aW50IHhkcGUxMjJfcmVnMmRhdGEodTE2IHJlZywgaW50IGRhdGEsIGxvbmcgKnZhbCkgew0KPiA+
ICsJczE2IGV4cG9uZW50Ow0KPiA+ICsJczMyIG1hbnRpc3NhOw0KPiA+ICsNCj4gPiArCXN3aXRj
aCAocmVnKSB7DQo+ID4gKwljYXNlIFBNQlVTX1ZPVVRfT1ZfRkFVTFRfTElNSVQ6DQo+ID4gKwlj
YXNlIFBNQlVTX1ZPVVRfVVZfRkFVTFRfTElNSVQ6DQo+IA0KPiBBbm90aGVyIHNpdHVhdGlvbiB3
aGVyZSBoYXZpbmcgYSBkYXRhc2hlZXQgd291bGQgYmUgcXVpdGUgdmFsdWFibGUuDQo+IA0KPiBJ
IHdvdWxkIHN1Z2dlc3QgdG8gaW1wbGVtZW50IHJlYWRpbmcgdGhvc2UgdHdvIHJlZ2lzdGVycyBs
b2NhbGx5IGFuZCBjb252ZXJ0DQo+IHRoZW0gdG8gdGhlIGV4cGVjdGVkIGRhdGEgZm9ybWF0LiBU
aGF0IHNlZW1zIHRvIGJlIG1vcmUgc3RyYWlnaHRmb3J3YXJkIHRoYW4NCj4gcmUtaW1wbGVtZW50
aW5nIHNsaW5lYXIgY29udmVyc2lvbi4NCg0KSGkgR3VlbnRlciwNCg0KRG8geW91IG1lYW4gdG8g
aW1wbGVtZW50IHRoZW0gbG9jYWxseSB0aHJvdWdoIHRoZSB2aXJ0dWFsIHJlZ2lzdGVycz8NCglj
YXNlIFBNQlVTX1ZJUlRfVk1PTl9PVl9GQVVMVF9MSU1JVDoNCgljYXNlIFBNQlVTX1ZJUlRfVk1P
Tl9VVl9GQVVMVF9MSU1JVDoNCg0KVGhhbmtzLA0KVmFkaW0uDQoNCj4gDQo+IFRoYW5rcywNCj4g
R3VlbnRlcg0KPiANCj4gPiArCQkvKiBDb252ZXJ0IHRvIExJTkVBUjExLiAqLw0KPiA+ICsJCWV4
cG9uZW50ID0gKChzMTYpZGF0YSkgPj4gMTE7DQo+ID4gKwkJbWFudGlzc2EgPSAoKHMxNikoKGRh
dGEgJiBHRU5NQVNLKDEwLCAwKSkgPDwgNSkpID4+IDU7DQo+ID4gKwkJKnZhbCA9IG1hbnRpc3Nh
ICogMTAwMEw7DQo+ID4gKwkJaWYgKGV4cG9uZW50ID49IDApDQo+ID4gKwkJCSp2YWwgPDw9IGV4
cG9uZW50Ow0KPiA+ICsJCWVsc2UNCj4gPiArCQkJKnZhbCA+Pj0gLWV4cG9uZW50Ow0KPiA+ICsJ
CXJldHVybiAwOw0KPiA+ICsJZGVmYXVsdDoNCj4gPiArCQlyZXR1cm4gLUVOT0RBVEE7DQo+ID4g
Kwl9DQo+ID4gK30NCj4gPiArDQo+ID4gICBzdGF0aWMgaW50IHhkcGUxMjJfaWRlbnRpZnkoc3Ry
dWN0IGkyY19jbGllbnQgKmNsaWVudCwNCj4gPiAgIAkJCSAgICBzdHJ1Y3QgcG1idXNfZHJpdmVy
X2luZm8gKmluZm8pDQo+ID4gICB7DQo+ID4gQEAgLTcwLDYgKzkyLDcgQEAgc3RhdGljIHN0cnVj
dCBwbWJ1c19kcml2ZXJfaW5mbyB4ZHBlMTIyX2luZm8gPSB7DQo+ID4gICAJCVBNQlVTX0hBVkVf
VEVNUCB8IFBNQlVTX0hBVkVfU1RBVFVTX1RFTVAgfA0KPiA+ICAgCQlQTUJVU19IQVZFX1BPVVQg
fCBQTUJVU19IQVZFX1BJTiB8DQo+IFBNQlVTX0hBVkVfU1RBVFVTX0lOUFVULA0KPiA+ICAgCS5p
ZGVudGlmeSA9IHhkcGUxMjJfaWRlbnRpZnksDQo+ID4gKwkucmVnMmRhdGEgPSB4ZHBlMTIyX3Jl
ZzJkYXRhLA0KPiA+ICAgfTsNCj4gPg0KPiA+ICAgc3RhdGljIGludCB4ZHBlMTIyX3Byb2JlKHN0
cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsDQo+ID4NCg0K
