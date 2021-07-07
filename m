Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E289C07E96
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jul 2021 02:43:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5291D61CAC
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Jul 2021 02:43:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbhGGCpr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Jul 2021 22:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbhGGCpr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Jul 2021 22:45:47 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FFE8C061574
        for <linux-hwmon@vger.kernel.org>; Tue,  6 Jul 2021 19:43:06 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id p1so1313128lfr.12
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Jul 2021 19:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6WVVeAMkBl+ujmcq6aKVz25FkMCeIFXrjyq7yaBL+6w=;
        b=q3eyDb030O1QMjeSRP0Uzq38jnC7qCqQDBG1W0n+CEkvVFQjCBh34lSaDPGvzZsF9p
         DQRb/fm6yosfclZXCCloQZae/AXshvOe7XYs+/stKVYhJuct7AZ8msSizSfGfyC6+8E6
         DH9bBvKafHBI5LisljsayTBzCjufsZsFQ79kbDqEhRb08d6xf7/2V1u4WRiGHkUqYg2W
         gHvzDeLnDK/MzIxQKnappjreG57C1UYl69Ot7xtARbRiahKzY54rL0aIv8MXGyLgAOX4
         194p026ZskGNWXGGBeSu2qhgcISPrG7qOvyq6JMdxjSHnG96XVuElvMOrpd+3LmTFzJB
         CUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6WVVeAMkBl+ujmcq6aKVz25FkMCeIFXrjyq7yaBL+6w=;
        b=A3rmbxxeUarXOXNGxtHpu4kXsGSb7lhLWuCW2oKC2mfj03lRBtWEQ1Q6dE4kLzJGF4
         brsl6rY3UTuFZ9c7mVfIjmrtbSZ4mrk8q275ejQ8R9czo7UhdxJoW/j4vF+E8nn9o+Th
         2Bq2txleiHfmFq8fV6CNllIXGHR9x8D8aOosf9x2vhM9cEoRCpT3zj+3FmgbLDn9odGc
         GIY5yMyLxi2JEqLCIZ4QOITr2XcC04N4JbSQfow8mK1saxyyuMXnoDsXqnxIS9YSSktd
         flM6TZo8xEkVDvYJoyHA1F8lt3/thOi0wg9qca73jEQgtSOKGq7Iw4Xd7AQ24QaouP/e
         e3Fg==
X-Gm-Message-State: AOAM532+uV3/mkttkZQUqMae1717rsCz3886xM8Pz4nT+h96T8cRKJEl
        MofvV4AzPwos2ZSkCA7HdZuAa8/iAYs2GwpgZ1NMIgMnuYE=
X-Google-Smtp-Source: ABdhPJw5+YLyvAYcT47Hy4J+FrUvqtm3i6o7MmI14lwaD7U7OkYUkkOjGRV80M/pW0z90ShNUVn6Ya29LKxltG9RYhc=
X-Received: by 2002:ac2:5183:: with SMTP id u3mr4550373lfi.454.1625625784770;
 Tue, 06 Jul 2021 19:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAMFK4TN9jcvwkdBdX1E4zH2NzS0LbCFqGW+MUzCKXor=4UwoBw@mail.gmail.com>
 <f3106f6d-1fa0-129f-28a2-9a85b5f9c453@roeck-us.net> <CAMFK4TMzZVAKdbJRMvUHdO3m+V1pNk59PyLXSxPkPFCsgr-rPg@mail.gmail.com>
 <e46d1215-121a-7480-cfa7-38d3f4bc0444@roeck-us.net>
In-Reply-To: <e46d1215-121a-7480-cfa7-38d3f4bc0444@roeck-us.net>
From:   Henk <henk.vergonet@gmail.com>
Date:   Wed, 7 Jul 2021 04:42:53 +0200
Message-ID: <CAMFK4TMb+aUVKtcWZkCcpjbeEOP7f=Nh2bOW9nAYZOymUvTA-w@mail.gmail.com>
Subject: [PATCH v3]: hwmon: nct6775: Fix some issues with NCT6796D
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000707a7d05c67f7f3b"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

--000000000000707a7d05c67f7f3b
Content-Type: text/plain; charset="UTF-8"

Is it the attchment format?

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index e7e1ddc1d631..385ef79d79c4 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -28,7 +28,7 @@
  * nct6792d    15      6       6       2+6    0xc910 0xc1    0x5ca3
  * nct6793d    15      6       6       2+6    0xd120 0xc1    0x5ca3
  * nct6795d    14      6       6       2+6    0xd350 0xc1    0x5ca3
