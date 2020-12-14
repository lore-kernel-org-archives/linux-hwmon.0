Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5467BC2BB48
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Dec 2020 19:01:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 04EDC22573
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Dec 2020 19:01:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440661AbgLNTAn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 14 Dec 2020 14:00:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440653AbgLNTAe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Dec 2020 14:00:34 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3A6C0613D3
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Dec 2020 10:59:54 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id 15so20356446oix.8
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Dec 2020 10:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=Yi0S2u4WuMZOZzIjL7rnoUmxsYnMqln56XllHQ+/QtA=;
        b=RmmWEXtu6Ryy5NHI7Yh6MgU9p91fdHXOSVkYHyMl+aI79JaqBIK2oKlk38wVQ81bTg
         WzqPEEbIJzqd73o7XSwrxGt/lf+d/80jiCBCtYrueW/8igJ/C3gzMnS+txElCN6aw1VP
         WPQmCjuFSsy+cfSFKx0q7HVjga6252cEkU+idgZe1C9hAV7+Um05Zr2e/+lYBdiygFOs
         M2VBqWtsfvWzgZ/m0qIXKdEYaVyK2Rs8HPBKzbM5ZR1B5cGWWb4OYTTvUmUtezITq4OY
         PnP+8q1TnsUENg6YxvFCxl7zdhlbqgng+cougzKv4sXS28yx8Axu06uBEid272PyCN3R
         orWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=Yi0S2u4WuMZOZzIjL7rnoUmxsYnMqln56XllHQ+/QtA=;
        b=nudHBAONw9wqau1HwPo/TZV5oHZE8J1mDX7SBg7kUBv5ZuOKSw5X7qOujpOI7EPDbB
         YmIdT7ClF1jJ/J/3k4EUNiYG/lqE5YGIZyOIZQJhRdAwEdMzClckqaBrCFWE2kptbgkl
         16b7Qqx/BQpH11A5POmu5l7tcg4TGOb/Ygt8IFkvypbpCaUDrPRueT69osKOBB4kDd4B
         y25r1mdHXDriAPfAn9paar9QryLw6YOFfW7TaIsBgyr9iwaSojdO7FcPXrJhKYTPNTHx
         k63cz9gCkiJfkL8Or/PCDVsCpCTR8ehLmknVdZ0PhdcNXG5aBcr/yFpcCv9FM1vUfPEe
         HOVg==
X-Gm-Message-State: AOAM533qi5NF1IvL8tuhMnzOlwKbOk1g8bhdl23yqlZ6mZTiczD+AoMx
        3iwvDlRFYZG/0RCRgBEKUk+5upIswow=
X-Google-Smtp-Source: ABdhPJwqvBAitHl9XfQBEQj+10/bRYzuOS2VYxwuQnoz2ZNAmUfK7erpCaSIRtubbEf61FFKKKaieg==
X-Received: by 2002:a05:6808:6cf:: with SMTP id m15mr19581539oih.40.1607972393125;
        Mon, 14 Dec 2020 10:59:53 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k10sm4518289otn.71.2020.12.14.10.59.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Dec 2020 10:59:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "Artem S . Tashkinov" <aros@gmx.com>,
        Wei Huang <wei.huang2@amd.com>
Subject: [PATCH] hwmon: (k10temp) Remove support for displaying voltage and current on Zen CPUs
Date:   Mon, 14 Dec 2020 10:59:47 -0800
Message-Id: <20201214185947.50413-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Voltages and current are reported by Zen CPUs. However, the means
to do so is undocumented, changes from CPU to CPU, and the raw data
is not calibrated. Calibration information is available, but again
not documented. This results in less than perfect user experience,
up to concerns that loading the driver might possibly damage
the hardware (by reporting out-of range voltages). Effectively
support for reporting voltages and current is not maintainable.
Drop it.

