Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:46333 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbeHYHEu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 25 Aug 2018 03:04:50 -0400
Received: by mail-qt0-f194.google.com with SMTP id d4-v6so12289742qtn.13
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Aug 2018 20:27:27 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH 1/2] hwmon: (mc13783-adc) Remove the mention to 'Atlas'
Date: Sat, 25 Aug 2018 00:27:55 -0300
Message-Id: <1535167676-27013-1-git-send-email-festevam@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Fabio Estevam <fabio.estevam@nxp.com>

'Atlas' was an internal name for the MC13783 PMIC only and does not
apply to MC13892.

To avoid confusion, remove the 'Atlas' term from the description.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 Documentation/hwmon/mc13783-adc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/mc13783-adc b/Documentation/hwmon/mc13783-adc
index d0e7b3f..2798a29 100644
--- a/Documentation/hwmon/mc13783-adc
+++ b/Documentation/hwmon/mc13783-adc
@@ -2,10 +2,10 @@ Kernel driver mc13783-adc
 =========================
 
 Supported chips:
-  * Freescale Atlas MC13783
+  * Freescale MC13783
     Prefix: 'mc13783'
     Datasheet: http://www.freescale.com/files/rf_if/doc/data_sheet/MC13783.pdf?fsrch=1
-  * Freescale Atlas MC13892
+  * Freescale MC13892
     Prefix: 'mc13892'
     Datasheet: http://cache.freescale.com/files/analog/doc/data_sheet/MC13892.pdf?fsrch=1&sr=1
 
-- 
2.7.4
