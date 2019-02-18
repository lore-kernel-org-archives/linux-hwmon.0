Return-Path: <SRS0=HSB5=QZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E927C43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Feb 2019 21:19:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC40721738
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Feb 2019 21:19:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=Mellanox.com header.i=@Mellanox.com header.b="B4G04/SG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730487AbfBRVTb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Feb 2019 16:19:31 -0500
Received: from mail-eopbgr00084.outbound.protection.outlook.com ([40.107.0.84]:56442
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729382AbfBRVT2 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Feb 2019 16:19:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2aXQV2M4KzZM82/HPqo+FSYQYjLuEy4Nd6/87xOC7h0=;
 b=B4G04/SG3yq5axaGsR9AaaiOYBoMz+dj+7IRJzbzQ7oqazgeoiWQ5a+zx6o4ewiX4m6+iOjGv2bCdbF0uweZ5s+c86WwFob+PsQ4PUU6NafpP1T4HrUlaNGsn9fHcPRQ/BDdPevxo4ai7zDxd4Z5dIh4VQPpEthYLrTvIN3RRoU=
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com (20.177.196.210) by
 AM6PR05MB5704.eurprd05.prod.outlook.com (20.178.92.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.19; Mon, 18 Feb 2019 21:19:22 +0000
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::195d:8821:cbf3:ca92]) by AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::195d:8821:cbf3:ca92%5]) with mapi id 15.20.1622.018; Mon, 18 Feb 2019
 21:19:22 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Michael Shych <michaelsh@mellanox.com>
