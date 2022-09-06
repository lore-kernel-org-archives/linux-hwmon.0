Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA6BECAAA1
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Sep 2022 09:28:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233959AbiIFJ2C (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Sep 2022 05:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233743AbiIFJ1z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Sep 2022 05:27:55 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A0BA13CED
        for <linux-hwmon@vger.kernel.org>; Tue,  6 Sep 2022 02:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662456469;
  x=1693992469;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HY/OTQFizoojN9STKhnghIxI4IHvUXWP3RNVN5eha+Y=;
  b=P9eWycyZTgJEIM9OV8FCOUw3p2Vdd+UAhngP1ysXcIgfZB4vVcHM33+O
   eaVePLdQHgnrhwry02bpluqSG0h8ewaUKkrrYPYN7xE4Y6noWY/U+BRER
   nvipbsaRY+yfIbNvMlZJkwdp8ZAheClANRujB2/z7usMAS+Tcgws3cSN/
   0JHL1x4IY8EOwo727Hz6IBG0LITFwzKKcWOY158euHQHhaHUrFrhglpxE
   hHkbQOdb1TmULenUM77K2jmiALhqbUSW//nXiyJLcFl2lorIbX5SCWVY9
   HaIszkNKN4XfU19N+HK+F+BKl12rJNeIRl9CJ9Vyd4Ph1xJDNZ848O0jy
   Q==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     <linux-hwmon@vger.kernel.org>, <kernel@axis.com>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH] hwmon: (pmbus) Add debugfs output voltage related commands
Date:   Tue, 6 Sep 2022 11:27:43 +0200
Message-ID: <20220906092743.1327269-1-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Export vout_command, vout_margin_high, and vout_margin_low through
debugfs. This is useful in order to manually configure the output
voltage on a channel.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 80 +++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 81d3f91dd204..25da2ff2d09f 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3050,6 +3050,41 @@ static int pmbus_debugfs_get(void *data, u64 *val)
 DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops, pmbus_debugfs_get, NULL,
 			 "0x%02llx\n");
 
+static int pmbus_debugfs_get_word(void *data, u64 *val)
+{
+	struct pmbus_debugfs_entry *entry = data;
+	struct pmbus_sensor s = {
+		.page = entry->page,
+		.class = PSC_VOLTAGE_OUT,
+		.convert = true,
+		.data = -1,
+	};
+
+	s.data = _pmbus_read_word_data(entry->client, entry->page, 0xff, entry->reg);
+	if (s.data < 0)
+		return s.data;
+	*val = pmbus_reg2data(i2c_get_clientdata(entry->client), &s);
+
+	return 0;
+}
+
+static int pmbus_debugfs_set_word(void *data, u64 val)
+{
+	struct pmbus_debugfs_entry *entry = data;
+	struct pmbus_sensor s = {
+		.page = entry->page,
+		.class = PSC_VOLTAGE_OUT,
+		.convert = true,
+		.data = -1,
+	};
+	val = pmbus_data2reg(i2c_get_clientdata(entry->client), &s, val);
+
+	return _pmbus_write_word_data(entry->client, entry->page, entry->reg,
+				      (u16)val);
+}
+DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_rw_word, pmbus_debugfs_get_word,
+			 pmbus_debugfs_set_word, "%llu\n");
+
 static int pmbus_debugfs_get_status(void *data, u64 *val)
 {
 	int rc;
@@ -3126,10 +3161,10 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 	/*
 	 * Allocate the max possible entries we need.
 	 * 6 entries device-specific
-	 * 10 entries page-specific
+	 * 13 entries page-specific
 	 */
 	entries = devm_kcalloc(data->dev,
-			       6 + data->info->pages * 10, sizeof(*entries),
+			       6 + data->info->pages * 13, sizeof(*entries),
 			       GFP_KERNEL);
 	if (!entries)
 		return -ENOMEM;
@@ -3299,6 +3334,47 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 					    &entries[idx++],
 					    &pmbus_debugfs_ops);
 		}
+
+		/*
+		 * VOUT_COMMAND - Nominal DC/DC output voltage setpoint.
+		 */
+		if (data->info->func[i] & PMBUS_HAVE_VOUT) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_VOUT_COMMAND;
+			scnprintf(name, PMBUS_NAME_SIZE, "vout%d_command", i);
+			debugfs_create_file(name, 0644, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops_rw_word);
+		}
+
+		/*
+		 * VOUT_MARGIN_HIGH - Margin high DC/DC converter output.
+		 */
+		if (data->info->func[i] & PMBUS_HAVE_VOUT) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_VOUT_MARGIN_HIGH;
+			scnprintf(name, PMBUS_NAME_SIZE,
+				  "vout%d_margin_high", i);
+			debugfs_create_file(name, 0644, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops_rw_word);
+		}
+
+		/*
+		 * VOUT_MARGIN_LOW - Margin low DC/DC converter output.
+		 */
+		if (data->info->func[i] & PMBUS_HAVE_VOUT) {
+			entries[idx].client = client;
+			entries[idx].page = i;
+			entries[idx].reg = PMBUS_VOUT_MARGIN_LOW;
+			scnprintf(name, PMBUS_NAME_SIZE,
+				  "vout%d_margin_low", i);
+			debugfs_create_file(name, 0644, data->debugfs,
+					    &entries[idx++],
+					    &pmbus_debugfs_ops_rw_word);
+		}
 	}
 
 	return devm_add_action_or_reset(data->dev,
-- 
2.30.2

