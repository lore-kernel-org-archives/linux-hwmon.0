Return-Path: <SRS0=XbaA=23=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC628C33C8C
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jan 2020 12:16:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAEFA2072E
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jan 2020 12:16:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=Mellanox.com header.i=@Mellanox.com header.b="QUc990P4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgAFMQo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jan 2020 07:16:44 -0500
Received: from mail-db8eur05on2059.outbound.protection.outlook.com ([40.107.20.59]:28384
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725787AbgAFMQo (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 6 Jan 2020 07:16:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UttLODZls/TkZEJl9w1boiHeEA3Sffa/QrTnEGJlEzc4FDYBJe7bDPYc5PiYQFYtVvLLMNikJLQnzyDjrCsF/kQkK+F7tEV4jWa4CkAo7fvgRFg0fKrQLlHL0oEPCmGBLZT7yi9mDEE41DJr1XpCpro0alhUMI7s4dFoyiGhJ+CI9ZFfkT0eIt4B5ZkZUlfxaAUCxjEkmapkT9t9fiYiF1K6IRQQflrKERbf9MypK42JOpb63BbMFGEQfTye/3W0t8XQ5LsEnwkdhYN5SPWl3vT5ikLaLLQ6/vhfVXVkk1p18YA0C7ZQYTvu0OYe2Kmsh2P3Y5W2ygomsjQZ9yPqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DW1KW1CFqQcqzfPR27RZi2emSTNAMbKPt6TRsWR/n6M=;
 b=k9caTecuPxkLxarKCtpqHzBpybmr4BWhrq99X8L3ZzVLvyQd4mdHo9ABB9VWXeIeaB7k8dCSyJgeT/WiQFOtKH+0pdMEbMKxc87fXIeBK7UVqK+LopWQC5oaZbVQeCgl2SKxY/Ci4o8l/c5/RE/M40nKRwy2AC/Y8yW7qnyvTqe/Vb0oS5MKIS6xFGU37yF70r3CQNVSMcugiwgvZncSQUpbRPZRRuZbXYT3/nevuRj5BLRtoqk378OXDCaMmG5NIwryId0/kUaaLJBxuNvUMBzsBhzXr74I/aXSmwBPLGabn87+HHOoXm+TpOnUNz3Q9eLPXij2wxaneUa+GGlWig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DW1KW1CFqQcqzfPR27RZi2emSTNAMbKPt6TRsWR/n6M=;
 b=QUc990P40s7+O8jIaKghrQrgBFPUjkhHp+8q9NTDC5TyNhMj7X2dK2JmJsPSXxhbENi8qYicco+mThdGx2EijuX/zcaPJatwSAx3cMzq+FjwsFHQIvnUr8Do3/pQhJk2/rgsmJkipdzZ4xwY91iXD5+LUJaJJb84rjuApmjW3GY=
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com (20.177.196.210) by
 AM6PR05MB5078.eurprd05.prod.outlook.com (20.177.36.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12; Mon, 6 Jan 2020 12:16:39 +0000
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::44ac:7bce:8f7c:3e6d]) by AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::44ac:7bce:8f7c:3e6d%3]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 12:16:39 +0000
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
Thread-Index: AQHVw7ccUo77+1Sy70mxGafA8mf8l6fcO+2AgAAG1qCAACN3gIAA8Bkw
Date:   Mon, 6 Jan 2020 12:16:39 +0000
Message-ID: <AM6PR05MB52245C747A0EB1691C3EBFBFA23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <20200105105833.30196-1-vadimp@mellanox.com>
 <20200105105833.30196-6-vadimp@mellanox.com>
 <567ebd26-529e-6b2a-2f07-cfaf0f2217a9@roeck-us.net>
 <AM6PR05MB5224F444CBAC5A0503AFBB83A23D0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <a30e4f98-65a4-f93c-371e-7691aace41f7@roeck-us.net>
