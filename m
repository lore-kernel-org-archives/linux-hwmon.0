Return-Path: <SRS0=mQrJ=RR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B43C10F06
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Mar 2019 16:14:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B265B2184E
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Mar 2019 16:14:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727605AbfCNQOG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Mar 2019 12:14:06 -0400
Received: from mail.infodas.de ([87.190.49.227]:25985 "EHLO mail.infodas.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727815AbfCNQOD (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Mar 2019 12:14:03 -0400
X-Greylist: delayed 324 seconds by postgrey-1.27 at vger.kernel.org; Thu, 14 Mar 2019 12:14:01 EDT
Received: from veco001.infodas.de ([192.168.119.2]:52978)
        by mail.infodas.de with esmtps (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.82_1-5b7a7c0-XX)
        (envelope-from <C.Groenke@infodas.de>)
        id 1h4SuH-0008Dg-1u; Thu, 14 Mar 2019 17:08:33 +0100
Received: from mailsrv.infodas.de (192.168.100.13) by veco001.infodas.de with Infodas vecoMail 3.5.100.00565
        id 52579712023750; Thu, 14 Mar 2019 17:08:32 +0100
Received: from AS001EX.ifd.infodas.de (192.168.100.13) by
 AS001EX.ifd.infodas.de (192.168.100.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1034.26; Thu, 14 Mar 2019 17:08:33 +0100
Received: from AS001EX.ifd.infodas.de ([fe80::1009:82f4:6b93:afe0]) by
 AS001EX.ifd.infodas.de ([fe80::1009:82f4:6b93:afe0%12]) with mapi id
 15.01.1034.033; Thu, 14 Mar 2019 17:08:33 +0100
X-CTCH-RefID: str=0001.0A0C0215.5C8A7C81.009F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
From:   =?utf-8?B?R3LDtm5rZSwgQ2hyaXN0aWFu?= <C.Groenke@infodas.de>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: AW: PMBus driver for FSP/3Y Power device with non-standard VOUT
 values (LINEAR11 vs LINEAR16)
Thread-Topic: PMBus driver for FSP/3Y Power device with non-standard VOUT
 values (LINEAR11 vs LINEAR16)
Thread-Index: AdTZlFnCHh83NT7jQ5qCS2EYnwBUxQAE3J+AAAMyQPD///ozgP//329wgADVuID//x1OIA==
Date:   Thu, 14 Mar 2019 16:08:32 +0000
Message-ID: <25260e7b0f3d43588253791046440a64@infodas.de>
References: <0e0877aa3c644765b226654bfd7874bf@infodas.de>
 <20190313151941.GA7122@roeck-us.net>
 <90ca63aeec904168b50b2f8c3f04dd73@infodas.de>
 <20190313163027.GB15451@roeck-us.net>
 <7c2e3520f1d24e51b7002c8d0138f00a@infodas.de>
 <20190314031849.GA19793@roeck-us.net>
In-Reply-To: <20190314031849.GA19793@roeck-us.net>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.76]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

SGVsbG8gR3VlbnRlciwNCg0KPiAtLS0tLVVyc3Byw7xuZ2xpY2hlIE5hY2hyaWNodC0tLS0tDQo+
IFZvbjogR3VlbnRlciBSb2VjayA8Z3JvZWNrN0BnbWFpbC5jb20+IEltIEF1ZnRyYWcgdm9uIEd1
ZW50ZXIgUm9lY2sNCj4gR2VzZW5kZXQ6IERvbm5lcnN0YWcsIDE0LiBNw6RyeiAyMDE5IDA0OjE5
DQo+IEFuOiBHcsO2bmtlLCBDaHJpc3RpYW4gPEMuR3JvZW5rZUBpbmZvZGFzLmRlPg0KPiBDYzog
bGludXgtaHdtb25Admdlci5rZXJuZWwub3JnDQo+IEJldHJlZmY6IFJlOiBQTUJ1cyBkcml2ZXIg
Zm9yIEZTUC8zWSBQb3dlciBkZXZpY2Ugd2l0aCBub24tc3RhbmRhcmQgVk9VVA0KPiB2YWx1ZXMg
KExJTkVBUjExIHZzIExJTkVBUjE2KQ0KPiANCj4gSGkgQ2hyaXN0aWFuLA0KPiANCj4gT24gV2Vk
LCBNYXIgMTMsIDIwMTkgYXQgMDU6MzU6MzhQTSArMDAwMCwgR3LDtm5rZSwgQ2hyaXN0aWFuIHdy
b3RlOg0KPiBbIC4uLiBdDQo+ID4gPg0KPiA+ID4gT3VyIGxhc3QgZS1tYWlscyBvdmVybGFwcGVk
OyBjYW4geW91IGV4cGxvcmUgd2hhdCBpdCB3b3VsZCB0YWtlIHRvDQo+ID4gPiBhZGQgc3VwcG9y
dCBmb3IgaWVlZTc1NCBoYWxmIHByZWNpc2lvbiBmbG9hdGluZyBwb2ludCA/ICBXZSB3b3VsZA0K
PiA+ID4gbmVlZCBhIG5ldyBzZXQgb2YgY29udmVyc2lvbiBmdW5jdGlvbnMgaW4gdGhlIGNvcmUg
KGllDQo+ID4gPiBwbWJ1c19yZWcyZGF0YV9pZWVlNzU0IGFuZCBwbWJ1c19kYXRhMnJlZ19pZWVl
NzU0KSwgYW5kIHlvdXIgZHJpdmVyDQo+ID4gPiB3b3VsZCBoYXZlIHRvIGltcGxlbWVudCB0aGUN
Cj4gPiA+IGxpbmVhcjExIDwtPiBpZWVlNzU0IGNvbnZlcnNpb24uIFRoYXQgbWF5IGJlIGEgYml0
IG1vcmUgd29yaywgYnV0IGl0DQo+ID4gPiB3b3VsZCBhbHNvIGJlIGNsZWFuZXIsIGFuZCBpdCBz
aG91bGQgbm90IGFmZmVjdCBwcmVjaXNpb24uDQo+ID4NCj4gPiBJIGdpdmUgaXQgYSBsb29rIHRv
bW9ycm93LiBJZiB0aGlzIHByZXNlbnRzIGEgcHJvcGVyIGFuZCBjbGVhbiB3YXksIHRvDQo+ID4g
YXZvaWQgYWRkaW5nIHRoZSBoYWNrIGluIHRoZSBnZW5lcmljIGNvZGUgaXQgbWlnaHQgYmUgd29y
dGggaXQuDQo+ID4NCj4gDQo+IFBsZWFzZSB1c2UgdGhlIGF0dGFjaGVkIHBhdGNoIGFzIHN0YXJ0
aW5nIHBvaW50LiBPYnZpb3VzbHkgSSBjb3VsZCBub3QNCj4gZG8gbXVjaCB0ZXN0aW5nLCBidXQg
dW5pdCB0ZXN0aW5nIHJldHVybmVkIHJlYXNvbmFibGUgcmVzdWx0cy4gTm90ZSB0aGF0DQo+IHdl
IGRvbid0IGhhdmUgdG8gZm9sbG93IHRoZSBwbWJ1cyBzcGVjIHRvIHRoZSBsZXR0ZXIgLSBpdCBp
cyBzdWZmaWNpZW50DQo+IHRvIGRlY2xhcmUgdGhlIFZPVVQgdmFsdWVzIHRvIGJlIGluIGllZWU3
NTQgZm9ybWF0IGZvciB5b3VyIGRyaXZlci4NCg0KVGhhbmtzIGEgbG90IGZvciB0aGUgcGF0Y2gu
IEl0IGRpZCBpbmRlZWQgaGVscC4NCg0KVGhlIGZyYW1ld29yayBjb2RlIHNlZW1lZCB0byB3b3Jr
IGZpbmUuIEkgdXNlZCB5b3VyIGNvZGUgZm9yIHRoZSBjb252ZXJzaW9uOg0KICAgIGxpbmVhcjEx
IC0+ICdzY2FsZWQgaW50ZWdlcicgLT4gaWVlZTc1NA0KSXQgcHJvdmlkZWQgYSB3YXkgdG8gdGVz
dCB0aGUgY29kZSBhbmQgd2FzIGVhc3kgZm9yIG1lIGFzIG15IHRyaWVzIHRvIGRvDQpzb21lIG90
aGVyIGJpdCBtYWdpYyB3ZXJlbid0IHN1Y2Nlc3NmdWwuIFRoYXQgbWVhbnMgSSBwYXJ0bHkgdGVz
dGVkIHRoZSBjb2RlDQpmcm9tIHBtYnVzX2RhdGEycmVnX2llZWU3NTQgYXMgbXkgcmVhZF93b3Jk
IGZ1bmN0aW9uIHVzZXMgdGhpcyBmb3IgdGhlDQpjb252ZXJzaW9uLiBPZiBjb3Vyc2Ugbm90IHRo
ZSBtb2R1bGUgbG9jYWwgZnVuY3Rpb24uLi4NCg0KSSBoYXZlIHF1ZXN0aW9uIHdydCB0byB0aGUg
Y29kZToNClsuLi5dDQo+ICtzdGF0aWMgdTE2IHBtYnVzX2RhdGEycmVnX2llZWU3NTQoc3RydWN0
IHBtYnVzX2RhdGEgKmRhdGEsDQo+ICsJCQkJICBzdHJ1Y3QgcG1idXNfc2Vuc29yICpzZW5zb3Is
IGxvbmcgdmFsKSB7DQpbLi4uXQ0KPiArDQo+ICsJLyogRW5zdXJlIHRoYXQgcmVzdWx0aW5nIG51
bWJlciBpcyB3aXRoaW4gcmFuZ2UgKi8NCj4gKwlpZiAobWFudGlzc2EgPiAweDdmZikNCj4gKwkJ
bWFudGlzc2EgPSAweDdmZjsNCj4gKwllbHNlIGlmIChtYW50aXNzYSA8IDB4NDAwKQ0KPiArCQlt
YW50aXNzYSA9IDB4NDAwOw0KDQpTZXR0aW5nIHRoZSBtYW50aXNzYSB0byAweDQwMC4uLg0KDQo+
ICsJLyogQ29udmVydCB0byBzaWduLCA1IGJpdCBleHBvbmVudCwgMTAgYml0IG1hbnRpc3NhICov
DQo+ICsJcmV0dXJuIHNpZ24gfCAobWFudGlzc2EgJiAweDNmZikgfCAoKGV4cG9uZW50IDw8IDEw
KSAmIDB4N2MwMCk7IH0NCg0KLi4uIHdvdWxkIG1lYW4gaXQgaXMgY3V0IHRvIDAgaGVyZS4gSSBh
bSBub3Qgc3VyZSB0aGlzIGlzIHRoZSBpbnRlbnRpb24uDQpJIGd1ZXNzIGl0IHNob3VsZCBiZSAw
eDNGRiB0aGVuLiBPciBpbiBjYXNlIGl0IGlzIHN1cHBvc2VkIHRvIGJlIDAsIHRoZW4NCidtYW50
aXNzYSA9IDA7JyB3b3VsZCBiZSBlYXNpZXIgdG8gdW5kZXJzdGFuZC4NCg0KUmVnYXJkcw0KQ2hy
aXN0aWFuDQo=
