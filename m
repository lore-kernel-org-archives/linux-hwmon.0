Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38059 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727341AbeLZV67 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Dec 2018 16:58:59 -0500
Received: by mail-pl1-f194.google.com with SMTP id e5so7963398plb.5
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Dec 2018 13:58:58 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Cook <mcook@mackal.net>
Subject: [PATCH] hwmon: (nct6775) Enable IO mapping for NCT6797D and NCT6798D
Date: Wed, 26 Dec 2018 13:58:55 -0800
Message-Id: <1545861535-2173-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Similar to other recent chips from Nuvoton, IO mapping may be disabled
by default. Enable it when instantiating the driver and after resume.

Fixes: 0599682b826f ("hwmon: (nct6775) Add support for NCT6798D")
Fixes: e41da286a2fd ("hwmon: (nct6775) Add support for NCT6797D")
Reported-by: Michael Cook <mcook@mackal.net>
Cc: Michael Cook <mcook@mackal.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6775.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 8f91e366866f..4adec4ab7d06 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -4508,7 +4508,8 @@ static int __maybe_unused nct6775_resume(struct device *dev)
 
 	if (data->kind == nct6791 || data->kind == nct6792 ||
 	    data->kind == nct6793 || data->kind == nct6795 ||
-	    data->kind == nct6796)
+	    data->kind == nct6796 || data->kind == nct6797 ||
+	    data->kind == nct6798)
 		nct6791_enable_io_mapping(sioreg);
 
 	superio_exit(sioreg);
@@ -4644,7 +4645,8 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 
 	if (sio_data->kind == nct6791 || sio_data->kind == nct6792 ||
 	    sio_data->kind == nct6793 || sio_data->kind == nct6795 ||
-	    sio_data->kind == nct6796)
+	    sio_data->kind == nct6796 || sio_data->kind == nct6797 ||
+	    sio_data->kind == nct6798)
 		nct6791_enable_io_mapping(sioaddr);
 
 	superio_exit(sioaddr);
-- 
2.7.4
