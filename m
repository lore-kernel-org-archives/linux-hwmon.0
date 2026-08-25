Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656903EDAA3
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787649961; cv=none; b=F26RaUXY8RaPYVoBw1sre9MzoSkiTEShcezVSJU5vNqLI37PG+X1CmEArA5JEGEY7EDy/2cRFtQ60FQcQqkThwNkNWxyjAv3bgjbER2YS7BWwd5rIQVJNApXIPhDpuoA19vEedxHirjmeBNi3axlPYnpk25oMs0+2chu5VhRxPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787649961; c=relaxed/simple;
	bh=2anvQFVPfCyDPhPtMpfhIbGCje2Q1JFv4wsSV1RIuZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mFDS0WthmwSSk2HOoN6fW87p7CA7l6rI/PQ9tV2+e9ZaxKRFyGY6LYhV4dplqrhtlnjpVCNnzjP+WLeP24gMfck7iUrE4Xyc5gRmgxdPaAG+a3g3EpYgRJqAP3R8g8z2tlKHQutBUmQC9VQ06wQwtHCuH3JPDQYcx3Y/lVk4nKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gO8/Ha2f; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gO8/Ha2f"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c214e625259so680570166b.2
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 02:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787649957; x=1788254757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A94qe2JMzOXhdD0NYjSSk1XRZc3aGtD4hUgwzwZIA0U=;
        b=gO8/Ha2fkHHtn4P65jMFZoMsgPmTZ4q9CeBBj9vzqzxHyM4OkSWqYeOSeXiH3P0Rdz
         MJFsm8N0p9DG5TcMteWg7lZdAnmRJ8XAkIy5ozqVXdE5QvpkgKI5FrY+AsFYo7ALiNLq
         G1lJDa2IFtj9JX0ZndYDfHT6fDdKF6tAMywW3eCVV7R+FgLoP3hMfFe83Mv4x5vHaKiL
         O9+TdnN6h4S7/DW8of+904QmMQ5Ry3Mt2zVFBfB3v6JH/jUjFfZjWknoAYAeiwDH0J8o
         UeFkPtZ7mY4sDgVENh07fW/SurCrkIHBYLYxCnoIVYY8ZOMGAqZyj5JJhqWaeB8tZ9tv
         nyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787649957; x=1788254757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A94qe2JMzOXhdD0NYjSSk1XRZc3aGtD4hUgwzwZIA0U=;
        b=pO/wcMSjTtmMpOe0Jz8M3BeoTjQO7/cLV6zaXiEjseklLPy9q0DItqH804Mau001nl
         qwBTCSDvHW0OjuMYFmZKD6z4a5017UuT1C1vXlVws5zG9ySAwU49GDFgE/kPfNwYAPNV
         bCsdxuE5FtLAiWWDFFV6ptuTB4m9HyY1Wgm77/SU19NnX8sG3+MuQ2hMaFzy56JO3I8I
         e5BDeQHh52RhRnQSYltyfUS7UXorOlqG/HovngZb8fWFp0gJFrO/i5qzKnl45588978M
         E6prhd9Ge3B4U3/WGwCdfJRPxKaC5hX3x480eaYivRrUDojtguyurKDrU3XQb8zXFbO1
         d7wQ==
X-Gm-Message-State: AFuF++nWLwwYeUIGSGNruHI1vgheYJODxqa26mv5InJgZzoree9x7sjg
	pMOcv2YuueVBgvR/VAekNoRPTB/ICizBLR6pIrtfWoWAbwXbD3jmbTNF
