Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88405C433E6
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Mar 2021 21:11:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EB8A64EC6
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Mar 2021 21:11:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbhCKVLM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Mar 2021 16:11:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbhCKVKU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Mar 2021 16:10:20 -0500
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3755CC061760
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Mar 2021 13:10:09 -0800 (PST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5D87F891B1
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Mar 2021 10:10:08 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1615497008;
        bh=dSzeAJgwbY1QY9wM9k81SdcI8INOz36n1vDYr0KkPWo=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=CryGatm+KZph5/KjRdNuBxp6dC1ZAl4afYmVObCQ6NECnodbmfD9WKG3HYihm1ifx
         yt4O+P+bQpdqZqm3nNDqKjSS+tXHqJbuSNcWy1aCXWfm8cqp8y9gEX8AV0pXBIIkgU
         anSmd+MRkscaji5TUsPOHPBV46oZa5eKGEPYsKLjgOe6xxzUAmsrDB3yKnb1OI06xG
         XzWUt+h1emrtcZi9TcAQxHMqPxuvc7haUPhjdAPE2bf5lWMgyG/8iRWCFgZRZYCWJO
         S+X6iVeJsmpQUejbEKVmxxvSLYeqFyQQiEHwZSIs9zJcPl0NmNXXa/RRaVPJ8adfdo
         UrNfRZSmh4bTg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B604a87300001>; Fri, 12 Mar 2021 10:10:08 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 12 Mar 2021 10:10:08 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Fri, 12 Mar 2021 10:10:08 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
CC:     Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 2/3] hwmon: (adm9240) Store i2c device instead of client
 in local data
Thread-Topic: [PATCH 2/3] hwmon: (adm9240) Store i2c device instead of client
 in local data
Thread-Index: AQHXFkjK/G0FWPpaEUqewWn6dWMccqp+b1OA
Date:   Thu, 11 Mar 2021 21:10:08 +0000
Message-ID: <2b9e6152-3d25-14dd-9e3a-2ee53f05ed3e@alliedtelesis.co.nz>
References: <20210311073302.221954-1-linux@roeck-us.net>
 <20210311073302.221954-2-linux@roeck-us.net>
In-Reply-To: <20210311073302.221954-2-linux@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9EC7A5B829A73408FD57AD103D47EE3@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=_jlGtV7tAAAA:8 a=gRmzr8IMhjr9lXYXZhUA:9 a=QEXdDO2ut3YA:10 a=nlm17XC03S6CtCLSeiRr:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

