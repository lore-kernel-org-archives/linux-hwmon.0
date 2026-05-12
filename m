Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227DB1E49F
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 04:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778559513; cv=none; b=qoDg9V0FXIc9nNqdXby1x3b8oenO0xPCPSHHqHdaN8LMWd0qIr99eJ3TrIpI+lS6/+a4uOWzMVi1dbqj+BAgHYVxjfaBSFQBARgoIiT8LO9u5vy0tIn+IDoWJPnsqLVVeoq5lt3ixyCK//wGUlMNmHSykKvzL9kRrkGnlYCHBnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778559513; c=relaxed/simple;
	bh=wmEhwYBrvTo3rJxVF5c4cFc9mwGJ04+s3Swr8pg7Y7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gdm0rm9ihZCmtSE7N+WG25yyv1uodOS1TDGglVJwHE/4xN1LaciboxHk2IZwZGr9zK6t80SJD5CKQ4iwD0G1Ee40WRs9sa5ilR2Fm5GFHYu2RgJqVAgv+izAPyo78cMiFLhPxpdZMcc1dkV13QPkNDZgFJIFkBQDS4LbBg7E7Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=IqlqYM11; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="IqlqYM11"
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9BB2A2C012E;
	Tue, 12 May 2026 16:18:28 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1778559508;
	bh=0t0Ua3EBvWAFWh8vr+gC+iI44t30654i2d3xDYYAFtc=;
	h=From:To:Cc:Subject:Date:From;
	b=IqlqYM11Os81kEDx9+l7+1M4vWb96d78CiMqLhg4jKxkpa5YflI5JZ2KK1lMIwFqx
	 LXYQQQnIm5SicBnYDmGDv8oCNE9MNAbBKJZB9OhL40/+ZDsi9rVO/VhCFJq/4WZXeb
	 fXpD44wfhR+hajuDaiiS7AG9X/9JZV7kqqpOGah6T2yoLPLdyxdE+akifV6wnG2lL9
	 U03/wQUfxam+eewQtHopFvqK8GGjfrQorao4FggPS7tmwHULeL6FX4ieywwJxTM8WX
	 /+DoLh3tixfZeByZwCGM/Ob47vCyt0F6i9lyWfkCeHbt7wNkXp3CwYQukbtE9qaRs+
	 EnEqzMJ59acKg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a02aa140000>; Tue, 12 May 2026 16:18:28 +1200
Received: from ronand-dl.ws.atlnz.lc (ronand-dl.ws.atlnz.lc [10.33.12.18])
	by pat.atlnz.lc (Postfix) with ESMTP id 6ACCE13ED2A;
	Tue, 12 May 2026 16:18:28 +1200 (NZST)
Received: by ronand-dl.ws.atlnz.lc (Postfix, from userid 1930)
	id 6642D84004F; Tue, 12 May 2026 16:18:28 +1200 (NZST)
From: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
To: linux@roeck-us.net
Cc: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] hwmon: (nct7802) Add time step attributes for tweaking responsiveness
Date: Tue, 12 May 2026 16:15:50 +1200
Message-ID: <20260512041607.988078-2-ronan.dalton@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=FPe4xPos c=1 sm=1 tr=0 ts=6a02aa14 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=YTW7iPMTII0yQG4K03oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nlm17XC03S6CtCLSeiRr:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The nct7802 chip exposes two registers that allow setting the time
interval between successive duty increases or decreases in Smart Fan
mode. The units are intervals of 0.1 second. The default value at power
on is 10, so 1 second.

Add sysfs attributes for step_up_time and step_down_time to allow
controlling the responsiveness of the fan speed. Values are represented
as milliseconds to the user. When set, the value is clamped to the valid
range of 100 to 25500 (0.1 to 25.5 seconds), and rounded to the nearest
multiple of 100.

Signed-off-by: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
Cc: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 Documentation/hwmon/nct7802.rst | 16 ++++++
 drivers/hwmon/nct7802.c         | 91 +++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/Documentation/hwmon/nct7802.rst b/Documentation/hwmon/nct780=
2.rst
index 8b7365a7cb32..366050ea595c 100644
--- a/Documentation/hwmon/nct7802.rst
+++ b/Documentation/hwmon/nct7802.rst
@@ -24,6 +24,22 @@ speed sensors.
=20
 Smart Fan=E2=84=A2 speed control is available via pwmX_auto_point attrib=
