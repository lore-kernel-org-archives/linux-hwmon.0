Return-Path: <SRS0=lfVP=22=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42B8C33C8C
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 10:58:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C29AE218AC
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jan 2020 10:58:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbgAEK6q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jan 2020 05:58:46 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:45705 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726029AbgAEK6q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Jan 2020 05:58:46 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 5 Jan 2020 12:58:40 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 005AwYmR020934;
        Sun, 5 Jan 2020 12:58:40 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net, robh+dt@kernel.org, vijaykhemka@fb.com
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend device list supported by driver
Date:   Sun,  5 Jan 2020 10:58:33 +0000
Message-Id: <20200105105833.30196-6-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200105105833.30196-1-vadimp@mellanox.com>
References: <20200105105833.30196-1-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Extends driver with support of the additional devices:
Texas Instruments Dual channel DCAP+ multiphase controllers: TPS53688,
SN1906016.
Infineon Multi-phase Digital VR Controller Sierra devices
XDPE12286C, XDPE12284C, XDPE12283C, XDPE12254C and XDPE12250C.

Extend Kconfig with added devices.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 drivers/hwmon/pmbus/Kconfig    |  5 +++--
 drivers/hwmon/pmbus/tps53679.c | 14 ++++++++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
index 59859979571d..9e3d197d5322 100644
--- a/drivers/hwmon/pmbus/Kconfig
+++ b/drivers/hwmon/pmbus/Kconfig
@@ -200,10 +200,11 @@ config SENSORS_TPS40422
 	  be called tps40422.
 
 config SENSORS_TPS53679
-	tristate "TI TPS53679"
+	tristate "TI TPS53679, TPS53688, SN1906016, Infineon XDPE122xxx family"
 	help
 	  If you say yes here you get hardware monitoring support for TI
-	  TPS53679.
+	  TPS53679, PS53688, SN1906016 and Infineon XDPE12286C, XDPE12284C,
+	  XDPE12283C, XDPE12254C, XDPE12250C devices.
 
 	  This driver can also be built as a module. If so, the module will
 	  be called tps53679.
diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 7ce2fca4acde..f38eb116735b 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -89,6 +89,13 @@ static int tps53679_probe(struct i2c_client *client,
 
 static const struct i2c_device_id tps53679_id[] = {
 	{"tps53679", 0},
+	{"tps53688", 0},
+	{"sn1906016", 0},
+	{"xdpe12283c", 0},
+	{"xdpe12250c", 0},
+	{"xdpe12254c", 0},
+	{"xdpe12284c", 0},
+	{"xdpe12286c", 0},
 	{}
 };
 
@@ -96,6 +103,13 @@ MODULE_DEVICE_TABLE(i2c, tps53679_id);
 
 static const struct of_device_id __maybe_unused tps53679_of_match[] = {
 	{.compatible = "ti,tps53679"},
+	{.compatible = "ti,tps53688"},
+	{.compatible = "ti,sn1906016"},
+	{.compatible = "infineon,xdpe12283c"},
+	{.compatible = "infineon,xdpe12250c"},
+	{.compatible = "infineon,xdpe12254c"},
+	{.compatible = "infineon,xdpe12284c"},
+	{.compatible = "infineon,xdpe12286c"},
 	{}
 };
 MODULE_DEVICE_TABLE(of, tps53679_of_match);
-- 
2.11.0

