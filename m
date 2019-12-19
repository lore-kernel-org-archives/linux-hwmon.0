Return-Path: <SRS0=pEIx=2J=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A72CC3F68F
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Dec 2019 03:32:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2208620684
	for <linux-hwmon@archiver.kernel.org>; Thu, 19 Dec 2019 03:32:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="P+Wg+Sxj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbfLSDcU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 18 Dec 2019 22:32:20 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:57235 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbfLSDcU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 18 Dec 2019 22:32:20 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AEA4A891A9;
        Thu, 19 Dec 2019 16:32:17 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1576726337;
        bh=L/lznGEkZvrKK9QhU4VOrmOAm9GaSsI8P16EfgiyvQk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=P+Wg+SxjomqdSgx9ts6amJMtVR5QkkM1L7/U/nUgqYWi1Mj+1tNoEMpMroeocXRRJ
         jO2WKWHROn/I/6uHBWq6XIsP8ECQDOAzm2mqjtN08UjvpzItnU2xnmYL4RzkMfi76n
         UuyNMrOecUfjypMdzsNpDCGyQTF55WTY84uyQ8yyxv5Uxa1upwazHdcf7OfugSb4kk
         Twe09iWSOCnx8cRiIARr/jJMZA7YQyMxXRgWPRMvUMnnnx+7GfUsx5d70N3M01ttZo
         k14Hco+FzPiw9htVUdjN/sucRvxNHgJefC8aIv6r57cAi3Hx0khja1uBntCWP6VAzo
         aL76TVr7ek6Fg==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5dfaef410000>; Thu, 19 Dec 2019 16:32:17 +1300
Received: from logans-dl.ws.atlnz.lc (logans-dl.ws.atlnz.lc [10.33.25.49])
        by smtp (Postfix) with ESMTP id 30FA513EEAF;
        Thu, 19 Dec 2019 16:32:16 +1300 (NZDT)
Received: by logans-dl.ws.atlnz.lc (Postfix, from userid 1820)
        id 7D147C03C3; Thu, 19 Dec 2019 16:32:17 +1300 (NZDT)
From:   Logan Shaw <logan.shaw@alliedtelesis.co.nz>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     logan.shaw@alliedtelesis.co.nz, joshua.scott@alliedtelesis.co.nz,
        linux-hwmon@vger.kernel.org
Subject: [PATCH v2 1/2] hwmon: (adt7475) Added attenuator bypass support
Date:   Thu, 19 Dec 2019 16:32:12 +1300
Message-Id: <20191219033213.30364-2-logan.shaw@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191219033213.30364-1-logan.shaw@alliedtelesis.co.nz>
References: <20191219033213.30364-1-logan.shaw@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Added support for reading DTS properties to set attenuators on
device probe. Only bypasses attenuators on the ADT7476 and ADT7490
(other chips do not support this).

Signed-off-by: Logan Shaw <logan.shaw@alliedtelesis.co.nz>
---
---
 drivers/hwmon/adt7475.c | 73 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 6c64d50c9aae..1e6ca1bc28ce 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -19,6 +19,7 @@
 #include <linux/hwmon-vid.h>
 #include <linux/err.h>
 #include <linux/jiffies.h>
+#include <linux/of.h>
 #include <linux/util_macros.h>
=20
 /* Indexes for the sysfs hooks */
@@ -1457,6 +1458,68 @@ static int adt7475_update_limits(struct i2c_client=
 *client)
 	return 0;
 }
=20
+/**
+ * Reads individual voltage input bypass attenuator properties from the =
DTS,
+ * and if the property is present the corresponding bit is set in the
+ * register. Only the ADT7476 and ADT7490 support bypassing individual
+ * attenuators.
+ *
+ * Properties must be in the form of "bypass-attenuator-inx", where x is=
 an
+ * integer from the set {0, 1, 3, 4} (can not bypass in2 attenuator).
+ *
+ * Returns a negative error code if there was an error writing to the re=
gister.
+ */
+static int load_individual_bypass_attenuators(const struct i2c_client *c=
lient,
+					      u8 *config4)
+{
+	u8 config4_copy =3D *config4;
+
+	if (of_get_property(client->dev.of_node, "bypass-attenuator-in0", NULL)=
)
+		config4_copy |=3D (1 << 4);
+
+	if (of_get_property(client->dev.of_node, "bypass-attenuator-in1", NULL)=
)
+		config4_copy |=3D (1 << 5);
+
+	if (of_get_property(client->dev.of_node, "bypass-attenuator-in3", NULL)=
)
+		config4_copy |=3D (1 << 6);
+
+	if (of_get_property(client->dev.of_node, "bypass-attenuator-in4", NULL)=
)
+		config4_copy |=3D (1 << 7);
+
+	if (i2c_smbus_write_byte_data(client, REG_CONFIG4, config4_copy) < 0)
+		return -EREMOTEIO;
+
+	*config4 =3D config4_copy;
+
+	return 0;
+}
+
+/**
+ * Sets the bypass all attenuators bit, if the "bypass-attenuator-all"
+ * property exists in the DTS.
+ *
+ * Returns a negative error code if there was an error writing to the
+ * register.
+ */
+static int load_all_bypass_attenuator(const struct i2c_client *client,
+				      u8 *config2)
+{
+	u8 config2_copy =3D *config2;
+
+	if (!of_get_property(client->dev.of_node,
+			     "bypass-attenuator-all", NULL))
+		return 0;
+
+	config2_copy |=3D (1 << 5);
+
+	if (i2c_smbus_write_byte_data(client, REG_CONFIG2, config2_copy) < 0)
+		return -EREMOTEIO;
+
+	*config2 =3D config2_copy;
+
+	return 0;
+}
+
 static int adt7475_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -1545,7 +1608,17 @@ static int adt7475_probe(struct i2c_client *client=
,
 	}
=20
 	/* Voltage attenuators can be bypassed, globally or individually */
+	if (chip =3D=3D adt7476 || chip =3D=3D adt7490)
+		if (load_individual_bypass_attenuators(client,
+							&(data->config4)) < 0)
+			dev_warn(&client->dev,
+				 "Error setting bypass attenuator bits\n");
+
 	config2 =3D adt7475_read(REG_CONFIG2);
+	if (chip =3D=3D adt7476 || chip =3D=3D adt7490)
+		if (load_all_bypass_attenuator(client, &config2) < 0)
+			dev_warn(&client->dev, "Error setting bypass all attenuator\n");
+
 	if (config2 & CONFIG2_ATTN) {
 		data->bypass_attn =3D (0x3 << 3) | 0x3;
 	} else {
--=20
2.23.0

