Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EDDC43460
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 23:11:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5FDF61376
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 23:11:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232058AbhELXMu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 May 2021 19:12:50 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:50708 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233851AbhELWnH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 May 2021 18:43:07 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 8815684488
        for <linux-hwmon@vger.kernel.org>; Thu, 13 May 2021 10:41:31 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1620859291;
        bh=RmPGpdDbdSjwUEDP54wbY5xcqFP3fbJt3l3wEtbbjGc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=zar2dtfpMLx50NcwRy2TXFiGcYbAniIuep+CH8WCYLaf1ZG/SFCfmseHC5+geis2Q
         XlyWETa1HrOX27ywWROTBmp/PtWAzlLwKO7mtaEvnRNvJu97+wUTSmK3t+33iixhzU
         r8nHV9OenkUUSoXsfYjwFRZIw10WlCy3ESwlqIKFDpyixwF80N//H1Fhv13u6boQ6g
         lPere10Yb88X9F0ILwTdwzkweguEiLx2wwHjXtFDl7+h/WYRj0upnvWrNsl1+25MaI
         A40oZ8GMXEs7VtsIQeFjYw38sXfXfo1FUgHUn3uHbDYt17owJDaLxG7FMSBIx2ixoR
         TkJfm8qofFfmw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B609c599b0001>; Thu, 13 May 2021 10:41:31 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 13 May 2021 10:41:31 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.015; Thu, 13 May 2021 10:41:31 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
CC:     Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 3/3] hwmon: (adm9240) Convert to
 devm_hwmon_device_register_with_info API
Thread-Topic: [PATCH 3/3] hwmon: (adm9240) Convert to
 devm_hwmon_device_register_with_info API
Thread-Index: AQHXFkjLr2Hz0R+oz0WybSgWrdlcQ6rf/RaAgAAELoCAAAdSgIAAAZQA
Date:   Wed, 12 May 2021 22:41:31 +0000
Message-ID: <c7bafe28-2017-dfe2-f897-914df05a286b@alliedtelesis.co.nz>
References: <20210311073302.221954-1-linux@roeck-us.net>
 <20210311073302.221954-3-linux@roeck-us.net>
 <590366ea-2c8c-8d92-171a-87807dedabd6@alliedtelesis.co.nz>
 <b853d6b2-11df-bedf-ccc0-dbb1cb88ffb3@roeck-us.net>
 <33828125-bf2d-294f-a519-226c39e13efa@roeck-us.net>
