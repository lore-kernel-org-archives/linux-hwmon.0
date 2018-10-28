Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:36502 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbeJ2CCJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 28 Oct 2018 22:02:09 -0400
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-hwmon@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] hwmon: (ibmpowernv) Remove bogus __init annotations
Date: Sun, 28 Oct 2018 18:16:51 +0100
Message-Id: <20181028171651.30751-1-geert@linux-m68k.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

If gcc decides not to inline make_sensor_label():

    WARNING: vmlinux.o(.text+0x4df549c): Section mismatch in reference from the function .create_device_attrs() to the function .init.text:.make_sensor_label()
    The function .create_device_attrs() references
    the function __init .make_sensor_label().
    This is often because .create_device_attrs lacks a __init
    annotation or the annotation of .make_sensor_label is wrong.

As .probe() can be called after freeing of __init memory, all __init
annotiations in the driver are bogus, and should be removed.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Compile-tested only.
---
 drivers/hwmon/ibmpowernv.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
index 0ccca87f527191dc..293dd1c6c7b36ef2 100644
--- a/drivers/hwmon/ibmpowernv.c
+++ b/drivers/hwmon/ibmpowernv.c
@@ -181,7 +181,7 @@ static ssize_t show_label(struct device *dev, struct device_attribute *devattr,
 	return sprintf(buf, "%s\n", sdata->label);
 }
 
-static int __init get_logical_cpu(int hwcpu)
+static int get_logical_cpu(int hwcpu)
 {
 	int cpu;
 
@@ -192,9 +192,8 @@ static int __init get_logical_cpu(int hwcpu)
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
