Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682BDC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 May 2022 08:09:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237841AbiEJINY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 May 2022 04:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237873AbiEJINV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 May 2022 04:13:21 -0400
Received: from inet10.abb.com (spf.hitachienergy.com [138.225.1.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88B625A7A7
        for <linux-hwmon@vger.kernel.org>; Tue, 10 May 2022 01:09:24 -0700 (PDT)
Received: from gitsiv.ch.abb.com (gitsiv.keymile.net [10.41.156.251])
        by inet10.abb.com (8.14.7/8.14.7) with SMTP id 24A892BX031566;
        Tue, 10 May 2022 10:09:02 +0200
Received: from ch10641.keymile.net.net (ch10641.keymile.net [172.31.40.7])
        by gitsiv.ch.abb.com (Postfix) with ESMTP id 5B39565F90CF;
        Tue, 10 May 2022 10:09:02 +0200 (CEST)
From:   Holger Brunck <holger.brunck@hitachienergy.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Holger Brunck <holger.brunck@hitachienergy.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [v2 2/2] driver/hwmon/lm90: enable extended range according to DTS node
Date:   Tue, 10 May 2022 10:09:00 +0200
Message-Id: <20220510080900.22758-2-holger.brunck@hitachienergy.com>
X-Mailer: git-send-email 2.35.1.871.gab1f276
In-Reply-To: <20220510080900.22758-1-holger.brunck@hitachienergy.com>
References: <20220510080900.22758-1-holger.brunck@hitachienergy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Some lm90 devices can operate in a extended temperature mode, this featur=
e
is now eanbled if the property is set in the corresponding device tree
node.

Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
cc: Jean Delvare <jdelvare@suse.com>
cc: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/lm90.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 1c9493c70813..6cdbcfab9f20 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -1707,6 +1707,7 @@ static void lm90_restore_conf(void *_data)
=20
 static int lm90_init_client(struct i2c_client *client, struct lm90_data =
*data)
 {
+	struct device_node *np =3D client->dev.of_node;
 	int config, convrate;
=20
 	convrate =3D lm90_read_reg(client, LM90_REG_R_CONVRATE);
@@ -1727,7 +1728,8 @@ static int lm90_init_client(struct i2c_client *clie=
nt, struct lm90_data *data)
=20
 	/* Check Temperature Range Select */
 	if (data->flags & LM90_HAVE_EXTENDED_TEMP) {
-		if (config & 0x04)
+		if (config & 0x04 ||
+		    of_property_read_bool(np, "onsemi,extended-range-enable"))
 			data->flags |=3D LM90_FLAG_ADT7461_EXT;
 	}
=20
--=20
2.35.1.871.gab1f276

