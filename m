Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C78C07E99
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Jul 2021 13:29:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D7F161447
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Jul 2021 13:29:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbhGENbu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Jul 2021 09:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhGENbu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Jul 2021 09:31:50 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 421DCC061574
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Jul 2021 06:29:13 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id n14so32520106lfu.8
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Jul 2021 06:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=dR9LiIgfnzZ0+KmNfL65EzO8kKw35EKF5+zzRX3jLYM=;
        b=FNMu2pILHYYPJEZPpZBzi9SjtLcI33/9B1Y6+KcF0wrMuCtpf6EBrn17/e8csjTu+i
         0ySWV6lBtBtuwmU3s7jIHYUjTmiDC7BdfZdJpOgoPelU6dc1tB0ZTkHRARLC6JH27VK7
         mb/F1j9krbJ1pjb6td0rk2l9EEopBlPCZ6VB8Ki18tiwkEVWl/VuUf/7jsk6mmopKINf
         FHJ202LUBaBaiDqKGbbIJ3X9gMQwL10QUBHMrtpAPK241ZkAUg9XLOfgcqJwWRDxzyOa
         OWMz2J1rnf7IejJXvmjC6bXnqB49JYMfZA/YRNbUXVYYWK8iHABierA3yD8JkNZFtyZb
         JUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=dR9LiIgfnzZ0+KmNfL65EzO8kKw35EKF5+zzRX3jLYM=;
        b=oRqEDYodXKW1YdVhmcPnNhm+Tz2VyPUjhfkztfKaWoViHKwFeBAitwZXG9pfkUm3OG
         zc7EfcUIOGYT36QLfVLSupv6Nw8Dzw2/WHJZIrCZGsQ2dKleezbqGIub5ne76NF77LMX
         pvTUCOXXGfdXazOS1G3CDaKILVBeOoCMghZmlS5BJOZdAC7Bq8MDfSSRkQCIfgaPC3nA
         WhCCh3HlcftYNRC9da41jNluy8hlxyBtLAf7p9KusD0UohgRxwn2+wR6VEe6vsc76rWq
         jXWfOIYjMhxmeZ+34hk3RTmu30mU2jr6OC9aJY7US6/ACTt9YPC3DpjpLxGhfzX211PP
         B/vg==
X-Gm-Message-State: AOAM5333Nwj+jCqokG5TJXJ+SE1YvKNUyUgcWYNKSUoPo/JDgqiitqHF
        42QEbocjpc5rdkNLVQCCuQ2JjHuxkeqC5myLdHHvMEhUMmY=
X-Google-Smtp-Source: ABdhPJx3Fu8MG8uVkWia2IULGs5LmV5b/m785PTGQ/5ZPzJh5RO6qWEGn+Cte7MYq/6jAN8b+aqd029mikw3yjNgTUk=
X-Received: by 2002:a05:6512:695:: with SMTP id t21mr10580976lfe.140.1625491751613;
 Mon, 05 Jul 2021 06:29:11 -0700 (PDT)
MIME-Version: 1.0
From:   Henk <henk.vergonet@gmail.com>
Date:   Mon, 5 Jul 2021 15:29:00 +0200
Message-ID: <CAMFK4TN_xh8_vfRu5vsPRfdsekcYgLXABPX5+jTBz5HTWSgimA@mail.gmail.com>
Subject: HWMON: (nct6775) Correct number of inputs on NCT6796D
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>
Content-Type: multipart/mixed; boundary="00000000000070cd5a05c6604a69"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

--00000000000070cd5a05c6604a69
Content-Type: text/plain; charset="UTF-8"

Noticed in the documentation that the NCT6796D actually has 16 analog
voltage inputs, where only 15 are configured.

See: https://www.nuvoton.com/resource-files/NCT6796D_Datasheet_V0_6.pdf
page 59-60:

8.6.2.1. Voltage Reading
NCT6796D has 16 voltage reading:
.....
and the missing one in the driver:
VIN9: Voltage reading Bank 4, Index 8F

This patch adds support for in15 on the NCT6796D.

Signed-off-by: Henk Vergonet <henk.vergonet@gmail.com>

--00000000000070cd5a05c6604a69
Content-Type: text/x-patch; charset="US-ASCII"; name="nct6775.patch"
Content-Disposition: attachment; filename="nct6775.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kqqnt7t10>
X-Attachment-Id: f_kqqnt7t10

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
IDogNjsK
--00000000000070cd5a05c6604a69--
