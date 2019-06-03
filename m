Return-Path: <SRS0=XoCa=UC=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3367AC04AB5
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Jun 2019 13:08:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05C382800C
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Jun 2019 13:08:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="RB6G4kWq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728353AbfFCNIz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Jun 2019 09:08:55 -0400
Received: from mail-eopbgr80132.outbound.protection.outlook.com ([40.107.8.132]:25221
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728351AbfFCNIy (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 3 Jun 2019 09:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUpXcIJdOKXSZeAFdcezu3ecUsHpwuRXtf78bKwgjG4=;
 b=RB6G4kWqWhf2ZgdYbyPZyUXqZf6zgGgbxLLFtQNoO6lSO4o3O9uJ9xYGrdZfbRz0ZoInold1dqw528OamtGChEia1RQLdWWwWeU7A6IGOLMvt/nGSd2ijXIUa/qRnCUjnCMkfTtEb8QnXEo3tcDfLae1ffXEUFXUYDMrFtjXsY0=
Received: from VI1PR07MB3165.eurprd07.prod.outlook.com (10.175.243.15) by
 VI1PR07MB4143.eurprd07.prod.outlook.com (52.134.26.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Mon, 3 Jun 2019 13:08:48 +0000
Received: from VI1PR07MB3165.eurprd07.prod.outlook.com
 ([fe80::1403:5377:c11d:a41a]) by VI1PR07MB3165.eurprd07.prod.outlook.com
 ([fe80::1403:5377:c11d:a41a%7]) with mapi id 15.20.1965.011; Mon, 3 Jun 2019
 13:08:48 +0000
From:   "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] pmbus: (core) mutex_lock write in
 pmbus_set_samples
Thread-Topic: [PATCH v2 1/2] pmbus: (core) mutex_lock write in
 pmbus_set_samples
Thread-Index: AQHVFiuJyDsKMA+7Ekunc/f1xOXSe6aJ7pSA
Date:   Mon, 3 Jun 2019 13:08:48 +0000
Message-ID: <c389f926-2a94-be95-840c-b3e009dbfaf7@nokia.com>
References: <25c0f33fa281e8fb9781b71bda9e2f570113df85.1559140351.git.krzysztof.adamski@nokia.com>
In-Reply-To: <25c0f33fa281e8fb9781b71bda9e2f570113df85.1559140351.git.krzysztof.adamski@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [131.228.32.166]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: HE1P192CA0007.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::17)
 To VI1PR07MB3165.eurprd07.prod.outlook.com (2603:10a6:802:21::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4694bb5-966e-4187-1585-08d6e8249d75
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR07MB4143;
x-ms-traffictypediagnostic: VI1PR07MB4143:
x-microsoft-antispam-prvs: <VI1PR07MB41435D1F5ACE876CF14DE30188140@VI1PR07MB4143.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(376002)(346002)(396003)(39860400002)(189003)(199004)(31686004)(76176011)(71190400001)(71200400001)(65826007)(25786009)(64126003)(486006)(26005)(446003)(11346002)(476003)(2616005)(52116002)(186003)(102836004)(99286004)(386003)(6506007)(53546011)(14444005)(256004)(4326008)(8676002)(31696002)(508600001)(6246003)(6512007)(7736002)(316002)(81156014)(81166006)(66446008)(64756008)(66556008)(66476007)(66946007)(58126008)(73956011)(86362001)(5660300002)(110136005)(2906002)(53936002)(305945005)(229853002)(36756003)(8936002)(3846002)(6486002)(66066001)(6116002)(6436002)(65806001)(14454004)(65956001)(68736007);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR07MB4143;H:VI1PR07MB3165.eurprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PHzace/2/2q/a5FhXNQ9UwDN2thmcy3/9yu2IpTwrU8TCONsKmFQDuPiGJat5ZqkkhzVM1YzfGFfBbPh/rjFiGbh85gVODIn+5J/R8IvRrkKvumdWo0iR2zNxn6v2BxTBinjlCy1aSk8iJ2VwiXeiO95x2REB4tvoH92cv9ijtVbsVEYcKaXVhfcQc0lFyAZDqNj0Wdd96Xyg+OwYCyyl4MJ4q+aZALlDj7eyv2khj/miE3CAUlVqc+BjV0qAwA/R5L5JaPHkKSRunG8MP2fodBKQGnsl0F9nCBNoRoXW+DftwPaEPwf3e41+CJupsqfRIFuN2+codh/iPDVWbQfV3axk3bTsB1Ip3rYJYCAifzBEgH8A3ErJCb76fmJmV+LAv4CStvg4L3BcRIaGjKpiZkOd7WVN7VCUGW9xARR9Ec=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F42B91199D970349B15E1405A7BA9E0C@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4694bb5-966e-4187-1585-08d6e8249d75
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 13:08:48.0465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: alexander.sverdlin@nokia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB4143
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

SGkhDQoNCk9uIDI5LzA1LzIwMTkgMTY6MzMsIEFkYW1za2ksIEtyenlzenRvZiAoTm9raWEgLSBQ
TC9Xcm9jbGF3KSB3cm90ZToNCj4gdXBkYXRlX2xvY2sgaXMgYSBtdXRleCBpbnRlbmRlZCB0byBw
cm90ZWN0IHdyaXRlIG9wZXJhdGlvbnMuIEl0IHdhcyBub3QNCj4gdGFrZW4sIGhvd2V2ZXIsIHdo
ZW4gX3BtYnVzX3dyaXRlX3dvcmRfZGF0YSBpcyBjYWxsZWQgZnJvbQ0KPiBwbWJ1c19zZXRfc2Ft
cGxlcygpIGZ1bmN0aW9uIHdoaWNoIG1heSBjYXVzZSBwcm9ibGVtcyBlc3BlY2lhbGx5IHdoZW4N
Cj4gc29tZSBQTUJVU19WSVJUXyogb3BlcmF0aW9uIGlzIGltcGxlbWVudGVkIGFzIGEgcmVhZC1t
b2RpZnktd3JpdGUgY3ljbGUuDQo+IA0KPiBUaGlzIHBhdGNoIG1ha2VzIHN1cmUgdGhlIGxvY2sg
aXMgaGVsZCBkdXJpbmcgdGhlIG9wZXJhdGlvbi4NCg0KUmV2aWV3ZWQtYnk6IEFsZXhhbmRlciBT
dmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQG5va2lhLmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5
OiBLcnp5c3p0b2YgQWRhbXNraSA8a3J6eXN6dG9mLmFkYW1za2lAbm9raWEuY29tPg0KPiAtLS0N
Cj4gIGRyaXZlcnMvaHdtb24vcG1idXMvcG1idXNfY29yZS5jIHwgMiArKw0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24v
cG1idXMvcG1idXNfY29yZS5jIGIvZHJpdmVycy9od21vbi9wbWJ1cy9wbWJ1c19jb3JlLmMNCj4g
aW5kZXggZWY3ZWU5MGVlNzg1Li42MmNkMjEzY2MyNjAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
aHdtb24vcG1idXMvcG1idXNfY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvaHdtb24vcG1idXMvcG1i
dXNfY29yZS5jDQo+IEBAIC0xOTQ2LDcgKzE5NDYsOSBAQCBzdGF0aWMgc3NpemVfdCBwbWJ1c19z
ZXRfc2FtcGxlcyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ICAJaWYgKGtzdHJ0b2woYnVmLCAwLCAm
dmFsKSA8IDApDQo+ICAJCXJldHVybiAtRUlOVkFMOw0KPiAgDQo+ICsJbXV0ZXhfbG9jaygmZGF0
YS0+dXBkYXRlX2xvY2spOw0KPiAgCXJldCA9IF9wbWJ1c193cml0ZV93b3JkX2RhdGEoY2xpZW50
LCByZWctPnBhZ2UsIHJlZy0+YXR0ci0+cmVnLCB2YWwpOw0KPiArCW11dGV4X3VubG9jaygmZGF0
YS0+dXBkYXRlX2xvY2spOw0KPiAgDQo+ICAJcmV0dXJuIHJldCA/IDogY291bnQ7DQo+ICB9DQoN
Ci0tIA0KQmVzdCByZWdhcmRzLA0KQWxleGFuZGVyIFN2ZXJkbGluLg0K
