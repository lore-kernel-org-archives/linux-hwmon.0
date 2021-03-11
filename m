Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431E3C433E0
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Mar 2021 21:11:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E09164EC6
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Mar 2021 21:11:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbhCKVLM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Mar 2021 16:11:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbhCKVKU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Mar 2021 16:10:20 -0500
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30309C061574
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Mar 2021 13:10:09 -0800 (PST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0788E891AE
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Mar 2021 10:09:05 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1615496945;
        bh=SPhWU1qe80Ei1Z/jOOsVsG5UlHpVrADaaO+JYUZjVMU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=C4HkHwTofr8Sr+3YzaoC5XvkpA4kM46eHR4FULGI/78vGuM1CA2gBGCOHW1g8z1s3
         80FSciXkxNC1urLhMTczDGNqK3WinEyE6Wc/uLZqLz1pPoKpSahMv+DdFOmqJtkc3U
         ZmBm0+P62R2lglDgXMgZ/R6P5Jn7v3rEI4a+H4V0jkOooiOLSlFb1U2rC81Y650zMX
         QS0sVkfGQWCzXnTohoxIuQ1f2KsUM0Nv7TcwCkyxxC+nm6Vr3rDtNzGtd+xv81a/Ur
         idg3fjb2jEShBNJEws+Z34Esf4Udbl6D230i7dfGmHECR/67vTuKytaecewxyKM0AB
         vu8gU4wW0fheg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B604a86f00001>; Fri, 12 Mar 2021 10:09:04 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 12 Mar 2021 10:09:04 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Fri, 12 Mar 2021 10:09:04 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
CC:     Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 1/3] hwmon: (adm9240) Drop log messages from detect
 function
Thread-Topic: [PATCH 1/3] hwmon: (adm9240) Drop log messages from detect
 function
Thread-Index: AQHXFkjKPt0v4xm8mEOiUkd+3idj9qp+bweA
Date:   Thu, 11 Mar 2021 21:09:03 +0000
Message-ID: <4f3606a3-8cca-4ad2-5cc2-191fc675f44a@alliedtelesis.co.nz>
References: <20210311073302.221954-1-linux@roeck-us.net>
In-Reply-To: <20210311073302.221954-1-linux@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FD175C3E72BFE4895049D7B49D2B8DD@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=_jlGtV7tAAAA:8 a=GW24y25DEVd4hJ5U5-QA:9 a=i1bZAYpRiSv23GsB:21 a=suy-Tgpx8UDBpbfP:21 a=QEXdDO2ut3YA:10 a=nlm17XC03S6CtCLSeiRr:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQpPbiAxMS8wMy8yMSA4OjMzIHBtLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPiBOb3QgZGV0ZWN0
aW5nIGEgY2hpcCBpbiB0aGUgZGV0ZWN0IGZ1bmN0aW9uIGlzIG5vcm1hbCBhbmQgc2hvdWxkIG5v
dA0KPiBnZW5lcmF0ZSBhbnkgbG9nIG1lc3NhZ2VzLCBtdWNoIGxlc3MgZXJyb3IgbWVzc2FnZXMu
DQo+DQo+IENjOiBDaHJpcyBQYWNraGFtIDxDaHJpcy5QYWNraGFtQGFsbGllZHRlbGVzaXMuY28u
bno+DQo+IFNpZ25lZC1vZmYtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4N
ClJldmlld2VkLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMu
Y28ubno+DQpUZXN0ZWQtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVs
ZXNpcy5jby5uej4NCj4gLS0tDQo+ICAgZHJpdmVycy9od21vbi9hZG05MjQwLmMgfCAxNyArKysr
Ky0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9hZG05MjQwLmMgYi9k
cml2ZXJzL2h3bW9uL2FkbTkyNDAuYw0KPiBpbmRleCBjYzNlMDE4NGU3MjAuLjNiYmRkNjYyYzll
NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9od21vbi9hZG05MjQwLmMNCj4gKysrIGIvZHJpdmVy
cy9od21vbi9hZG05MjQwLmMNCj4gQEAgLTczMCwyNiArNzMwLDE5IEBAIHN0YXRpYyBpbnQgYWRt
OTI0MF9kZXRlY3Qoc3RydWN0IGkyY19jbGllbnQgKm5ld19jbGllbnQsDQo+ICAgCQlyZXR1cm4g
LUVOT0RFVjsNCj4gICANCj4gICAJLyogdmVyaWZ5IGNoaXA6IHJlZyBhZGRyZXNzIHNob3VsZCBt
YXRjaCBpMmMgYWRkcmVzcyAqLw0KPiAtCWlmIChpMmNfc21idXNfcmVhZF9ieXRlX2RhdGEobmV3
X2NsaWVudCwgQURNOTI0MF9SRUdfSTJDX0FERFIpDQo+IC0JCQkhPSBhZGRyZXNzKSB7DQo+IC0J
CWRldl9lcnIoJmFkYXB0ZXItPmRldiwgImRldGVjdCBmYWlsOiBhZGRyZXNzIG1hdGNoLCAweCUw
MnhcbiIsDQo+IC0JCQlhZGRyZXNzKTsNCj4gKwlpZiAoaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRh
KG5ld19jbGllbnQsIEFETTkyNDBfUkVHX0kyQ19BRERSKSAhPSBhZGRyZXNzKQ0KPiAgIAkJcmV0
dXJuIC1FTk9ERVY7DQo+IC0JfQ0KPiAgIA0KPiAgIAkvKiBjaGVjayBrbm93biBjaGlwIG1hbnVm
YWN0dXJlciAqLw0KPiAgIAltYW5faWQgPSBpMmNfc21idXNfcmVhZF9ieXRlX2RhdGEobmV3X2Ns
aWVudCwgQURNOTI0MF9SRUdfTUFOX0lEKTsNCj4gLQlpZiAobWFuX2lkID09IDB4MjMpIHsNCj4g
KwlpZiAobWFuX2lkID09IDB4MjMpDQo+ICAgCQluYW1lID0gImFkbTkyNDAiOw0KPiAtCX0gZWxz
ZSBpZiAobWFuX2lkID09IDB4ZGEpIHsNCj4gKwllbHNlIGlmIChtYW5faWQgPT0gMHhkYSkNCj4g
ICAJCW5hbWUgPSAiZHMxNzgwIjsNCj4gLQl9IGVsc2UgaWYgKG1hbl9pZCA9PSAweDAxKSB7DQo+
ICsJZWxzZSBpZiAobWFuX2lkID09IDB4MDEpDQo+ICAgCQluYW1lID0gImxtODEiOw0KPiAtCX0g
ZWxzZSB7DQo+IC0JCWRldl9lcnIoJmFkYXB0ZXItPmRldiwgImRldGVjdCBmYWlsOiB1bmtub3du
IG1hbnVmLCAweCUwMnhcbiIsDQo+IC0JCQltYW5faWQpOw0KPiArCWVsc2UNCj4gICAJCXJldHVy
biAtRU5PREVWOw0KPiAtCX0NCj4gICANCj4gICAJLyogc3VjY2Vzc2Z1bCBkZXRlY3QsIHByaW50
IGNoaXAgaW5mbyAqLw0KPiAgIAlkaWVfcmV2ID0gaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRhKG5l
d19jbGllbnQsIEFETTkyNDBfUkVHX0RJRV9SRVYpOw==
