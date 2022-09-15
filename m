Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B85ECAAA1
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Sep 2022 13:10:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbiIONKf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 15 Sep 2022 09:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiIONKa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Sep 2022 09:10:30 -0400
Received: from m1524.mail.126.com (m1524.mail.126.com [220.181.15.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2E18D32A9C
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Sep 2022 06:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=ABbwc
        +o7qgY8b9WnSMF6mbvYxSNeHw9wpR5sKXilwds=; b=cBNqv9y28ziC9U4GaUKL/
        YH3JDuszCo6w+jepAQIBQCyhfw6O9kpPwGcMSWkzCn9vGIyLbIdQxvhdee66pXdT
        fw6edU2FdRW08YVmwBSHu4AYj96tG1NSsFbCQZrfC3jQLhG9GN3pdHWe9YuzTJMw
        w5ri7gf6By7AIua3JArgV8=
Received: from windhl$126.com ( [8.219.73.50, 14.29.82.34] ) by
 ajax-webmail-wmsvr24 (Coremail) ; Thu, 15 Sep 2022 21:10:00 +0800 (CST)
X-Originating-IP: [8.219.73.50, 14.29.82.34]
Date:   Thu, 15 Sep 2022 21:10:00 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Guenter Roeck" <linux@roeck-us.net>
Cc:     tharvey@gateworks.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, chenmengda2009@163.com
Subject: Re:Re: [PATCH v2] hwmon: (gsc-hwmon) Call of_node_get() before
 of_find_xxx API
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <20220915122536.GA3190145@roeck-us.net>
References: <20220915090627.4007728-1-windhl@126.com>
 <20220915122536.GA3190145@roeck-us.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <34c8065f.783c.18341453f34.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: GMqowAAnLycpJCNjZWl2AA--.38328W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizgp9F18RP1V6JgABsX
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

CgpBdCAyMDIyLTA5LTE1IDIwOjI1OjM2LCAiR3VlbnRlciBSb2VjayIgPGxpbnV4QHJvZWNrLXVz
Lm5ldD4gd3JvdGU6Cj5PbiBUaHUsIFNlcCAxNSwgMjAyMiBhdCAwNTowNjoyN1BNICswODAwLCBM
aWFuZyBIZSB3cm90ZToKPj4gSW4gZ3NjX2h3bW9uX2dldF9kZXZ0cmVlX3BkYXRhKCksIHdlIHNo
b3VsZCBjYWxsIG9mX25vZGVfZ2V0KCkgYmVmb3JlCj4+IHRoZSBvZl9maW5kX2NvbXBhdGlibGVf
bm9kZSgpIHdoaWNoIHdpbGwgYXV0b21hdGljYWxseSBjYWxsCj4+IG9mX25vZGVfcHV0KCkgZm9y
IHRoZSAnZnJvbScgYXJndW1lbnQuCj4+IAo+PiBGaXhlczogM2JjZTUzNzdlZjY2ICgiaHdtb246
IEFkZCBHYXRld29ya3MgU3lzdGVtIENvbnRyb2xsZXIgc3VwcG9ydCIpCj4+IENvLWRldmVsb3Bl
ZC1ieTogTWVuZ2RhIENoZW4gPGNoZW5tZW5nZGEyMDA5QDE2My5jb20+Cj4+IFNpZ25lZC1vZmYt
Ynk6IE1lbmdkYSBDaGVuIDxjaGVubWVuZ2RhMjAwOUAxNjMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5
OiBMaWFuZyBIZSA8d2luZGhsQDEyNi5jb20+Cj4KPlNpZ2guIFRoZSBmaXJzdCBzaWduZXIgaXMg
c3VwcG9zZWQgdG8gYmUgdGhlIGF1dGhvci4KPgo+R3VlbnRlcgoKSGksIEd1ZW50ZXIKCkkgc2Vh
cmNoIHRoZSBjb21taXQgaGlzdG9yeSBhbmQgZm91bmQgc2V2ZXJhbCByZWNlbnQgYnV0IGRpZmZl
cmVudCBjb21taXRzIAoKVGhpcyBvbmUgaXMgc2FtZSB3aXRoIG1pbmU6IENvLWRldmVsb3BlZC1i
eTogQSAmIFNPQiBGaXJzdCAmIFNPQiBBdXRob3IsICBmb2xsb3dpbmcgdGhlIGtlcm5lbCBkb2Mg
Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRz
L2xpbnV4LmdpdC9jb21taXQvP2g9djYuMC1yYzUmaWQ9N2U5N2NmZWQ5OTI5ZWFhYmM0MTgyOWMz
OTVlYjBkMTM1MGZjY2I5ZAoKQnV0LCB0aGlzIG9uZSBpcyBjb25zaXN0ZW50IHdpdGggeW91ciBh
ZHZpc2U6IFNPQiBBdXRob3IgJiBDby1kZXZlbG9wZWQtYnk6IEEgJiBTT0IgQQooaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0
L2NvbW1pdC8/aD12Ni4wLXJjNSZpZD1lZjY5YWEzYTk4NmVmOTRmMDFjZThiNWI2MTlmNTUwZGI1
NDQzMmZlCgpTbyBwbGVhc2UgdGVsbCBtZSB3aGF0IEkgc2hvdWxkIGZvbGxvdz8KClRoYW5rcyB2
ZXJ5IG11Y2guCgpMaWFuZwoKCgoKCgo+Cj4+IC0tLQo+PiAKPj4gIHYyOiB1c2UgcHJvcGVyIHRh
Z3MgYWR2aXNlZCBieSBHdWVudGVyIGFuZCBiYXNlZCBvbiBLZXJuZWwgRG9jCj4+IAo+PiAgZHJp
dmVycy9od21vbi9nc2MtaHdtb24uYyB8IDEgKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9od21vbi9nc2MtaHdtb24uYyBiL2Ry
aXZlcnMvaHdtb24vZ3NjLWh3bW9uLmMKPj4gaW5kZXggZDY0YmU0OGYxZWY2Li5iNjBlYzk1YjVl
ZGIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaHdtb24vZ3NjLWh3bW9uLmMKPj4gKysrIGIvZHJp
dmVycy9od21vbi9nc2MtaHdtb24uYwo+PiBAQCAtMjY3LDYgKzI2Nyw3IEBAIGdzY19od21vbl9n
ZXRfZGV2dHJlZV9wZGF0YShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+ICAJcGRhdGEtPm5jaGFubmVs
cyA9IG5jaGFubmVsczsKPj4gIAo+PiAgCS8qIGZhbiBjb250cm9sbGVyIGJhc2UgYWRkcmVzcyAq
Lwo+PiArCW9mX25vZGVfZ2V0KGRldi0+cGFyZW50LT5vZl9ub2RlKTsKPj4gIAlmYW4gPSBvZl9m
aW5kX2NvbXBhdGlibGVfbm9kZShkZXYtPnBhcmVudC0+b2Zfbm9kZSwgTlVMTCwgImd3LGdzYy1m
YW4iKTsKPj4gIAlpZiAoZmFuICYmIG9mX3Byb3BlcnR5X3JlYWRfdTMyKGZhbiwgInJlZyIsICZw
ZGF0YS0+ZmFuX2Jhc2UpKSB7Cj4+ICAJCW9mX25vZGVfcHV0KGZhbik7Cj4+IC0tIAo+PiAyLjI1
LjEKPj4gCg==
