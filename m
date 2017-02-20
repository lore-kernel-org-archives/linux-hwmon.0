Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from ms2.toshiba-tops.co.jp ([61.200.21.4]:43702 "EHLO
        dmz-ms2.toshiba-tops.co.jp" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750737AbdBTFMW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Feb 2017 00:12:22 -0500
Date: Mon, 20 Feb 2017 13:50:14 +0900
Message-ID: <20170220.135014.415950098927632727.nemoto@toshiba-tops.co.jp>
To: <linux-hwmon@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, <sato@toshiba-tops.co.jp>
Subject: [PATCH] hwmon: (w83627ehf) Use request_muxed_region
From: Atsushi Nemoto <nemoto@toshiba-tops.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Katsumi Sato <sato@toshiba-tops.co.jp>

Serialize access to the hardware by using "request_muxed_region".
Call to this macro will hold off the requestor if the resource is
currently busy. "superio_enter" will return an error if call to
"request_muxed_region" fails.

Signed-off-by: Katsumi Sato <sato@toshiba-tops.co.jp>
Signed-off-by: Atsushi Nemoto <nemoto@toshiba-tops.co.jp>
---
 drivers/hwmon/w83627ehf.c |   32 ++++++++++++++++++++++++++------
 1 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index 697007a..40cb8fa 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -135,11 +135,16 @@ enum kinds {
 	outb(ld, ioreg + 1);
 }
 
-static inline void
+static inline int
 superio_enter(int ioreg)
 {
+	if (!request_muxed_region(ioreg, 2, DRVNAME))
+		return -EBUSY;
+
 	outb(0x87, ioreg);
 	outb(0x87, ioreg);
+
+	return 0;
 }
 
 static inline void
@@ -148,6 +153,7 @@ enum kinds {
 	outb(0xaa, ioreg);
 	outb(0x02, ioreg);
 	outb(0x02, ioreg + 1);
+	release_region(ioreg, 2);
 }
 
 /*
@@ -1970,7 +1976,10 @@ static void w82627ehf_swap_tempreg(struct w83627ehf_data *data,
 		return;
 	}
 
-	superio_enter(sio_data->sioreg);
+	if (superio_enter(sio_data->sioreg)) {
+		pr_err("%s: superio is busy!!\n", __func__);
+		return;
+	}
 
 	/* fan4 and fan5 share some pins with the GPIO and serial flash */
 	if (sio_data->kind == nct6775) {
@@ -2352,7 +2361,11 @@ static int w83627ehf_probe(struct platform_device *pdev)
 	w83627ehf_init_device(data, sio_data->kind);
 
 	data->vrm = vid_which_vrm();
-	superio_enter(sio_data->sioreg);
+
+	err = superio_enter(sio_data->sioreg);
+	if (err)
+		goto exit_release;
+
 	/* Read VID value */
 	if (sio_data->kind == w83667hg || sio_data->kind == w83667hg_b ||
 	    sio_data->kind == nct6775 || sio_data->kind == nct6776) {
@@ -2364,8 +2377,10 @@ static int w83627ehf_probe(struct platform_device *pdev)
 		superio_select(sio_data->sioreg, W83667HG_LD_VID);
 		data->vid = superio_inb(sio_data->sioreg, 0xe3);
 		err = device_create_file(dev, &dev_attr_cpu0_vid);
-		if (err)
+		if (err) {
+			superio_exit(sio_data->sioreg);
 			goto exit_release;
+		}
 	} else if (sio_data->kind != w83627uhg) {
 		superio_select(sio_data->sioreg, W83627EHF_LD_HWM);
 		if (superio_inb(sio_data->sioreg, SIO_REG_VID_CTRL) & 0x80) {
@@ -2401,8 +2416,10 @@ static int w83627ehf_probe(struct platform_device *pdev)
 				data->vid &= 0x3f;
 
 			err = device_create_file(dev, &dev_attr_cpu0_vid);
-			if (err)
+			if (err) {
+				superio_exit(sio_data->sioreg);
 				goto exit_release;
+			}
 		} else {
 			dev_info(dev,
 				 "VID pins in output mode, CPU VID not available\n");
@@ -2712,8 +2729,11 @@ static int __init w83627ehf_find(int sioaddr, unsigned short *addr,
 
 	u16 val;
 	const char *sio_name;
+	int err;
 
-	superio_enter(sioaddr);
+	err = superio_enter(sioaddr);
+	if (err)
+		return err;
 
 	if (force_id)
 		val = force_id;
-- 


