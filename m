Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDEEC48BE6
	for <linux-hwmon@archiver.kernel.org>; Wed, 16 Jun 2021 03:42:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE39E610A2
	for <linux-hwmon@archiver.kernel.org>; Wed, 16 Jun 2021 03:42:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbhFPDoc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 15 Jun 2021 23:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbhFPDoc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 15 Jun 2021 23:44:32 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8DEDC061574
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Jun 2021 20:42:26 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A1D84806B6;
        Wed, 16 Jun 2021 15:42:22 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1623814942;
        bh=s0CAWFQ32kQS3+aR+ihGgXkiL8fYOybhJO3wDi6wk5o=;
        h=From:To:Cc:Subject:Date;
        b=AzcSIq6ZIjfmSeZDh9l9iEZuyK7qs5KSHuZPDIUrYiOlSNqiDu4B7I8g+Z4eTEHxk
         +vlf3QWR2bVghQrAyYxsUhMFC0GmQxnYnE7Si1eVPLckiZkEtr6xcfX2DM8yRTtWKW
         Qc8VYj2XXGcfEOHltr260Lcm7rfvbbox3yxFXIav4U7KEdltPP4mgBiOM6qEUCtwSv
         BmGM77fm35Xbf3dBJ8zwg9iMs4pY/mQKFhIORCkR9vWvKBRQgIP0gchUFa3fKPd42U
         puoPnJREQFIz6u8lixRJaHVYWrovtu6Yi3JRHdjWOhlVR+fQZ7FojTeiSVZEgAvKwJ
         7Cpe1kIgsUi6g==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60c9731e0000>; Wed, 16 Jun 2021 15:42:22 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id 7BB2413EE59;
        Wed, 16 Jun 2021 15:42:22 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 79498283992; Wed, 16 Jun 2021 15:42:22 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] hwmon: (pmbus/bpa-rs600): Handle Vin readings >= 256V
Date:   Wed, 16 Jun 2021 15:42:18 +1200
Message-Id: <20210616034218.25821-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=IOh89TnG c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=r6YtysWOX24A:10 a=KPmePab-Z0ZYxpDPYCYA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The BPA-RS600 doesn't follow the PMBus spec for linear data.
Specifically it treats the mantissa as an unsigned 11-bit value instead
of a two's complement 11-bit value. At this point it's unclear whether
this only affects Vin or if Pin/Pout1 are affected as well. Erring on
the side of caution only Vin is dealt with here.

Fixes: 15b2703e5e02 ("hwmon: (pmbus) Add driver for BluTek BPA-RS600")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/hwmon/pmbus/bpa-rs600.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/hwmon/pmbus/bpa-rs600.c b/drivers/hwmon/pmbus/bpa-rs=
600.c
index f6558ee9dec3..2be69fedfa36 100644
--- a/drivers/hwmon/pmbus/bpa-rs600.c
+++ b/drivers/hwmon/pmbus/bpa-rs600.c
@@ -46,6 +46,32 @@ static int bpa_rs600_read_byte_data(struct i2c_client =
*client, int page, int reg
 	return ret;
 }
=20
+/*
+ * The BPA-RS600 violates the PMBus spec. Specifically it treats the
+ * mantissa as unsigned. Deal with this here to allow the PMBus core
+ * to work with correctly encoded data.
+ */
+static int bpa_rs600_read_vin(struct i2c_client *client)
+{
+	int ret, exponent, mantissa;
+
+	ret =3D pmbus_read_word_data(client, 0, 0xff, PMBUS_READ_VIN);
+	if (ret < 0)
+		return ret;
+
+	if (ret & BIT(10)) {
+		exponent =3D ret >> 11;
+		mantissa =3D ret & 0x7ff;
+
+		exponent++;
+		mantissa >>=3D 1;
+
+		ret =3D (exponent << 11) | mantissa;
+	}
+
+	return ret;
+}
+
 static int bpa_rs600_read_word_data(struct i2c_client *client, int page,=
 int phase, int reg)
 {
 	int ret;
@@ -85,6 +111,9 @@ static int bpa_rs600_read_word_data(struct i2c_client =
*client, int page, int pha
 		/* These commands return data but it is invalid/un-documented */
 		ret =3D -ENXIO;
 		break;
+	case PMBUS_READ_VIN:
+		ret =3D bpa_rs600_read_vin(client);
+		break;
 	default:
 		if (reg >=3D PMBUS_VIRT_BASE)
 			ret =3D -ENXIO;
--=20
2.31.1

