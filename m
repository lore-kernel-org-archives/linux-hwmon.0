Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9195C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 May 2022 05:33:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231425AbiECFh2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 May 2022 01:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231423AbiECFh1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 May 2022 01:37:27 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607D16383;
        Mon,  2 May 2022 22:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651556036;
  x=1683092036;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=na8TtpW8KsQrZ7tPnXTOPhZeejAWFUwNJUtTdfgCeJI=;
  b=CN9RAKcJRyiIktZnsRIqypeBd5jGnLGApFGEzUDCyPKpI7udHq2XQud1
   nQXr1NLWU4corsK0qCCtQXhE4/SEnWey8RDlOMBmYBkAbnWwE/RriNbKD
   /9GmdSYKOtIBQSmMnq6xrHJTDfQFs2nZbwffQ7YitH5D7pNBkr4fPiTm1
   xtXkkhieiAXAJWqLA61mlWiUGieyjN2Vr2Aihgivi3eCEQlFh30fzI3AB
   8faKPVwXEjXcr0CGlflB0Rvb8DNnrFoC7QqJbJT+5ntriAOLxrk7gA9qD
   8jnrziWPDwPrQ/ACxcr6V9BDDwhUjXbPjKuBOwVNcAkhKhMGUtDBPBpxJ
   A==;
From:   Camel Guo <camel.guo@axis.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
CC:     Camel Guo <camel.guo@axis.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Wolfram Sang <wsa@kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@axis.com>
Subject: [PATCH v3] hwmon: (tmp401) Add OF device ID table
Date:   Tue, 3 May 2022 07:33:50 +0200
Message-ID: <20220503053350.598031-1-camel.guo@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The driver doesn't have a struct of_device_id table but supported devices
are registered via Device Trees. This is working on the assumption that a
I2C device registered via OF will always match a legacy I2C device ID and
that the MODALIAS reported will always be of the form i2c:<device>.

But this could change in the future so the correct approach is to have an
OF device ID table if the devices are registered via OF.

Fixes: af503716ac14 ("i2c: core: report OF style module alias for devices registered via OF")
Signed-off-by: Camel Guo <camel.guo@axis.com>
---

Notes:
    v3:
     - Copy commit message from commit 72fc64c68decf119466 ("hwmon: (tmp103)
       Add OF device ID table")
     - Add Fixes tag
    v2:
     - Put evidence and circumstances in commit message

 drivers/hwmon/tmp401.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
index b86d9df7105d..52c9e7d3f2ae 100644
--- a/drivers/hwmon/tmp401.c
+++ b/drivers/hwmon/tmp401.c
@@ -708,10 +708,21 @@ static int tmp401_probe(struct i2c_client *client)
 	return 0;
 }
 
+static const struct of_device_id __maybe_unused tmp4xx_of_match[] = {
+	{ .compatible = "ti,tmp401", },
+	{ .compatible = "ti,tmp411", },
+	{ .compatible = "ti,tmp431", },
+	{ .compatible = "ti,tmp432", },
+	{ .compatible = "ti,tmp435", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tmp4xx_of_match);
+
 static struct i2c_driver tmp401_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "tmp401",
+		.of_match_table = of_match_ptr(tmp4xx_of_match),
 	},
 	.probe_new	= tmp401_probe,
 	.id_table	= tmp401_id,

base-commit: 38d741cb70b30741c0e802cbed7bd9cf4fd15fa4
-- 
2.30.2

