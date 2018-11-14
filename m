Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:38848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389353AbeKOIbc (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Nov 2018 03:31:32 -0500
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Sasha Levin <sashal@kernel.org>, linux-hwmon@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 4.4 6/8] hwmon: (ibmpowernv) Remove bogus __init annotations
Date: Wed, 14 Nov 2018 17:26:12 -0500
Message-Id: <20181114222618.100378-6-sashal@kernel.org>
In-Reply-To: <20181114222618.100378-1-sashal@kernel.org>
References: <20181114222618.100378-1-sashal@kernel.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>

[ Upstream commit e3e61f01d755188cb6c2dcf5a244b9c0937c258e ]

If gcc decides not to inline make_sensor_label():

    WARNING: vmlinux.o(.text+0x4df549c): Section mismatch in reference from the function .create_device_attrs() to the function .init.text:.make_sensor_label()
    The function .create_device_attrs() references
    the function __init .make_sensor_label().
    This is often because .create_device_attrs lacks a __init
    annotation or the annotation of .make_sensor_label is wrong.

As .probe() can be called after freeing of __init memory, all __init
annotiations in the driver are bogus, and should be removed.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwmon/ibmpowernv.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
index 55b5a8ff1cfe..ca3aa28977bc 100644
--- a/drivers/hwmon/ibmpowernv.c
+++ b/drivers/hwmon/ibmpowernv.c
@@ -114,7 +114,7 @@ static ssize_t show_label(struct device *dev, struct device_attribute *devattr,
 	return sprintf(buf, "%s\n", sdata->label);
 }
 
-static int __init get_logical_cpu(int hwcpu)
+static int get_logical_cpu(int hwcpu)
 {
 	int cpu;
 
@@ -125,9 +125,8 @@ static int __init get_logical_cpu(int hwcpu)
 	return -ENOENT;
 }
 
-static void __init make_sensor_label(struct device_node *np,
-				     struct sensor_data *sdata,
-				     const char *label)
+static void make_sensor_label(struct device_node *np,
+			      struct sensor_data *sdata, const char *label)
 {
 	u32 id;
 	size_t n;
-- 
2.17.1
