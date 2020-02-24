Return-Path: <SRS0=BLaD=4M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5D6C11D2F
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 15:44:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BFE8E2084E
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 15:44:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=Mellanox.com header.i=@Mellanox.com header.b="nfRf49ID"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbgBXPoM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Feb 2020 10:44:12 -0500
Received: from mail-eopbgr150054.outbound.protection.outlook.com ([40.107.15.54]:57494
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727730AbgBXPoM (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Feb 2020 10:44:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5TMZNgaJlq57D/RdTyPHh4RYuWCwicMr6U5pplgDarHGV+fxnhsJoTTb4L8D4ZYOLzUBdLIQLiKIfaxRumulItV3mQsXNzEWjai+SwVhpTIUO8n/f1OBt5RLi/l9UOmpsOWYvRTQmj2cjdO+5ijk62xQbzFkUbbXdTQ1coW5OssoVJKrB74C0+3hs86e9MV+qO3wxupgJv0QEhxcHxVMG+QRmSrHfA5NisBzHxBou3fL8IONNIDYSikjXjo9rujK8LgB+uLUxdXhcjMej4tGIVK9aIbF3rrg9V8SszvutzRH3J4EtA1k8Q7uVRX6NPjomuNHlMfv+JBgBzyGLoojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSfx0LBfrazXABIqQnBWNJ1E8IptyDGyRn2VuBIdgyY=;
 b=MRdSVbvHsteWblOCPbIT61vetau9J6hiwRIwEKAx+1q6+qEmr1iQuFnKgRz1NoP5Zx3MP+9+PYH8p4dTOykhlRjdJ1Bw95jpuTHWELNGjFBiCS52qw6Ss/DZ4v3gRQWFblKhyNObLpiUjO98eS/IAIF0K+noGOn3mPEggzIQk4up0HTwJtzNPdE7E6zX2NGgjDlmgEbiD13PfhRM0U2zzKbi9Lpnb/9EMmHRmyCXbCYjaZLt1bASqt6QxCYEMUs1O/BWkrlEumZa86gJLa5WX1l1dDUDaWXB/WmGOsVjEZMWXmTyGcbGtzutp/F8RPvN3yPf5BytiM289nlGY7b4Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSfx0LBfrazXABIqQnBWNJ1E8IptyDGyRn2VuBIdgyY=;
 b=nfRf49IDOp+AVjr+suh/w1zGfMeHO5MYw2vZsjHf1ixkvnI75jbZNEItOCgms42alnsKIWLu4I8RlAAYtaXkb6SJWSlhdJ+DnoFBBusvMoitOFuF3QCFFwgOaCOMTy1A0Z9PJjmNVnYtNaSdFBE7eYc5J2U4oWdZ6XqZYJLVqFg=
Received: from DB6PR0501MB2358.eurprd05.prod.outlook.com (10.168.57.146) by
 DB6PR0501MB2823.eurprd05.prod.outlook.com (10.172.226.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17; Mon, 24 Feb 2020 15:44:04 +0000
Received: from DB6PR0501MB2358.eurprd05.prod.outlook.com
 ([fe80::5108:a8d6:5b9:45f4]) by DB6PR0501MB2358.eurprd05.prod.outlook.com
 ([fe80::5108:a8d6:5b9:45f4%10]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 15:44:04 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [hwmon-next v1] hwmon: (pmbus/tps53679) Add support for
 historical registers for TPS53688
Thread-Topic: [hwmon-next v1] hwmon: (pmbus/tps53679) Add support for
 historical registers for TPS53688
Thread-Index: AQHV6xRZB08WINjb/UWHvGecIbZtXagqbWaAgAAFoQCAAAPFAA==
Date:   Mon, 24 Feb 2020 15:44:04 +0000
Message-ID: <DB6PR0501MB235847DEC43DED481A0553EDA2EC0@DB6PR0501MB2358.eurprd05.prod.outlook.com>
References: <20200224131316.28238-1-vadimp@mellanox.com>
 <b9b2d96b-1b1d-7445-18a7-21e3d28e6819@roeck-us.net>
 <d38525ac-e7f2-970b-5c7c-e0a84d492492@roeck-us.net>
In-Reply-To: <d38525ac-e7f2-970b-5c7c-e0a84d492492@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 786b3c51-4da7-40fb-ae98-08d7b9406062
x-ms-traffictypediagnostic: DB6PR0501MB2823:
x-microsoft-antispam-prvs: <DB6PR0501MB2823814B1DD0A38010BE73B6A2EC0@DB6PR0501MB2823.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(189003)(199004)(316002)(33656002)(478600001)(5660300002)(8936002)(81166006)(71200400001)(8676002)(81156014)(2906002)(4326008)(86362001)(52536014)(76116006)(6506007)(186003)(55016002)(26005)(6916009)(64756008)(66556008)(66476007)(66446008)(66946007)(7696005)(9686003)(53546011);DIR:OUT;SFP:1101;SCL:1;SRVR:DB6PR0501MB2823;H:DB6PR0501MB2358.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M1gRpTOA6whwHnUdw/6n3MmiFXJSlD6S2W4/oaINEhXC5GE8JgO7ScXiEYfEdfIyyeOaHUW4W6Vk6crLMc3cOBDZ/8cHZK512SzNCMiP0rbg9Vt0RqZOuyLJ3uYQYYBMds675SkktLJCjkaOM6Ujxd9MS4h072BaC5GOzru03i4Dqis/skjz2Par1syu0lUbbom/9UC+RREmg/5GUT7Bd9RA9zsnkynIHex7TjOM5/l3R5C/hXBblywEd7M7lPNtO1zHa2WqR6fymtqdgkvbfyK/MdWORnN3kHWmtT+JqOjXjOQDoQS98i7WBrsknvmGmxt1xUS0BalKHX0htUwpBqJ23U64VZx6KgZujdOS2PNPLoc9fuFd2yi9xXcYlnoctRPuXOQlAkUOFgq6fcKh+RR1mERmkE9RSjgNklah36VVdO+9XMEUt1E5P7UakbZN
x-ms-exchange-antispam-messagedata: bdmK0uThby6a80tf9mBId/4SzzmY+da3Q3y7SKGhE8jdDLuL3jT+6dbd0dd2hD16JeTq4G4C63hKvKWOiDa3w/AFs/KVD3yVcsnb44xCL4/kCOhweU1K+xSQUJlPY4FSFATz3NSpKnleE6aMNuoTJw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 786b3c51-4da7-40fb-ae98-08d7b9406062
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 15:44:04.1860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9HiuK5L4KcAEihiRICOnUPBrPa9nIQipY5NwGCj4X95+WibpAy/Zft7uHvCuMo/Ge3MwMmCOYW+iz3VJf20lfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0501MB2823
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayA8
Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+IFNlbnQ6IE1v
bmRheSwgRmVicnVhcnkgMjQsIDIwMjAgNToxMSBQTQ0KPiBUbzogVmFkaW0gUGFzdGVybmFrIDx2
YWRpbXBAbWVsbGFub3guY29tPg0KPiBDYzogbGludXgtaHdtb25Admdlci5rZXJuZWwub3JnDQo+
IFN1YmplY3Q6IFJlOiBbaHdtb24tbmV4dCB2MV0gaHdtb246IChwbWJ1cy90cHM1MzY3OSkgQWRk
IHN1cHBvcnQgZm9yDQo+IGhpc3RvcmljYWwgcmVnaXN0ZXJzIGZvciBUUFM1MzY4OA0KPiANCj4g
T24gMi8yNC8yMCA2OjUwIEFNLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPiA+IE9uIDIvMjQvMjAg
NToxMyBBTSwgVmFkaW0gUGFzdGVybmFrIHdyb3RlOg0KPiA+PiBUUFM1MzY4OCBzdXBwb3J0cyBo
aXN0b3JpY2FsIHJlZ2lzdGVycy4gUGF0Y2ggYWxsb3dzIGV4cG9zaW5nIHRoZQ0KPiA+PiBuZXh0
IGF0dHJpYnV0ZXMgZm9yIHRoZSBoaXN0b3JpY2FsIHJlZ2lzdGVycyBpbiAnc3lzZnMnOg0KPiA+
PiAtIGN1cnJ7eH1fcmVzZXRfaGlzdG9yeTsNCj4gPj4gLSBpbnt4fV9yZXNldF9oaXN0b3J5Ow0K
PiA+PiAtIHBvd2Vye3h9X3Jlc2V0X2hpc3Rvcnk7DQo+ID4+IC0gdGVtcHt4fV9yZXNldF9oaXN0
b3J5Ow0KPiA+PiAtIGN1cnJ7eH1faGlnaGVzdDsNCj4gPj4gLSBpbnt4fV9oaWdoZXN0Ow0KPiA+
PiAtIHBvd2Vye3h9X2lucHV0X2hpZ2hlc3Q7DQo+ID4+IC0gdGVtcHt4fV9oaWdoZXN0Ow0KPiA+
PiAtIGN1cnJ7eH1fbG93ZXN0Ow0KPiA+PiAtIGlue3h9X2xvd2VzdDsNCj4gPj4gLSBwb3dlcnt4
fV9pbnB1dF9sb3dlc3Q7DQo+ID4+IC0gdGVtcHt4fV9sb3dlc3QuDQo+ID4+DQo+ID4+IFRoaXMg
cGF0Y2ggaXMgcmVxdWlyZWQgcGF0Y2g6DQo+ID4+ICJod21vbjogKHBtYnVzL2NvcmUpIEFkZCBj
YWxsYmFjayBmb3IgcmVnaXN0ZXIgdG8gZGF0YSBjb252ZXJzaW9uIi4NCj4gPj4NCj4gPj4gU2ln
bmVkLW9mZi1ieTogVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbWVsbGFub3guY29tPg0KPiA+PiAt
LS0NCj4gPj4gwqAgZHJpdmVycy9od21vbi9wbWJ1cy90cHM1MzY3OS5jIHwgMjQ0DQo+ID4+ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ID4+IMKgIDEgZmlsZSBj
aGFuZ2VkLCAyNDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+Pg0KPiA+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9od21vbi9wbWJ1cy90cHM1MzY3OS5jDQo+ID4+IGIvZHJpdmVycy9o
d21vbi9wbWJ1cy90cHM1MzY3OS5jIGluZGV4IDE1N2M5OWZmYjUyYi4uYWU1Y2UxNDRlNWZlDQo+
ID4+IDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2h3bW9uL3BtYnVzL3RwczUzNjc5LmMNCj4g
Pj4gKysrIGIvZHJpdmVycy9od21vbi9wbWJ1cy90cHM1MzY3OS5jDQo+ID4+IEBAIC0zNCw2ICsz
NCwyMjcgQEAgZW51bSBjaGlwcyB7DQo+ID4+IMKgICNkZWZpbmUgVFBTNTM2ODFfTUZSX1NQRUNJ
RklDXzIwwqDCoMKgIDB4ZTTCoMKgwqAgLyogTnVtYmVyIG9mIHBoYXNlcywNCj4gPj4gcGVyIHBh
Z2UgKi8NCj4gPj4gKy8qIFJlZ2lzdGVycyBmb3IgaGlnaGVzdCBhbmQgbG93ZXN0IGhpc3Rvcmlj
YWwgdmFsdWVzIHJlY29yZHMgKi8NCj4gPj4gKyNkZWZpbmUgVFBTNTM2ODhfVk9VVF9QRUFLwqDC
oMKgwqDCoMKgwqAgMHhkMSAjZGVmaW5lIFRQUzUzNjg4X0lPVVRfUEVBSw0KPiA+PiArMHhkMiAj
ZGVmaW5lIFRQUzUzNjg4X1RFTVBfUEVBS8KgwqDCoMKgwqDCoMKgIDB4ZDMgI2RlZmluZQ0KPiA+
PiArVFBTNTM2ODhfVklOX1BFQUvCoMKgwqDCoMKgwqDCoCAweGQ1ICNkZWZpbmUgVFBTNTM2ODhf
SUlOX1BFQUvCoMKgwqDCoMKgwqDCoCAweGQ2DQo+ID4+ICsjZGVmaW5lIFRQUzUzNjg4X1BJTl9Q
RUFLwqDCoMKgwqDCoMKgwqAgMHhkNyAjZGVmaW5lIFRQUzUzNjg4X1BPVVRfUEVBSw0KPiA+PiAr
MHhkOCAjZGVmaW5lIFRQUzUzNjg4X0hJU1RPUllfUkVHX0JVRl9MRU7CoMKgwqAgNSAjZGVmaW5l
DQo+ID4+ICtUUFM1MzY4OF9ISVNUT1JZX1JFR19NSU5fT0ZGU0VUwqDCoMKgIDMgI2RlZmluZQ0K
PiA+PiArVFBTNTM2ODhfSElTVE9SWV9SRUdfTUFYX09GRlNFVMKgwqDCoCAxDQo+ID4+ICsNCj4g
Pj4gK2NvbnN0IHN0YXRpYyB1OCB0cHM1MzY4OF9yZXNldF9sb2dnaW5nW10gPSB7IDB4MDQsIDB4
MDAsIDB4MDEsIDB4MDAsDQo+ID4+ICsweDAwIH07IGNvbnN0IHN0YXRpYyB1OCB0cHM1MzY4OF9y
ZXN1bWVfbG9nZ2luZ1tdID0geyAweDA0LCAweDIwLA0KPiA+PiArMHgwMCwgMHgwMCwgMHgwMCB9
Ow0KPiA+PiArDQo+ID4gUGFzc2luZyB0aGUgbGVuZ3RoIGFzIDFzdCBmaWVsZCBzZWVtcyB3cm9u
Zy4NCj4gPg0KPiA+PiArc3RhdGljIGludCB0cHM1MzY4OF9yZWcyZGF0YSh1MTYgcmVnLCBpbnQg
ZGF0YSwgbG9uZyAqdmFsKSB7DQo+ID4+ICvCoMKgwqAgczE2IGV4cG9uZW50Ow0KPiA+PiArwqDC
oMKgIHMzMiBtYW50aXNzYTsNCj4gPj4gKw0KPiA+PiArwqDCoMKgIGlmIChkYXRhID09IDApDQo+
ID4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gZGF0YTsNCj4gPj4gKw0KPiA+PiArwqDCoMKgIHN3
aXRjaCAocmVnKSB7DQo+ID4+ICvCoMKgwqAgY2FzZSBQTUJVU19WSVJUX1JFQURfVk9VVF9NSU46
DQo+ID4+ICvCoMKgwqAgY2FzZSBQTUJVU19WSVJUX1JFQURfVk9VVF9NQVg6DQo+ID4+ICvCoMKg
wqDCoMKgwqDCoCAvKiBDb252ZXJ0IHRvIExJTkVBUjExLiAqLw0KPiA+PiArwqDCoMKgwqDCoMKg
wqAgZXhwb25lbnQgPSAoKHMxNilkYXRhKSA+PiAxMTsNCj4gPj4gK8KgwqDCoMKgwqDCoMKgIG1h
bnRpc3NhID0gKChzMTYpKChkYXRhICYgR0VOTUFTSygxMCwgMCkpIDw8IDUpKSA+PiA1Ow0KPiA+
PiArwqDCoMKgwqDCoMKgwqAgKnZhbCA9IG1hbnRpc3NhICogMTAwMEw7DQo+ID4+ICvCoMKgwqDC
oMKgwqDCoCBpZiAoZXhwb25lbnQgPj0gMCkNCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KnZhbCA8PD0gZXhwb25lbnQ7DQo+ID4+ICvCoMKgwqDCoMKgwqDCoCBlbHNlDQo+ID4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICp2YWwgPj49IC1leHBvbmVudDsNCj4gPj4gK8KgwqDCoMKgwqDC
oMKgIHJldHVybiAwOw0KPiA+PiArwqDCoMKgIGRlZmF1bHQ6DQo+ID4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm4gLUVOT0RBVEE7DQo+ID4+ICvCoMKgwqAgfQ0KPiA+PiArfQ0KPiA+PiArDQo+ID4g
QXMgd2l0aCB0aGUgeHBkZSBkcml2ZXIsIEkgd291bGQgc3VnZ2VzdCB0byBpbXBsZW1lbnQgdGhl
IGNvbnZlcnNpb24NCj4gPiBpbiB0aGUgcmVhZF93b3JkX2RhdGEgZnVuY3Rpb24uDQo+ID4NCj4g
Pj4gK3N0YXRpYyBpbnQNCj4gPj4gK3RwczUzNjg4X2dldF9oaXN0b3J5KHN0cnVjdCBpMmNfY2xp
ZW50ICpjbGllbnQsIGludCByZWcsIGludCBwYWdlLA0KPiA+PiAraW50IHVudXNlZCwNCj4gPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgb2Zmc2V0KQ0KPiA+DQo+ID4gV2hhdCBpcyB0
aGUgcG9pbnQgb2YgcGFzc2luZyAidW51c2VkIiB0byB0aGlzIGZ1bmN0aW9uID8NCj4gPg0KPiA+
PiArew0KPiA+PiArwqDCoMKgIHU4IGJ1ZltUUFM1MzY4OF9ISVNUT1JZX1JFR19CVUZfTEVOXTsN
Cj4gPj4gK8KgwqDCoCBpbnQgcmV0Ow0KPiA+PiArDQo+ID4+ICvCoMKgwqAgcmV0ID0gcG1idXNf
c2V0X3BhZ2UoY2xpZW50LCBwYWdlLCAwKTsNCj4gPj4gK8KgwqDCoCBpZiAocmV0IDwgMCkNCj4g
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+ID4+ICsNCj4gPj4gK8KgwqDCoCByZXQg
PSBpMmNfc21idXNfcmVhZF9pMmNfYmxvY2tfZGF0YShjbGllbnQsIHJlZywNCj4gPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVFBTNTM2ODhfSElTVE9S
WV9SRUdfQlVGX0xFTiwNCj4gPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgYnVmKTsNCj4gPj4gK8KgwqDCoCBpZiAocmV0IDwgMCkNCj4gPj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybiByZXQ7DQo+ID4+ICvCoMKgwqAgZWxzZSBpZiAocmV0ICE9IFRQUzUz
Njg4X0hJU1RPUllfUkVHX0JVRl9MRU4pDQo+ID4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJ
TzsNCj4gPg0KPiA+IEkgYW0gYSBiaXQgY29uZnVzZWQgaGVyZS4gQXJlIHlvdSBzdXJlIHRoaXMg
cmV0dXJucyAoYW5kIGlzIHN1cHBvc2VkDQo+ID4gdG8gcmV0dXJuKQ0KPiA+IDUgYnl0ZXMgb2Yg
ZGF0YSwgbm90IDQsIGFuZCB0aGF0IHRoZSBkYXRhIG9mZnNldHMgYXJlIDEgYW5kIDMsIG5vdCAw
IGFuZCAyID8NCj4gPiBpMmNfc21idXNfcmVhZF9pMmNfYmxvY2tfZGF0YSgpIHJldHVybnMgdGhl
IGxlbmd0aCwgYW5kIG9ubHkgY29waWVzDQo+ID4gdGhlIGRhdGEgaW50byB0aGUgYnVmZmVyLCBu
b3QgdGhlIGxlbmd0aCBmaWVsZC4NCj4gPg0KPiBXYWl0LCB5b3UgY2FyZSBjYWxsaW5nIGkyY19z
bWJ1c19yZWFkX2kyY19ibG9ja19kYXRhKCkgaW5zdGVhZCBvZg0KPiBpMmNfc21idXNfcmVhZF9i
bG9ja19kYXRhKCkuIE1heWJlIHRoYXQgZXhwbGFpbnMgd2h5IHlvdSBuZWVkIHRvIHNwZWNpZnkg
dGhlDQo+IGxlbmd0aCB0d2ljZS4gVGhpcyBzaG91bGQgcmVhbGx5IGJlIGkyY19zbWJ1c19yZWFk
X2Jsb2NrX2RhdGEoKSAoYW5kLCB5ZXMsIHRoZQ0KPiBidWZmZXIgbmVlZHMgdG8gZml0IHRoZSBt
YXhpbXVtIHNtYnVzIGJsb2NrIGxlbmd0aCkuDQo+IA0KPiBTYW1lIGZvciB3cml0ZS4NCg0KSGkg
R3VudGVyLA0KDQpJdCBzZWVtcyAgaXQgd2FzIHNvbWUgbWlzdW5kZXJzdGFuZGluZy4NCg0KV2hl
biB3ZSBkaXNjdXNzZWQgdGhpcyBmZWF0dXJlIEkgYXNrZWQ6DQoNCj4+IENhbiBJIGFzc3VtZSB0
aGF0IG1vc3QgaTJjIGNvbnRyb2xsZXJzIHN1cHBvcnQgInNtYnVzX3JlYWRfYmxvY2siLCAgb3Ig
DQo+PiBpdCdzIGJldHRlciB0byByZWFkIHdpdGgNCj4+IGkyY19zbWJ1c19yZWFkX2kyY19ibG9j
a19kYXRhKCkgd2l0aCBzaXplIDU/DQo+PiANCkFuZCB5b3UgcmVwbGllZDoNCj4gSSB1c2UgaTJj
X3NtYnVzX3JlYWRfaTJjX2Jsb2NrX2RhdGEoKTsgdGhhdCBpcyB3aGF0IGl0IGlzIGZvci4NCg0K
U28sIEkgdGhvdWdodCB0aGF0IGkyY19zbWJ1c19yZWFkX2kyY19ibG9ja19kYXRhIHdpbGwgYmUg
bW9yZSBjb21tb24NCmNhc2UuDQpJJ2xsIGNoYW5nZSBpdC4NCg0KPiANCj4gVGhhbmtzLA0KPiBH
dWVudGVyDQo=
