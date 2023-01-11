Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A62C46467
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Jan 2023 04:36:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjAKEgi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 Jan 2023 23:36:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbjAKEgh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Jan 2023 23:36:37 -0500
Received: from mail.nfschina.com (unknown [42.101.60.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F71643B;
        Tue, 10 Jan 2023 20:36:26 -0800 (PST)
Received: from localhost (unknown [127.0.0.1])
        by mail.nfschina.com (Postfix) with ESMTP id 08EDB1A009D5;
        Wed, 11 Jan 2023 12:36:40 +0800 (CST)
X-Virus-Scanned: amavisd-new at nfschina.com
Received: from mail.nfschina.com ([127.0.0.1])
        by localhost (localhost.localdomain [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8jEW19MEqXmt; Wed, 11 Jan 2023 12:36:39 +0800 (CST)
Received: from localhost.localdomain.localdomain (unknown [219.141.250.2])
        (Authenticated sender: xupengfei@nfschina.com)
        by mail.nfschina.com (Postfix) with ESMTPA id 289C21A00919;
        Wed, 11 Jan 2023 12:36:39 +0800 (CST)
From:   XU pengfei <xupengfei@nfschina.com>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        XU pengfei <xupengfei@nfschina.com>
Subject: [PATCH 1/1] hwmon: ibmpex: remove unnecessary (void*) conversions
Date:   Wed, 11 Jan 2023 12:36:06 +0800
Message-Id: <20230111043605.3726-1-xupengfei@nfschina.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Pointer variables of void * type do not require type cast.

Signed-off-by: XU pengfei <xupengfei@nfschina.com>
---
 drivers/hwmon/ibmpex.c   | 2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
-- 
2.18.2

