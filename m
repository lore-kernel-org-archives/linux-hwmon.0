Return-Path: <SRS0=Ro9r=3C=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5DEC33CAD
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jan 2020 15:08:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7BF392084D
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jan 2020 15:08:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728981AbgAMPIz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Jan 2020 10:08:55 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:58651 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728871AbgAMPIz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Jan 2020 10:08:55 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 13 Jan 2020 17:08:50 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 00DF8hqc006851;
        Mon, 13 Jan 2020 17:08:50 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net, robh+dt@kernel.org, vijaykhemka@fb.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH hwmon-next v1 3/6] hwmon: (pmbus/tps53679) Extend device list supported by driver
Date:   Mon, 13 Jan 2020 15:08:38 +0000
Message-Id: <20200113150841.17670-4-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200113150841.17670-1-vadimp@mellanox.com>
References: <20200113150841.17670-1-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Extends driver with support of the additional devices:
Texas Instruments Dual channel DCAP+ multiphase controllers: TPS53688.

Extend Kconfig with added device.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/hwmon/pmbus/Kconfig    | 4 ++--
 drivers/hwmon/pmbus/tps53679.c | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 59859979571d..0dd30b07bf18 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -200,10 +200,10 @@ config SENSORS_TPS40422
 	  be called tps40422.
 
 config SENSORS_TPS53679
-	tristate "TI TPS53679"
+	tristate "TI TPS53679, TPS53688"
 	help
 	  If you say yes here you get hardware monitoring support for TI
-	  TPS53679.
+	  TPS53679, TPS53688
 
 	  This driver can also be built as a module. If so, the module will
 	  be called tps53679.
diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 163e8c6aaa8e..9c22e9013dd7 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -85,6 +85,7 @@ static int tps53679_probe(struct i2c_client *client,
 
 static const struct i2c_device_id tps53679_id[] = {
 	{"tps53679", 0},
+	{"tps53688", 0},
 	{}
 };
 
@@ -92,6 +93,7 @@ MODULE_DEVICE_TABLE(i2c, tps53679_id);
 
 static const struct of_device_id __maybe_unused tps53679_of_match[] = {
 	{.compatible = "ti,tps53679"},
+	{.compatible = "ti,tps53688"},
 	{}
 };
 MODULE_DEVICE_TABLE(of, tps53679_of_match);
-- 
2.11.0