Subject: RE: query for hwmon: (mlxreg-fan) patch
Thread-Topic: query for hwmon: (mlxreg-fan) patch
Thread-Index: AdTHxJ4hNo4BJOqfQpaqZKIVL1K+ZAAAtCOAAABTsfA=
Date:   Mon, 18 Feb 2019 21:19:22 +0000
Message-ID: <AM6PR05MB5224795D7BBB93224AC7BCAAA2630@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <AM6PR05MB522493FB8E567BFFFE1A95EDA2630@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <c5619fa9-b05c-5a84-26ec-382c7fed80bf@roeck-us.net>
In-Reply-To: <c5619fa9-b05c-5a84-26ec-382c7fed80bf@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee8562d5-a45f-4dde-4ebf-08d695e6c08a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:AM6PR05MB5704;
x-ms-traffictypediagnostic: AM6PR05MB5704:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtBTTZQUjA1TUI1NzA0OzIzOmY3OU5JZndLa3FCS1FXa1lEM1NWa1lHdnFI?=
 =?utf-8?B?YjMza3VHQWZ4QWVpYk9kNnBsTzZUdEhQejBaN2JOZzZab0RmeCtBMzJud0Fn?=
 =?utf-8?B?ZTVCUDlGTEhSVzRldktqaUFnS3hDRFdubXBNaWcycTBMOWNOemlpSDgzekg0?=
 =?utf-8?B?TFlSQ3E4dVl3TEVhU0ZCMHk5d0NwRzVraC9tL0ZiQnlLSUVzVFowNjNQV0Ny?=
 =?utf-8?B?em82aXlSSHBYMnJVQVhMTEV1a1gxZTJybVJoT05EOWJEZWw5ZTVQNGxVL0Rm?=
 =?utf-8?B?UXBMbG9GNEpyMFQzVGVwNnh1SHZKSU82ck5mZG1FUHUzRGhYclBOaGJyTWxa?=
 =?utf-8?B?MWlYNE5qV1hkTHZxa1lWNFNUdWlQRy9BRmg2c3QxMWsweitNOHZJVzNZVHJQ?=
 =?utf-8?B?WXpFbzNhaHBrSTB0OVlwbFhzVjZZRzNJK2N0Y25Qai9KRmdtL3k2U0xnNllJ?=
 =?utf-8?B?TXN1QUdyNE0xNlJqVnVHM3p1NUZMT1lFWSs2VkxjVlBNRzYwWFZoTkxiTmtB?=
 =?utf-8?B?WGNHQjVrdjhGVE1LbW9LM2VINkpIRnN6R1dSRlcwbSs1L3VzWXZ2aE5ISjNk?=
 =?utf-8?B?ZnNxcEJBZUM3N2drYUtxS25WUTA5Qkk5U2xlMDhsM05lWVMxUzM5MjVJVEJR?=
 =?utf-8?B?bUxVdGw4OHViVThLWHNUakRUdDRQNDBiWTZ3aThhdEpCRk50YUlaVFJsVEVR?=
 =?utf-8?B?UEQyUk5YalhhMFBQcWVjKzNVNVNpQ3FsMlNpRXhUTEhDclV4Z3l5V1JRT3lN?=
 =?utf-8?B?bWUxcFVScW5yYXVpWWtZdUxUK3pncGcxN1NaRkEwUGZTQXN0ZEhOSnVjUU9x?=
 =?utf-8?B?eXVLc2FiVnBjOGI3bkN1eWswWm5oa1lPaUZuOHpqYzNnZndNcGYwdGVqblJ3?=
 =?utf-8?B?ejFBUXl6Z1E5U083UFl2VmhiZnpoamcxMnBCeDNYdFd2ZllCOEJyREFEK2NF?=
 =?utf-8?B?K1NGTmtLVmJ3Z3I4OVQzUEVnelhrMk9LYzJZODJNYlFEZXBFekZiam1CcHNV?=
 =?utf-8?B?WUp2ODJnd1RjUDY1WWE1RkdLL0RST3RvSGVQV094SWIyQlNoeFhkMTlPNjJF?=
 =?utf-8?B?SHluSk9aeTFEdzIzN1ZPSEZhMnVRbERhVjhld2V3NVRHMWxlQ0VaT056Y3BV?=
 =?utf-8?B?bDNGSGRnaTBhdDNta2RqTjFHdmFaN0g0eTAvY2wyb1VpRFBaLzVyeVlrQU0v?=
 =?utf-8?B?N2lmKzh1Y3hpOUhmYjBxNTJlSTZFc09KelRWWVdnSE9oM0NqbkxSMVR5cFRG?=
 =?utf-8?B?a2RhRUJGNVU5NlNzQkYxQnloK3pPb3ptczZrZ2swQVpjeDY1T21vQ1hydzlx?=
 =?utf-8?B?THNtZUxBTzZKMldLRHpub1VHK0pDaTNSMk12QmhPSGFKeUZ6d0tSclM5ZHRp?=
 =?utf-8?B?eDV1cThQTUc1OXdBVEF4MWRtdlpyV0tzblc5UlVsampJOE5LaWtGT1owd3JR?=
 =?utf-8?B?QkxWbEp6Z21XVTM5eU5ERjB2V3hIUXVpbC9lb1hLMHoxbjJ6bzVtcDRVcmto?=
 =?utf-8?B?RUJXZlg3K0JCSzRheXhTNFFuY09DV2FaVkNEZXk1bGtmcmJhRzl3U1AycEhl?=
 =?utf-8?B?a0xManUwVXdDYWpQaXhSNUNDY1h1cEFOaHVCc1BoVVNtcnNMQzJzcjkrY3ZT?=
 =?utf-8?B?Tmo3bEdCNkIxWlozVm53NXgxNzBCMFNrcGVwN20zamIvK3JpSVYrazhIMktP?=
 =?utf-8?B?YTQydUVjMGRJMFc4b2pvbytzcjZha3lVWkZZU1gzVUtzZkxjc3Z0M1FHd2Rv?=
 =?utf-8?B?VnpUYnZKUUVzdUhZU2x2QT09?=
