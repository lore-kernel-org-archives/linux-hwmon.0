Return-Path: <SRS0=sAql=2R=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1A8C2D0C0
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Dec 2019 02:53:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95C812080D
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Dec 2019 02:53:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="JZ7ZNmWY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfL0CxW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Dec 2019 21:53:22 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:34838 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbfL0CxW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Dec 2019 21:53:22 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7CB42886BF
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Dec 2019 15:53:19 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1577415199;
        bh=i8A790WdtaNDbRdtPUy6a+E6ZZO1B6hVPSfTnB/JLBQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=JZ7ZNmWYtoXNpmUzlb2LaHF0f0sEAnH1aMWyDE2bQoMD3C6rsocK5cDaB4J86+FBo
         GAma8Nvm1pMfMZQwoSPnF+b06+ZLW3njq2HuGEvD4HawRPluHZWYgBWLauMEcTrkFm
         Mk0psS0LUWmFatyuwwZijnaIPzO2X9msyLs5IsnAYNJfEeT+dA0UwIXIvRtYqFGBw0
         hafVwg/hQqbEIoEfHj1mbcZnzvrNykJSePIk0SUOm8FJ7KQqs2BlPynCmPgf2tj+wg
         rHVsKnfcLfzbO9lZrqRckVddTzeFv2RrgyRMbqS5vLHPBnBUKixlssA/FuxkHXkYGi
         szxDMWf4doSLQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e05721f0000>; Fri, 27 Dec 2019 15:53:19 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Fri, 27 Dec 2019 15:53:16 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Fri, 27 Dec 2019 15:53:16 +1300
From:   Logan Shaw <Logan.Shaw@alliedtelesis.co.nz>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     Joshua Scott <Joshua.Scott@alliedtelesis.co.nz>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] hwmon: (adt7475) Added attenuator bypass support
Thread-Topic: [PATCH v2 2/2] hwmon: (adt7475) Added attenuator bypass support
Thread-Index: AQHVthzqestyVtwTz0S+q/NkKMJJp6e/+a+AgAyBvAA=
Date:   Fri, 27 Dec 2019 02:53:16 +0000
Message-ID: <804d10c6a459b9d7fa02d1e7ba08369c1c95ec87.camel@alliedtelesis.co.nz>
References: <20191219033213.30364-1-logan.shaw@alliedtelesis.co.nz>
         <20191219033213.30364-3-logan.shaw@alliedtelesis.co.nz>
         <e88b029b-dbb3-e423-5c37-0917d7716b66@roeck-us.net>
In-Reply-To: <e88b029b-dbb3-e423-5c37-0917d7716b66@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:25:ae22:bff:fe77:dd09]
Content-Type: text/plain; charset="utf-8"
Content-ID: <30BB46F3A3BB3747A6D9A8144EB0D1FB@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