In-Reply-To: <33828125-bf2d-294f-a519-226c39e13efa@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0664D2D690BDE34DA361387FA5A35641@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=K6Jc4BeI c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=5FLXtPjwQuUA:10 a=_jlGtV7tAAAA:8 a=8Wpzio3cFpDOrFPWtmkA:9 a=QEXdDO2ut3YA:10 a=nlm17XC03S6CtCLSeiRr:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQpPbiAxMy8wNS8yMSAxMDozNSBhbSwgR3VlbnRlciBSb2VjayB3cm90ZToNCj4gT24gNS8xMi8y
MSAzOjA5IFBNLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPj4gT24gNS8xMi8yMSAyOjU0IFBNLCBD
aHJpcyBQYWNraGFtIHdyb3RlOg0KPj4+IEhpIEd1ZW50ZXIsDQo+Pj4NCj4+PiBPbiAxMS8wMy8y
MSA4OjMzIHBtLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPj4+PiBBbHNvIHVzZSByZWdtYXAgZm9y
IHJlZ2lzdGVyIGNhY2hpbmcuIFRoaXMgY2hhbmdlIHJlZHVjZXMgY29kZSBhbmQNCj4+Pj4gZGF0
YSBzaXplIGJ5IG1vcmUgdGhhbiA0MCUuDQo+Pj4+DQo+Pj4+IFdoaWxlIGF0IGl0LCBmaXhlZCBz
b21lIHdhcm5pbmdzIHJlcG9ydGVkIGJ5IGNoZWNrcGF0Y2guDQo+Pj4+DQo+Pj4+IENjOiBDaHJp
cyBQYWNraGFtIDxDaHJpcy5QYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4NCj4+Pg0KPj4+IEkn
dmUganVzdCBiZWVuIGluZm9ybWVkIGJ5IG91ciBRQSB0ZWFtIHRoYXQgaXQgbG9va3MgbGlrZSB0
aGUNCj4+PiBjb25maWd1cmF0aW9uIG9mIGxpbWl0cyAoZS5nLiBieSB3cml0aW5nIHRvIHN5c2Zz
KSBoYXMgYmVlbiBicm9rZW4uDQo+Pj4gUHJvYmFibHkgYnkgdGhpcyBjaGFuZ2UuIEknbSBqdXN0
IHN0YXJ0aW5nIHRvIGRpZyBpbnRvIGl0IG5vdyBidXQgSQ0KPj4+IHRob3VnaCBJJ2QgZ2l2ZSB5
b3UgYSBoZWFkcyB1cC4NCj4+Pg0KPj4NCj4+IFRoYW5rcyBmb3IgdGhlIGhlYWRzIHVwLg0KPj4N
Cj4+IEl0IGxvb2tzIGxpa2Ugdm9sdGFnZSBtYXhpbXVtIHdyaXRlcyB1c2UgdGhlIHdyb25nIHJl
Z2lzdGVyLA0KPj4gQURNOTI0MF9SRUdfSU4gaW5zdGVhZCBvZiBBRE05MjQwX1JFR19JTl9NQVgu
DQo+PiBPZGQsIEknZCBoYXZlIGFzc3VtZWQgdGhhdCBteSBtb2R1bGUgdGVzdCBjb2RlIGNhdGNo
ZXMgdGhhdC4NCj4+IEknbGwgaGF2ZSB0byBjaGVjayB3aHkgaXQgZG9lc24ndC4NCj4+DQo+DQo+
IFllcywgdHVybnMgb3V0IG15IG1vZHVsZSB0ZXN0IHNjcmlwdCBkb2VzIG5vdCBjYXRjaCB0aGF0
IHNpdHVhdGlvbi4NCj4gSXQgdHJpZXMgdG8gZmluZCB0aGUgdmFsdWUgcmFuZ2UgYW5kIGRldGVy
bWluZXMgdGhhdCB0aGVyZSBpcyBubyByYW5nZQ0KPiAoYmVjYXVzZSBhbGwgd3JpdGVzIGFyZSBp
bnRvIHRoZSB3cm9uZyByZWdpc3RlcikuIEknbGwgaGF2ZSB0byBmaXggdGhhdC4NCj4NCj4+IEFu
eXdheSwgYW55dGhpbmcgbW9yZSBzcGVjaWZpYyA/DQo+Pg0KPiBJJ2xsIHdhaXQgZm9yIHlvdXIg
cmVzcG9uc2UgYmVmb3JlIHN1Ym1pdHRpbmcgYSBwYXRjaC4NCj4NCkkgYWdyZWUgdGhhdCB0aGUg
d3JpdGVzIHRvIG1heCBhcmVuJ3Qgd29ya2luZy4gSGF2ZW4ndCBjaGVja2VkIG1pbi4NCg0KW3Jv
b3RAYXdwbHVzIGZsYXNoXSMgY2F0IC9zeXMvY2xhc3MvaHdtb24vaHdtb24wL2luNV9tYXgNCjM1
ODYNCltyb290QGF3cGx1cyBmbGFzaF0jIGVjaG8gMTA5NyA+L3N5cy9jbGFzcy9od21vbi9od21v
bjAvaW41X21heA0KW3Jvb3RAYXdwbHVzIGZsYXNoXSMgY2F0IC9zeXMvY2xhc3MvaHdtb24vaHdt
b24wL2luNV9tYXgNCjM1ODYNCg0K