Cc: Artem S. Tashkinov <aros@gmx.com>
Cc: Wei Huang <wei.huang2@amd.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/k10temp.c | 98 -----------------------------------------
 1 file changed, 98 deletions(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index a250481b5a97..3bc2551577a3 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -11,13 +11,6 @@
  *   convert raw register values is from https://github.com/ocerman/zenpower.
  *   The information is not confirmed from chip datasheets, but experiments
  *   suggest that it provides reasonable temperature values.
- * - Register addresses to read chip voltage and current are also from
- *   https://github.com/ocerman/zenpower, and not confirmed from chip
- *   datasheets. Current calibration is board specific and not typically
- *   shared by board vendors. For this reason, current values are
- *   normalized to report 1A/LSB for core current and and 0.25A/LSB for SoC
- *   current. Reported values can be adjusted using the sensors configuration
- *   file.
  */
 
 #include <linux/bitops.h>
@@ -109,10 +102,7 @@ struct k10temp_data {
 	int temp_offset;
 	u32 temp_adjust_mask;
 	u32 show_temp;
-	u32 svi_addr[2];
 	bool is_zen;
-	bool show_current;
-	int cfactor[2];
 };
 
 #define TCTL_BIT	0
@@ -137,16 +127,6 @@ static const struct tctl_offset tctl_offset_table[] = {
 	{ 0x17, "AMD Ryzen Threadripper 29", 27000 }, /* 29{20,50,70,90}[W]X */
 };
 
-static bool is_threadripper(void)
-{
-	return strstr(boot_cpu_data.x86_model_id, "Threadripper");
-}
-
-static bool is_epyc(void)
-{
-	return strstr(boot_cpu_data.x86_model_id, "EPYC");
-}
-
 static void read_htcreg_pci(struct pci_dev *pdev, u32 *regval)
 {
 	pci_read_config_dword(pdev, REG_HARDWARE_THERMAL_CONTROL, regval);
@@ -211,16 +191,6 @@ static const char *k10temp_temp_label[] = {
 	"Tccd8",
 };
 
-static const char *k10temp_in_label[] = {
-	"Vcore",
-	"Vsoc",
-};
-
-static const char *k10temp_curr_label[] = {
-	"Icore",
-	"Isoc",
-};
-
 static int k10temp_read_labels(struct device *dev,
 			       enum hwmon_sensor_types type,
 			       u32 attr, int channel, const char **str)
@@ -229,50 +199,6 @@ static int k10temp_read_labels(struct device *dev,
 	case hwmon_temp:
 		*str = k10temp_temp_label[channel];
 		break;
-	case hwmon_in:
-		*str = k10temp_in_label[channel];
-		break;
-	case hwmon_curr:
-		*str = k10temp_curr_label[channel];
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
-	return 0;
-}
-
-static int k10temp_read_curr(struct device *dev, u32 attr, int channel,
-			     long *val)
-{
-	struct k10temp_data *data = dev_get_drvdata(dev);
-	u32 regval;
-
-	switch (attr) {
-	case hwmon_curr_input:
-		amd_smn_read(amd_pci_dev_to_node_id(data->pdev),
-			     data->svi_addr[channel], &regval);
-		*val = DIV_ROUND_CLOSEST(data->cfactor[channel] *
-					 (regval & 0xff),
-					 1000);
-		break;
-	default:
-		return -EOPNOTSUPP;
-	}
-	return 0;
-}
-
-static int k10temp_read_in(struct device *dev, u32 attr, int channel, long *val)
-{
-	struct k10temp_data *data = dev_get_drvdata(dev);
-	u32 regval;
-
-	switch (attr) {
-	case hwmon_in_input:
-		amd_smn_read(amd_pci_dev_to_node_id(data->pdev),
-			     data->svi_addr[channel], &regval);
-		regval = (regval >> 16) & 0xff;
-		*val = DIV_ROUND_CLOSEST(155000 - regval * 625, 100);
-		break;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -331,10 +257,6 @@ static int k10temp_read(struct device *dev, enum hwmon_sensor_types type,
 	switch (type) {
 	case hwmon_temp:
 		return k10temp_read_temp(dev, attr, channel, val);
-	case hwmon_in:
-		return k10temp_read_in(dev, attr, channel, val);
-	case hwmon_curr:
-		return k10temp_read_curr(dev, attr, channel, val);
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -383,11 +305,6 @@ static umode_t k10temp_is_visible(const void *_data,
 			return 0;
 		}
 		break;
-	case hwmon_in:
-	case hwmon_curr:
-		if (!data->show_current)
-			return 0;
-		break;
 	default:
 		return 0;
 	}
@@ -517,20 +434,10 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		case 0x8:	/* Zen+ */
 		case 0x11:	/* Zen APU */
 		case 0x18:	/* Zen+ APU */
-			data->show_current = !is_threadripper() && !is_epyc();
-			data->svi_addr[0] = F17H_M01H_SVI_TEL_PLANE0;
-			data->svi_addr[1] = F17H_M01H_SVI_TEL_PLANE1;
-			data->cfactor[0] = F17H_M01H_CFACTOR_ICORE;
-			data->cfactor[1] = F17H_M01H_CFACTOR_ISOC;
 			k10temp_get_ccd_support(pdev, data, 4);
 			break;
 		case 0x31:	/* Zen2 Threadripper */
 		case 0x71:	/* Zen2 */
-			data->show_current = !is_threadripper() && !is_epyc();
-			data->cfactor[0] = F17H_M31H_CFACTOR_ICORE;
-			data->cfactor[1] = F17H_M31H_CFACTOR_ISOC;
-			data->svi_addr[0] = F17H_M31H_SVI_TEL_PLANE0;
-			data->svi_addr[1] = F17H_M31H_SVI_TEL_PLANE1;
 			k10temp_get_ccd_support(pdev, data, 8);
 			break;
 		}
@@ -542,11 +449,6 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 		switch (boot_cpu_data.x86_model) {
 		case 0x0 ... 0x1:	/* Zen3 */
-			data->show_current = true;
-			data->svi_addr[0] = F19H_M01_SVI_TEL_PLANE0;
-			data->svi_addr[1] = F19H_M01_SVI_TEL_PLANE1;
-			data->cfactor[0] = F19H_M01H_CFACTOR_ICORE;
-			data->cfactor[1] = F19H_M01H_CFACTOR_ISOC;
 			k10temp_get_ccd_support(pdev, data, 8);
 			break;
 		}
-- 
2.17.1

