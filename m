Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27BFC07E96
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jul 2021 01:40:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C40561CB3
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jul 2021 01:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhGGBne (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Jul 2021 21:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbhGGBne (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Jul 2021 21:43:34 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4C08C061574
        for <linux-hwmon@vger.kernel.org>; Tue,  6 Jul 2021 18:40:53 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id t30so575446ljo.5
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Jul 2021 18:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Iu1i4rdl3jiKDp54PewqP0Rgb0vc3gWyw4FESdpQ3gs=;
        b=jIRbeDuvPPr/f1Swkwh21evkm7by6W7w1eWz6/8r/uHjX2Vn7oafJMlE9khuLtRVC8
         9wri1IXTS4/2AqlPqYX/UHiLOcnbHdvI7y8tjmHVnVBjtQZwhar2HpgZzfY7Cbno0m+Q
         SKUTId+lPbhb/u9XTap+RKoh+UhG7Ajh9tdflfdEvcyHliKpXn4Ir9mJEm5H1ZoAmLCN
         1W9oP8PLA/in95aajKIPDYh6Y2KUmArbfbRNz8wz7sHMUaASr84MRt6KwZjDxxCUEEff
         CGreGqZxI61fpuvzVTWtWJWhj2qAKGwRN0dpXnxqXOLMfhQbpCosEWjBQBGWzgVmnMgE
         C80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Iu1i4rdl3jiKDp54PewqP0Rgb0vc3gWyw4FESdpQ3gs=;
        b=j8stUFQ4uT26qq7JL7Nuey4Vvl2TZpzP8KSEbKgd6hUVgw8d0YI9yvso5OY8HZ30XB
         KAdUbCDxPTXj9cdyODZyrKl411QOagE7kMB+s0HErUej9HPK8j7L3GdX0WwWFwaA7DOH
         q2eqt7+S2EwGPWbAIcnV2NAgMU5xQ6zxz9FuRKiDw+TlpWcX2dgi2i5Cfj6uymf+79bq
         IGprN6Eg6G6muc9Y/c+oNATVyH+znjpx/mBQQYv4cY4srrwXCxzUhysvUh5h8l2AkfVx
         w8AIzEUnUsQolqQDy4eCwmt2Oqf0eaR4oWBj59XdVmHBGwQh+yUXYH5iRrd1qg7jFD3t
         WOJw==
X-Gm-Message-State: AOAM531ZIfGBEPw4XKc3qH/nn+gOe3Xu56WVKmPktiA4ZUS702Y8G2vU
        UCv5rKqKHZEw5UOrzRgjg12/okBvLme8CeN9QY2uCms0MeU=
X-Google-Smtp-Source: ABdhPJyKECcQZFgLTI4qooa19aOfLhuwzVqYMnlInQzcj1OeYMaHi5MUCzWW44hNcBjLFk6jDiuMBlZ/q5aau/AQHt0=
X-Received: by 2002:a2e:6c09:: with SMTP id h9mr569441ljc.69.1625622052099;
 Tue, 06 Jul 2021 18:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAMFK4TN9jcvwkdBdX1E4zH2NzS0LbCFqGW+MUzCKXor=4UwoBw@mail.gmail.com>
 <f3106f6d-1fa0-129f-28a2-9a85b5f9c453@roeck-us.net>
In-Reply-To: <f3106f6d-1fa0-129f-28a2-9a85b5f9c453@roeck-us.net>
From:   Henk <henk.vergonet@gmail.com>
Date:   Wed, 7 Jul 2021 03:40:41 +0200
Message-ID: <CAMFK4TMzZVAKdbJRMvUHdO3m+V1pNk59PyLXSxPkPFCsgr-rPg@mail.gmail.com>
Subject: PATCH: HWMON: (nct6775) Correct number of inputs on NCT6796D
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000f473e305c67ea0e1"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

--000000000000f473e305c67ea0e1
Content-Type: text/plain; charset="UTF-8"

Thank you Guenter,

This should be fixed now, here is a reading from the sensors output
without any scaling done:

$ sensors
nct6796-isa-0290
Adapter: ISA adapter
...
in15 VIN9:   840.00 mV
...

Changes available on: https://github.com/hvegh/linux.git

Op ma 5 jul. 2021 om 16:47 schreef Guenter Roeck <linux@roeck-us.net>:
>
> As for the patch itself, it doesn't define the limit register addresses
> in NCT6775_REG_IN_MAX[] and NCT6775_REG_IN_MIN[], and it doesn't define
> the register address itself in NCT6779_REG_IN[]. That means it won't work.
>
> Guenter

--000000000000f473e305c67ea0e1
Content-Type: application/x-patch; name="nct6775.patch"
Content-Disposition: attachment; filename="nct6775.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kqssv4jn0>
X-Attachment-Id: f_kqssv4jn0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vbmN0Njc3NS5jIGIvZHJpdmVycy9od21vbi9uY3Q2
Nzc1LmMKaW5kZXggZTdlMWRkYzFkNjMxLi5hODBkZjBiYmMxOTcgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvaHdtb24vbmN0Njc3NS5jCisrKyBiL2RyaXZlcnMvaHdtb24vbmN0Njc3NS5jCkBAIC0yOCw3
ICsyOCw3IEBACiAgKiBuY3Q2NzkyZCAgICAxNSAgICAgIDYgICAgICAgNiAgICAgICAyKzYgICAg
MHhjOTEwIDB4YzEgICAgMHg1Y2EzCiAgKiBuY3Q2NzkzZCAgICAxNSAgICAgIDYgICAgICAgNiAg
ICAgICAyKzYgICAgMHhkMTIwIDB4YzEgICAgMHg1Y2EzCiAgKiBuY3Q2Nzk1ZCAgICAxNCAgICAg
IDYgICAgICAgNiAgICAgICAyKzYgICAgMHhkMzUwIDB4YzEgICAgMHg1Y2EzCi0gKiBuY3Q2Nzk2
ZCAgICAxNCAgICAgIDcgICAgICAgNyAgICAgICAyKzYgICAgMHhkNDIwIDB4YzEgICAgMHg1Y2Ez
CisgKiBuY3Q2Nzk2ZCAgICAxNiAgICAgIDcgICAgICAgNyAgICAgICAyKzYgICAgMHhkNDIwIDB4
YzEgICAgMHg1Y2EzCiAgKiBuY3Q2Nzk3ZCAgICAxNCAgICAgIDcgICAgICAgNyAgICAgICAyKzYg
ICAgMHhkNDUwIDB4YzEgICAgMHg1Y2EzCiAgKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAoMHhkNDUxKQogICogbmN0Njc5OGQgICAgMTQgICAgICA3ICAgICAgIDcg
ICAgICAgMis2ICAgIDB4ZDQyOCAweGMxICAgIDB4NWNhMwpAQCAtMTA0Nyw5ICsxMDQ3LDkgQEAg
ZGl2X2Zyb21fcmVnKHU4IHJlZykKICAqIFNvbWUgb2YgdGhlIHZvbHRhZ2UgaW5wdXRzIGhhdmUg
aW50ZXJuYWwgc2NhbGluZywgdGhlIHRhYmxlcyBiZWxvdwogICogY29udGFpbiA4ICh0aGUgQURD
IExTQiBpbiBtVikgKiBzY2FsaW5nIGZhY3RvciAqIDEwMAogICovCi1zdGF0aWMgY29uc3QgdTE2
IHNjYWxlX2luWzE1XSA9IHsKK3N0YXRpYyBjb25zdCB1MTYgc2NhbGVfaW5bMTZdID0gewogCTgw
MCwgODAwLCAxNjAwLCAxNjAwLCA4MDAsIDgwMCwgODAwLCAxNjAwLCAxNjAwLCA4MDAsIDgwMCwg
ODAwLCA4MDAsCi0JODAwLCA4MDAKKwk4MDAsIDgwMCwgODAwCiB9OwogCiBzdGF0aWMgaW5saW5l
IGxvbmcgaW5fZnJvbV9yZWcodTggcmVnLCB1OCBucikKQEAgLTExNDMsNyArMTE0Myw3IEBAIHN0
cnVjdCBuY3Q2Nzc1X2RhdGEgewogCS8qIFJlZ2lzdGVyIHZhbHVlcyAqLwogCXU4IGJhbms7CQkv
KiBjdXJyZW50IHJlZ2lzdGVyIGJhbmsgKi8KIAl1OCBpbl9udW07CQkvKiBudW1iZXIgb2YgaW4g
aW5wdXRzIHdlIGhhdmUgKi8KLQl1OCBpblsxNV1bM107CQkvKiBbMF09aW4sIFsxXT1pbl9tYXgs
IFsyXT1pbl9taW4gKi8KKwl1OCBpblsxNl1bM107CQkvKiBbMF09aW4sIFsxXT1pbl9tYXgsIFsy
XT1pbl9taW4gKi8KIAl1bnNpZ25lZCBpbnQgcnBtW05VTV9GQU5dOwogCXUxNiBmYW5fbWluW05V
TV9GQU5dOwogCXU4IGZhbl9wdWxzZXNbTlVNX0ZBTl07CkBAIC00MjAwLDcgKzQyMDAsNyBAQCBz
dGF0aWMgaW50IG5jdDY3NzVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlj
YXNlIG5jdDY3OTY6CiAJY2FzZSBuY3Q2Nzk3OgogCWNhc2UgbmN0Njc5ODoKLQkJZGF0YS0+aW5f
bnVtID0gMTU7CisJCWRhdGEtPmluX251bSA9IChkYXRhLT5raW5kID09IG5jdDY3OTYpID8gMTYg
OiAxNTsKIAkJZGF0YS0+cHdtX251bSA9IChkYXRhLT5raW5kID09IG5jdDY3OTYgfHwKIAkJCQkg
ZGF0YS0+a2luZCA9PSBuY3Q2Nzk3IHx8CiAJCQkJIGRhdGEtPmtpbmQgPT0gbmN0Njc5OCkgPyA3
IDogNjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdtb24vbmN0Njc3NS5jIGIvZHJpdmVycy9od21v
bi9uY3Q2Nzc1LmMKaW5kZXggYTgwZGYwYmJjMTk3Li4zODVlZjc5ZDc5YzQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvaHdtb24vbmN0Njc3NS5jCisrKyBiL2RyaXZlcnMvaHdtb24vbmN0Njc3NS5jCkBA
IC0yMDksMTQgKzIwOSwxNCBAQCBzdXBlcmlvX2V4aXQoaW50IGlvcmVnKQogCiAvKiBDb21tb24g
YW5kIE5DVDY3NzUgc3BlY2lmaWMgZGF0YSAqLwogCi0vKiBWb2x0YWdlIG1pbi9tYXggcmVnaXN0
ZXJzIGZvciBucj03Li4xNCBhcmUgaW4gYmFuayA1ICovCisvKiBWb2x0YWdlIG1pbi9tYXggcmVn
aXN0ZXJzIGZvciBucj03Li4xNSBhcmUgaW4gYmFuayA1ICovCiAKIHN0YXRpYyBjb25zdCB1MTYg
TkNUNjc3NV9SRUdfSU5fTUFYW10gPSB7CiAJMHgyYiwgMHgyZCwgMHgyZiwgMHgzMSwgMHgzMywg
MHgzNSwgMHgzNywgMHg1NTQsIDB4NTU2LCAweDU1OCwgMHg1NWEsCi0JMHg1NWMsIDB4NTVlLCAw
eDU2MCwgMHg1NjIgfTsKKwkweDU1YywgMHg1NWUsIDB4NTYwLCAweDU2MiwgMHg1NjQgfTsKIHN0
YXRpYyBjb25zdCB1MTYgTkNUNjc3NV9SRUdfSU5fTUlOW10gPSB7CiAJMHgyYywgMHgyZSwgMHgz
MCwgMHgzMiwgMHgzNCwgMHgzNiwgMHgzOCwgMHg1NTUsIDB4NTU3LCAweDU1OSwgMHg1NWIsCi0J
MHg1NWQsIDB4NTVmLCAweDU2MSwgMHg1NjMgfTsKKwkweDU1ZCwgMHg1NWYsIDB4NTYxLCAweDU2
MywgMHg1NjUgfTsKIHN0YXRpYyBjb25zdCB1MTYgTkNUNjc3NV9SRUdfSU5bXSA9IHsKIAkweDIw
LCAweDIxLCAweDIyLCAweDIzLCAweDI0LCAweDI1LCAweDI2LCAweDU1MCwgMHg1NTEsIDB4NTUy
CiB9OwpAQCAtNDc4LDcgKzQ3OCw3IEBAIHN0YXRpYyBjb25zdCB1MTYgTkNUNjc3Nl9SRUdfVEVN
UF9DUklUWzMyXSA9IHsKIAogc3RhdGljIGNvbnN0IHUxNiBOQ1Q2Nzc5X1JFR19JTltdID0gewog
CTB4NDgwLCAweDQ4MSwgMHg0ODIsIDB4NDgzLCAweDQ4NCwgMHg0ODUsIDB4NDg2LCAweDQ4NywK
LQkweDQ4OCwgMHg0ODksIDB4NDhhLCAweDQ4YiwgMHg0OGMsIDB4NDhkLCAweDQ4ZSB9OworCTB4
NDg4LCAweDQ4OSwgMHg0OGEsIDB4NDhiLCAweDQ4YywgMHg0OGQsIDB4NDhlLCAweDQ4ZiB9Owog
CiBzdGF0aWMgY29uc3QgdTE2IE5DVDY3NzlfUkVHX0FMQVJNW05VTV9SRUdfQUxBUk1dID0gewog
CTB4NDU5LCAweDQ1QSwgMHg0NUIsIDB4NTY4IH07Cg==
--000000000000f473e305c67ea0e1--