X-Gm-Gg: AR+sD109HF/yd1DSEGLOU45VwHNDQjVIdTj9cxte0RwABfxYSmBSewfauT6ukRqqVsq
	aa/jhkyq9apI+IK21O50EmOwt5K35NwqE+yx5AnmG2JfqweR8JxQOu894GoTdenod33UQnoGKst
	pzmLNjcEN6Lp1ndIwH5PV8W6Dxv7NnxvKzJUjD5KPMOk+/094Dbh7/WfTn0OWPdI82fAxsQYYjl
	YTlbeF9cAyPQXH3x17UNtrVgtp9I3LnVxvIy6hckyUClKIUe7oplzrU/Em60G+XiGn6w/ys9vPd
	8Wso/qRTX2/9u4uWYmKsvog5mphZGppS1C4quXjQiG4FejMby56mqJUz5hSk+n5/Yj6P1dz7zZi
	MNhHuEp0iD64mwx3XFiJMiPuWT8/KKs4iv3ipy1SmwOjlysOVPOyphKNyP1Aj4skOGEHRaMC9xH
	x8xgKpcp1/9uoXttz1XtvI6bPx+tfheqEb4qUbnaxwXgLWtiBGpbyCGSMCQjOCBg0AgiPpwpKpA
	3NZ73MftPFMZJtjrSl0RC7Ls+ir/UDBwwq+IAU7bf9gZQkIUUtq5LPF6C1QMfPg/hWCjTuYKBQb
	yeqfR7n1Sm8WXBds/E4ZBCs=
X-Received: by 2002:a17:907:1ca7:b0:c20:33db:41d3 with SMTP id a640c23a62f3a-c24e5ade69dmr575868666b.11.1787649957161;
        Tue, 25 Aug 2026 02:25:57 -0700 (PDT)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606bd05sm1612570866b.2.2026.08.25.02.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:25:56 -0700 (PDT)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH 3/5] hwmon: (nct6683) Add pwm[1-8]_enable
Date: Tue, 25 Aug 2026 11:25:44 +0200
Message-ID: <20260825092546.669450-4-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825092546.669450-1-jdahlin@gmail.com>
References: <20260825092546.669450-1-jdahlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NCT668x keeps a per-fan manual-control bitmap in register 0xa00. While a
fan's bit is clear the EC runs its own control loop and ignores the pwm
registers, so a pwm write succeeds and then has no effect on the fan.

Expose the bitmap as pwm[1-8]_enable following the hwmon ABI, with 1 for
manual control and 2 for the EC's automatic control. The attribute group
now has two attributes per channel, so is_visible derives the channel from
the attribute index.

Intel boards run a firmware variant that Nuvoton confirms uses different
register addresses, so 0xa00 cannot be assumed to mean the same thing
there. Only expose the attribute where fan control has been verified.

The register was derived from the out-of-tree nct6687d driver, which
documents it from LibreHardwareMonitor's reverse engineering.

Link: https://github.com/Fred78290/nct6687d
Link: https://github.com/LibreHardwareMonitor/LibreHardwareMonitor
Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
---
 Documentation/hwmon/nct6683.rst |  6 +++
 drivers/hwmon/nct6683.c         | 77 +++++++++++++++++++++++++++++++--
 2 files changed, 79 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index 908c0b10c642..ff5edb34c5c5 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -49,6 +49,12 @@ The driver has only been tested with the Intel firmware, and by default
 only instantiates on Intel boards. To enable it on non-Intel boards,
 set the 'force' module parameter to 1.
 
+Fan control is likewise restricted. The EC runs its own control loop unless
+a fan is switched to manual mode by writing 1 to its pwm[1-8]_enable
+attribute, and pwm values are only writable on boards where this has been
+verified to work. On all other boards the pwm attributes are read-only and
+the fan curve must be configured from the BIOS.
+
 Tested Boards and Firmware Versions
 -----------------------------------
 
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index b43e915f9d0f..0324ace707a5 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -165,6 +165,7 @@ superio_exit(int ioreg)
 
 #define NCT6683_REG_FAN_MIN(x)		(0x3b8 + (x) * 2)	/* 16 bit */
 
