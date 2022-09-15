Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8252EC6FA86
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Sep 2022 07:42:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbiIOHmT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 15 Sep 2022 03:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbiIOHmS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Sep 2022 03:42:18 -0400
X-Greylist: delayed 1854 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 15 Sep 2022 00:42:12 PDT
Received: from m1564.mail.126.com (m1564.mail.126.com [220.181.15.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ECE4F92F54
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Sep 2022 00:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=5Vcfm
        TA9O7RJAWHtKf7bnR2qJAEoU7GZJuwiPMY8JwY=; b=XUHcPHsBW8/PJrKk4DW/F
        09GOSIj5SvNPGeWYvWF59PSskzkbHvMi25wRLtjPFVdck9xPeW77fiiC+S32SkRW
        JdoQ5XyCPf40Pds1AkwrTxR/17hoVz0LPDCw2SHnMvMaAPCi9sKF2eygEEyka7a+
        epstudd+UOLKDHwVSmAfjo=
Received: from windhl$126.com ( [8.219.73.50] ) by ajax-webmail-wmsvr64
 (Coremail) ; Thu, 15 Sep 2022 15:10:54 +0800 (CST)
X-Originating-IP: [8.219.73.50]
Date:   Thu, 15 Sep 2022 15:10:54 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Guenter Roeck" <linux@roeck-us.net>
Cc:     tharvey@gateworks.com, rjones@gateworks.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, chenmengda2009@163.com
Subject: Re:Re: [PATCH] hwmon: (gsc-hwmon) Call of_node_get() before
 of_find_xxx API
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <20220915065910.GA4098423@roeck-us.net>
References: <20220915020245.4001047-1-windhl@126.com>
 <20220915065910.GA4098423@roeck-us.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <4dc7624a.479c.1833ffc78b1.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QMqowADX33P_zyJjyb5wAA--.58868W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhl9F18RP1PtWQACsp
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

CgoKQXQgMjAyMi0wOS0xNSAxNDo1OToxMCwgIkd1ZW50ZXIgUm9lY2siIDxsaW51eEByb2Vjay11
cy5uZXQ+IHdyb3RlOgo+T24gVGh1LCBTZXAgMTUsIDIwMjIgYXQgMTA6MDI6NDVBTSArMDgwMCwg
TGlhbmcgSGUgd3JvdGU6Cj4+IEluIGdzY19od21vbl9nZXRfZGV2dHJlZV9wZGF0YSgpLCB3ZSBz
aG91bGQgY2FsbCBvZl9ub2RlX2dldCgpIGJlZm9yZQo+PiB0aGUgb2ZfZmluZF9jb21wYXRpYmxl
X25vZGUoKSB3aGljaCB3aWxsIGF1dG9tYXRpY2FsbHkgY2FsbAo+PiBvZl9ub2RlX3B1dCgpIGZv
ciB0aGUgJ2Zyb20nIGFyZ3VtZW50Lgo+PiAKPj4gRml4ZXM6IDNiY2U1Mzc3ZWY2NiAoImh3bW9u
OiBBZGQgR2F0ZXdvcmtzIFN5c3RlbSBDb250cm9sbGVyIHN1cHBvcnQiKQo+PiBTaWduZWQtb2Zm
LWJ5OiBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IE1lbmdkYSBD
aGVuIDxjaGVubWVuZ2RhMjAwOUAxNjMuY29tPgo+Cj5UaGF0IHNlY29uZCBTaWduZWQtb2ZmLWJ5
OiBkb2Vzbid0IG1ha2Ugc2Vuc2UgaW4gdGhpcyBjb250ZXh0IHNpbmNlCj50aGUgcGF0Y2ggaXMg
ZnJvbSBhbmQgd2FzIHNlbnQgYnkgdGhlIGZpcnN0IHNpZ25lci4KPgoKPkd1ZW50ZXIKCgpIaSwg
R3VlbnRlcgoKSSB3b25kZXIgaWYgaXQgaXMgT0sgaWYgbWVuZ2RhIHNlbmQgYSBTaWduZWQtb2Zm
LWJ5IGZvciB0aGlzIApvciBJIHNob3VkIHJlc2VuZCBhbm90aGVyIG5ldyB2ZXJzaW9uIChWMikg
aW4gd2hpY2ggSSBvbmx5IGF0dGFjaCBteSBTT0IgCmFuZCB0aGVuIG1lbmdkYSBzZW5kcyBoaXMg
U09CLgoKVGhhbmtzIHZlcnkgbXVjaCEKCkxpYW5nCgoKCj4+IC0tLQo+PiAgZHJpdmVycy9od21v
bi9nc2MtaHdtb24uYyB8IDEgKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+
IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9nc2MtaHdtb24uYyBiL2RyaXZlcnMvaHdt
b24vZ3NjLWh3bW9uLmMKPj4gaW5kZXggZDY0YmU0OGYxZWY2Li5iNjBlYzk1YjVlZGIgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvaHdtb24vZ3NjLWh3bW9uLmMKPj4gKysrIGIvZHJpdmVycy9od21v
bi9nc2MtaHdtb24uYwo+PiBAQCAtMjY3LDYgKzI2Nyw3IEBAIGdzY19od21vbl9nZXRfZGV2dHJl
ZV9wZGF0YShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+ICAJcGRhdGEtPm5jaGFubmVscyA9IG5jaGFu
bmVsczsKPj4gIAo+PiAgCS8qIGZhbiBjb250cm9sbGVyIGJhc2UgYWRkcmVzcyAqLwo+PiArCW9m
X25vZGVfZ2V0KGRldi0+cGFyZW50LT5vZl9ub2RlKTsKPj4gIAlmYW4gPSBvZl9maW5kX2NvbXBh
dGlibGVfbm9kZShkZXYtPnBhcmVudC0+b2Zfbm9kZSwgTlVMTCwgImd3LGdzYy1mYW4iKTsKPj4g
IAlpZiAoZmFuICYmIG9mX3Byb3BlcnR5X3JlYWRfdTMyKGZhbiwgInJlZyIsICZwZGF0YS0+ZmFu
X2Jhc2UpKSB7Cj4+ICAJCW9mX25vZGVfcHV0KGZhbik7Cj4+IC0tIAo+PiAyLjI1LjEKPj4gCg==

