Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335793;
	b=KBoojWp0shhFA3NbTYIm0nudCq46nO7wWyXRtfRxiIrIkjBPacpw++h32bFTX2h1hgzj
	 HRcb7pRlbU7gxVd/eLSfWdLoXDVj4KSHuv73fD9quJodtEcNmj+ZEswusuUtiSTcQDj3R
	 QYz4uwcPTgzfe0kFUCjQ3dxgd4UdTBLxsCgb2Db0wUIsMnDcElCDIdUpFztkA3qaZX9N6
	 MI8j208PefvVAZAEjvrFhDPzw00BECiY8SXelx0iop5hCDcQTPEwCuVpPsKFNBV/NgLJt
	 n2W5T7bK8CraprRZaDsK3mEPoiHnnQkTB70hI7xdjKh97udsuaSXyb1M2OVC2dQTimg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335793;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:
	 X-Source-Dir:X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:
	 X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=BkAh/naonxwCFmxEjtC1JpyDS0Uv/1pMVGUHzCrZAuU=;
	b=itmsTOejSCAKfJMU7xDLswzuYZZCsTqkT3Q5N1zMgjfE+yPBIc+RHgChg9Va6hTunhH+
	 YU9PofWVt27RWWrEe9dr1MLEJ/2N3RTa6lERWrht1oNb5NdTq8I4mNP8NvOzIXG/rIiUc
	 0gqcS8vARuGvpUpHH/0SlEDYEbMvUVTMdkri0uhv+9+ZDBCPS4bf3X94ymdxzTKcDybm3
	 n2ZvDoxvD0rubIWy6O3ODTuZP/WbuE8g4C6zMH1W2Nrbt8BITBJZyzrzSxgrhnbhQzHi6
	 NaBgO2iDBRNVADH8OT56XOTU4KN/dEkv7YNu8JKkDuWkE2xuIQgNTOgGIpYdKngjPmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=aIXUiPD6;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66F3606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 18:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A66F3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=aIXUiPD6
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id QqAjxHzC7yb4YQqhsx0vg9; Tue, 10 Nov 2026 18:36:32 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QqgPxIJLJYskhQqgPxBpQ8; Tue, 10 Nov 2026 18:35:01 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6af363d5
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=gAnH3GRIAAAA:8
 a=_jlGtV7tAAAA:8 a=aRxQL1JOAAAA:8 a=V3OuN7rwlyLKenittegA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nlm17XC03S6CtCLSeiRr:22 a=lBRdisTmIr2YKkuu8atg:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=BkAh/naonxwCFmxEjtC1JpyDS0Uv/1pMVGUHzCrZAuU=; b=aIXUiPD6Rbmd
	s2Lg21twfPe9ZdqVpPaEZ2W/U6PeCLfoBKbF5xuIVJV86ym1X0m1hmP6mgMCDB7I5ardslTndNR8J
	FXbWV620Tx0tT9Aoz6abHwGA5IE4RzGHhpgDl9A9Q8lOuovVW6lvIOA8bQaljNO/6J/NoyxmHX+hD
	Sx3owClgxkGp5Q9okLoIXEjYKb6tN9YOkbzHKaiIk/qkj9G4qStmR53/ijX6r1xKIfwpoOL8ubDyU
	hguG2ilMuEjlU0ZpHGjEJoS7J4cegFeiXeE0aswGvGYSAb7EQ5UzQrKUeHutkBUUdaAUFXrausoT7
	4UrHy4fyxE1nvlcxduJ3ag==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40306 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQqgP-00000003PmN-0HWP;
	Wed, 11 Nov 2026 00:05:01 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Subject: [PATCH 08/10] hwmon: (max197) Remove driver
Date: Tue, 10 Nov 2026 10:34:31 -0800
Message-ID: <20261110183434.181711-9-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110183434.181711-1-linux@roeck-us.net>
References: <20261110183434.181711-1-linux@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQqgP-00000003PmN-0HWP
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40306
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 24
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPzGpKr6g5SUOqhxSnGa379PMB6FtMs0i8dLURBTAbJICQMMZ0CH12BkFUcxYg7dvn+vH152nU7454D2DRYhyibC0wabOKN5jzcRRp+Wyt4BorGJrife
 5yjxsCeI0GEezo85HpaKG0MYRYvg9hOg29SKlNkKgSnNl2VZxXZDP4yfILXJr0ypXJX2FpMPQA5EQflR+VnVQtSBIzKMHs7Nv7fZLGI21Y884SX2/lqkL6KY