+#define NCT6683_REG_FAN_CTRL_MODE	0xa00
 #define NCT6683_REG_FAN_CFG_CTRL	0xa01
 #define NCT6683_FAN_CFG_REQ		0x80
 #define NCT6683_FAN_CFG_DONE		0x40
@@ -962,25 +963,93 @@ store_pwm(struct device *dev, struct device_attribute *attr, const char *buf,
 
 SENSOR_TEMPLATE(pwm, "pwm%d", S_IRUGO, show_pwm, store_pwm, 0);
 
+/*
+ * Fan control has only been verified on the boards listed here. Intel boards
+ * in particular run a firmware variant that Nuvoton confirms uses different
+ * register addresses, so 0xa00 cannot be assumed to mean the same thing
+ * there. Leave the fans to the EC everywhere else.
+ */
+static bool nct6683_has_fan_control(struct nct6683_data *data)
+{
+	return data->customer_id == NCT6683_CUSTOMER_ID_MITAC;
+}
+
+/*
+ * NCT668x keeps a per-fan manual-control bitmap. While a fan's bit is clear
+ * the EC runs its own control loop and ignores the pwm registers, so pwm
+ * writes only take effect once the fan has been switched to manual mode.
+ */
+static ssize_t
+show_pwm_enable(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct nct6683_data *data = dev_get_drvdata(dev);
+	u8 mode;
+
+	mutex_lock(&data->update_lock);
+	mode = nct6683_read(data, NCT6683_REG_FAN_CTRL_MODE);
+	mutex_unlock(&data->update_lock);
+
+	return sysfs_emit(buf, "%d\n", (mode & BIT(sattr->index)) ? 1 : 2);
+}
+
+static ssize_t
+store_pwm_enable(struct device *dev, struct device_attribute *attr,
+		 const char *buf, size_t count)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct nct6683_data *data = dev_get_drvdata(dev);
+	u8 bit = BIT(sattr->index);
+	unsigned long val;
+	bool manual;
+	int err = 0;
+	u8 mode;
+
+	if (kstrtoul(buf, 10, &val) || (val != 1 && val != 2))
+		return -EINVAL;
+
+	manual = val == 1;
+
+	mutex_lock(&data->update_lock);
+	mode = nct6683_read(data, NCT6683_REG_FAN_CTRL_MODE);
+	if (manual)
+		mode |= bit;
+	else
+		mode &= ~bit;
+	nct6683_write(data, NCT6683_REG_FAN_CTRL_MODE, mode);
+
+	if (!!(nct6683_read(data, NCT6683_REG_FAN_CTRL_MODE) & bit) != manual)
+		err = -EIO;
+	mutex_unlock(&data->update_lock);
+
+	return err ? err : count;
+}
+
+SENSOR_TEMPLATE(pwm_enable, "pwm%d_enable", 0444, show_pwm_enable,
+		store_pwm_enable, 0);
+
 static umode_t nct6683_pwm_is_visible(struct kobject *kobj,
 				      struct attribute *attr, int index)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct nct6683_data *data = dev_get_drvdata(dev);
-	int pwm = index;	/* pwm index */
+	int pwm = index / 2;	/* pwm index */
+	int nr = index % 2;	/* attribute index */
 
 	if (!(data->have_pwm & (1 << pwm)))
 		return 0;
 
-	/* Only update pwm values for Mitac boards */
-	if (data->customer_id == NCT6683_CUSTOMER_ID_MITAC)
+	/* Only touch fan control on boards where it has been verified */
+	if (nct6683_has_fan_control(data))
 		return attr->mode | S_IWUSR;
 
-	return attr->mode;
+	/* Elsewhere hide pwm_enable and keep pwm read-only */
+	return nr ? 0 : attr->mode;
 }
 
 static struct sensor_device_template *nct6683_attributes_pwm_template[] = {
 	&sensor_dev_template_pwm,
+	&sensor_dev_template_pwm_enable,
 	NULL
 };
 
-- 
2.53.0

