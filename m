Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047FBC433E0
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Mar 2021 08:33:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6B3F64EF6
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Mar 2021 08:33:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbhCMIdZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 13 Mar 2021 03:33:25 -0500
Received: from out20-26.mail.aliyun.com ([115.124.20.26]:52692 "EHLO
        out20-26.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbhCMIdE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 13 Mar 2021 03:33:04 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.8245703|0.07362942;CH=green;DM=|AD|false|;DS=CONTINUE|ham_alarm|0.0974564-0.00599479-0.896549;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047208;MF=wangyugui@e16-tech.com;NM=1;PH=DS;RN=4;RT=4;SR=0;TI=SMTPD_---.JkREMO6_1615624379;
Received: from T640.e16-tech.com(mailfrom:wangyugui@e16-tech.com fp:SMTPD_---.JkREMO6_1615624379)
          by smtp.aliyun-inc.com(10.147.40.26);
          Sat, 13 Mar 2021 16:32:59 +0800
From:   wangyugui <wangyugui@e16-tech.com>
To:     linux-hwmon@vger.kernel.org
Cc:     dwagner@suse.de, hare@suse.de, wangyugui <wangyugui@e16-tech.com>
Subject: [PATCH] nvme-hwmon: drop not common HWMON_T_MIN and HWMON_T_MAX
Date:   Sat, 13 Mar 2021 16:32:56 +0800
Message-Id: <20210313083256.68158-1-wangyugui@e16-tech.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

HWMON_T_MIN is not common in NVMe SSD, so drop all of them in nvme-hwmon.

HWMON_T_MAX is only common in NVMe SSD Composite sensor, so drop them in other sensors.

Before this patch(SSD: PM1733):
#sensors
nvme-pci-4300
Adapter: PCI adapter
Composite:    +49.9°C  (low  = -273.1°C, high = +71.8°C)
                       (crit = +84.8°C)
Sensor 1:     +47.9°C  (low  = -273.1°C, high = +65261.8°C)
ERROR: Can't get value of subfeature temp3_min: I/O error
ERROR: Can't get value of subfeature temp3_max: I/O error
Sensor 2:     +49.9°C  (low  =  +0.0°C, high =  +0.0°C)

# cat /sys/class/nvme/nvme0/hwmon1/temp3_min
cat: /sys/class/nvme/nvme0/hwmon1/temp3_min: Input/output error
# cat /sys/class/nvme/nvme0/hwmon1/temp3_max
cat: /sys/class/nvme/nvme0/hwmon1/temp3_max: Input/output error

After this patch(SSD: PM1733):
#sensors
nvme-pci-4300
Adapter: PCI adapter
Composite:    +48.9°C  (high = +71.8°C, crit = +84.8°C)
Sensor 1:     +46.9°C
Sensor 2:     +48.9°C

---
 drivers/nvme/host/hwmon.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/nvme/host/hwmon.c b/drivers/nvme/host/hwmon.c
index 552dbc0..a93612f 100644
--- a/drivers/nvme/host/hwmon.c
+++ b/drivers/nvme/host/hwmon.c
@@ -188,23 +188,23 @@ static umode_t nvme_hwmon_is_visible(const void *_data,
 static const struct hwmon_channel_info *nvme_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
-			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+			   HWMON_T_INPUT | HWMON_T_MAX |
 				HWMON_T_CRIT | HWMON_T_LABEL | HWMON_T_ALARM,
-			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+			   HWMON_T_INPUT |
 				HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+			   HWMON_T_INPUT |
 				HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+			   HWMON_T_INPUT |
 				HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+			   HWMON_T_INPUT |
 				HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+			   HWMON_T_INPUT |
 				HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+			   HWMON_T_INPUT |
 				HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+			   HWMON_T_INPUT |
 				HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MIN |
+			   HWMON_T_INPUT |
 				HWMON_T_LABEL),
 	NULL
 };
-- 
2.30.2