The max197 driver requires platform data providing a convert() callback
function pointer and fails to probe without it. No in-tree platform ever
instantiates max197 or supplies struct max197_platform_data, and there
is no alternative mechanism to access the chip.

Remove the unused driver, its platform_data header file, Kconfig/Makefile
entries, and documentation.

Cc: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/index.rst        |   1 -
 Documentation/hwmon/max197.rst       |  70 ------
 drivers/hwmon/Kconfig                |   9 -
 drivers/hwmon/Makefile               |   1 -
 drivers/hwmon/max197.c               | 341 ---------------------------
 include/linux/platform_data/max197.h |  23 --
 6 files changed, 445 deletions(-)
 delete mode 100644 Documentation/hwmon/max197.rst
 delete mode 100644 drivers/hwmon/max197.c
 delete mode 100644 include/linux/platform_data/max197.h

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 7ce1a6f42ddc..e364e051457f 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -168,7 +168,6 @@ Hardware Monitoring Kernel Drivers
    max16601
    max1668
    max17616
-   max197
    max20730
    max20751
    max20826
diff --git a/Documentation/hwmon/max197.rst b/Documentation/hwmon/max197.rst
deleted file mode 100644
index 00e16056823f..000000000000
--- a/Documentation/hwmon/max197.rst
+++ /dev/null
@@ -1,70 +0,0 @@
-Kernel driver max197
-====================
-
-Author:
-
-  * Vivien Didelot <vivien.didelot@savoirfairelinux.com>
-
-Supported chips:
-
-  * Maxim MAX197
-
-    Prefix: 'max197'
-
-    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX197.pdf
-
-  * Maxim MAX199
-
-    Prefix: 'max199'
-
-    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/MAX199.pdf
-
-Description
------------
-
-The A/D converters MAX197, and MAX199 are both 8-Channel, Multi-Range, 5V,
-12-Bit DAS with 8+4 Bus Interface and Fault Protection.
-
-The available ranges for the MAX197 are {0,-5V} to 5V, and {0,-10V} to 10V,
-while they are {0,-2V} to 2V, and {0,-4V} to 4V on the MAX199.
-
-Platform data
--------------
-
-The MAX197 platform data (defined in linux/platform_data/max197.h) should be
-filled with a pointer to a conversion function, defined like::
-
-    int convert(u8 ctrl);
-
-ctrl is the control byte to write to start a new conversion.
-On success, the function must return the 12-bit raw value read from the chip,
-or a negative error code otherwise.
-
-Control byte format:
-
-======= ========== ============================================
-Bit     Name       Description
-7,6     PD1,PD0    Clock and Power-Down modes
-5       ACQMOD     Internal or External Controlled Acquisition
-4       RNG        Full-scale voltage magnitude at the input
-3       BIP        Unipolar or Bipolar conversion mode
-2,1,0   A2,A1,A0   Channel
-======= ========== ============================================
-
-Sysfs interface
----------------
-
-  ============== ==============================================================
-  in[0-7]_input  The conversion value for the corresponding channel.
-		 RO
-
-  in[0-7]_min    The lower limit (in mV) for the corresponding channel.
-		 For the MAX197, it will be adjusted to -10000, -5000, or 0.
-		 For the MAX199, it will be adjusted to -4000, -2000, or 0.
-		 RW
-
-  in[0-7]_max    The higher limit (in mV) for the corresponding channel.
-		 For the MAX197, it will be adjusted to 0, 5000, or 10000.
-		 For the MAX199, it will be adjusted to 0, 2000, or 4000.
-		 RW
-  ============== ==============================================================
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 9979958a59a2..1612a408c287 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1342,15 +1342,6 @@ config SENSORS_MAX1668
 	  This driver can also be built as a module. If so, the module
 	  will be called max1668.
 
-config SENSORS_MAX197
-	tristate "Maxim MAX197 and compatibles"
-	help
-	  Support for the Maxim MAX197 A/D converter.
-	  Support will include, but not be limited to, MAX197, and MAX199.
-
-	  This driver can also be built as a module. If so, the module
-	  will be called max197.
-
 config SENSORS_MAX31722
 	tristate "MAX31722 temperature sensor"
 	depends on SPI
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index ec4b0de8cf47..56776df17cfd 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -164,7 +164,6 @@ obj-$(CONFIG_SENSORS_MAX127)	+= max127.o
 obj-$(CONFIG_SENSORS_MAX16065)	+= max16065.o
 obj-$(CONFIG_SENSORS_MAX1619)	+= max1619.o
 obj-$(CONFIG_SENSORS_MAX1668)	+= max1668.o