In-Reply-To: <a30e4f98-65a4-f93c-371e-7691aace41f7@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 87dedeec-0041-4866-c4b7-08d792a24863
x-ms-traffictypediagnostic: AM6PR05MB5078:
x-microsoft-antispam-prvs: <AM6PR05MB5078CB576814DD78195143C9A23C0@AM6PR05MB5078.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(199004)(189003)(13464003)(81156014)(86362001)(4326008)(7696005)(81166006)(33656002)(71200400001)(2906002)(316002)(110136005)(478600001)(55016002)(8936002)(26005)(9686003)(6506007)(53546011)(66476007)(66556008)(64756008)(66446008)(186003)(54906003)(66946007)(5660300002)(76116006)(8676002)(52536014);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB5078;H:AM6PR05MB5224.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f1yfcYaPZNQNORdBwJqo+bCwJQB0kNU+Ar3BCrI/xlcEGlNIczZ30FPi28bavG9R7HA/fMOGbgIyNv6fPhmAjjXLDRGBTQZSgcBdc2DS8KEgaddK1ut8m/PxB6ZlyXzfBBjucVCl8g6l8PZndoSFBojRtA/vQBExMZmXH0cM8YQM4y3j788eol9iOYq1ZXodT3r7pGjEyQ4YqT5NXyEW40sWCCqgx3pabR02d9FVkJVKB824AOw9eSltRmXOwNxe8J4Bwt3g7AHtceArxx3zIQi+ZtWqXfy4IB4oot/t7n2tHVMVluxDqiJHFYvkFeh940VQdbn4LqZw3O4Mpby0uk6RpRiXCPv9h1X8mJxVn2FiMQDzsrtiRYvOrHSIF737IXBxpmTjX3UxCrGNzra9PObwaxTdDefEhQMFhbdE9VFaH83pnssX8AtUpPlHxxVTBbIlo4cXhPSkvv9RrLc/TEJNF75YyrFQOOR04Z4uw+rW1qgmneAmDQH/+9MqmL8d
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87dedeec-0041-4866-c4b7-08d792a24863
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 12:16:39.1750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TUidLXKhx2GM8Rkfi5/hVNG52rseDVB1UhEx3LBOKEFudE+5XttlyXFYPu6Y9qV6sFONoOW/DAjnqt1ctTSojA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5078
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayA8
Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+IFNlbnQ6IFN1
bmRheSwgSmFudWFyeSAwNSwgMjAyMCA4OjM1IFBNDQo+IFRvOiBWYWRpbSBQYXN0ZXJuYWsgPHZh
ZGltcEBtZWxsYW5veC5jb20+OyByb2JoK2R0QGtlcm5lbC5vcmc7DQo+IHZpamF5a2hlbWthQGZi
LmNvbQ0KPiBDYzogbGludXgtaHdtb25Admdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIu
a2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCBod21vbi1uZXh0IHYxIDUvNV0g
aHdtb246IChwbWJ1cy90cHM1MzY3OSkgRXh0ZW5kDQo+IGRldmljZSBsaXN0IHN1cHBvcnRlZCBi
eSBkcml2ZXINCj4gDQo+IE9uIDEvNS8yMCA4OjQ0IEFNLCBWYWRpbSBQYXN0ZXJuYWsgd3JvdGU6
DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBH
dWVudGVyIFJvZWNrIDxncm9lY2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9l
Y2sNCj4gPj4gU2VudDogU3VuZGF5LCBKYW51YXJ5IDA1LCAyMDIwIDY6MDQgUE0NCj4gPj4gVG86
IFZhZGltIFBhc3Rlcm5hayA8dmFkaW1wQG1lbGxhbm94LmNvbT47IHJvYmgrZHRAa2VybmVsLm9y
ZzsNCj4gPj4gdmlqYXlraGVta2FAZmIuY29tDQo+ID4+IENjOiBsaW51eC1od21vbkB2Z2VyLmtl
cm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBb
UkZDIFBBVENIIGh3bW9uLW5leHQgdjEgNS81XSBod21vbjogKHBtYnVzL3RwczUzNjc5KQ0KPiA+
PiBFeHRlbmQgZGV2aWNlIGxpc3Qgc3VwcG9ydGVkIGJ5IGRyaXZlcg0KPiA+Pg0KPiA+PiBPbiAx
LzUvMjAgMjo1OCBBTSwgVmFkaW0gUGFzdGVybmFrIHdyb3RlOg0KPiA+Pj4gRXh0ZW5kcyBkcml2
ZXIgd2l0aCBzdXBwb3J0IG9mIHRoZSBhZGRpdGlvbmFsIGRldmljZXM6DQo+ID4+PiBUZXhhcyBJ
bnN0cnVtZW50cyBEdWFsIGNoYW5uZWwgRENBUCsgbXVsdGlwaGFzZSBjb250cm9sbGVyczoNCj4g
Pj4+IFRQUzUzNjg4LCBTTjE5MDYwMTYuDQo+ID4+PiBJbmZpbmVvbiBNdWx0aS1waGFzZSBEaWdp
dGFsIFZSIENvbnRyb2xsZXIgU2llcnJhIGRldmljZXMNCj4gPj4+IFhEUEUxMjI4NkMsIFhEUEUx
MjI4NEMsIFhEUEUxMjI4M0MsIFhEUEUxMjI1NEMgYW5kIFhEUEUxMjI1MEMuDQo+ID4+Pg0KPiA+
Pj4gRXh0ZW5kIEtjb25maWcgd2l0aCBhZGRlZCBkZXZpY2VzLg0KPiA+Pj4NCj4gPj4+IFNpZ25l
ZC1vZmYtYnk6IFZhZGltIFBhc3Rlcm5hayA8dmFkaW1wQG1lbGxhbm94LmNvbT4NCj4gPj4+IC0t
LQ0KPiA+Pj4gICAgZHJpdmVycy9od21vbi9wbWJ1cy9LY29uZmlnICAgIHwgIDUgKysrLS0NCj4g
Pj4+ICAgIGRyaXZlcnMvaHdtb24vcG1idXMvdHBzNTM2NzkuYyB8IDE0ICsrKysrKysrKysrKysr
DQo+ID4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vcG1idXMvS2NvbmZp
Zw0KPiA+Pj4gYi9kcml2ZXJzL2h3bW9uL3BtYnVzL0tjb25maWcgaW5kZXggNTk4NTk5Nzk1NzFk
Li45ZTNkMTk3ZDUzMjINCj4gPj4+IDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9od21vbi9w
bWJ1cy9LY29uZmlnDQo+ID4+PiArKysgYi9kcml2ZXJzL2h3bW9uL3BtYnVzL0tjb25maWcNCj4g
Pj4+IEBAIC0yMDAsMTAgKzIwMCwxMSBAQCBjb25maWcgU0VOU09SU19UUFM0MDQyMg0KPiA+Pj4g
ICAgCSAgYmUgY2FsbGVkIHRwczQwNDIyLg0KPiA+Pj4NCj4gPj4+ICAgIGNvbmZpZyBTRU5TT1JT
X1RQUzUzNjc5DQo+ID4+PiAtCXRyaXN0YXRlICJUSSBUUFM1MzY3OSINCj4gPj4+ICsJdHJpc3Rh
dGUgIlRJIFRQUzUzNjc5LCBUUFM1MzY4OCwgU04xOTA2MDE2LCBJbmZpbmVvbiBYRFBFMTIyeHh4
DQo+ID4+IGZhbWlseSINCj4gPj4+ICAgIAloZWxwDQo+ID4+PiAgICAJICBJZiB5b3Ugc2F5IHll
cyBoZXJlIHlvdSBnZXQgaGFyZHdhcmUgbW9uaXRvcmluZyBzdXBwb3J0IGZvciBUSQ0KPiA+Pj4g
LQkgIFRQUzUzNjc5Lg0KPiA+Pj4gKwkgIFRQUzUzNjc5LCBQUzUzNjg4LCBTTjE5MDYwMTYgYW5k
IEluZmluZW9uIFhEUEUxMjI4NkMsDQo+ID4+IFhEUEUxMjI4NEMsDQo+ID4+DQo+ID4+IFRQUzUz
Njg4LiBGb3IgdGhlIG90aGVycywgZm9yIHNvbWUgSSBjYW4ndCBldmVuIGRldGVybWluZSBpZiB0
aGV5DQo+ID4+IGV4aXN0IGluIHRoZSBmaXJzdCBwbGFjZSAoZWcgU04xOTA2MDE2LCBYUERFMTIy
NTBDKSBvciBob3cgdGhleSB3b3VsZA0KPiA+PiBkaWZmZXIgZnJvbSBvdGhlciB2YXJpYW50cyAo
ZWcgWFBERTEyMjg0QyB2cy4gWFBERTEyMjg0QSkuDQo+ID4+IEFuZCB3aHkgd291bGQgdGhleSBh
bGwgdXNlIHRoZSBzYW1lIGJpdCBtYXAgaW4gdGhlIFZPVVRfTU9ERQ0KPiA+PiByZWdpc3Rlciwg
dGhlIHNhbWUgbnVtYmVyIG9mIFBNQnVzIHBhZ2VzIChwaGFzZXMpLCBhbmQgdGhlIHNhbWUgYXR0
cmlidXRlcw0KPiBpbiBlYWNoIHBhZ2UgPw0KPiA+DQo+ID4gSGkgR3VlbnRlciwNCj4gPg0KPiA+
IFRoYW5rIHlvdSBmb3IgcmVwbHkuDQo+ID4NCj4gPiBPbiBvdXIgbmV3IHN5c3RlbSB3ZSBoYXZl
IGRldmljZSBYUERFMTIyODRDIGVxdWlwcGVkLg0KPiA+IEkgdGVzdGVkIHRoaXMgZGV2aWNlLg0K
PiA+DQo+IFNvdW5kcyBnb29kLCBidXQgZGlkIHlvdSBhbHNvIG1ha2Ugc3VyZSB0aGF0IGFsbCBj
aGlwcyBoYXZlIHRoZSBzYW1lIG51bWJlciBvZg0KPiBwYWdlcyAocGhhc2VzKSwgdGhlIHNhbWUg
c2V0IG9mIGNvbW1hbmRzIGFzIHRoZSBUSSBjaGlwLCBhbmQgc3VwcG9ydCB0aGUgc2FtZQ0KPiBi
aXQgc2V0dGluZ3MgaW4gVk9VVF9NT0RFID8gSXQgc2VlbXMgYSBiaXQgdW5saWtlbHkgdGhhdCBU
SSdzIHJlZ2lzdGVyIGRlZmluaXRpb25zDQo+IHdvdWxkIG1ha2UgaXQgaW50byBhbiBJbmZpbmVv
biBjaGlwLg0KPiANCj4gQWxzbywgd2hhdCBhYm91dCB0aGUgU04xOTA2MDE2ID8gSSBkb24ndCBm
aW5kIHRoYXQgYW55d2hlcmUsIGV4Y2VwdCBpbiBvbmUNCj4gcGxhY2Ugd2hlcmUgaXQgaXMgbGlz
dGVkIGFzIE1DVSBmcm9tIFRJLg0KDQpJJ2xsIGRyb3AgU04xOTA2MDE2Lg0KRGF0YXNoZWV0IGhh
cyBhIHRpdGxlIER1YWwgY2hhbm5lbCBEQ0FQKyBtdWx0aXBoYXNlIGNvbnRyb2xsZXJzOg0KVFBT
NTM2ODgsIFNOMTkwNjAxNi4NCkJ1dCBtYXliZSBpdCdzIHNvbWUgY3VzdG9tIGRldmljZSAoYW55
d2F5IEknbGwgdHJ5IHRvIGNoZWNrIGl0IHdpdGggVEkpLg0KDQo+IA0KPiA+IEluZmluZW9uIGRh
dGFzaGVldCByZWZlcnMgYWxsIHRoZXNlIGRldmljZSBhcyBYRFBFMTIyeHhDIGZhbWlseSBhbmQg
aXQNCj4gPiBkb2Vzbid0IHNwZWNpZnkgYW55IGRpZmZlcmVuY2VzIGluIHJlZ2lzdGVyIG1hcCBi
ZXR3ZWVuIHRoZXNlIGRldmljZXMuDQo+IA0KPiBUaGF0IGlzIGEgYml0IHZhZ3VlLCBlc3BlY2lh
bGx5IHdoZW4gaXQgaW5jbHVkZXMgZGV2aWNlcyB3aGljaCByZXR1cm4gemVybyByZXN1bHRzDQo+
IHdpdGggR29vZ2xlIHNlYXJjaGVzLg0KPiANCj4gIkEiIHZzLiAiQyIgbWF5IGRpc3Rpbmd1aXNo
IGF1dG9tb3RpdmUgdnMuIGNvbW1lcmNpYWw7IHRoZSAiQSIgZGV2aWNlIGlzIGxpc3RlZA0KPiB1
bmRlciBhdXRvbW90aXZlLiBJZiB0aGUgY29tbWFuZCBzZXQgaXMgdGhlIHNhbWUsIEkgZG9uJ3Qg
cmVhbGx5IHdhbnQgdGhlICJjIiBpbg0KPiB0aGUgaWQuDQoNCkdvdCBmZWVkYmFjayBmcm9tIElu
ZmluZW9uIGd1eXMuDQpObyBuZWVkICdDJyBhdCB0aGUgZW5kLCBhcyB5b3Ugd3JvdGUuDQpBbGwg
WERQRTEyMjUwLCBYRFBFMTIyNTQsIFhEUEUxMjI4MywgWERQRTEyMjg0LCBYRFBFMTIyODYgYXJl
DQp0cmVhdGVkIGluIHRoZSBzYW1lIHdheToNCnNhbWUgcGFnZXMsIHNhbWUgVk9VVF9NT0RFLCBW
T1VUX1JFQUQsIGV0Y2V0ZXJhLg0KDQo+IA0KPiA+IFRvbW9ycm93IHdlJ2xsIGhhdmUgZ3V5cyBm
cm9tIEluZmluZW9uIGluIG91ciBsYWIgYW5kIEknbGwgdmVyaWZ5IGlmDQo+ID4gdGhlcmUgaXMg
YW55IGRpZmZlcmVuY2UuDQo+IA0KPiBUZWxsIHRoZW0gdGhhdCBpdCBpc24ndCByZWFsbHkgaGVs
cGZ1bCB0byBrZWVwIHRoZWlyIGRhdGFzaGVldHMgdW5kZXIgd3JhcC4NCj4gVW5mb3J0dW5hdGVs
eSwgVEkgc3RhcnRlZCBkb2luZyB0aGUgc2FtZSwgd2hpY2ggaXNuJ3QgaGVscGZ1bCBlaXRoZXIu
DQoNClRvbGQgdGhlbSBhYm91dCBkYXRhc2hlZXRzIGF2YWlsYWJpbGl0eSAtIGdvdCA6KQ0KDQo+
IA0KPiBUaGFua3MsDQo+IEd1ZW50ZXINCj4gDQo+ID4gSWYgeWVzLCBJJ2xsIGxlYXZlIG9ubHkg
WFBERTEyMjg0Qy4NCj4gPg0KPiA+Pg0KPiA+PiBUaGFua3MsDQo+ID4+IEd1ZW50ZXINCj4gPj4N
Cj4gPj4+ICsJICBYRFBFMTIyODNDLCBYRFBFMTIyNTRDLCBYRFBFMTIyNTBDIGRldmljZXMuDQo+
ID4+Pg0KPiA+Pj4gICAgCSAgVGhpcyBkcml2ZXIgY2FuIGFsc28gYmUgYnVpbHQgYXMgYSBtb2R1
bGUuIElmIHNvLCB0aGUgbW9kdWxlIHdpbGwNCj4gPj4+ICAgIAkgIGJlIGNhbGxlZCB0cHM1MzY3
OS4NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3bW9uL3BtYnVzL3RwczUzNjc5LmMNCj4g
Pj4+IGIvZHJpdmVycy9od21vbi9wbWJ1cy90cHM1MzY3OS5jIGluZGV4IDdjZTJmY2E0YWNkZS4u
ZjM4ZWIxMTY3MzViDQo+ID4+PiAxMDA2NDQNCj4gPj4+IC0tLSBhL2RyaXZlcnMvaHdtb24vcG1i
dXMvdHBzNTM2NzkuYw0KPiA+Pj4gKysrIGIvZHJpdmVycy9od21vbi9wbWJ1cy90cHM1MzY3OS5j
DQo+ID4+PiBAQCAtODksNiArODksMTMgQEAgc3RhdGljIGludCB0cHM1MzY3OV9wcm9iZShzdHJ1
Y3QgaTJjX2NsaWVudA0KPiA+Pj4gKmNsaWVudCwNCj4gPj4+DQo+ID4+PiAgICBzdGF0aWMgY29u
c3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgdHBzNTM2NzlfaWRbXSA9IHsNCj4gPj4+ICAgIAl7InRw
czUzNjc5IiwgMH0sDQo+ID4+PiArCXsidHBzNTM2ODgiLCAwfSwNCj4gPj4+ICsJeyJzbjE5MDYw
MTYiLCAwfSwNCj4gPj4+ICsJeyJ4ZHBlMTIyODNjIiwgMH0sDQo+ID4+PiArCXsieGRwZTEyMjUw
YyIsIDB9LA0KPiA+Pj4gKwl7InhkcGUxMjI1NGMiLCAwfSwNCj4gPj4+ICsJeyJ4ZHBlMTIyODRj
IiwgMH0sDQo+ID4+PiArCXsieGRwZTEyMjg2YyIsIDB9LA0KPiA+Pg0KPiA+PiBBbHBoYWJldGlj
IG9yZGVyLCBwbGVhc2UuDQo+ID4+DQo+ID4+PiAgICAJe30NCj4gPj4+ICAgIH07DQo+ID4+Pg0K
PiA+Pj4gQEAgLTk2LDYgKzEwMywxMyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKGkyYywgdHBzNTM2
NzlfaWQpOw0KPiA+Pj4NCj4gPj4+ICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IF9fbWF5YmVfdW51c2VkIHRwczUzNjc5X29mX21hdGNoW10gPQ0KPiB7DQo+ID4+PiAgICAJey5j
b21wYXRpYmxlID0gInRpLHRwczUzNjc5In0sDQo+ID4+PiArCXsuY29tcGF0aWJsZSA9ICJ0aSx0
cHM1MzY4OCJ9LA0KPiA+Pj4gKwl7LmNvbXBhdGlibGUgPSAidGksc24xOTA2MDE2In0sDQo+ID4+
PiArCXsuY29tcGF0aWJsZSA9ICJpbmZpbmVvbix4ZHBlMTIyODNjIn0sDQo+ID4+PiArCXsuY29t
cGF0aWJsZSA9ICJpbmZpbmVvbix4ZHBlMTIyNTBjIn0sDQo+ID4+PiArCXsuY29tcGF0aWJsZSA9
ICJpbmZpbmVvbix4ZHBlMTIyNTRjIn0sDQo+ID4+PiArCXsuY29tcGF0aWJsZSA9ICJpbmZpbmVv
bix4ZHBlMTIyODRjIn0sDQo+ID4+PiArCXsuY29tcGF0aWJsZSA9ICJpbmZpbmVvbix4ZHBlMTIy
ODZjIn0sDQo+ID4+PiAgICAJe30NCj4gPj4+ICAgIH07DQo+ID4+PiAgICBNT0RVTEVfREVWSUNF
X1RBQkxFKG9mLCB0cHM1MzY3OV9vZl9tYXRjaCk7DQo+ID4+Pg0KPiA+DQoNCg==
