Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF69FC433ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 10:20:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77AB561152
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 10:20:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230322AbhEJKVb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 May 2021 06:21:31 -0400
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84]:43450 "EHLO
        fgw23-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230002AbhEJKVb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 May 2021 06:21:31 -0400
X-Greylist: delayed 964 seconds by postgrey-1.27 at vger.kernel.org; Mon, 10 May 2021 06:21:30 EDT
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id 1702a08c-b177-11eb-8ccd-005056bdfda7;
        Mon, 10 May 2021 13:04:21 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Alexandru Tachici <alexandru.tachici@analog.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 1/1] hwmon: (ltc2992) Put fwnode in error case during ->probe()
Date:   Mon, 10 May 2021 13:01:36 +0300
Message-Id: <20210510100136.3303142-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In each iteration fwnode_for_each_available_child_node() bumps a reference
counting of a loop variable followed by dropping in on a next iteration,

Since in error case the loop is broken, we have to drop a reference count
by ourselves. Do it for port_fwnode in error case during ->probe().

Fixes: b0bd407e94b0 ("hwmon: (ltc2992) Add support")
Cc: Alexandru Tachici <alexandru.tachici@analog.com>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/hwmon/ltc2992.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ltc2992.c b/drivers/hwmon/ltc2992.c
index 4382105bf142..2a4bed0ab226 100644
--- a/drivers/hwmon/ltc2992.c
+++ b/drivers/hwmon/ltc2992.c
@@ -900,11 +900,15 @@ static int ltc2992_parse_dt(struct ltc2992_state *st)
 
 	fwnode_for_each_available_child_node(fwnode, child) {
 		ret = fwnode_property_read_u32(child, "reg", &addr);
-		if (ret < 0)
+		if (ret < 0) {
+			fwnode_handle_put(child);
 			return ret;
+		}
 
-		if (addr > 1)
+		if (addr > 1) {
+			fwnode_handle_put(child);
 			return -EINVAL;
+		}
 
 		ret = fwnode_property_read_u32(child, "shunt-resistor-micro-ohms", &val);
 		if (!ret)
-- 
2.31.1

