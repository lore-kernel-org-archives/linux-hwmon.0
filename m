Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECF5C433ED
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 00:04:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E614661183
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 00:04:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbhEMADF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 May 2021 20:03:05 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:50938 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbhELX6j (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 May 2021 19:58:39 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B169D84488
        for <linux-hwmon@vger.kernel.org>; Thu, 13 May 2021 11:57:22 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1620863842;
        bh=zm7jAOQdpMjb96qxJjy9xFABUGd+1IaO9CDpJx2nTJQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=B9rAfTZ1t03uQa9DQ6Z9Yb/g0zPTuvCTwVU07zBKAH2s32dv3sIM5YPtiNqsIpvbM
         OlaJV60NbOA8aDbuHBLq3H6EZU9qOoQKgt6fBe27A4REuBeOkRBUGXkZkQfkWT3uPw
         o5NScGyCEmYXfOJtJCqjsGIgyrAJEVHokvDkUJJmlVZwgvF0x2Qo/leTLHkr4HEXwa
         V1rtR9wf+QHmETQ3fuZZD0sxXrWVVm+NBx6gpPoNgCtwCg310OLnD5QqvtWUBT8W9o
         KCWK1rtVxWrjydJkCBuSgUQmkMAjJ73ahSDq1uRenXtjjMUhDK5nygFqk9FtsmKiC4
         3Szxs5IOg5jZg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B609c6b620001>; Thu, 13 May 2021 11:57:22 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 13 May 2021 11:57:22 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.015; Thu, 13 May 2021 11:57:22 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
CC:     Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (adm9240) Fix writes into inX_max attributes
Thread-Topic: [PATCH] hwmon: (adm9240) Fix writes into inX_max attributes
Thread-Index: AQHXR4dFdIyX+BfEmUOzV5AylFcae6rfvN6A
Date:   Wed, 12 May 2021 23:57:21 +0000
Message-ID: <2e79a8b5-a299-803d-6caf-d4d5c223548e@alliedtelesis.co.nz>
References: <20210512233346.2876734-1-linux@roeck-us.net>
In-Reply-To: <20210512233346.2876734-1-linux@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD9BFDEC2426F443B4714173CD4C788C@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=K6Jc4BeI c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=5FLXtPjwQuUA:10 a=_jlGtV7tAAAA:8 a=cfyWPQF3scTRpynG1jIA:9 a=QEXdDO2ut3YA:10 a=nlm17XC03S6CtCLSeiRr:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQpPbiAxMy8wNS8yMSAxMTozMyBhbSwgR3VlbnRlciBSb2VjayB3cm90ZToNCj4gV2hlbiBjb252
ZXJ0aW5nIHRoZSBkcml2ZXIgdG8gdXNlIHRoZSBkZXZtX2h3bW9uX2RldmljZV9yZWdpc3Rlcl93
aXRoX2luZm8NCj4gQVBJLCB0aGUgd3JvbmcgcmVnaXN0ZXIgd2FzIHNlbGVjdGVkIHdoZW4gd3Jp
dGluZyBpbnRvIGluWF9tYXggYXR0cmlidXRlcy4NCj4gRml4IGl0Lg0KPg0KPiBGaXhlczogMTI0
YjdlMzRhNWE2ICgiaHdtb246IChhZG05MjQwKSBDb252ZXJ0IHRvIGRldm1faHdtb25fZGV2aWNl
X3JlZ2lzdGVyX3dpdGhfaW5mbyBBUEkiKQ0KPiBSZXBvcnRlZC1ieTogQ2hyaXMgUGFja2hhbSA8
Q2hyaXMuUGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KPiBTaWduZWQtb2ZmLWJ5OiBHdWVu
dGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+DQoNCldvcmtzIGZvciBtZS4NCg0KVGVzdGVk
LWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQoN
Cj4gLS0tDQo+ICAgZHJpdmVycy9od21vbi9hZG05MjQwLmMgfCAyICstDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2h3bW9uL2FkbTkyNDAuYyBiL2RyaXZlcnMvaHdtb24vYWRtOTI0MC5jDQo+IGluZGV4
IDU2NzcyNjNiY2YwZC4uNDgzY2Q3NTdhYmQzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2h3bW9u
L2FkbTkyNDAuYw0KPiArKysgYi9kcml2ZXJzL2h3bW9uL2FkbTkyNDAuYw0KPiBAQCAtNDg1LDcg
KzQ4NSw3IEBAIHN0YXRpYyBpbnQgYWRtOTI0MF9pbl93cml0ZShzdHJ1Y3QgZGV2aWNlICpkZXYs
IHUzMiBhdHRyLCBpbnQgY2hhbm5lbCwgbG9uZyB2YWwpDQo+ICAgCQlyZWcgPSBBRE05MjQwX1JF
R19JTl9NSU4oY2hhbm5lbCk7DQo+ICAgCQlicmVhazsNCj4gICAJY2FzZSBod21vbl9pbl9tYXg6
DQo+IC0JCXJlZyA9IEFETTkyNDBfUkVHX0lOKGNoYW5uZWwpOw0KPiArCQlyZWcgPSBBRE05MjQw
X1JFR19JTl9NQVgoY2hhbm5lbCk7DQo+ICAgCQlicmVhazsNCj4gICAJZGVmYXVsdDoNCj4gICAJ
CXJldHVybiAtRU9QTk9UU1VQUDs=
