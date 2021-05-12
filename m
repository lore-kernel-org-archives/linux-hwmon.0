Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C979CC43460
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 23:12:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C99E613EE
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 May 2021 23:12:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236810AbhELXNM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 May 2021 19:13:12 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:50759 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234978AbhELW7T (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 May 2021 18:59:19 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A6591891AD
        for <linux-hwmon@vger.kernel.org>; Thu, 13 May 2021 10:58:07 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1620860287;
        bh=SZx1WsPreZArYIwqfIQDcdlljiFii8fjIOFWVFPbJA4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=uBoSAhyaTk6chx8JE2qkfdTIAhnCh0uQQcbKPpEW32qGj+OG1kIL+++u+piUKoFqS
         gn6dhc/JXq6uwNW1jsZagEY4CojIyo8SzwGNGvEgu9O3LGu6sPspMUatlPk8N/kQTN
         tj/eRNqCSx+P4OD43pmWqcyOxIawHiavnydUNVcctykEPkQWc74fhc+TmvyJOL9zOR
         PHwuXJK0CKWIGLBSnb7NYHp/H72ls2fXSpiiActULojN05eAa1JLIlzAttOmsulWiv
         y58Us9YppI941+MfOYFSfhMlZ+KGahVsb/O2CaKpJeclQvJfov9cQiCjuywYLfHW0o
         AFudKB+TNxgaA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B609c5d7f0001>; Thu, 13 May 2021 10:58:07 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 13 May 2021 10:58:07 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.015; Thu, 13 May 2021 10:58:07 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
CC:     Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 3/3] hwmon: (adm9240) Convert to
 devm_hwmon_device_register_with_info API
Thread-Topic: [PATCH 3/3] hwmon: (adm9240) Convert to
 devm_hwmon_device_register_with_info API
Thread-Index: AQHXFkjLr2Hz0R+oz0WybSgWrdlcQ6rf/RaAgAAELoCAAAdSgIAAAZQAgAAC7ICAAAG5gA==
Date:   Wed, 12 May 2021 22:58:07 +0000
Message-ID: <9bed7b7a-9fe9-c6c5-1de9-390ddce9b052@alliedtelesis.co.nz>
References: <20210311073302.221954-1-linux@roeck-us.net>
 <20210311073302.221954-3-linux@roeck-us.net>
 <590366ea-2c8c-8d92-171a-87807dedabd6@alliedtelesis.co.nz>
 <b853d6b2-11df-bedf-ccc0-dbb1cb88ffb3@roeck-us.net>
 <33828125-bf2d-294f-a519-226c39e13efa@roeck-us.net>
 <c7bafe28-2017-dfe2-f897-914df05a286b@alliedtelesis.co.nz>
 <8401b580-66f4-c4f1-a5d5-41c66530eaca@roeck-us.net>
In-Reply-To: <8401b580-66f4-c4f1-a5d5-41c66530eaca@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8617784DB5B054A85339C8A841AFDF5@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=K6Jc4BeI c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=5FLXtPjwQuUA:10 a=_jlGtV7tAAAA:8 a=vTEp1iyp9ncwSLs3rxoA:9 a=QEXdDO2ut3YA:10 a=nlm17XC03S6CtCLSeiRr:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

