Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B480DC4338F
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Aug 2021 01:40:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F83E6101E
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Aug 2021 01:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233385AbhHLBk3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Aug 2021 21:40:29 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:54318 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233345AbhHLBk2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Aug 2021 21:40:28 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4575C891B1;
        Thu, 12 Aug 2021 13:40:02 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1628732402;
        bh=0PIc7W/Q6OADnmNoNCW9y/GZ6e9+krN+3DhPpTgQlxU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=HreqBuW4yxsNEokuFoAojwPmIoLcUf1MgawPtnhNHm4RTdMqPm4fasagntQxtkPM5
         hoKjobdSCTjVBIkv+lOI0CVgiW811rGlwga+jXuOy645eaaqeC2GJgPZM9m22IgUTz
         YXu7aq8pXY1N3m4pfd06IdhwLfPXsN4waWXX4L5A7b1UzpZ2t8/VsZwdg6Basj7S7n
         uDg7IhhGisxOmmjiJ56GHYipdi+A+7tLjfH60Oo0KLyv2LQusAV3ExwaCWwVHJedlF
         zs9kZaTmbc2rep6PAicLt8us56mMBhvNbYQK4KREk+ktkCMVggGjzP63A7CsO0JE6C
         jAsKCmegfn9yw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B61147bf20000>; Thu, 12 Aug 2021 13:40:02 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id 14FBC13EE8E;
        Thu, 12 Aug 2021 13:40:02 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 1B22B280E9D; Thu, 12 Aug 2021 13:40:02 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     linux@roeck-us.net, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 2/2] hwmon: (pmbus/bpa-rs600) Add workaround for incorrect Pin max
Date:   Thu, 12 Aug 2021 13:40:00 +1200
Message-Id: <20210812014000.26293-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210812014000.26293-1-chris.packham@alliedtelesis.co.nz>
References: <20210812014000.26293-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=aqTM9hRV c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=MhDmnRu9jo8A:10 a=P-41vWzb2nyXeCwVk6YA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

BPD-RS600 modules running firmware v5.70 misreport the MFR_PIN_MAX.
The indicate a maximum of 1640W instead of 700W. Detect the invalid
reading and return a sensible value instead.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - Add comments for magic values

 drivers/hwmon/pmbus/bpa-rs600.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/hwmon/pmbus/bpa-rs600.c b/drivers/hwmon/pmbus/bpa-rs=
600.c
index 84dee86399cb..f2d4e378a775 100644
--- a/drivers/hwmon/pmbus/bpa-rs600.c
+++ b/drivers/hwmon/pmbus/bpa-rs600.c
@@ -65,6 +65,26 @@ static int bpa_rs600_read_vin(struct i2c_client *clien=
t)
 	return ret;
 }
=20
+/*
+ * Firmware V5.70 incorrectly reports 1640W for MFR_PIN_MAX.
+ * Deal with this by returning a sensible value.
+ */
+static int bpa_rs600_read_pin_max(struct i2c_client *client)
+{
+	int ret;
+
+	ret =3D pmbus_read_word_data(client, 0, 0xff, PMBUS_MFR_PIN_MAX);
+	if (ret < 0)
+		return ret;
+
+	/* Detect invalid 1640W (linear encoding) */
+	if (ret =3D=3D 0x0b34)
+		/* Report 700W (linear encoding) */
+		return 0x095e;
+
+	return ret;
+}
+
 static int bpa_rs600_read_word_data(struct i2c_client *client, int page,=
 int phase, int reg)
 {
 	int ret;
@@ -91,6 +111,9 @@ static int bpa_rs600_read_word_data(struct i2c_client =
*client, int page, int pha
 	case PMBUS_READ_VIN:
 		ret =3D bpa_rs600_read_vin(client);
 		break;
+	case PMBUS_MFR_PIN_MAX:
+		ret =3D bpa_rs600_read_pin_max(client);
+		break;
 	default:
 		if (reg >=3D PMBUS_VIRT_BASE)
 			ret =3D -ENXIO;
--=20
2.32.0

