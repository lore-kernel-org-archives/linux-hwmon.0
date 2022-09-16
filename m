Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30058C32771
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Sep 2022 01:33:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbiIPBdt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 15 Sep 2022 21:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbiIPBds (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Sep 2022 21:33:48 -0400
Received: from m1550.mail.126.com (m1550.mail.126.com [220.181.15.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1A7E842ACE
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Sep 2022 18:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=nzZj7
        Or3v6IyFBkka4fIYxJnlMVZyyKNfpmFdl/fKvc=; b=k9fE2EIBs2+rLeZyHpQ+A
        N/kOqQSbvR1vhntmvyaizcpdpRhAXHXsMThFgD3YeXglgWlF7OAbf0KUcRlWEpck
        Mz3TT9JjdE3/uOhodxX71rNGzrF6YxDdboF3tI08cazCAx7YonhDS94f0VkT559/
        ZwlFcb6FnKQMOhR4wd8baQ=
Received: from windhl$126.com ( [8.219.73.50] ) by ajax-webmail-wmsvr50
 (Coremail) ; Fri, 16 Sep 2022 09:33:18 +0800 (CST)
X-Originating-IP: [8.219.73.50]
Date:   Fri, 16 Sep 2022 09:33:18 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Guenter Roeck" <linux@roeck-us.net>
Cc:     tharvey@gateworks.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, chenmengda2009@163.com
Subject: Re:Re: Re: [PATCH v2] hwmon: (gsc-hwmon) Call of_node_get() before
 of_find_xxx API
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <20220915164346.GA2994323@roeck-us.net>
References: <20220915090627.4007728-1-windhl@126.com>
 <20220915122536.GA3190145@roeck-us.net>
 <34c8065f.783c.18341453f34.Coremail.windhl@126.com>
 <20220915164346.GA2994323@roeck-us.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <4173bc92.fe1.18343edbfc7.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowAAHXfFf0iNjtPRtAA--.51642W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhx+F18RP1fClAACsJ
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

CgoKQXQgMjAyMi0wOS0xNiAwMDo0Mzo0NiwgIkd1ZW50ZXIgUm9lY2siIDxsaW51eEByb2Vjay11
cy5uZXQ+IHdyb3RlOgo+T24gVGh1LCBTZXAgMTUsIDIwMjIgYXQgMDk6MTA6MDBQTSArMDgwMCwg
TGlhbmcgSGUgd3JvdGU6Cj4+IAo+PiAKPj4gQXQgMjAyMi0wOS0xNSAyMDoyNTozNiwgIkd1ZW50
ZXIgUm9lY2siIDxsaW51eEByb2Vjay11cy5uZXQ+IHdyb3RlOgo+PiA+T24gVGh1LCBTZXAgMTUs
IDIwMjIgYXQgMDU6MDY6MjdQTSArMDgwMCwgTGlhbmcgSGUgd3JvdGU6Cj4+ID4+IEluIGdzY19o
d21vbl9nZXRfZGV2dHJlZV9wZGF0YSgpLCB3ZSBzaG91bGQgY2FsbCBvZl9ub2RlX2dldCgpIGJl
Zm9yZQo+PiA+PiB0aGUgb2ZfZmluZF9jb21wYXRpYmxlX25vZGUoKSB3aGljaCB3aWxsIGF1dG9t
YXRpY2FsbHkgY2FsbAo+PiA+PiBvZl9ub2RlX3B1dCgpIGZvciB0aGUgJ2Zyb20nIGFyZ3VtZW50
Lgo+PiA+PiAKPj4gPj4gRml4ZXM6IDNiY2U1Mzc3ZWY2NiAoImh3bW9uOiBBZGQgR2F0ZXdvcmtz
IFN5c3RlbSBDb250cm9sbGVyIHN1cHBvcnQiKQo+PiA+PiBDby1kZXZlbG9wZWQtYnk6IE1lbmdk
YSBDaGVuIDxjaGVubWVuZ2RhMjAwOUAxNjMuY29tPgo+PiA+PiBTaWduZWQtb2ZmLWJ5OiBNZW5n
ZGEgQ2hlbiA8Y2hlbm1lbmdkYTIwMDlAMTYzLmNvbT4KPj4gPj4gU2lnbmVkLW9mZi1ieTogTGlh
bmcgSGUgPHdpbmRobEAxMjYuY29tPgo+PiA+Cj4+ID5TaWdoLiBUaGUgZmlyc3Qgc2lnbmVyIGlz
IHN1cHBvc2VkIHRvIGJlIHRoZSBhdXRob3IuCj4+ID4KPj4gPkd1ZW50ZXIKPj4gCj4+IEhpLCBH
dWVudGVyCj4+IAo+PiBJIHNlYXJjaCB0aGUgY29tbWl0IGhpc3RvcnkgYW5kIGZvdW5kIHNldmVy
YWwgcmVjZW50IGJ1dCBkaWZmZXJlbnQgY29tbWl0cyAKPj4gCj4+IFRoaXMgb25lIGlzIHNhbWUg
d2l0aCBtaW5lOiBDby1kZXZlbG9wZWQtYnk6IEEgJiBTT0IgRmlyc3QgJiBTT0IgQXV0aG9yLCAg
Zm9sbG93aW5nIHRoZSBrZXJuZWwgZG9jIAo+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9oPXY2LjAtcmM1
JmlkPTdlOTdjZmVkOTkyOWVhYWJjNDE4MjljMzk1ZWIwZDEzNTBmY2NiOWQKPj4gCj4+IEJ1dCwg
dGhpcyBvbmUgaXMgY29uc2lzdGVudCB3aXRoIHlvdXIgYWR2aXNlOiBTT0IgQXV0aG9yICYgQ28t
ZGV2ZWxvcGVkLWJ5OiBBICYgU09CIEEKPj4gKGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2g9djYuMC1yYzUm
aWQ9ZWY2OWFhM2E5ODZlZjk0ZjAxY2U4YjViNjE5ZjU1MGRiNTQ0MzJmZQo+PiAKPgo+WWVzLCBJ
IGtub3csIG9uZSBjYW4gYWx3YXlzIGZpbmQgYW4gZXhhbXBsZSBmb3IgZXZlcnl0aGluZwo+aW4g
dGhlIExpbnV4IGtlcm5lbC4KPgo+SSBleHBlY3QgdGhlIGZpcnN0IHNpZ25lciB0byBiZSB0aGUg
YXV0aG9yLCBhbmQgdGhlIGxhc3Qgc2lnbmVyCj50byBiZSB0aGUgcGVyc29uIHdobyBzZW50IG1l
IHRoZSBwYXRjaC4KPgo+R3VlbnRlcgoKVGhhbmtzIGZvciB5b3VyIGFkdmljZSwgc28gZm9sbG93
aW5nIHRhZyBvcmRlciBpcyBhY2NlcHRhYmxlPwoKRml4ZXM6IDNiY2U1Mzc3ZWY2NiAoImh3bW9u
OiBBZGQgR2F0ZXdvcmtzIFN5c3RlbSBDb250cm9sbGVyIHN1cHBvcnQiKQpTaWduZWQtb2ZmLWJ5
OiBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+CkNvLWRldmVsb3BlZC1ieTogTWVuZ2RhIENoZW4g
PGNoZW5tZW5nZGEyMDA5QDE2My5jb20+ClNpZ25lZC1vZmYtYnk6IE1lbmdkYSBDaGVuIDxjaGVu
bWVuZ2RhMjAwOUAxNjMuY29tPgoKSWYgdGhlcmUgaXMgbm8gcHJvYmxlbSwgSSB3aWxsIHNlbmQg
YSBuZXcgdmVyc2lvbiBwYXRjaC4KClRoYW5rcyBhZ2Fpbi4KCkxpYW5nCgoK