T24gV2VkLCAyMDE5LTEyLTE4IGF0IDE5OjUzIC0wODAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0K
PiBPbiAxMi8xOC8xOSA3OjMyIFBNLCBMb2dhbiBTaGF3IHdyb3RlOg0KPiA+IEFkZGVkIGEgbmV3
IGZpbGUgZG9jdW1lbnRpbmcgdGhlIGFkdDc0NzUgZGV2aWNldHJlZSBhbmQgYWRkZWQgdGhlDQo+
ID4gZml2ZQ0KPiA+IG5ldyBwcm9wZXJ0aWVzIHRvIGl0Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYt
Ynk6IExvZ2FuIFNoYXcgPGxvZ2FuLnNoYXdAYWxsaWVkdGVsZXNpcy5jby5uej4NCj4gPiAtLS0N
Cj4gPiAtLS0NCj4gPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL2FkdDc0NzUudHh0
ICAgICB8IDM1DQo+ID4gKysrKysrKysrKysrKysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQs
IDM1IGluc2VydGlvbnMoKykNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9hZHQ3NDc1LnR4dA0KPiA+IA0KPiA+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaHdtb24vYWR0NzQ3
NS50eHQNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9od21vbi9hZHQ3
NDc1LnR4dA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAw
Li4zODhkZDcxOGEyNDYNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2h3bW9uL2FkdDc0NzUudHh0DQo+ID4gQEAgLTAsMCArMSwz
NSBAQA0KPiA+ICsqQURUNzQ3NSBod21vbiBzZW5zb3IuDQo+ID4gKw0KPiA+ICtSZXF1aXJlZCBw
cm9wZXJ0aWVzOg0KPiA+ICstIGNvbXBhdGlibGU6IE9uZSBvZg0KPiA+ICsJImFkaSxhZHQ3NDcz
Ig0KPiA+ICsJImFkaSxhZHQ3NDc1Ig0KPiA+ICsJImFkaSxhZHQ3NDc2Ig0KPiA+ICsJImFkaSxh
ZHQ3NDkwIg0KPiA+ICsNCj4gPiArLSByZWc6IEkyQyBhZGRyZXNzDQo+ID4gKw0KPiA+ICtvcHRp
b25hbCBwcm9wZXJ0aWVzOg0KPiA+ICsNCj4gPiArLSBieXBhc3MtYXR0ZW51YXRvci1hbGw6IENv
bmZpZ3VyZXMgYnlwYXNzaW5nIGFsbCB2b2x0YWdlIGlucHV0DQo+ID4gYXR0ZW51YXRvcnMuDQo+
ID4gKwlUaGlzIGlzIG9ubHkgc3VwcG9ydGVkIG9uIHRoZSBBRFQ3NDc2IGFuZCBBRFQ3NDkwLCB0
aGlzDQo+ID4gcHJvcGVydHkgZG9lcw0KPiA+ICsJbm90aGluZyBvbiBvdGhlciBjaGlwcy4NCj4g
DQo+IEJvdGggYWR0NzQ3MyBhbmQgYWR0NzQ3NSBkbyBzdXBwb3J0IGNvbmZpZ3VyaW5nIGFuIGF0
dGVudWF0b3Igb24gVkNDUA0KPiANCg0KVGhhdCBpcyB0cnVlLCBidXQgYXMgdGhlIGZ1bmN0aW9u
IG9mIHJlZ2lzdGVyIDB4NzMgYml0IDUgZGlmZmVycw0KYmV0d2VlbiB0aGUgdHdvIHNldCBvZiBo
YXJkd2FyZSAoe2FkdDc0NzMsIGFkdDc0NzV9IGFuZCB7YWR0NzQ3NiwNCmFkdDc0OTB9KSBhIHNv
bHV0aW9uIHdoaWNoIGFsbG93cyBieXBhc3NpbmcgVkNDUCBvbiBib3RoIGdldHMgbW9yZQ0KY29t
cGxpY2F0ZWQgd2hpY2ggSSB3YXMgdHJ5aW5nIHRvIGF2b2lkLg0KDQpJcyBpdCBhY2NlcHRhYmxl
IHRvIHNwbGl0IHRoZSBmdW5jdGlvbg0KbG9hZF9pbmRpdmlkdWFsX2J5cGFzc19hdHRlbnVhdG9y
cyBpbnRvIHR3bywgb25lIGZvciBlYWNoIHNldCBvZg0KY2hpcHMsIGFuZCBjYWxsIHRoZSBhcHBy
b3ByaWF0ZSBmdW5jdGlvbiBmb3IgdGhlIGNoaXA/IFRoYXQgd2F5IGFkZGluZw0KImJ5cGFzcy1h
dHRlbnVhdG9yLWluMSIgdG8gYW55IG9mIHRoZSBmb3VyIGFkdCBjaGlwcyBEVFMgd2lsbCByZXN1
bHQgaW4NCnRoZSBhdHRlbnVhdG9yIGZvciBWQ0NQIGJlaW5nIGJ5cGFzc2VkIChhbGJlaXQgYnkg
c2V0dGluZyBkaWZmZXJlbnQNCmJpdHMgZGVwZW5kaW5nIG9uIHRoZSBzcGVjaWZpYyBiaXQpLg0K
DQo+ID4gKwkJcHJvcGVydHkgcHJlc2VudDogQml0IHNldCB0byBieXBhc3MgYWxsIHZvbHRhZ2Ug
aW5wdXQNCj4gPiBhdHRlbnVhdG9ycy4NCj4gPiArCQlwcm9wZXJ0eSBhYnNlbnQ6IFJlZ2lzdGVy
cyBsZWZ0IHVuY2hhbmdlZC4NCj4gPiArDQo+ID4gKy0gYnlwYXNzLWF0dGVudWF0b3ItaW54OiBD
b25maWd1cmVzIGJ5cGFzc2luZyBpbmRpdmlkdWFsIHZvbHRhZ2UNCj4gPiBpbnB1dA0KPiA+ICsJ
YXR0ZW51YXRvcnMsIHdoZXJlIHggaXMgYW4gaW50ZWdlciBmcm9tIHRoZSBzZXQgezAsIDEsIDMs
IDR9Lg0KPiA+IFRoaXMNCj4gPiArCWlzIG9ubHkgc3VwcG9ydGVkIG9uIHRoZSBBRFQ3NDc2IGFu
ZCBBRFQ3NDkwLCB0aGlzIHByb3BlcnR5DQo+ID4gZG9lcyBub3RoaW5nDQo+ID4gKwlvbiBvdGhl
ciBjaGlwcy4NCj4gPiArCQlwcm9wZXJ0eSBwcmVzZW50OiBCaXQgc2V0IHRvIGJ5cGFzcyBzcGVj
aWZpYyB2b2x0YWdlDQo+ID4gaW5wdXQgYXR0ZW51YXRvcg0KPiA+ICsJCQlmb3Igdm9sdGFnZSBp
bnB1dCB4Lg0KPiA+ICsJCXByb3BlcnR5IGFic2VudDogUmVnaXN0ZXJzIGxlZnQgdW5jaGFuZ2Vk
Lg0KPiA+ICsNCj4gDQo+IFRoaXMgaXMgaW50ZXJlc3RpbmcuIEl0IGVzc2VudGlhbGx5IG1lYW5z
ICJyZXRhaW4gY29uZmlndXJhdGlvbiBmcm9tDQo+IFJPTQ0KPiBNb25pdG9yIiwgYnV0IGxlYXZl
cyBubyBtZWFucyB0byBfZGlzYWJsZV8gdGhlIGJ5cGFzcy4NCj4gDQoNCk9ubHkgYSBwb3dlciBj
eWNsZSAoYWZ0ZXIgcmVtb3ZpbmcgdGhlIHByb3BlcnRpZXMgZnJvbSB0aGUgRFRTKSB3aWxsDQpz
ZXQgdGhlIGFmZmVjdGVkIGJpdHMgYmFjayB0byAwLiBSZW1vdmluZyB0aGUgcHJvcGVydGllcywg
YnV0IG9ubHkNCnNvZnRseSByZXN0YXJ0aW5nIHRoZSBzeXN0ZW0gKG5vIGludGVycnVwdGVkIHBv
d2VyIHN1cHBseSB0byB0aGUgYWR0DQpjaGlwKSwgd2lsbCBub3Qgc2V0IHRoZSBiaXRzIGJhY2sg
dG8gMC4NCg0KSSBkZWNpZGVkIGFnYWluc3Qgc2V0dGluZyB0aGUgYml0cyB0byAwIGJ5IGRlZmF1
bHQgKGlmIG5vIHByb3BlcnR5IHdhcw0KcHJlc2VudCkgYXMgZG9pbmcgc28gbWlnaHQgYnJlYWsg
Y29tcGF0aWJpbGl0eSB3aXRoIHN5c3RlbXMgdGhhdCBleHBlY3QNCnRoZSBiaXRzIHRvIHJlbWFp
biB1bmNoYW5nZWQuIA0KDQpBIGNvbXByb21pc2Ugd291bGQgYmUgdG8gY2hhbmdlIHRoZSAiYnlw
YXNzLWF0dGVudWF0b3ItaW54IiBwcm9wZXJ0eSB0bw0KImJ5cGFzcy1hdHRlbnVhdG9yLWlueCA9
IDx5PiIsIHdoZXJlIHkgPSAxIGJ5cGFzc2VzIHRoZSBhdHRlbnVhdG9yIGFuZA0KeSA9IDAgZG9l
cyBub3QuIElmIHRoZSBwcm9wZXJ0eSBpcyBub3QgcHJlc2VudCB0aGVuIHRoZSByZWdpc3RlciBp
cw0KbGVmdCB1bmNoYW5nZWQuIEl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gZG8gdGhlIHNhbWUgdG8g
dGhlICJieXBhc3MtDQphdHRlbnVhdG9yLWFsbCIgcHJvcGVydHkuIFdvdWxkIHRoZXNlIGNoYW5n
ZXMgYmUgYWNjZXB0YWJsZT8NCg0KPiA+ICtFeGFtcGxlOg0KPiA+ICsNCj4gPiAraHdtb25AMmUg
ew0KPiA+ICsJY29tcGF0aWJsZSA9ICJhZGksYWR0NzQ3NSI7DQo+ID4gKwlyZWcgPSA8MHgyZT47
DQo+ID4gKwlieXBhc3MtYXR0ZW51YXRvci1hbGw7DQo+ID4gKwlieXBhc3MtYXR0ZW51YXRvci1p
bjE7DQo+IA0KPiBXaGF0IHdvdWxkIGJlIHRoZSBwdXJwb3NlIG9mIHNwZWNpZnlpbmcgYm90aCBh
bGwgYW5kIGluMSA/DQoNClRoZXJlIHdvdWxkIGJlIG5vIHByYWN0aWNhbCBwdXJwb3NlLCBpdCB3
YXMgdG8ga2VlcCB0aGUgZXhhbXBsZQ0KY29tcGFjdC4gSW5zdGVhZCAiYnlwYXNzLWF0dGVudWF0
b3ItaW4xIiBjb3VsZCBiZSByZW1vdmVkIGFuZCBhZGRlZCB0byANCnNlY29uZCBkZXZpY2UgaHdt
b25AMmQuIFRoaXMgd291bGQgc2hvdyBvZmYgdGhlIHN5bnRheCBmb3IgZWFjaCBzZXQgb2YNCnBy
b3BlcnRpZXMgaW4gYSBtb3JlIHByYWN0aWNhbCB3YXkuDQoNCj4gDQo+ID4gK307DQo+ID4gXCBO
byBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlDQo+ID4gDQo+IA0KPiANCg==