utes.
=20
+Sysfs Attributes
+----------------
+
+Sysfs attributes unique to this chip are documented below. For common
+attributes, see Documentation/hwmon/sysfs-interface.rst.
+
+step_up_time
+			Time interval between successive duty cycle increases
+			when in Smart Fan mode. Specified in milliseconds and
+			rounded to intervals of 100 in the range 100-25500.
+
+step_down_time
+			Time interval between successive duty cycle decreases
+			when in Smart Fan mode. Specified in milliseconds and
+			rounded to intervals of 100 in the range 100-25500.
+
 Tested Boards and BIOS Versions
 -------------------------------
=20
diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
index 8c9351da12c6..f30123fd908c 100644
--- a/drivers/hwmon/nct7802.c
+++ b/drivers/hwmon/nct7802.c
@@ -47,6 +47,8 @@ static const u8 REG_VOLTAGE_LIMIT_MSB_SHIFT[2][5] =3D {
 #define REG_PWM(x)		(0x60 + (x))
 #define REG_SMARTFAN_EN(x)      (0x64 + (x) / 2)
 #define SMARTFAN_EN_SHIFT(x)    ((x) % 2 * 4)
+#define REG_SMARTFAN_STEP_UP_TIME	0x6e
+#define REG_SMARTFAN_STEP_DOWN_TIME	0x6f
 #define REG_VENDOR_ID		0xfd
 #define REG_CHIP_ID		0xfe
 #define REG_VERSION_ID		0xff
@@ -560,6 +562,77 @@ beep_store(struct device *dev, struct device_attribu=
te *attr, const char *buf,
 	return err ? : count;
 }
=20
+static ssize_t step_time_show(struct device *dev, struct device_attribut=
e *attr,
+			      char *buf, bool step_up)
+{
+	struct nct7802_data *data =3D dev_get_drvdata(dev);
+	unsigned int reg, val;
+	int ret;
+
+	if (step_up)
+		reg =3D REG_SMARTFAN_STEP_UP_TIME;
+	else
+		reg =3D REG_SMARTFAN_STEP_DOWN_TIME;
+
+	ret =3D regmap_read(data->regmap, reg, &val);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%u\n", val * 100); /* Convert from ds to ms */
+}
+
+static ssize_t step_up_time_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	return step_time_show(dev, attr, buf, true);
+}
+
+static ssize_t step_down_time_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	return step_time_show(dev, attr, buf, false);
+}
+
+static ssize_t step_time_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count, bool step_up)
+{
+	struct nct7802_data *data =3D dev_get_drvdata(dev);
+	unsigned long val;
+	unsigned int reg;
+	int ret;
+
+	ret =3D kstrtoul(buf, 0, &val);
+	if (ret < 0)
+		return ret;
+
+	/* Clamp range, and convert from ms to ds */
+	val =3D DIV_ROUND_CLOSEST(clamp_val(val, 100, 25500), 100);
+
+	if (step_up)
+		reg =3D REG_SMARTFAN_STEP_UP_TIME;
+	else
+		reg =3D REG_SMARTFAN_STEP_DOWN_TIME;
+
+	ret =3D regmap_write(data->regmap, reg, val);
+
+	return ret ? : count;
+}
+
+static ssize_t step_up_time_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	return step_time_store(dev, attr, buf, count, true);
+}
+
+static ssize_t step_down_time_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	return step_time_store(dev, attr, buf, count, false);
+}
+
 static SENSOR_DEVICE_ATTR_RW(temp1_type, temp_type, 0);
 static SENSOR_DEVICE_ATTR_2_RO(temp1_input, temp, 0x01, REG_TEMP_LSB);
 static SENSOR_DEVICE_ATTR_2_RW(temp1_min, temp, 0x31, 0);
@@ -975,12 +1048,30 @@ static const struct attribute_group nct7802_auto_p=
oint_group =3D {
 	.attrs =3D nct7802_auto_point_attrs,
 };
=20
+/* 7.2.102 0x6E FANCTL Step Up Time Register */
+static SENSOR_DEVICE_ATTR_RW(step_up_time, step_up_time, 0);
+
+/* 7.2.103 0x6F FANCTL Step Down Time Register */
+static SENSOR_DEVICE_ATTR_RW(step_down_time, step_down_time, 0);
+
+static struct attribute *nct7802_step_time_attrs[] =3D {
+	&sensor_dev_attr_step_up_time.dev_attr.attr,
+	&sensor_dev_attr_step_down_time.dev_attr.attr,
+
+	NULL
+};
+
+static const struct attribute_group nct7802_step_time_group =3D {
+	.attrs =3D nct7802_step_time_attrs,
+};
+
 static const struct attribute_group *nct7802_groups[] =3D {
 	&nct7802_temp_group,
 	&nct7802_in_group,
 	&nct7802_fan_group,
 	&nct7802_pwm_group,
 	&nct7802_auto_point_group,
+	&nct7802_step_time_group,
 	NULL
 };
=20
--=20
2.53.0

