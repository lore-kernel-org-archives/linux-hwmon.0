Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9744BC433DB
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Mar 2021 15:40:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7009464F1E
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Mar 2021 15:40:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235102AbhCDPjc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Mar 2021 10:39:32 -0500
Received: from mx3.molgen.mpg.de ([141.14.17.11]:40053 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235261AbhCDPjV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 4 Mar 2021 10:39:21 -0500
Received: from localhost.localdomain (ip5f5aed34.dynamic.kabel-deutschland.de [95.90.237.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id D2AFF20645D71;
        Thu,  4 Mar 2021 16:38:38 +0100 (CET)
From:   Paul Menzel <pmenzel@molgen.mpg.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Guohan Lu <lguohan@gmail.com>,
        Boyang Yu <byu@arista.com>, Paul Menzel <pmenzel@molgen.mpg.de>
Subject: [PATCH] hwmon: (lm90) Fix false alarm when writing convrate on max6658
Date:   Thu,  4 Mar 2021 16:38:32 +0100
Message-Id: <20210304153832.19275-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Boyang Yu <byu@arista.com>

We found that the max6658 sometimes issues a false alarm when its
convrate is changed, with the current hwmon driver. This workaround
will fix it by stopping the conversion before setting the convrate.

Upstream the patch added added to the SONiC Linux kernel in merge/pull
request #82 [1][2].

[1]: https://github.com/Azure/sonic-linux-kernel/pull/82
[2]: https://github.com/Azure/sonic-linux-kernel/commit/d03f6167f64b2bfa1330ff7b33fe217f68ab7028

[pmenzel: Forward port patch from 4.19 to 5.12-rc1+]
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/hwmon/lm90.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index ebbfd5f352c0..0c1a91b715e8 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -639,7 +639,11 @@ static int lm90_set_convrate(struct i2c_client *client, struct lm90_data *data,
 		if (interval >= update_interval * 3 / 4)
 			break;
 
-	err = lm90_write_convrate(data, i);
+	if (data->kind == max6657)
+		err = max6657_write_convrate(client, i);
+	else
+		err = lm90_write_convrate(data, i);
+
 	data->update_interval = DIV_ROUND_CLOSEST(update_interval, 64);
 	return err;
 }
@@ -1649,7 +1653,11 @@ static void lm90_restore_conf(void *_data)
 	struct i2c_client *client = data->client;
 
 	/* Restore initial configuration */
-	lm90_write_convrate(data, data->convrate_orig);
+	if (data->kind == max6657)
+		max6657_write_convrate(client, data->convrate_orig);
+	else
+		lm90_write_convrate(data, data->convrate_orig);
+
 	i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1,
 				  data->config_orig);
 }
@@ -1672,7 +1680,8 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
 	data->config_orig = config;
 	data->config = config;
 
-	lm90_set_convrate(client, data, 500); /* 500ms; 2Hz conversion rate */
+	if (data->kind != max6657)
+		lm90_set_convrate(client, data, 500); /* 500ms; 2Hz conversion rate */
 
 	/* Check Temperature Range Select */
 	if (data->kind == adt7461 || data->kind == tmp451) {
-- 
2.30.1

