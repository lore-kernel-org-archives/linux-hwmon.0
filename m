Return-Path: <SRS0=A7RS=DB=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E6DC4346E
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Sep 2020 08:51:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CE9523772
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Sep 2020 08:51:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="BFaoINlJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbgIXIvT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Sep 2020 04:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbgIXIvS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Sep 2020 04:51:18 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B36C8C0613CE
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2020 01:51:18 -0700 (PDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2023D80719;
        Thu, 24 Sep 2020 20:51:15 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1600937475;
        bh=/ap3Q/9+vlrjg7JibnYC9gTRzC6imvDbQvlR0bdI54M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=BFaoINlJzvVJsm18fL5lbWJVFsOEUbYGtai1kQojooH7PjdnR2SA49SYGQ8YpXRBz
         y0oQtkI+aJ9rVvA4xHuZ+Rpq5PxZ3Q8tnXOxV9yhQank8ZZbZ3A9PJqTw1X9DDrlec
         Xcz09ypOrm+X6bsdkyg7aosiqGNX/bmJSfHfW7OBNnCWrDDqXGwJWQvv2vi8q1S8g0
         6lwFzNwW2KF9Z93XRiykFRQGA9crra9FC800cH4mktDeBr2UgqHVeVe/unHB4AJjHC
         PrqhC2HlUF0wz97G0VWQlQLdAqk+7OYtG2iM5snRrBdJTM3h+W9QyejS6nNVfdRVV/
         kTuEV+dzxRMZw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f6c5e030000>; Thu, 24 Sep 2020 20:51:15 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 1D88A13EEBA;
        Thu, 24 Sep 2020 20:51:14 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id E466D28005C; Thu, 24 Sep 2020 20:51:14 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/3] hwmon: (adm9240) Use loops to avoid duplicated code
Date:   Thu, 24 Sep 2020 20:51:00 +1200
Message-Id: <20200924085102.15219-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200924085102.15219-1-chris.packham@alliedtelesis.co.nz>
References: <20200924085102.15219-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use loops for reading temp_max and initialising FAN_MIN/TEMP_MAX rather
than duplicating code.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/hwmon/adm9240.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
index 496d47490e10..f95dde1b9c7f 100644
--- a/drivers/hwmon/adm9240.c
+++ b/drivers/hwmon/adm9240.c
@@ -223,10 +223,10 @@ static struct adm9240_data *adm9240_update_device(s=
truct device *dev)
 			data->fan_min[i] =3D i2c_smbus_read_byte_data(client,
 					ADM9240_REG_FAN_MIN(i));
 		}
-		data->temp_max[0] =3D i2c_smbus_read_byte_data(client,
-				ADM9240_REG_TEMP_MAX(0));
-		data->temp_max[1] =3D i2c_smbus_read_byte_data(client,
-				ADM9240_REG_TEMP_MAX(1));
+		for (i =3D 0; i < 2; i++) {
+			data->temp_max[i] =3D i2c_smbus_read_byte_data(client,
+					ADM9240_REG_TEMP_MAX(i));
+		}
=20
 		/* read fan divs and 5-bit VID */
 		i =3D i2c_smbus_read_byte_data(client, ADM9240_REG_VID_FAN_DIV);
@@ -687,14 +687,14 @@ static void adm9240_init_client(struct i2c_client *=
client)
 			i2c_smbus_write_byte_data(client,
 					ADM9240_REG_IN_MAX(i), 255);
 		}
-		i2c_smbus_write_byte_data(client,
-				ADM9240_REG_FAN_MIN(0), 255);
-		i2c_smbus_write_byte_data(client,
-				ADM9240_REG_FAN_MIN(1), 255);
-		i2c_smbus_write_byte_data(client,
-				ADM9240_REG_TEMP_MAX(0), 127);
-		i2c_smbus_write_byte_data(client,
-				ADM9240_REG_TEMP_MAX(1), 127);
+		for (i =3D 0; i < 2; i++) {
+			i2c_smbus_write_byte_data(client,
+					ADM9240_REG_FAN_MIN(i), 255);
+		}
+		for (i =3D 0; i < 2; i++) {
+			i2c_smbus_write_byte_data(client,
+					ADM9240_REG_TEMP_MAX(i), 127);
+		}
=20
 		/* start measurement cycle */
 		i2c_smbus_write_byte_data(client, ADM9240_REG_CONFIG, 1);
--=20
2.28.0

