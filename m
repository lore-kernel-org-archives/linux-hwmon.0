Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45720 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725762AbeICEej (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Sep 2018 00:34:39 -0400
From: Guenter Roeck <linux@roeck-us.net>
To: Clemens Ladisch <clemens@ladisch.de>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Guglielmo Fanini <g.fanini@gmail.com>
Subject: [PATCH] hwmon: (k10temp) Support all Family 15h Model 6xh and Model 7xh processors
Date: Sun,  2 Sep 2018 17:17:00 -0700
Message-Id: <1535933820-23767-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

BIOS developer guides refer to Family 15h Models 60h-6fh and Family 15h
Models 70h-7fh. So far the driver only checked for Modela 60h and 70h.
However, there are now processors with other model numbers in the same
family. Example is A10-9620P family 15h model 65h. Follow the developer
guides and mask the lower 4 bit of the model number to determine the
registers to use for reading temperatures and temperature limits.

Reported-by: Guglielmo Fanini <g.fanini@gmail.com>
Cc: Guglielmo Fanini <g.fanini@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/k10temp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index bb15d7816a29..2cef0c37ff6f 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -325,8 +325,9 @@ static int k10temp_probe(struct pci_dev *pdev,
 
 	data->pdev = pdev;
 
-	if (boot_cpu_data.x86 == 0x15 && (boot_cpu_data.x86_model == 0x60 ||
-					  boot_cpu_data.x86_model == 0x70)) {
+	if (boot_cpu_data.x86 == 0x15 &&
+	    ((boot_cpu_data.x86_model & 0xf0) == 0x60 ||
+	     (boot_cpu_data.x86_model & 0xf0) == 0x70)) {
 		data->read_htcreg = read_htcreg_nb_f15;
 		data->read_tempreg = read_tempreg_nb_f15;
 	} else if (boot_cpu_data.x86 == 0x17) {
-- 
2.7.4