- * nct6796d    14      7       7       2+6    0xd420 0xc1    0x5ca3
+ * nct6796d    16      7       7       2+6    0xd420 0xc1    0x5ca3
  * nct6797d    14      7       7       2+6    0xd450 0xc1    0x5ca3
  *                                           (0xd451)
  * nct6798d    14      7       7       2+6    0xd428 0xc1    0x5ca3
@@ -209,14 +209,14 @@ superio_exit(int ioreg)

 /* Common and NCT6775 specific data */

-/* Voltage min/max registers for nr=7..14 are in bank 5 */
+/* Voltage min/max registers for nr=7..15 are in bank 5 */

 static const u16 NCT6775_REG_IN_MAX[] = {
     0x2b, 0x2d, 0x2f, 0x31, 0x33, 0x35, 0x37, 0x554, 0x556, 0x558, 0x55a,
-    0x55c, 0x55e, 0x560, 0x562 };
+    0x55c, 0x55e, 0x560, 0x562, 0x564 };
 static const u16 NCT6775_REG_IN_MIN[] = {
     0x2c, 0x2e, 0x30, 0x32, 0x34, 0x36, 0x38, 0x555, 0x557, 0x559, 0x55b,
-    0x55d, 0x55f, 0x561, 0x563 };
+    0x55d, 0x55f, 0x561, 0x563, 0x565 };
 static const u16 NCT6775_REG_IN[] = {
     0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x550, 0x551, 0x552
 };
@@ -478,7 +478,7 @@ static const u16 NCT6776_REG_TEMP_CRIT[32] = {

 static const u16 NCT6779_REG_IN[] = {
     0x480, 0x481, 0x482, 0x483, 0x484, 0x485, 0x486, 0x487,
-    0x488, 0x489, 0x48a, 0x48b, 0x48c, 0x48d, 0x48e };
+    0x488, 0x489, 0x48a, 0x48b, 0x48c, 0x48d, 0x48e, 0x48f };

 static const u16 NCT6779_REG_ALARM[NUM_REG_ALARM] = {
     0x459, 0x45A, 0x45B, 0x568 };
@@ -1047,9 +1047,9 @@ div_from_reg(u8 reg)
  * Some of the voltage inputs have internal scaling, the tables below
  * contain 8 (the ADC LSB in mV) * scaling factor * 100
  */
-static const u16 scale_in[15] = {
+static const u16 scale_in[16] = {
     800, 800, 1600, 1600, 800, 800, 800, 1600, 1600, 800, 800, 800, 800,
-    800, 800
+    800, 800, 800
 };

 static inline long in_from_reg(u8 reg, u8 nr)
@@ -1143,7 +1143,7 @@ struct nct6775_data {
     /* Register values */
     u8 bank;        /* current register bank */
     u8 in_num;        /* number of in inputs we have */
-    u8 in[15][3];        /* [0]=in, [1]=in_max, [2]=in_min */
+    u8 in[16][3];        /* [0]=in, [1]=in_max, [2]=in_min */
     unsigned int rpm[NUM_FAN];
     u16 fan_min[NUM_FAN];
     u8 fan_pulses[NUM_FAN];
@@ -4200,7 +4200,7 @@ static int nct6775_probe(struct platform_device *pdev)
     case nct6796:
     case nct6797:
     case nct6798:
-        data->in_num = 15;
+        data->in_num = (data->kind == nct6796) ? 16 : 15;
         data->pwm_num = (data->kind == nct6796 ||
                  data->kind == nct6797 ||
                  data->kind == nct6798) ? 7 : 6;


Op wo 7 jul. 2021 om 03:51 schreef Guenter Roeck <linux@roeck-us.net>:
>
> On 7/6/21 6:40 PM, Henk wrote:
> > Thank you Guenter,
> >
> > This should be fixed now, here is a reading from the sensors output
> > without any scaling done:
> >
> > $ sensors
> > nct6796-isa-0290
> > Adapter: ISA adapter
> > ...
> > in15 VIN9:   840.00 mV
> > ...
> >
> > Changes available on: https://github.com/hvegh/linux.git
> >
> > Op ma 5 jul. 2021 om 16:47 schreef Guenter Roeck <linux@roeck-us.net>:
> >>
> >> As for the patch itself, it doesn't define the limit register addresses
> >> in NCT6775_REG_IN_MAX[] and NCT6775_REG_IN_MIN[], and it doesn't define
> >> the register address itself in NCT6779_REG_IN[]. That means it won't work.
> >>
> >> Guenter
>
> This is not an acceptable patch format.
>
> Guenter

--000000000000707a7d05c67f7f3b
Content-Type: text/x-patch; charset="US-ASCII"; name="nct6775.patch"
Content-Disposition: attachment; filename="nct6775.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kqsv08q20>
X-Attachment-Id: f_kqsv08q20

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
--000000000000707a7d05c67f7f3b--