x-microsoft-antispam-prvs: <AM6PR05MB570439376D69110936578661A2630@AM6PR05MB5704.eurprd05.prod.outlook.com>
x-forefront-prvs: 09525C61DB
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(136003)(366004)(346002)(376002)(39860400002)(13464003)(199004)(189003)(26005)(71190400001)(71200400001)(53936002)(316002)(54906003)(478600001)(305945005)(7736002)(9686003)(74316002)(68736007)(55016002)(6306002)(446003)(105586002)(106356001)(2906002)(6916009)(3846002)(53546011)(6116002)(6506007)(102836004)(14454004)(256004)(186003)(76176011)(99286004)(966005)(7696005)(4326008)(86362001)(107886003)(5660300002)(8676002)(486006)(476003)(81166006)(25786009)(81156014)(33656002)(11346002)(229853002)(66066001)(6246003)(97736004)(8936002)(6436002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB5704;H:AM6PR05MB5224.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xDXtoM1mDlvP+0XlRSLtjxepkscuEcL5qzNTeNOivbahcJc4JgxaE45px9AZqUug+upo/HXihvd9v2CS10rN2tEWgxG6AtzPmZ0wdF2jICFzOy1IYeroNI+XWXsbavGfPmgquj9uzvrCBIPZOiO5MflC7pw82+UILzzk1Hv/DSTlgw87m1dAAWkVgvBI9Htlp05wqWc8dG9XkciV9PSuVKTw3ZpbChjGy/97hEKz4eW3FllCY798SjxfjmGpwRo/6WnzF1Nm1UyLbIvVP8VwElGDLH6J2xVNymgsuvZ1rNrWQKik0blyF5JTe53Rq+gcdQpjgzJfILsE7EOzmBP3UBKlYc19vkgx66DbMnLWCDvWr65g1oOLsF0dtfxyYtiWsp4naqHB5N5qIH+veMFHudTGUTrU3h5JJ/NageqjvPM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8562d5-a45f-4dde-4ebf-08d695e6c08a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2019 21:19:22.3469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5704
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VlbnRlciBSb2VjayA8
Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBHdWVudGVyIFJvZWNrDQo+IFNlbnQ6IE1v
bmRheSwgRmVicnVhcnkgMTgsIDIwMTkgMTA6MjEgUE0NCj4gVG86IFZhZGltIFBhc3Rlcm5hayA8
dmFkaW1wQG1lbGxhbm94LmNvbT4NCj4gQ2M6IGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZw0K
PiBTdWJqZWN0OiBSZTogcXVlcnkgZm9yIGh3bW9uOiAobWx4cmVnLWZhbikgcGF0Y2gNCj4gDQo+
IE9uIDIvMTgvMTkgMTI6MDcgUE0sIFZhZGltIFBhc3Rlcm5hayB3cm90ZToNCj4gPiBIaSBHdWVu
dGVyLA0KPiA+DQo+ID4gSSB3b3VsZCBsaWtlIHRvIGFzayB5b3UgYWJvdXQgdGhlIHdheSBvZiBz
ZW5kaW5nIHRoZSBwYXRjaCBmb3INCj4gPiBkcml2ZXJzL2h3bW9uL21seHJlZy1mYW4uYy4NCj4g
Pg0KPiA+IFRoaXMgcGF0Y2ggbWFrZXMgdXNlIG9mIG5ldyAiY2FwYWJpbGl0eSIgcmVnaXN0ZXIs
IGJ1dCByZXF1aXJlZCBjb21taXQNCj4gPiAicGxhdGZvcm1fZGF0YS9tbHhyZWc6IEFkZCBjYXBh
YmlsaXR5IGZpZWxkIHRvIGNvcmUgcGxhdGZvcm0gZGF0YSINCj4gPiBmcm9tIHBsYXRmb3JtIGZv
ci1uZXh0IGJyYW5jaDoNCj4gPiBodHRwOi8vZ2l0LmluZnJhZGVhZC5vcmcvbGludXgtcGxhdGZv
cm0tZHJpdmVycy14ODYuZ2l0L2Jsb2JkaWZmLzliMjhhDQo+ID4NCj4gYTFkMGVhZTFiZTEwMTZj
OGY0YmE1MDQ1NDVjYWZmMDFkYTMuLjk0NmU0ZTAyYjExODg5Y2IxNjFiMTVmZjQ3MTJhOGINCj4g
YTINCj4gPiAxYTUwZWI2Oi9pbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvbWx4cmVnLmgNCj4g
Pg0KPiA+IElzIGl0IHBvc3NpYmx5IHRvIHNlbmQgYSBwYXRjaCB3aXRoIHN1Y2ggZGVwZW5kZW5j
eT8gT3IgSSBzaG91bGQgd2FpdA0KPiA+IHVudGlsDQo+ID4gInBsYXRmb3JtX2RhdGEvbWx4cmVn
OiBBZGQgY2FwYWJpbGl0eSBmaWVsZCB0byBjb3JlIHBsYXRmb3JtIGRhdGEiIGlzDQo+ID4gZ290
IHRvIHVwc3RyZWFtPw0KPiA+DQo+IA0KPiBBIHNpbmdsZSBzZXJpZXMgc3VibWl0dGVkIHRocm91
Z2ggb25lIG1haW50YWluZXIsIHdpdGggYWNrcyBmcm9tIGFsbCB0aGUgb3RoZXINCj4gbWFpbnRh
aW5lcnMsIGlzIGFsd2F5cyB0aGUgZWFzaWVzdC4gT3RoZXJ3aXNlIG9uZSBtYWludGFpbmVyIHdv
dWxkIGhhdmUgdG8NCj4gY3JlYXRlIGFuIGltbW11dGFibGUgYnJhbmNoIHdpdGggdGhlIGVzc2Vu
dGlhbCBwYXRjaChlcykgbmVlZGVkIGJ5IGFsbCB0aGUNCj4gb3RoZXJzLiBPciwgeWVzLCB5b3Ug
Y291bGQgd2FpdCBmb3IgdGhlIGluZnJhc3RydWN0dXJlIHRvIGJlIGluIHBsYWNlLg0KDQpPSy4g
SSBzZWUuDQpXaWxsIGZvbGxvdyB5b3UgaW5wdXQgZm9yIHRoZSBmdXR1cmUgcGF0Y2hlcy4NCg0K
SSB1c2VkIHRoaXMgZmllbGQgaW4gbWx4LXBsYXRmb3JtIGFuZCBtbHhyZS1ob3RwbHVnIGRyaXZl
cnMgYW5kIGFsc28NCm5lZWQgaXQgZm9yIG1seHJlZy1mYW4gYW5kIGxlZHMtbWx4cmVnIGRyaXZl
ci4NCkFuZCBJIHRob3VnaHQgdGhhdCBwdXR0aW5nIGFsbCBpbiBhIHNpbmdsZSBwYXRjaHNldCB3
aWxsIGNvbXBsaWNhdGUNCnN1Ym1pc3Npb24uIFdpbGwgbGVhcm4gZnJvbSB0aGlzIG1pc3Rha2Uu
DQoNCj4gDQo+IE1ha2VzIG1lIHdvbmRlciwgdGhvdWdoOiBJZiB5b3UgYXJlIG9wZW4gdG8gZG9p
bmcgdGhhdCwgd2h5IHRoZSBjb21wbGV4LA0KPiBjb25mdXNpbmcsIGFuZCByaXNreSBtbHhyZWdf
d2R0X2NoZWNrX3dhdGNoZG9nX3R5cGUoKSBpbiB0aGUgd2F0Y2hkb2cgZHJpdmVyDQo+IChpbnN0
ZWFkIG9mIHByb3ZpZGluZyBhIG1lYW5zIGZvciB0aGUgZHJpdmVyIHRvIGdldCB0aGUgSFcgdmVy
c2lvbiBkaXJlY3RseSBmcm9tDQo+IHRoZSBwYXJlbnQpID8NCg0KV2VsbC4NCkFsbCB0aGlzIGlu
Zm8gcmVhbGx5IHNob3VsZCBiZSBhdmFpbGFibGUgaW4gbWx4LXBsYXRmb3JtLCB3aGljaCBpcyBh
IHBhcmVudC4NCkl0IGhhcyB0byBwcm92aWRlIGNvbmZpZ3VyYXRpb24gbGlrZToNCnN0YXRpYyBz
dHJ1Y3QgbWx4cmVnX2NvcmVfZGF0YSBtbHhwbGF0X21seGNwbGRfd2RfbWFpbl9yZWdzX3R5cGUy
W10gPSB7DQoJew0KCQkubGFiZWwgPSAiYWN0aW9uIiwNCgkJLnJlZyA9IE1MWFBMQVRfQ1BMRF9M
UENfUkVHX1dEMl9BQ1RfT0ZGU0VULA0KCQkubWFzayA9IE1MWFBMQVRfQ1BMRF9XRF9SRVNFVF9B
Q1RfTUFTSywNCgkJLmJpdCA9IDAsDQoJfSwNCgl7DQoJCS5sYWJlbCA9ICJwaW5nIiwNCgkJLnJl
ZyA9IE1MWFBMQVRfQ1BMRF9MUENfUkVHX1dEMl9BQ1RfT0ZGU0VULA0KCQkubWFzayA9IE1MWFBM
QVRfQ1BMRF9XRF9SRVNFVF9BQ1RfTUFTSywNCgkJLmJpdCA9IDAsDQoJfSwNCgkuLi4NCn07DQoN
Ckl0IGhvd2V2ZXIgd2lsbCByZXF1aXJlIHRvIGFkZCBzb21lIHNwZWNpYWwgZmllbGQgdG8gInN0
cnVjdCBtbHhyZWdfY29yZV9kYXRhIg0KZm9yIHBhc3NpbmcgaXQgdG8gbWx4X3dkdC4NCldlJ2xs
IHRoaW5rIGFib3V0IGl0Lg0KVGhhbmtzIGZvciB0aGlzIGlucHV0Lg0KDQo+IA0KPiBHdWVudGVy
DQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2gsDQpWYWRpbS4NCg==
