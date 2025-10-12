Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA902264CF
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 21:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760303794; cv=none; b=Ii+cGN26+8Jz+JzHw7nWfJ0dEUfas/Mpl3OepuVYpBbGt0Z9O0npGkYvi2gXHr9es9iOVtiY8Dv/tHoJqbma29lVR9jMzbUx7FY8jy7IedvlophpDaOA4Rgql+Pz+aKbK41QLid0hLCfmKGW9f1H4Iu6KKAp2CgAq8WhymHzQtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760303794; c=relaxed/simple;
	bh=JaY03Bn6wvVwa2aqwScz8NbNsbg7Ohu9S8hNbUk97cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EwTvI7/vEIoCiKQD5W512aD9W0kL/rM3xPGVOJSVyhZk5aj8A6scbv07K6T1mgFKHElD/9VVrUVV7WPE64KUk1bz//w2GbEVN0SMfG2dg9yW9LKv9vvQUQ2ZZMiz2Yb3vxWBE7ORV6TN3ha+YJy4ffGAVPoJt9LkgTtDl67Myxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZA4RQy+; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZA4RQy+"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77f1f29a551so4634880b3a.3
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 14:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760303791; x=1760908591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bTuKC68ffrgAV8+KSmdGXA7zdrg52yQN6pRT//rpug=;
        b=lZA4RQy+Fm3GEBhjGzZbInHA0KW/KSdUXufxSVyqNCwlL5PC0/uA53qHno4Q/GN9La
         NFc4qJ+QK3IVujrIgtJNSygcPrsW2D+nkGoo7l7R8dkiRdQYClZqUdUgg3I5rZU/qsd4
         gjij3iqrDVn9SvI6pz2aujxBY2i3Ggd53wgjvgu8rUOWCCKObowWrdAOkJkule6XaEU7
         vVrJlKT6uEfoiqyyecTZ7A282kR5Vs+EoAoDbhnWCFXiBPxanXa0QNafVo25F/ftgTYH
         jeRohwbOz2bUFjl2wWamb6wnURwvdo9aQFH4Mb8yz1QYmR8q5IAP0OSWhv/lZPbsjm4x
         rvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760303791; x=1760908591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7bTuKC68ffrgAV8+KSmdGXA7zdrg52yQN6pRT//rpug=;
        b=ZWgoHA5XB369A6FA4niLd/1/zLarOdkTTLC6i/cNcq+eod6QWsqBPceEevXqE6+GzV
         YaqZAs7kwLUmtnu/Us99Av+uuuODb36BrpyO1storQ4EceoBGoecYpb/s+QrfevXnIT+
         Z/6xrm6wtV+PjmyB02k+rMA7nSRYShFKaCXV6ClozpLEKyVOUE6XVIK/u5+pUj01/jYS
         hT7s7D1iuphEFFYBIrLzXEBqjC1JOkJ6roIaXDZMQe+wMmdIf3R1QORNzTGyb5wIehHM
         xdF3SxB9jl58MWJHyB+zBE4x0zALDWonMERL+h3Z68OGmuff3qHHPp6eQhzXwdO7H4Qo
         TYyA==
X-Gm-Message-State: AOJu0Yw1olor6JKowgC9JtpNRsdOGHEtOeMj9bnMFoDeXBwsAUlAlLBI
	i6ZwZFRReZ/OvJeiaio1eI1VmISvNQvYW2hhICWEIJZOxOo2jfdoaG1OQbQSjQ==
X-Gm-Gg: ASbGncu8f4QuqqhCjcuAcu2xxuXx1TVKPhFcRoC8WRTkwN5tMqnW7VrCLeeBv+eExcw
	CBwnR696zk8MUahFIVwbXqe0oI+yVb/uY6++MJcYQ6xNxY2lRjDiLfZn9saOwmtHMAjh/2OXALU
	usZitBKN/q8vrdEEaOMHEC13Cnk+AqZf9F1OjGK/9E6xtTjqlixmAGn4gTcA5Edncv3elsFT22U
	zefFTrSdwrW5ib9bjib+7zwgOacWWe4f12AQMj0K3cI7va6t2/NXP3MbirU5IYQhDDIQZ3xbaik
	TAX86Kv52hpTaoQSbqfIaIPbGMo4TMBtS9NsSxSEYgtPlQRdKI5sCGkTsDIODzYmauX4wL6aUXY
	zRkKv9n1aHzEcjDQPCr83RTaza1pyFRCkekoahg5z0IqjKYps3YVfDIl6h31104fU
