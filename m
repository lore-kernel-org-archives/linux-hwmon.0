Return-Path: <SRS0=lfVP=22=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7EBC3F68F
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 10:58:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83B7021582
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 10:58:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgAEK6m (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jan 2020 05:58:42 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:45661 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725990AbgAEK6l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jan 2020 05:58:41 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 5 Jan 2020 12:58:36 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 005AwYmO020934;
        Sun, 5 Jan 2020 12:58:36 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net, robh+dt@kernel.org, vijaykhemka@fb.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [RFC PATCH hwmon-next v1 2/5] hwmon: (pmbus/core) Add support for Intel IMVP9 specification
Date:   Sun,  5 Jan 2020 10:58:30 +0000
Message-Id: <20200105105833.30196-3-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200105105833.30196-1-vadimp@mellanox.com>
References: <20200105105833.30196-1-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Extend "vrm_version" with support for Intel IMVP9 specification.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/hwmon/pmbus/pmbus.h      | 2 +-
 drivers/hwmon/pmbus/pmbus_core.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 2bdebd0ea9c1..c6b2401f1c6c 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -377,7 +377,7 @@ enum pmbus_sensor_classes {
 #define PMBUS_PAGE_VIRTUAL	BIT(31)
 
 enum pmbus_data_format { linear = 0, direct, vid };
-enum vrm_version { vr11 = 0, vr12, vr13 };
+enum vrm_version { vr11 = 0, vr12, vr13, imvp9 };
 
 struct pmbus_driver_info {
 	int pages;		/* Total number of pages */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 98226e84b351..a9b7b555cf6e 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -709,6 +709,10 @@ static long pmbus_reg2data_vid(struct pmbus_data *data,
 		if (val >= 0x01)
 			rv = 500 + (val - 1) * 10;
 		break;
+	case imvp9:
+		if (val >= 0x01)
+			rv = 200 + (val - 1) * 10;
+		break;
 	}
 	return rv;
 }
-- 
2.11.0