-obj-$(CONFIG_SENSORS_MAX197)	+= max197.o
 obj-$(CONFIG_SENSORS_MAX31722)	+= max31722.o
 obj-$(CONFIG_SENSORS_MAX31730)	+= max31730.o
 obj-$(CONFIG_SENSORS_MAX31760)  += max31760.o
diff --git a/drivers/hwmon/max197.c b/drivers/hwmon/max197.c
deleted file mode 100644
index a613abfdc2db..000000000000
--- a/drivers/hwmon/max197.c
+++ /dev/null
@@ -1,341 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Maxim MAX197 A/D Converter driver
- *
- * Copyright (c) 2012 Savoir-faire Linux Inc.
- *          Vivien Didelot <vivien.didelot@savoirfairelinux.com>
- *
- * For further information, see the Documentation/hwmon/max197.rst file.
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/err.h>
-#include <linux/slab.h>
-#include <linux/mutex.h>
-#include <linux/device.h>
-#include <linux/sysfs.h>
-#include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
-#include <linux/platform_device.h>
-#include <linux/platform_data/max197.h>
-
-#define MAX199_LIMIT	4000		/* 4V */
-#define MAX197_LIMIT	10000		/* 10V */
-
-#define MAX197_NUM_CH	8		/* 8 Analog Input Channels */
-
-/* Control byte format */
-#define MAX197_BIP	(1 << 3)	/* Bipolarity */
-#define MAX197_RNG	(1 << 4)	/* Full range */
-
-#define MAX197_SCALE	12207		/* Scale coefficient for raw data */
-
-/* List of supported chips */
-enum max197_chips { max197, max199 };
-
-/**
- * struct max197_data - device instance specific data
- * @pdata:		Platform data.
- * @hwmon_dev:		The hwmon device.
- * @lock:		Read/Write mutex.
- * @limit:		Max range value (10V for MAX197, 4V for MAX199).
- * @scale:		Need to scale.
- * @ctrl_bytes:		Channels control byte.
- */
-struct max197_data {
-	struct max197_platform_data *pdata;
-	struct device *hwmon_dev;
-	struct mutex lock;
-	int limit;
-	bool scale;
-	u8 ctrl_bytes[MAX197_NUM_CH];
-};
-
-static inline void max197_set_unipolarity(struct max197_data *data, int channel)
-{
-	data->ctrl_bytes[channel] &= ~MAX197_BIP;
-}
-
-static inline void max197_set_bipolarity(struct max197_data *data, int channel)
-{
-	data->ctrl_bytes[channel] |= MAX197_BIP;
-}
-
-static inline void max197_set_half_range(struct max197_data *data, int channel)
-{
-	data->ctrl_bytes[channel] &= ~MAX197_RNG;
-}
-
-static inline void max197_set_full_range(struct max197_data *data, int channel)
-{
-	data->ctrl_bytes[channel] |= MAX197_RNG;
-}
-
-static inline bool max197_is_bipolar(struct max197_data *data, int channel)
-{
-	return data->ctrl_bytes[channel] & MAX197_BIP;
-}
-
-static inline bool max197_is_full_range(struct max197_data *data, int channel)
-{
-	return data->ctrl_bytes[channel] & MAX197_RNG;
-}
-
-/* Function called on read access on in{0,1,2,3,4,5,6,7}_{min,max} */
-static ssize_t max197_show_range(struct device *dev,
-				 struct device_attribute *devattr, char *buf)
-{
-	struct max197_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(devattr);
-	int channel = attr->index;
-	bool is_min = attr->nr;
-	int range;
-
-	if (mutex_lock_interruptible(&data->lock))
-		return -ERESTARTSYS;
-
-	range = max197_is_full_range(data, channel) ?
-		data->limit : data->limit / 2;
-	if (is_min) {
-		if (max197_is_bipolar(data, channel))
-			range = -range;
-		else
-			range = 0;
-	}
-
-	mutex_unlock(&data->lock);
-
-	return sprintf(buf, "%d\n", range);
-}
-
-/* Function called on write access on in{0,1,2,3,4,5,6,7}_{min,max} */
-static ssize_t max197_store_range(struct device *dev,
-				  struct device_attribute *devattr,
-				  const char *buf, size_t count)
-{
-	struct max197_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute_2 *attr = to_sensor_dev_attr_2(devattr);
-	int channel = attr->index;
-	bool is_min = attr->nr;
-	long value;
-	int half = data->limit / 2;
-	int full = data->limit;
-
-	if (kstrtol(buf, 10, &value))
-		return -EINVAL;
-
-	if (is_min) {
-		if (value <= -full)
-			value = -full;
-		else if (value < 0)
-			value = -half;
-		else
-			value = 0;
-	} else {
-		if (value >= full)
-			value = full;
-		else
-			value = half;
-	}
-
-	if (mutex_lock_interruptible(&data->lock))
-		return -ERESTARTSYS;
-
-	if (value == 0) {
-		/* We can deduce only the polarity */
-		max197_set_unipolarity(data, channel);
-	} else if (value == -half) {
-		max197_set_bipolarity(data, channel);
-		max197_set_half_range(data, channel);
-	} else if (value == -full) {
-		max197_set_bipolarity(data, channel);
-		max197_set_full_range(data, channel);
-	} else if (value == half) {
-		/* We can deduce only the range */
-		max197_set_half_range(data, channel);
-	} else if (value == full) {
-		/* We can deduce only the range */
-		max197_set_full_range(data, channel);
-	}
-
-	mutex_unlock(&data->lock);
-
-	return count;
-}
-
-/* Function called on read access on in{0,1,2,3,4,5,6,7}_input */
-static ssize_t max197_show_input(struct device *dev,
-				 struct device_attribute *devattr,
-				 char *buf)
-{
-	struct max197_data *data = dev_get_drvdata(dev);
-	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
-	int channel = attr->index;
-	s32 value;
-	int ret;
-
-	if (mutex_lock_interruptible(&data->lock))
-		return -ERESTARTSYS;
-
-	ret = data->pdata->convert(data->ctrl_bytes[channel]);
-	if (ret < 0) {
-		dev_err(dev, "conversion failed\n");
-		goto unlock;
-	}
-	value = ret;
-
-	/*
-	 * Coefficient to apply on raw value.
-	 * See Table 1. Full Scale and Zero Scale in the MAX197 datasheet.
-	 */
-	if (data->scale) {
-		value *= MAX197_SCALE;
-		if (max197_is_full_range(data, channel))
-			value *= 2;
-		value /= 10000;
-	}
-
-	ret = sprintf(buf, "%d\n", value);
-
-unlock:
-	mutex_unlock(&data->lock);
-	return ret;
-}
-
-static ssize_t name_show(struct device *dev, struct device_attribute *attr,
-			 char *buf)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-	return sprintf(buf, "%s\n", pdev->name);
-}
-
-#define MAX197_SENSOR_DEVICE_ATTR_CH(chan)				\
-	static SENSOR_DEVICE_ATTR(in##chan##_input, S_IRUGO,		\
-				  max197_show_input, NULL, chan);	\
-	static SENSOR_DEVICE_ATTR_2(in##chan##_min, S_IRUGO | S_IWUSR,	\
-				    max197_show_range,			\
-				    max197_store_range,			\
-				    true, chan);			\
-	static SENSOR_DEVICE_ATTR_2(in##chan##_max, S_IRUGO | S_IWUSR,	\
-				    max197_show_range,			\
-				    max197_store_range,			\
-				    false, chan)
-
-#define MAX197_SENSOR_DEV_ATTR_IN(chan)					\
-	&sensor_dev_attr_in##chan##_input.dev_attr.attr,		\
-	&sensor_dev_attr_in##chan##_max.dev_attr.attr,			\
-	&sensor_dev_attr_in##chan##_min.dev_attr.attr
-
-static DEVICE_ATTR_RO(name);
-
-MAX197_SENSOR_DEVICE_ATTR_CH(0);
-MAX197_SENSOR_DEVICE_ATTR_CH(1);
-MAX197_SENSOR_DEVICE_ATTR_CH(2);
-MAX197_SENSOR_DEVICE_ATTR_CH(3);
-MAX197_SENSOR_DEVICE_ATTR_CH(4);
-MAX197_SENSOR_DEVICE_ATTR_CH(5);
-MAX197_SENSOR_DEVICE_ATTR_CH(6);
-MAX197_SENSOR_DEVICE_ATTR_CH(7);
-
-static const struct attribute_group max197_sysfs_group = {
-	.attrs = (struct attribute *[]) {
-		&dev_attr_name.attr,
-		MAX197_SENSOR_DEV_ATTR_IN(0),
-		MAX197_SENSOR_DEV_ATTR_IN(1),
-		MAX197_SENSOR_DEV_ATTR_IN(2),
-		MAX197_SENSOR_DEV_ATTR_IN(3),
-		MAX197_SENSOR_DEV_ATTR_IN(4),
-		MAX197_SENSOR_DEV_ATTR_IN(5),
-		MAX197_SENSOR_DEV_ATTR_IN(6),
-		MAX197_SENSOR_DEV_ATTR_IN(7),
-		NULL
-	},
-};
-
-static int max197_probe(struct platform_device *pdev)
-{
-	int ch, ret;
-	struct max197_data *data;
-	struct max197_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	enum max197_chips chip = platform_get_device_id(pdev)->driver_data;
-
-	if (pdata == NULL) {
-		dev_err(&pdev->dev, "no platform data supplied\n");
-		return -EINVAL;
-	}
-
-	if (pdata->convert == NULL) {
-		dev_err(&pdev->dev, "no convert function supplied\n");
-		return -EINVAL;
-	}
-
-	data = devm_kzalloc_obj(&pdev->dev, struct max197_data);
-	if (!data)
-		return -ENOMEM;
-
-	data->pdata = pdata;
-	mutex_init(&data->lock);
-
-	if (chip == max197) {
-		data->limit = MAX197_LIMIT;
-		data->scale = true;
-	} else {
-		data->limit = MAX199_LIMIT;
-		data->scale = false;
-	}
-
-	for (ch = 0; ch < MAX197_NUM_CH; ch++)
-		data->ctrl_bytes[ch] = (u8) ch;
-
-	platform_set_drvdata(pdev, data);
-
-	ret = sysfs_create_group(&pdev->dev.kobj, &max197_sysfs_group);
-	if (ret) {
-		dev_err(&pdev->dev, "sysfs create group failed\n");
-		return ret;
-	}
-
-	data->hwmon_dev = hwmon_device_register(&pdev->dev);
-	if (IS_ERR(data->hwmon_dev)) {
-		ret = PTR_ERR(data->hwmon_dev);
-		dev_err(&pdev->dev, "hwmon device register failed\n");
-		goto error;
-	}
-
-	return 0;
-
-error:
-	sysfs_remove_group(&pdev->dev.kobj, &max197_sysfs_group);
-	return ret;
-}
-
-static void max197_remove(struct platform_device *pdev)
-{
-	struct max197_data *data = platform_get_drvdata(pdev);
-
-	hwmon_device_unregister(data->hwmon_dev);
-	sysfs_remove_group(&pdev->dev.kobj, &max197_sysfs_group);
-}
-
-static const struct platform_device_id max197_device_ids[] = {
-	{ .name = "max197", .driver_data = max197 },
-	{ .name = "max199", .driver_data = max199 },
-	{ }
-};
-MODULE_DEVICE_TABLE(platform, max197_device_ids);
-
-static struct platform_driver max197_driver = {
-	.driver = {
-		.name = "max197",
-	},
-	.probe = max197_probe,
-	.remove = max197_remove,
-	.id_table = max197_device_ids,
-};
-module_platform_driver(max197_driver);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Savoir-faire Linux Inc. <kernel@savoirfairelinux.com>");
-MODULE_DESCRIPTION("Maxim MAX197 A/D Converter driver");
diff --git a/include/linux/platform_data/max197.h b/include/linux/platform_data/max197.h
deleted file mode 100644
index 03ef46f9cd65..000000000000
--- a/include/linux/platform_data/max197.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Maxim MAX197 A/D Converter Driver
- *
- * Copyright (c) 2012 Savoir-faire Linux Inc.
- *          Vivien Didelot <vivien.didelot@savoirfairelinux.com>
- *
- * For further information, see the Documentation/hwmon/max197.rst file.
- */
-
-#ifndef _PDATA_MAX197_H
-#define _PDATA_MAX197_H
-
-/**
- * struct max197_platform_data - MAX197 connectivity info
- * @convert:	Function used to start a conversion with control byte ctrl.
- *		It must return the raw data, or a negative error code.
- */
-struct max197_platform_data {
-	int (*convert)(u8 ctrl);
-};
-
-#endif /* _PDATA_MAX197_H */
-- 
2.45.2

