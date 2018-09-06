Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:34174 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbeIFXfn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 6 Sep 2018 19:35:43 -0400
Received: by mail-qt0-f195.google.com with SMTP id m13-v6so13600630qth.1
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Sep 2018 11:58:54 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH 2/2] hwmon: (sht15) Switch to SPDX identifier
Date: Thu,  6 Sep 2018 15:59:50 -0300
Message-Id: <1536260390-22584-2-git-send-email-festevam@gmail.com>
In-Reply-To: <1536260390-22584-1-git-send-email-festevam@gmail.com>
References: <1536260390-22584-1-git-send-email-festevam@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Fabio Estevam <fabio.estevam@nxp.com>

Adopt the SPDX license identifier headers to ease license compliance
management.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/hwmon/sht15.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
index 2be7775..c878242 100644
--- a/drivers/hwmon/sht15.c
+++ b/drivers/hwmon/sht15.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * sht15.c - support for the SHT15 Temperature and Humidity Sensor
  *
@@ -9,10 +10,6 @@
  *
  * Copyright (c) 2007 Wouter Horre
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
  * For further information, see the Documentation/hwmon/sht15 file.
  */
 
-- 
2.7.4