X-Google-Smtp-Source: AGHT+IExdZ5K08sLpVsZOf8ErdaKoSZgrmYk9w/Q2bIazpAA5JTiCOfPK0+ZezhBjzXr+LnhxuJYuA==
X-Received: by 2002:a05:6a00:179a:b0:77f:11bd:749a with SMTP id d2e1a72fcca58-7938723b2acmr18988824b3a.20.1760303791249;
        Sun, 12 Oct 2025 14:16:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-799283c1a14sm9416287b3a.0.2025.10.12.14.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 14:16:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/2] hwmon: (ltc4282) Use the energy64 attribute type to report the energy
Date: Sun, 12 Oct 2025 14:16:25 -0700
Message-ID: <20251012211625.533791-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251012211625.533791-1-linux@roeck-us.net>
References: <20251012211625.533791-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the energy64 attribute type instead of a locally defined sysfs
attribute to report the accumulated energy.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ltc4282.c | 44 ++++++++++++-----------------------------
 1 file changed, 13 insertions(+), 31 deletions(-)

diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
index 1d664a2d7b3c..44102879694a 100644
--- a/drivers/hwmon/ltc4282.c
+++ b/drivers/hwmon/ltc4282.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/i2c.h>
 #include <linux/math.h>
 #include <linux/minmax.h>
@@ -541,7 +540,7 @@ static int ltc4282_read_power_byte(const struct ltc4282_state *st, u32 reg,
 	return 0;
 }
 
-static int ltc4282_read_energy(const struct ltc4282_state *st, u64 *val)
+static int ltc4282_read_energy(const struct ltc4282_state *st, s64 *val)
 {
 	u64 temp, energy;
 	__be64 raw;
@@ -617,6 +616,12 @@ static int ltc4282_read(struct device *dev, enum hwmon_sensor_types type,
 			*val = st->energy_en;
 		}
 		return 0;
+	case hwmon_energy64:
+		scoped_guard(mutex, &st->lock) {
+			if (st->energy_en)
+				return ltc4282_read_energy(st, (s64 *)val);
+		}
+		return -ENODATA;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -1078,6 +1083,9 @@ static umode_t ltc4282_is_visible(const void *data,
 	case hwmon_energy:
 		/* hwmon_energy_enable */
 		return 0644;
+	case hwmon_energy64:
+		/* hwmon_energy_input */
+		return 0444;
 	default:
 		return 0;
 	}
@@ -1106,24 +1114,6 @@ static int ltc4282_read_labels(struct device *dev,
 	}
 }
 
-static ssize_t ltc4282_energy_show(struct device *dev,
-				   struct device_attribute *da, char *buf)
-{
-	struct ltc4282_state *st = dev_get_drvdata(dev);
-	u64 energy;
-	int ret;
-
-	guard(mutex)(&st->lock);
-	if (!st->energy_en)
-		return -ENODATA;
-
-	ret = ltc4282_read_energy(st, &energy);
-	if (ret < 0)
-		return ret;
-
-	return sysfs_emit(buf, "%llu\n", energy);
-}
-
 static const struct clk_ops ltc4282_ops = {
 	.recalc_rate = ltc4282_recalc_rate,
 	.determine_rate = ltc4282_determine_rate,
@@ -1588,6 +1578,8 @@ static const struct hwmon_channel_info * const ltc4282_info[] = {
 			   HWMON_P_RESET_HISTORY | HWMON_P_LABEL),
 	HWMON_CHANNEL_INFO(energy,
 			   HWMON_E_ENABLE),
+	HWMON_CHANNEL_INFO(energy64,
+			   HWMON_E_INPUT),
 	NULL
 };
 
@@ -1603,15 +1595,6 @@ static const struct hwmon_chip_info ltc4282_chip_info = {
 	.info = ltc4282_info,
 };
 
-/* energy attributes are 6bytes wide so we need u64 */
-static SENSOR_DEVICE_ATTR_RO(energy1_input, ltc4282_energy, 0);
-
-static struct attribute *ltc4282_attrs[] = {
-	&sensor_dev_attr_energy1_input.dev_attr.attr,
-	NULL
-};
-ATTRIBUTE_GROUPS(ltc4282);
-
 static int ltc4282_show_fault_log(void *arg, u64 *val, u32 mask)
 {
 	struct ltc4282_state *st = arg;
@@ -1718,8 +1701,7 @@ static int ltc4282_probe(struct i2c_client *i2c)
 
 	mutex_init(&st->lock);
 	hwmon = devm_hwmon_device_register_with_info(dev, "ltc4282", st,
-						     &ltc4282_chip_info,
-						     ltc4282_groups);
+						     &ltc4282_chip_info, NULL);
 	if (IS_ERR(hwmon))
 		return PTR_ERR(hwmon);
 
-- 
2.45.2

