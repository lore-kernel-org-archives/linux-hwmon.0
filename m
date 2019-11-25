Return-Path: <SRS0=YpYn=ZR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCD2C432C0
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Nov 2019 16:44:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D48D20835
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Nov 2019 16:44:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728853AbfKYQor (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Nov 2019 11:44:47 -0500
Received: from skedge04.snt-world.com ([91.208.41.69]:38872 "EHLO
        skedge04.snt-world.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728683AbfKYQor (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Nov 2019 11:44:47 -0500
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by skedge04.snt-world.com (Postfix) with ESMTPS id 0B21D67A7B0;
        Mon, 25 Nov 2019 17:44:45 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 25 Nov
 2019 17:44:44 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Mon, 25 Nov 2019 17:44:44 +0100
From:   Gilles Buloz <Gilles.Buloz@kontron.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: hwmon: (nct7802) buggy VSEN1/2/3 alarm
Thread-Topic: hwmon: (nct7802) buggy VSEN1/2/3 alarm
Thread-Index: AQHVo5IpgkKRfgHMQkil/fmfzLEhKaeb4hMAgAAlS4A=
Date:   Mon, 25 Nov 2019 16:44:44 +0000
Message-ID: <5DDC04FB.1030705@kontron.com>
References: <5DDBD386.4070408@kontron.com>
 <6cde95e5-0ab3-016f-b67d-73db8c16ff71@roeck-us.net>
In-Reply-To: <6cde95e5-0ab3-016f-b67d-73db8c16ff71@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux i686; rv:24.0) Gecko/20100101
 Thunderbird/24.1.1
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-Type: text/plain; charset="utf-8"
Content-ID: <32284B1CB7AB334F9773434E84F54A99@snt-world.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 0B21D67A7B0.AEAB2
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: gilles.buloz@kontron.com
X-SnT-MailScanner-To: linux-hwmon@vger.kernel.org, linux@roeck-us.net
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

TGUgMjUvMTEvMjAxOSAxNTozMSwgR3VlbnRlciBSb2VjayBhIMOpY3JpdCA6DQo+IE9uIDExLzI1
LzE5IDU6MTMgQU0sIEdpbGxlcyBCdWxveiB3cm90ZToNCj4+IEhpIEd1ZW50ZXIsDQo+Pg0KPj4g
QWNjb3JkaW5nIHRvIHRoZSBOQ1Q3ODAyWSBkYXRhc2hlZXQsIHRoZSBSRUdfVk9MVEFHRV9MSU1J
VF9MU0IgZGVmaW5pdGlvbiBpcyB3cm9uZyBhbmQgbGVhZHMgdG8gd3JvbmcgdGhyZXNob2xkIHJl
Z2lzdGVycyB1c2VkLiBJdA0KPj4gc2hvdWxkIGJlIDoNCj4+IHN0YXRpYyBjb25zdCB1OCBSRUdf
Vk9MVEFHRV9MSU1JVF9MU0JbMl1bNV0gPSB7DQo+PiAgICAgICAgICAgeyAweDQ2LCAweDAwLCAw
eDQwLCAweDQyLCAweDQ0IH0sDQo+PiAgICAgICAgICAgeyAweDQ1LCAweDAwLCAweDNmLCAweDQx
LCAweDQzIH0sDQo+PiB9Ow0KPj4gV2l0aCB0aGlzIGRlZmluaXRpb24sIHRoZSByaWdodCBiaXQg
aXMgc2V0IGluICJWb2x0YWdlIFNNSSBTdGF0dXMgUmVnaXN0ZXIgQDB4MWUiIGZvciBlYWNoIHRo
cmVzaG9sZCByZWFjaGVkICh1c2luZyBpMmNnZXQgdG8gY2hlY2spDQo+Pg0KPg0KPiBHb29kIGNh
dGNoLiBDYXJlIHRvIHNlbmQgYSBwYXRjaCA/DQpBcyBhIGZpeCBmb3IgdGhpcyBpcyBvbmx5IHVz
ZWZ1bCB3aXRoIGEgZml4IGZvciB0aGUgcHJvYmxlbSBiZWxvdywgbWF5YmUgYSBzaW5nbGUgcGF0
Y2ggZm9yIGJvdGggd291bGQgYmUgYmV0dGVyLg0KPj4gQnV0IEknbSB1bmFibGUgdG8gZ2V0IGFu
eSAiQUxBUk0iIHJlcG9ydGVkIGJ5IHRoZSBjb21tYW5kICJzZW5zb3JzIiBmb3IgVlNFTjEvMi8z
ID0gaW4yLGluMyxpbjQgYmVjYXVzZSBzdGF0dXMgZm9yIGluMCBpcyByZWFkDQo+PiBiZWZvcmUg
KHVubGVzcyBJIHNldCAiaWdub3JlIGluMCIgaW4gc2Vuc29ycyBmaWxlKS4gVGhlIHByb2JsZW0g
aXMgdGhhdCBzdGF0dXMgYml0cyBpbiAiVm9sdGFnZSBTTUkgU3RhdHVzIFJlZ2lzdGVyIEAweDFl
IiBhcmUNCj4+IGNsZWFyZWQgd2hlbiByZWFkaW5nLCBhbmQgYSByZWFkIGlzIGRvbmUgZm9yIGVh
Y2ggaW5YIHByb2Nlc3NlZCwgc28gb25seSB0aGUgZmlyc3QgaW5YIGhhcyBhIGNoYW5jZSB0byBn
ZXQgaXRzIGFsYXJtIGJpdCBzZXQuDQo+PiBGb3IgdGhpcyBwcm9ibGVtIEkgZG9uJ3Qgc2VlIGhv
dyB0byBmaXggdGhpcyBlYXNpbHk7IGp1c3QgdG8gbGV0IHlvdSBrbm93IC4uLg0KPj4NCj4gT25l
IHBvc3NpYmxlIGZpeCB3b3VsZCBiZSB0byBjYWNoZSBlYWNoIGFsYXJtIHJlZ2lzdGVyIGFuZCB0
byBjbGVhciB0aGUgY2FjaGUNCj4gZWl0aGVyIGFmdGVyIHJlYWRpbmcgaXQgKGJpdHdpc2UpIG9y
IGFmdGVyIGEgdGltZW91dC4gVGhlIGxhdHRlciBpcyBwcm9iYWJseQ0KPiBiZXR0ZXIgdG8gYXZv
aWQgc3RhbGUgaW5mb3JtYXRpb24uDQpBcyB3ZSBoYXZlIHN0YXR1cyByZWdpc3RlcnMgY2xlYXJl
ZCBhdCBieXRlIGxldmVsIGFuZCB3ZSB3YW50IHRoZW0gdG8gYmUgY2xlYXJlZCBhdCBiaXQgbGV2
ZWwgd2hlbiBlYWNoIGJpdCBpcyByZWFkLCBJIHRoaW5rIGEgY2FjaGUgDQp3b3VsZCBiZSBiZXR0
ZXIuIEkgc3VnZ2VzdCB0aGlzIDoNCi0gaGF2ZSBhIGNhY2hlZCB2YWx1ZSBmb3IgZWFjaCBzdGF0
dXMgcmVnaXN0ZXIsIGJ5IGRlZmF1bHQgYXQgMHgwMA0KLSB3aGVuIHJlYWRpbmcgYSByZWdpc3Rl
ciB0byBnZXQgYSBiaXQsICJPUiIgaXRzIGJ5dGUgdmFsdWUgd2l0aCBpdHMgY2FjaGVkIHZhbHVl
LCB0aGVuIHVzZSBpdHMgY2FjaGVkIHZhbHVlIGZvciBwcm9jZXNzaW5nLg0KLSB0aGVuIGNsZWFy
IHRoZSBiaXQgdGhhdCBoYXMgYmVlbiBwcm9jZXNzZWQgZnJvbSB0aGUgY2FjaGVkIHZhbHVlLg0K
DQpJIHRoaW5rIGEgdGltZW91dCB3b3VsZCBub3QgYmUgb2J2aW91cyB0byBzZXQgOiBhdCBsZWFz
dCB0aGUgdGltZSBmb3Igc2Vuc29ycyB0byByZWFkIGFsbCBpbmZvIChpbmNsdWRpbmcgd2hlbiB0
ZXJtaW5hbCBpcyBhIHNlcmlhbCANCmxpbmUgYW5kIG91dHB1dCBpcyBzbG93ZXIpIGFuZCB0byBk
ZWFsIHdpdGggcG9zc2libGUgbGF0ZW5jaWVzLCBidXQgbm90IHRvbyBsb25nLi4uDQo+DQo+IEd1
ZW50ZXINCj4gLg0KPg0K
