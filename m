Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4992BC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 07:58:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232421AbiEQH6D (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 03:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238272AbiEQH6C (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 03:58:02 -0400
Received: from inet10.abb.com (inet10.abb.com [138.225.1.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4ABD48E53
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 00:58:00 -0700 (PDT)
Received: from gitsiv.ch.abb.com (gitsiv.keymile.net [10.41.156.251])
        by inet10.abb.com (8.14.7/8.14.7) with SMTP id 24H7veIR011307;
        Tue, 17 May 2022 09:57:40 +0200
Received: from ch10641.keymile.net.net (ch10641.keymile.net [172.31.40.7])
        by gitsiv.ch.abb.com (Postfix) with ESMTP id E082765FAB27;
        Tue, 17 May 2022 09:57:39 +0200 (CEST)
From:   Holger Brunck <holger.brunck@hitachienergy.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Holger Brunck <holger.brunck@hitachienergy.com>
Subject: [v3 3/3] hwmon: (lm90) enable extended range according to DTS node
Date:   Tue, 17 May 2022 09:57:38 +0200
Message-Id: <20220517075738.16885-1-holger.brunck@hitachienergy.com>
X-Mailer: git-send-email 2.35.1.871.gab1f276
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Some lm90 compatible devices can operate in a extended temperature mode.
This feature is now enabled if the property is set in the corresponding
device tree node.

Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
---
changes for v3:
  - set config bit is property is set in DTS
  - rephrase commit msg
  - rename property

 drivers/hwmon/lm90.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 1c9493c70813..3820f0e61510 100644
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
@@ -1727,6 +1728,9 @@ static int lm90_init_client(struct i2c_client *clie=
nt, struct lm90_data *data)
=20
 	/* Check Temperature Range Select */
 	if (data->flags & LM90_HAVE_EXTENDED_TEMP) {
+		if (of_property_read_bool(np, "ti,extended-range-enable"))
+			config |=3D 0x04;
+
 		if (config & 0x04)
 			data->flags |=3D LM90_FLAG_ADT7461_EXT;
 	}
--=20
2.35.1.871.gab1f276