DQpPbiAxMy8wNS8yMSAxMDo1MSBhbSwgR3VlbnRlciBSb2VjayB3cm90ZToNCj4gT24gNS8xMi8y
MSAzOjQxIFBNLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4NCj4+IE9uIDEzLzA1LzIxIDEwOjM1
IGFtLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPj4+IE9uIDUvMTIvMjEgMzowOSBQTSwgR3VlbnRl
ciBSb2VjayB3cm90ZToNCj4+Pj4gT24gNS8xMi8yMSAyOjU0IFBNLCBDaHJpcyBQYWNraGFtIHdy
b3RlOg0KPj4+Pj4gSGkgR3VlbnRlciwNCj4+Pj4+DQo+Pj4+PiBPbiAxMS8wMy8yMSA4OjMzIHBt
LCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPj4+Pj4+IEFsc28gdXNlIHJlZ21hcCBmb3IgcmVnaXN0
ZXIgY2FjaGluZy4gVGhpcyBjaGFuZ2UgcmVkdWNlcyBjb2RlIGFuZA0KPj4+Pj4+IGRhdGEgc2l6
ZSBieSBtb3JlIHRoYW4gNDAlLg0KPj4+Pj4+DQo+Pj4+Pj4gV2hpbGUgYXQgaXQsIGZpeGVkIHNv
bWUgd2FybmluZ3MgcmVwb3J0ZWQgYnkgY2hlY2twYXRjaC4NCj4+Pj4+Pg0KPj4+Pj4+IENjOiBD
aHJpcyBQYWNraGFtIDxDaHJpcy5QYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+Pj4+Pj4g
U2lnbmVkLW9mZi1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pg0KPj4+Pj4N
Cj4+Pj4+IEkndmUganVzdCBiZWVuIGluZm9ybWVkIGJ5IG91ciBRQSB0ZWFtIHRoYXQgaXQgbG9v
a3MgbGlrZSB0aGUNCj4+Pj4+IGNvbmZpZ3VyYXRpb24gb2YgbGltaXRzIChlLmcuIGJ5IHdyaXRp
bmcgdG8gc3lzZnMpIGhhcyBiZWVuIGJyb2tlbi4NCj4+Pj4+IFByb2JhYmx5IGJ5IHRoaXMgY2hh
bmdlLiBJJ20ganVzdCBzdGFydGluZyB0byBkaWcgaW50byBpdCBub3cgYnV0IEkNCj4+Pj4+IHRo
b3VnaCBJJ2QgZ2l2ZSB5b3UgYSBoZWFkcyB1cC4NCj4+Pj4+DQo+Pj4+DQo+Pj4+IFRoYW5rcyBm
b3IgdGhlIGhlYWRzIHVwLg0KPj4+Pg0KPj4+PiBJdCBsb29rcyBsaWtlIHZvbHRhZ2UgbWF4aW11
bSB3cml0ZXMgdXNlIHRoZSB3cm9uZyByZWdpc3RlciwNCj4+Pj4gQURNOTI0MF9SRUdfSU4gaW5z
dGVhZCBvZiBBRE05MjQwX1JFR19JTl9NQVguDQo+Pj4+IE9kZCwgSSdkIGhhdmUgYXNzdW1lZCB0
aGF0IG15IG1vZHVsZSB0ZXN0IGNvZGUgY2F0Y2hlcyB0aGF0Lg0KPj4+PiBJJ2xsIGhhdmUgdG8g
Y2hlY2sgd2h5IGl0IGRvZXNuJ3QuDQo+Pj4+DQo+Pj4NCj4+PiBZZXMsIHR1cm5zIG91dCBteSBt
b2R1bGUgdGVzdCBzY3JpcHQgZG9lcyBub3QgY2F0Y2ggdGhhdCBzaXR1YXRpb24uDQo+Pj4gSXQg
dHJpZXMgdG8gZmluZCB0aGUgdmFsdWUgcmFuZ2UgYW5kIGRldGVybWluZXMgdGhhdCB0aGVyZSBp
cyBubyByYW5nZQ0KPj4+IChiZWNhdXNlIGFsbCB3cml0ZXMgYXJlIGludG8gdGhlIHdyb25nIHJl
Z2lzdGVyKS4gSSdsbCBoYXZlIHRvIGZpeCANCj4+PiB0aGF0Lg0KPj4+DQo+Pj4+IEFueXdheSwg
YW55dGhpbmcgbW9yZSBzcGVjaWZpYyA/DQo+Pj4+DQo+Pj4gSSdsbCB3YWl0IGZvciB5b3VyIHJl
c3BvbnNlIGJlZm9yZSBzdWJtaXR0aW5nIGEgcGF0Y2guDQo+Pj4NCj4+IEkgYWdyZWUgdGhhdCB0
aGUgd3JpdGVzIHRvIG1heCBhcmVuJ3Qgd29ya2luZy4gSGF2ZW4ndCBjaGVja2VkIG1pbi4NCj4+
DQo+PiBbcm9vdEBhd3BsdXMgZmxhc2hdIyBjYXQgL3N5cy9jbGFzcy9od21vbi9od21vbjAvaW41
X21heA0KPj4gMzU4Ng0KPj4gW3Jvb3RAYXdwbHVzIGZsYXNoXSMgZWNobyAxMDk3ID4vc3lzL2Ns
YXNzL2h3bW9uL2h3bW9uMC9pbjVfbWF4DQo+PiBbcm9vdEBhd3BsdXMgZmxhc2hdIyBjYXQgL3N5
cy9jbGFzcy9od21vbi9od21vbjAvaW41X21heA0KPj4gMzU4Ng0KPj4NCj4NCj4gQW55dGhpbmcg
ZWxzZSA/IEkgZ290IGEgcGF0Y2ggcmVhZHkgdG8gZml4IHRoYXQsIGJ1dCBJIHdvdWxkIHByZWZl
ciB0bw0KPiBmaXggZXZlcnl0aGluZyBpbiBvbmUgZ28gaWYgcG9zc2libGUuIE15IChmaXhlZCkg
bW9kdWxlIHRlc3Qgc2NyaXB0DQo+IGRvZXNuJ3QgcGljayB1cCBvdGhlciBwcm9ibGVtcywgYnV0
IG9idmlvdXNseSB3ZSBjYW4ndCByZWFsbHkgdHJ1c3QgaXQuDQo+DQpFdmVyeXRoaW5nIGVsc2Ug
c2VlbXMgT0ssIEkgdGhpbmsgaXQgd2FzIGp1c3QgdGhlIG1heC4gVGhhdCB3YXMgDQpjZXJ0YWlu
bHkgdGhlIG9ubHkgdGhpbmcgdGhlIFFBIHRlYW0gd2FzIGNvbXBsYWluaW5nIGFib3V0Lg0KDQpU
aGFua3MgZm9yIHRoZSBxdWljayB3b3JrLg0KDQo+IFRoYW5rcywNCj4gR3VlbnRlcg==
