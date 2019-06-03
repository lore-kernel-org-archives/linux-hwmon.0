Return-Path: <SRS0=XoCa=UC=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFEDC04AB5
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Jun 2019 13:34:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C373227DBB
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Jun 2019 13:34:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="iILaH7jo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728740AbfFCNei (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Jun 2019 09:34:38 -0400
Received: from mail-eopbgr40116.outbound.protection.outlook.com ([40.107.4.116]:24609
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727387AbfFCNei (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 3 Jun 2019 09:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjL1HnmUv7JukHh9/TAzNg8tgA2mJjF2KoTx5Q7XY8k=;
 b=iILaH7jo8ePGBCZBhytUbgiwzkxkg8kg0psx6w47MWhCVj2Onn+8SDKt0HUhlkn0f8/87J8YTOUUuO7gD/WIzi3JIULZlVmLO0KjmdzPmkyYmAI1HBVV04ms6CPbZlRUK0uaFi+HwOKhBuJIGKAu8QdWmQELpyu1FeS7wN4CWHg=
Received: from VI1PR07MB3165.eurprd07.prod.outlook.com (10.175.243.15) by
 VI1PR07MB4064.eurprd07.prod.outlook.com (52.134.20.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.4; Mon, 3 Jun 2019 13:34:33 +0000
Received: from VI1PR07MB3165.eurprd07.prod.outlook.com
 ([fe80::1403:5377:c11d:a41a]) by VI1PR07MB3165.eurprd07.prod.outlook.com
 ([fe80::1403:5377:c11d:a41a%7]) with mapi id 15.20.1965.011; Mon, 3 Jun 2019
 13:34:33 +0000
From:   "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] adm1275: support PMBUS_VIRT_*_SAMPLES
Thread-Topic: [PATCH v2 2/2] adm1275: support PMBUS_VIRT_*_SAMPLES
Thread-Index: AQHVFivj8N7SetslHUKR51Hkdr+Gt6aJ9caA
Date:   Mon, 3 Jun 2019 13:34:33 +0000
Message-ID: <9cde209a-aa14-8820-3006-fccd1459ad8d@nokia.com>
References: <25c0f33fa281e8fb9781b71bda9e2f570113df85.1559140351.git.krzysztof.adamski@nokia.com>
 <7524aaac106af01da2b52662b160535a211ebcd0.1559140351.git.krzysztof.adamski@nokia.com>
In-Reply-To: <7524aaac106af01da2b52662b160535a211ebcd0.1559140351.git.krzysztof.adamski@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.166]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: HE1PR07CA0022.eurprd07.prod.outlook.com
 (2603:10a6:7:67::32) To VI1PR07MB3165.eurprd07.prod.outlook.com
 (2603:10a6:802:21::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da32acf7-9601-430c-fa78-08d6e82836ad
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR07MB4064;
x-ms-traffictypediagnostic: VI1PR07MB4064:
x-microsoft-antispam-prvs: <VI1PR07MB4064F9B20EDFD15903627A6488140@VI1PR07MB4064.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(31686004)(229853002)(64126003)(71190400001)(6512007)(71200400001)(14444005)(64756008)(66446008)(36756003)(66556008)(256004)(66476007)(73956011)(66946007)(65806001)(65826007)(486006)(68736007)(86362001)(11346002)(31696002)(66066001)(446003)(65956001)(5660300002)(2616005)(476003)(52116002)(76176011)(508600001)(8936002)(186003)(81166006)(2906002)(81156014)(8676002)(110136005)(316002)(4326008)(305945005)(6246003)(58126008)(14454004)(26005)(6486002)(386003)(6436002)(6506007)(102836004)(6116002)(25786009)(3846002)(99286004)(53546011)(7736002)(53936002);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR07MB4064;H:VI1PR07MB3165.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7FR+cKPaOqxns24bIYa8ijFv7/IFmPzt2C3IFc7NQX9VhzQg3MJlH7UzdeSgAeXMA+wIP84yxdPThOynsPK8wTxAUtAtVXVBprhLy4cj12vj32EU3NXUkoqG9sSQT+Y3IGCl+UEL8AyOwwvv0dEC3ngJdla/kPiT43sRDtHRuNKOEIvbnxclVGZLRZ4K3SuEGD38KRC2MtjNK7s6XQt2cr9971Z8RXxWewoHRpGZ8UAe5Mr+Mj15U46xoSI9Uvr/tYOGa0m0okzttceh9hesk3GAhdld80rKR65YCgtNppHhJHtfPEuy0D3YjDKK1bLjAnDYJ0stVU2qFNtzptN1pz3i8xO6s1dIopgs9gzZ3xcdfnbMdwZs8FM3+Y0RpjEO4BcqzzX14H/yUY9/pN1red6A5re1I/Mgla/snjUsMts=
Content-Type: text/plain; charset="utf-8"
Content-ID: <224B6C24BFC1AB4188666B1CE19ACA95@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da32acf7-9601-430c-fa78-08d6e82836ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 13:34:33.5439
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: alexander.sverdlin@nokia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB4064
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

SGkhDQoNCk9uIDI5LzA1LzIwMTkgMTY6MzYsIEFkYW1za2ksIEtyenlzenRvZiAoTm9raWEgLSBQ
TC9Xcm9jbGF3KSB3cm90ZToNCj4gVGhlIGRldmljZSBzdXBwb3J0cyBzZXR0aW5nIHRoZSBudW1i
ZXIgb2Ygc2FtcGxlcyBmb3IgYXZlcmFnaW5nIHRoZQ0KPiBtZWFzdXJlbWVudHMuIFRoZXJlIGFy
ZSB0d28gc2VwYXJhdGUgc2V0dGluZ3MgLSBQV1JfQVZHIGZvciBhdmVyYWdpbmcNCj4gUElOIGFu
ZCBWSV9BVkcgZm9yIGF2ZXJhZ2luZyBWSU4vVkFVWC9JT1VULCBib3RoIGJlaW5nIHBhcnQgb2YN
Cj4gUE1PTl9DT05GSUcgcmVnaXN0ZXIuIFRoZSB2YWx1ZXMgYXJlIHN0b3JlZCBhcyBleHBvbmVu
dCBvZiBiYXNlIDIgb2YgdGhlDQo+IGFjdHVhbCBudW1iZXIgb2Ygc2FtcGxlcyB0aGF0IHdpbGwg
YmUgdGFrZW4uDQoNClJldmlld2VkLWJ5OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5z
dmVyZGxpbkBub2tpYS5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEFkYW1za2kg
PGtyenlzenRvZi5hZGFtc2tpQG5va2lhLmNvbT4NCj4gLS0tDQo+IA0KPiBDaGFuZ2VzIGluIHYy
Og0KPiAtIE1vdmVkIG11dGV4IGxvY2sgdG8gcG1idXNfc2V0X3NhbXBsZXMgKHNlZSBwYXRjaCAx
LzIpDQo+IC0gQ2hhbmdlZCBtYXNrIHR5cGUgcGFzc2VkIGFzIGFyZ3VtZW50IHRvIGFkbTEyNzVf
cmVhZF9wbW9uX2NvbmZpZyBhbmQNCj4gICBhZG0xMjc1X3dyaXRlX3Btb25fY29uZmlnIHRvIHUx
Ng0KPiAtIENoYW5nZWQgMSA8PCByZXQgdG8gQklUKHJldCkNCj4gDQo+ICBkcml2ZXJzL2h3bW9u
L3BtYnVzL2FkbTEyNzUuYyB8IDYxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
DQo+ICAxIGZpbGUgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vcG1idXMvYWRtMTI3NS5jIGIvZHJpdmVycy9o
d21vbi9wbWJ1cy9hZG0xMjc1LmMNCj4gaW5kZXggZjU2OTM3MmM5MjA0Li4wYzM0OTNmYTUzZWEg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaHdtb24vcG1idXMvYWRtMTI3NS5jDQo+ICsrKyBiL2Ry
aXZlcnMvaHdtb24vcG1idXMvYWRtMTI3NS5jDQo+IEBAIC0yMyw2ICsyMyw4IEBADQo+ICAjaW5j
bHVkZSA8bGludXgvc2xhYi5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2kyYy5oPg0KPiAgI2luY2x1
ZGUgPGxpbnV4L2JpdG9wcy5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+DQo+ICsj
aW5jbHVkZSA8bGludXgvbG9nMi5oPg0KPiAgI2luY2x1ZGUgInBtYnVzLmgiDQo+ICANCj4gIGVu
dW0gY2hpcHMgeyBhZG0xMDc1LCBhZG0xMjcyLCBhZG0xMjc1LCBhZG0xMjc2LCBhZG0xMjc4LCBh
ZG0xMjkzLCBhZG0xMjk0IH07DQo+IEBAIC03OCw2ICs4MCwxMCBAQCBlbnVtIGNoaXBzIHsgYWRt
MTA3NSwgYWRtMTI3MiwgYWRtMTI3NSwgYWRtMTI3NiwgYWRtMTI3OCwgYWRtMTI5MywgYWRtMTI5
NCB9Ow0KPiAgI2RlZmluZSBBRE0xMDc1X1ZBVVhfT1ZfV0FSTgkJQklUKDcpDQo+ICAjZGVmaW5l
IEFETTEwNzVfVkFVWF9VVl9XQVJOCQlCSVQoNikNCj4gIA0KPiArI2RlZmluZSBBRE0xMjc1X1BX
Ul9BVkdfTUFTSwkJR0VOTUFTSygxMywgMTEpDQo+ICsjZGVmaW5lIEFETTEyNzVfVklfQVZHX01B
U0sJCUdFTk1BU0soMTAsIDgpDQo+ICsjZGVmaW5lIEFETTEyNzVfU0FNUExFU19BVkdfTUFYCTEy
OA0KPiArDQo+ICBzdHJ1Y3QgYWRtMTI3NV9kYXRhIHsNCj4gIAlpbnQgaWQ7DQo+ICAJYm9vbCBo
YXZlX29jX2ZhdWx0Ow0KPiBAQCAtMTY0LDYgKzE3MCwzNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGNvZWZmaWNpZW50cyBhZG0xMjkzX2NvZWZmaWNpZW50c1tdID0gew0KPiAgCVsxOF0gPSB7IDc2
NTgsIDAsIC0zIH0sCQkvKiBwb3dlciwgMjFWLCBpcmFuZ2UyMDAgKi8NCj4gIH07DQo+ICANCj4g
K3N0YXRpYyBpbmxpbmUgaW50IGFkbTEyNzVfcmVhZF9wbW9uX2NvbmZpZyhzdHJ1Y3QgaTJjX2Ns
aWVudCAqY2xpZW50LCB1MTYgbWFzaykNCj4gK3sNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJcmV0
ID0gaTJjX3NtYnVzX3JlYWRfd29yZF9kYXRhKGNsaWVudCwgQURNMTI3NV9QTU9OX0NPTkZJRyk7
DQo+ICsJaWYgKHJldCA8IDApDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwlyZXR1cm4gRklF
TERfR0VUKG1hc2ssICh1MTYpcmV0KTsNCj4gK30NCj4gKw0KPiArc3RhdGljIGlubGluZSBpbnQg
YWRtMTI3NV93cml0ZV9wbW9uX2NvbmZpZyhzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LCB1MTYg
bWFzaywNCj4gKwkJCQkJICAgIHUxNiB3b3JkKQ0KPiArew0KPiArCWNvbnN0IHN0cnVjdCBwbWJ1
c19kcml2ZXJfaW5mbyAqaW5mbyA9IHBtYnVzX2dldF9kcml2ZXJfaW5mbyhjbGllbnQpOw0KPiAr
CXN0cnVjdCBhZG0xMjc1X2RhdGEgKmRhdGEgPSB0b19hZG0xMjc1X2RhdGEoaW5mbyk7DQo+ICsJ
aW50IHJldDsNCj4gKw0KPiArCXJldCA9IGkyY19zbWJ1c19yZWFkX3dvcmRfZGF0YShjbGllbnQs
IEFETTEyNzVfUE1PTl9DT05GSUcpOw0KPiArCWlmIChyZXQgPCAwKQ0KPiArCQlyZXR1cm4gcmV0
Ow0KPiArDQo+ICsJd29yZCA9IEZJRUxEX1BSRVAobWFzaywgd29yZCkgfCAocmV0ICYgfm1hc2sp
Ow0KPiArCXJldCA9IGkyY19zbWJ1c193cml0ZV93b3JkX2RhdGEoY2xpZW50LCBBRE0xMjc1X1BN
T05fQ09ORklHLCB3b3JkKTsNCj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gIHN0
YXRpYyBpbnQgYWRtMTI3NV9yZWFkX3dvcmRfZGF0YShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50
LCBpbnQgcGFnZSwgaW50IHJlZykNCj4gIHsNCj4gIAljb25zdCBzdHJ1Y3QgcG1idXNfZHJpdmVy
X2luZm8gKmluZm8gPSBwbWJ1c19nZXRfZHJpdmVyX2luZm8oY2xpZW50KTsNCj4gQEAgLTI0Miw2
ICsyNzYsMTkgQEAgc3RhdGljIGludCBhZG0xMjc1X3JlYWRfd29yZF9kYXRhKHN0cnVjdCBpMmNf
Y2xpZW50ICpjbGllbnQsIGludCBwYWdlLCBpbnQgcmVnKQ0KPiAgCQlpZiAoIWRhdGEtPmhhdmVf
dGVtcF9tYXgpDQo+ICAJCQlyZXR1cm4gLUVOWElPOw0KPiAgCQlicmVhazsNCj4gKwljYXNlIFBN
QlVTX1ZJUlRfUE9XRVJfU0FNUExFUzoNCj4gKwkJcmV0ID0gYWRtMTI3NV9yZWFkX3Btb25fY29u
ZmlnKGNsaWVudCwgQURNMTI3NV9QV1JfQVZHX01BU0spOw0KPiArCQlpZiAocmV0IDwgMCkNCj4g
KwkJCWJyZWFrOw0KPiArCQlyZXQgPSBCSVQocmV0KTsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBQ
TUJVU19WSVJUX0lOX1NBTVBMRVM6DQo+ICsJY2FzZSBQTUJVU19WSVJUX0NVUlJfU0FNUExFUzoN
Cj4gKwkJcmV0ID0gYWRtMTI3NV9yZWFkX3Btb25fY29uZmlnKGNsaWVudCwgQURNMTI3NV9WSV9B
VkdfTUFTSyk7DQo+ICsJCWlmIChyZXQgPCAwKQ0KPiArCQkJYnJlYWs7DQo+ICsJCXJldCA9IEJJ
VChyZXQpOw0KPiArCQlicmVhazsNCj4gIAlkZWZhdWx0Og0KPiAgCQlyZXQgPSAtRU5PREFUQTsN
Cj4gIAkJYnJlYWs7DQo+IEBAIC0yODYsNiArMzMzLDE3IEBAIHN0YXRpYyBpbnQgYWRtMTI3NV93
cml0ZV93b3JkX2RhdGEoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwgaW50IHBhZ2UsIGludCBy
ZWcsDQo+ICAJY2FzZSBQTUJVU19WSVJUX1JFU0VUX1RFTVBfSElTVE9SWToNCj4gIAkJcmV0ID0g
cG1idXNfd3JpdGVfd29yZF9kYXRhKGNsaWVudCwgMCwgQURNMTI3OF9QRUFLX1RFTVAsIDApOw0K
PiAgCQlicmVhazsNCj4gKwljYXNlIFBNQlVTX1ZJUlRfUE9XRVJfU0FNUExFUzoNCj4gKwkJd29y
ZCA9IGNsYW1wX3ZhbCh3b3JkLCAxLCBBRE0xMjc1X1NBTVBMRVNfQVZHX01BWCk7DQo+ICsJCXJl
dCA9IGFkbTEyNzVfd3JpdGVfcG1vbl9jb25maWcoY2xpZW50LCBBRE0xMjc1X1BXUl9BVkdfTUFT
SywNCj4gKwkJCQkJCWlsb2cyKHdvcmQpKTsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBQTUJVU19W
SVJUX0lOX1NBTVBMRVM6DQo+ICsJY2FzZSBQTUJVU19WSVJUX0NVUlJfU0FNUExFUzoNCj4gKwkJ
d29yZCA9IGNsYW1wX3ZhbCh3b3JkLCAxLCBBRE0xMjc1X1NBTVBMRVNfQVZHX01BWCk7DQo+ICsJ
CXJldCA9IGFkbTEyNzVfd3JpdGVfcG1vbl9jb25maWcoY2xpZW50LCBBRE0xMjc1X1ZJX0FWR19N
QVNLLA0KPiArCQkJCQkJaWxvZzIod29yZCkpOw0KPiArCQlicmVhazsNCj4gIAlkZWZhdWx0Og0K
PiAgCQlyZXQgPSAtRU5PREFUQTsNCj4gIAkJYnJlYWs7DQo+IEBAIC00MzksNyArNDk3LDggQEAg
c3RhdGljIGludCBhZG0xMjc1X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsDQo+ICAJ
aW5mby0+Zm9ybWF0W1BTQ19DVVJSRU5UX09VVF0gPSBkaXJlY3Q7DQo+ICAJaW5mby0+Zm9ybWF0
W1BTQ19QT1dFUl0gPSBkaXJlY3Q7DQo+ICAJaW5mby0+Zm9ybWF0W1BTQ19URU1QRVJBVFVSRV0g
PSBkaXJlY3Q7DQo+IC0JaW5mby0+ZnVuY1swXSA9IFBNQlVTX0hBVkVfSU9VVCB8IFBNQlVTX0hB
VkVfU1RBVFVTX0lPVVQ7DQo+ICsJaW5mby0+ZnVuY1swXSA9IFBNQlVTX0hBVkVfSU9VVCB8IFBN
QlVTX0hBVkVfU1RBVFVTX0lPVVQgfA0KPiArCQkJUE1CVVNfSEFWRV9TQU1QTEVTOw0KPiAgDQo+
ICAJaW5mby0+cmVhZF93b3JkX2RhdGEgPSBhZG0xMjc1X3JlYWRfd29yZF9kYXRhOw0KPiAgCWlu
Zm8tPnJlYWRfYnl0ZV9kYXRhID0gYWRtMTI3NV9yZWFkX2J5dGVfZGF0YTsNCj4gDQoNCi0tIA0K
QmVzdCByZWdhcmRzLA0KQWxleGFuZGVyIFN2ZXJkbGluLg0K
