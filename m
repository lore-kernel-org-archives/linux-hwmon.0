Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	CHARSET_FARAWAY_HEADER,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAA9C64E7C
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Dec 2020 14:28:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6B0D21D42
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Dec 2020 14:28:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgLBO2d (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Dec 2020 09:28:33 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2390 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727460AbgLBO2c (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Dec 2020 09:28:32 -0500
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4CmLrz6TKkz4y1G;
        Wed,  2 Dec 2020 22:27:15 +0800 (CST)
Received: from dggema757-chm.china.huawei.com (10.1.198.199) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Wed, 2 Dec 2020 22:27:49 +0800
Received: from dggema755-chm.china.huawei.com (10.1.198.197) by
 dggema757-chm.china.huawei.com (10.1.198.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Wed, 2 Dec 2020 22:27:49 +0800
Received: from dggema755-chm.china.huawei.com ([10.1.198.197]) by
 dggema755-chm.china.huawei.com ([10.1.198.197]) with mapi id 15.01.1913.007;
 Wed, 2 Dec 2020 22:27:49 +0800
From:   zhangqilong <zhangqilong3@huawei.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBod21vbjogKGluYTMyMjEpIEZpeCBQTSB1c2FnZSBj?=
 =?gb2312?B?b3VudGVyIHVuYmFsYW5jZSBpbiBpbmEzMjIxX3dyaXRlX2VuYWJsZQ==?=
Thread-Topic: [PATCH] hwmon: (ina3221) Fix PM usage counter unbalance in
 ina3221_write_enable
Thread-Index: AQHWxfxWp2nym2mwjkeQSqb3sapJ3qnj36sw
Date:   Wed, 2 Dec 2020 14:27:49 +0000
Message-ID: <2ba39483c16c487eb5f7bd373212e96c@huawei.com>
References: <20201123102000.3864999-1-zhangqilong3@huawei.com>
 <20201129030422.GA96772@roeck-us.net>
In-Reply-To: <20201129030422.GA96772@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.179.28]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

SEksDQoNCj4gDQo+IE9uIE1vbiwgTm92IDIzLCAyMDIwIGF0IDA2OjIwOjAwUE0gKzA4MDAsIFpo
YW5nIFFpbG9uZyB3cm90ZToNCj4gPiBwbV9ydW50aW1lX2dldF9zeW5jIHdpbGwgaW5jcmVtZW50
IHBtIHVzYWdlIGNvdW50ZXIgZXZlbiBpdCBmYWlsZWQuDQo+ID4gRm9yZ2V0dGluZyB0byBwdXR0
aW5nIG9wZXJhdGlvbiB3aWxsIHJlc3VsdCBpbiByZWZlcmVuY2UgbGVhayBoZXJlLiBXZQ0KPiA+
IGZpeCBpdCBieSByZXBsYWNpbmcgaXQgd2l0aCBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0IHRv
IGtlZXAgdXNhZ2UNCj4gPiBjb3VudGVyIGJhbGFuY2VkLg0KPiA+DQo+IFR1cm5zIG91dCB0aGlz
IGZ1bmN0aW9uIGRvZXNuJ3QgZXhpc3QgaW4gdGhlIG1haW5saW5lIGtlcm5lbCwgbWVhbmluZyBp
dCBjYW4gbm90DQo+IGJlIHVzZWQgdG8gZml4IGEgcGF0Y2ggaW4gdGhlIG1haW5saW5lIGtlcm5l
bC4NCj4gSSBkcm9wcGVkIHRoaXMgcGF0Y2ggZnJvbSBteSBxdWV1ZS4NCj4gDQoNCkkgYW0gc29y
cnkgLEkgZm9yZ290IHRvIGFkZCB0aGUgZGVwZW5kZW5jeSwgdGhlIGNvbW1pdCBpcyBhcyBmbG93
aW5nOg0KDQoJaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aD12NS4xMC1yYzYmaWQ9ZGQ4MDg4ZDVhODk2OWRj
MmI0MmY3MWQ3YmMwMWMyNWM2MWE3ODA2Ng0KDQpJIHdpbGwgdXBkYXRlIHRoZSBkZXNjcmlwdGlv
biBuZXh0IHZlcnNpb24uDQoNCkJlc3QgcmVnYXJkcywNClpoYW5nIFFpbG9uZyAgDQoNCj4gR3Vl
bnRlcg0KPiANCj4gPiBGaXhlczogMzIzYWViMGViNWQ5YSAoImh3bW9uOiAoaW5hMzIyMSkgQWRk
IFBNIHJ1bnRpbWUgc3VwcG9ydCIpDQo+ID4gU2lnbmVkLW9mZi1ieTogWmhhbmcgUWlsb25nIDx6
aGFuZ3FpbG9uZzNAaHVhd2VpLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9od21vbi9pbmEz
MjIxLmMgfCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vaW5hMzIyMS5jIGIv
ZHJpdmVycy9od21vbi9pbmEzMjIxLmMgaW5kZXgNCj4gPiA3MmNmZGMwMDdlNjAuLmQ4MGJkM2Vm
Y2Q2ZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2h3bW9uL2luYTMyMjEuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvaHdtb24vaW5hMzIyMS5jDQo+ID4gQEAgLTQ4OSw3ICs0ODksNyBAQCBzdGF0aWMg
aW50IGluYTMyMjFfd3JpdGVfZW5hYmxlKHN0cnVjdCBkZXZpY2UNCj4gPiAqZGV2LCBpbnQgY2hh
bm5lbCwgYm9vbCBlbmFibGUpDQo+ID4NCj4gPiAgCS8qIEZvciBlbmFibGluZyByb3V0aW5lLCBp
bmNyZWFzZSByZWZjb3VudCBhbmQgcmVzdW1lKCkgYXQgZmlyc3QgKi8NCj4gPiAgCWlmIChlbmFi
bGUpIHsNCj4gPiAtCQlyZXQgPSBwbV9ydW50aW1lX2dldF9zeW5jKGluYS0+cG1fZGV2KTsNCj4g
PiArCQlyZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KGluYS0+cG1fZGV2KTsNCj4gPiAg
CQlpZiAocmV0IDwgMCkgew0KPiA+ICAJCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgUE0g
cnVudGltZVxuIik7DQo+ID4gIAkJCXJldHVybiByZXQ7DQo=