T24gMTEvMDMvMjEgODozMyBwbSwgR3VlbnRlciBSb2VjayB3cm90ZToNCj4gV2Ugb25seSB1c2Ug
dGhlIHBvaW50ZXIgdG8gaTJjX2NsaWVudCB0byBhY2Nlc3MgJmNsaWVudC0+ZGV2Lg0KPiBTdG9y
ZSB0aGUgZGV2aWNlIHBvaW50ZXIgZGlyZWN0bHkgaW5zdGVhZCBvZiByZXRyaWV2aW5nIGl0DQo+
IGZyb20gaTJjX2NsaWVudC4NCj4NCj4gQ2M6IENocmlzIFBhY2toYW0gPENocmlzLlBhY2toYW1A
YWxsaWVkdGVsZXNpcy5jby5uej4NCj4gU2lnbmVkLW9mZi1ieTogR3VlbnRlciBSb2VjayA8bGlu
dXhAcm9lY2stdXMubmV0Pg0KDQpSZXZpZXdlZC1ieTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFj
a2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KVGVzdGVkLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJp
cy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9od21v
bi9hZG05MjQwLmMgfCAyOSArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaHdtb24vYWRtOTI0MC5jIGIvZHJpdmVycy9od21vbi9hZG05MjQwLmMN
Cj4gaW5kZXggM2JiZGQ2NjJjOWU0Li43NDA0MDgyYzdhM2YgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvaHdtb24vYWRtOTI0MC5jDQo+ICsrKyBiL2RyaXZlcnMvaHdtb24vYWRtOTI0MC5jDQo+IEBA
IC0xMjMsNyArMTIzLDcgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgQU9VVF9GUk9NX1JF
Ryh1OCByZWcpDQo+ICAgDQo+ICAgLyogcGVyIGNsaWVudCBkYXRhICovDQo+ICAgc3RydWN0IGFk
bTkyNDBfZGF0YSB7DQo+IC0Jc3RydWN0IGkyY19jbGllbnQgKmNsaWVudDsNCj4gKwlzdHJ1Y3Qg
ZGV2aWNlICpkZXY7DQo+ICAgCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsNCj4gICAJc3RydWN0IG11
dGV4IHVwZGF0ZV9sb2NrOw0KPiAgIAljaGFyIHZhbGlkOw0KPiBAQCAtMTYwLDcgKzE2MCw3IEBA
IHN0YXRpYyBpbnQgYWRtOTI0MF93cml0ZV9mYW5fZGl2KHN0cnVjdCBhZG05MjQwX2RhdGEgKmRh
dGEsIGludCBuciwNCj4gICAJZXJyID0gcmVnbWFwX3dyaXRlKGRhdGEtPnJlZ21hcCwgQURNOTI0
MF9SRUdfVklEX0ZBTl9ESVYsIHJlZyk7DQo+ICAgCWlmIChlcnIgPCAwKQ0KPiAgIAkJcmV0dXJu
IGVycjsNCj4gLQlkZXZfZGJnKCZkYXRhLT5jbGllbnQtPmRldiwNCj4gKwlkZXZfZGJnKGRhdGEt
PmRldiwNCj4gICAJCSJmYW4lZCBjbG9jayBkaXZpZGVyIGNoYW5nZWQgZnJvbSAldSB0byAldVxu
IiwNCj4gICAJCW5yICsgMSwgMSA8PCBvbGQsIDEgPDwgZmFuX2Rpdik7DQo+ICAgDQo+IEBAIC01
MDcsNyArNTA3LDYgQEAgc3RhdGljIHNzaXplX3QgZmFuX21pbl9zdG9yZShzdHJ1Y3QgZGV2aWNl
ICpkZXYsDQo+ICAgew0KPiAgIAlzdHJ1Y3Qgc2Vuc29yX2RldmljZV9hdHRyaWJ1dGUgKmF0dHIg
PSB0b19zZW5zb3JfZGV2X2F0dHIoZGV2YXR0cik7DQo+ICAgCXN0cnVjdCBhZG05MjQwX2RhdGEg
KmRhdGEgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gLQlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xp
ZW50ID0gZGF0YS0+Y2xpZW50Ow0KPiAgIAlpbnQgbnIgPSBhdHRyLT5pbmRleDsNCj4gICAJdTgg
bmV3X2RpdjsNCj4gICAJdW5zaWduZWQgbG9uZyB2YWw7DQo+IEBAIC01MjMsMTQgKzUyMiwxNCBA
QCBzdGF0aWMgc3NpemVfdCBmYW5fbWluX3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gICAJ
CWRhdGEtPmZhbl9taW5bbnJdID0gMjU1Ow0KPiAgIAkJbmV3X2RpdiA9IGRhdGEtPmZhbl9kaXZb
bnJdOw0KPiAgIA0KPiAtCQlkZXZfZGJnKCZjbGllbnQtPmRldiwgImZhbiV1IGxvdyBsaW1pdCBz
ZXQgZGlzYWJsZWRcbiIsDQo+ICsJCWRldl9kYmcoZGF0YS0+ZGV2LCAiZmFuJXUgbG93IGxpbWl0
IHNldCBkaXNhYmxlZFxuIiwNCj4gICAJCQkJbnIgKyAxKTsNCj4gICANCj4gICAJfSBlbHNlIGlm
ICh2YWwgPCAxMzUwMDAwIC8gKDggKiAyNTQpKSB7DQo+ICAgCQluZXdfZGl2ID0gMzsNCj4gICAJ
CWRhdGEtPmZhbl9taW5bbnJdID0gMjU0Ow0KPiAgIA0KPiAtCQlkZXZfZGJnKCZjbGllbnQtPmRl
diwgImZhbiV1IGxvdyBsaW1pdCBzZXQgbWluaW11bSAldVxuIiwNCj4gKwkJZGV2X2RiZyhkYXRh
LT5kZXYsICJmYW4ldSBsb3cgbGltaXQgc2V0IG1pbmltdW0gJXVcbiIsDQo+ICAgCQkJCW5yICsg
MSwgRkFOX0ZST01fUkVHKDI1NCwgMSA8PCBuZXdfZGl2KSk7DQo+ICAgDQo+ICAgCX0gZWxzZSB7
DQo+IEBAIC01NDYsNyArNTQ1LDcgQEAgc3RhdGljIHNzaXplX3QgZmFuX21pbl9zdG9yZShzdHJ1
Y3QgZGV2aWNlICpkZXYsDQo+ICAgDQo+ICAgCQlkYXRhLT5mYW5fbWluW25yXSA9IG5ld19taW47
DQo+ICAgDQo+IC0JCWRldl9kYmcoJmNsaWVudC0+ZGV2LCAiZmFuJXUgbG93IGxpbWl0IHNldCBm
YW4gc3BlZWQgJXVcbiIsDQo+ICsJCWRldl9kYmcoZGF0YS0+ZGV2LCAiZmFuJXUgbG93IGxpbWl0
IHNldCBmYW4gc3BlZWQgJXVcbiIsDQo+ICAgCQkJCW5yICsgMSwgRkFOX0ZST01fUkVHKG5ld19t
aW4sIDEgPDwgbmV3X2RpdikpOw0KPiAgIAl9DQo+ICAgDQo+IEBAIC02NjMsNyArNjYyLDcgQEAg
c3RhdGljIHNzaXplX3QgYWxhcm1fc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2
aWNlX2F0dHJpYnV0ZSAqYXR0ciwNCj4gICAJbXV0ZXhfdW5sb2NrKCZkYXRhLT51cGRhdGVfbG9j
ayk7DQo+ICAgCWlmIChlcnIgPCAwKQ0KPiAgIAkJcmV0dXJuIGVycjsNCj4gLQlkZXZfZGJnKCZk
YXRhLT5jbGllbnQtPmRldiwgImNoYXNzaXMgaW50cnVzaW9uIGxhdGNoIGNsZWFyZWRcbiIpOw0K
PiArCWRldl9kYmcoZGF0YS0+ZGV2LCAiY2hhc3NpcyBpbnRydXNpb24gbGF0Y2ggY2xlYXJlZFxu
Iik7DQo+ICAgDQo+ICAgCXJldHVybiBjb3VudDsNCj4gICB9DQo+IEBAIC03NTUsNyArNzU0LDcg
QEAgc3RhdGljIGludCBhZG05MjQwX2RldGVjdChzdHJ1Y3QgaTJjX2NsaWVudCAqbmV3X2NsaWVu
dCwNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiAtc3RhdGljIGludCBhZG05MjQwX2lu
aXRfY2xpZW50KHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsIHN0cnVjdCBhZG05MjQwX2RhdGEg
KmRhdGEpDQo+ICtzdGF0aWMgaW50IGFkbTkyNDBfaW5pdF9jbGllbnQoc3RydWN0IGFkbTkyNDBf
ZGF0YSAqZGF0YSkNCj4gICB7DQo+ICAgCXU4IGNvbmYsIG1vZGU7DQo+ICAgCWludCBlcnI7DQo+
IEBAIC03NzAsMTMgKzc2OSwxMyBAQCBzdGF0aWMgaW50IGFkbTkyNDBfaW5pdF9jbGllbnQoc3Ry
dWN0IGkyY19jbGllbnQgKmNsaWVudCwgc3RydWN0IGFkbTkyNDBfZGF0YSAqZA0KPiAgIA0KPiAg
IAlkYXRhLT52cm0gPSB2aWRfd2hpY2hfdnJtKCk7IC8qIG5lZWQgdGhpcyB0byByZXBvcnQgdmlk
IGFzIG1WICovDQo+ICAgDQo+IC0JZGV2X2luZm8oJmNsaWVudC0+ZGV2LCAiVXNpbmcgVlJNOiAl
ZC4lZFxuIiwgZGF0YS0+dnJtIC8gMTAsDQo+IC0JCQlkYXRhLT52cm0gJSAxMCk7DQo+ICsJZGV2
X2luZm8oZGF0YS0+ZGV2LCAiVXNpbmcgVlJNOiAlZC4lZFxuIiwgZGF0YS0+dnJtIC8gMTAsDQo+
ICsJCSBkYXRhLT52cm0gJSAxMCk7DQo+ICAgDQo+ICAgCWlmIChjb25mICYgMSkgeyAvKiBtZWFz
dXJlbWVudCBjeWNsZSBydW5uaW5nOiByZXBvcnQgc3RhdGUgKi8NCj4gICANCj4gLQkJZGV2X2lu
Zm8oJmNsaWVudC0+ZGV2LCAic3RhdHVzOiBjb25maWcgMHglMDJ4IG1vZGUgJXVcbiIsDQo+IC0J
CQkJY29uZiwgbW9kZSk7DQo+ICsJCWRldl9pbmZvKGRhdGEtPmRldiwgInN0YXR1czogY29uZmln
IDB4JTAyeCBtb2RlICV1XG4iLA0KPiArCQkJIGNvbmYsIG1vZGUpOw0KPiAgIA0KPiAgIAl9IGVs
c2UgeyAvKiBjb2xkIHN0YXJ0OiBvcGVuIGxpbWl0cyBiZWZvcmUgc3RhcnRpbmcgY2hpcCAqLw0K
PiAgIAkJaW50IGk7DQo+IEBAIC04MDksNyArODA4LDcgQEAgc3RhdGljIGludCBhZG05MjQwX2lu
aXRfY2xpZW50KHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsIHN0cnVjdCBhZG05MjQwX2RhdGEg
KmQNCj4gICAJCWlmIChlcnIgPCAwKQ0KPiAgIAkJCXJldHVybiBlcnI7DQo+ICAgDQo+IC0JCWRl
dl9pbmZvKCZjbGllbnQtPmRldiwNCj4gKwkJZGV2X2luZm8oZGF0YS0+ZGV2LA0KPiAgIAkJCSAi
Y29sZCBzdGFydDogY29uZmlnIHdhcyAweCUwMnggbW9kZSAldVxuIiwgY29uZiwgbW9kZSk7DQo+
ICAgCX0NCj4gICANCj4gQEAgLTgzNCwxMyArODMzLDEzIEBAIHN0YXRpYyBpbnQgYWRtOTI0MF9w
cm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqbmV3X2NsaWVudCkNCj4gICAJaWYgKCFkYXRhKQ0KPiAg
IAkJcmV0dXJuIC1FTk9NRU07DQo+ICAgDQo+IC0JZGF0YS0+Y2xpZW50ID0gbmV3X2NsaWVudDsN
Cj4gKwlkYXRhLT5kZXYgPSBkZXY7DQo+ICAgCW11dGV4X2luaXQoJmRhdGEtPnVwZGF0ZV9sb2Nr
KTsNCj4gICAJZGF0YS0+cmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdF9pMmMobmV3X2NsaWVudCwg
JmFkbTkyNDBfcmVnbWFwX2NvbmZpZyk7DQo+ICAgCWlmIChJU19FUlIoZGF0YS0+cmVnbWFwKSkN
Cj4gICAJCXJldHVybiBQVFJfRVJSKGRhdGEtPnJlZ21hcCk7DQo+ICAgDQo+IC0JZXJyID0gYWRt
OTI0MF9pbml0X2NsaWVudChuZXdfY2xpZW50LCBkYXRhKTsNCj4gKwllcnIgPSBhZG05MjQwX2lu
aXRfY2xpZW50KGRhdGEpOw0KPiAgIAlpZiAoZXJyIDwgMCkNCj4gICAJCXJldHVybiBlcnI7DQo+
ICAg
