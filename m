Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BA9C433E0
	for <linux-hwmon@archiver.kernel.org>; Sat,  6 Feb 2021 09:53:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A44BC64E5A
	for <linux-hwmon@archiver.kernel.org>; Sat,  6 Feb 2021 09:53:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhBFJxJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 6 Feb 2021 04:53:09 -0500
Received: from lnfm1.sai.msu.ru ([93.180.26.255]:39749 "EHLO lnfm1.sai.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229590AbhBFJxH (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 6 Feb 2021 04:53:07 -0500
Received: from dragon.sai.msu.ru (dragon.sai.msu.ru [93.180.26.172])
        by lnfm1.sai.msu.ru (8.14.1/8.12.8) with ESMTP id 1169pesx029777;
        Sat, 6 Feb 2021 12:51:45 +0300
Received: from oak.local (unknown [83.167.113.121])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by dragon.sai.msu.ru (Postfix) with ESMTPSA id 807601CDFD;
        Sat,  6 Feb 2021 12:51:41 +0300 (MSK)
From:   "Matwey V. Kornilov" <matwey@sai.msu.ru>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Matwey V. Kornilov" <matwey@sai.msu.ru>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS)
Subject: [PATCH v4 1/4] hwmon: lm75: Add lm75 to of_match list
Date:   Sat,  6 Feb 2021 12:51:18 +0300
Message-Id: <20210206095121.20625-2-matwey@sai.msu.ru>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210206095121.20625-1-matwey@sai.msu.ru>
References: <2588ea5c-630e-6509-689d-4c8fea358e9b@roeck-us.net>
 <20210206095121.20625-1-matwey@sai.msu.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Currently, many boards use just 'lm75' as a compatible string.

Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>
---
 Documentation/devicetree/bindings/hwmon/lm75.yaml | 1 +
 drivers/hwmon/lm75.c                              | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
index 96eed5cc7841..aec8edd1e0c6 100644
--- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
@@ -13,6 +13,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - lm75
       - adi,adt75
       - dallas,ds1775
       - dallas,ds75
diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index e447febd121a..08cde1c446db 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -667,6 +667,10 @@ static const struct i2c_device_id lm75_ids[] = {
 MODULE_DEVICE_TABLE(i2c, lm75_ids);
 
 static const struct of_device_id __maybe_unused lm75_of_match[] = {
+	{
+		.compatible = "lm75",
+		.data = (void *)lm75
+	},
 	{
 		.compatible = "adi,adt75",
 		.data = (void *)adt75
-- 
2.26.2

