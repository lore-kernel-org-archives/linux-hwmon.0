Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C75EC54EBC
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Jan 2023 02:07:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234570AbjAKCHo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 Jan 2023 21:07:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbjAKCHm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Jan 2023 21:07:42 -0500
Received: from mail.nfschina.com (unknown [42.101.60.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB2C20F;
        Tue, 10 Jan 2023 18:07:41 -0800 (PST)
Received: from localhost (unknown [127.0.0.1])
        by mail.nfschina.com (Postfix) with ESMTP id C9BB91A009FE;
        Wed, 11 Jan 2023 10:07:55 +0800 (CST)
X-Virus-Scanned: amavisd-new at nfschina.com
Received: from mail.nfschina.com ([127.0.0.1])
        by localhost (localhost.localdomain [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tI5tCzWo8b1T; Wed, 11 Jan 2023 10:07:55 +0800 (CST)
Received: from localhost.localdomain.localdomain (unknown [219.141.250.2])
        (Authenticated sender: xupengfei@nfschina.com)
        by mail.nfschina.com (Postfix) with ESMTPA id E7CBF1A0092A;
        Wed, 11 Jan 2023 10:07:54 +0800 (CST)
From:   XU pengfei <xupengfei@nfschina.com>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        XU pengfei <xupengfei@nfschina.com>
Subject: [PATCH 1/1] hwmon: remove unnecessary (void*) conversions
Date:   Wed, 11 Jan 2023 10:07:24 +0800
Message-Id: <20230111020723.3194-1-xupengfei@nfschina.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Pointer variables of void * type do not require type cast.

Signed-off-by: XU pengfei <xupengfei@nfschina.com>
---
 drivers/hwmon/ibmpex.c   | 2 +-
 drivers/hwmon/powr1220.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ibmpex.c b/drivers/hwmon/ibmpex.c
index 1837cccd993c..db066b368918 100644
--- a/drivers/hwmon/ibmpex.c
+++ b/drivers/hwmon/ibmpex.c
@@ -546,7 +546,7 @@ static void ibmpex_bmc_gone(int iface)
 
 static void ibmpex_msg_handler(struct ipmi_recv_msg *msg, void *user_msg_data)
 {
-	struct ibmpex_bmc_data *data = (struct ibmpex_bmc_data *)user_msg_data;
+	struct ibmpex_bmc_data *data = user_msg_data;
 
 	if (msg->msgid != data->tx_msgid) {
 		dev_err(data->bmc_device,
diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
index f77dc6db31ac..501337ee5aa3 100644
--- a/drivers/hwmon/powr1220.c
+++ b/drivers/hwmon/powr1220.c
@@ -174,7 +174,7 @@ static umode_t
 powr1220_is_visible(const void *data, enum hwmon_sensor_types type, u32
 		    attr, int channel)
 {
-	struct powr1220_data *chip_data = (struct powr1220_data *)data;
+	struct powr1220_data *chip_data = data;
 
 	if (channel >= chip_data->max_channels)
 		return 0;
-- 
2.18.2

