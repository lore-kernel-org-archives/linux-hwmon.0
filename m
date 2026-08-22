Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1681C5799;
	Sat, 22 Aug 2026 11:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787398561; cv=none; b=N18isKaI3wCbuVZFvIQ16+6cXkr7B+Ms1c9oRDp7X1nB5lheXRa4Xrva77fkXG/wfNwcFnXEvSrw+U1dO+vsjAqlVTmRJ4cQN1KoPZBni2+NRjolhs51QOawgehoDtYZCeaqWLntEJUlN0XYUu/GAGOrV+aBpEOMnjeDg6HFOH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787398561; c=relaxed/simple;
	bh=mB/FW2OPx0UpmHotk7YNbujDwpzAlzAgpNIVNeTw2K0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=RbFgIJqTOr202mB6hScdRgXe2PS8+r8xdzFrq7gV2VBcdKEzb5OugiKXGZWVbT39J1dizVZj3Qsm3RbOy91TRM3yFvHb6cUwWNeOSUJgaPd6LdZsCL+ZAY1RUu9+raunozvC5AzJd9Jd9FUOdpBh182lhSouECciM5Xq330tZxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Pl0YCfwF; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Pl0YCfwF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787398547; bh=xXRHURo952J7TidMqO5HAkX5f2gFHjg5x2uB14fPe24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Pl0YCfwFbDHNigNtTsuVQXZgnTQ/iZrfKAS51liAckIK7LVKMDNE0Py3mMFkBHMTu
	 Fe958Xc5l3daPU7rwm3vRCnG6R0AWDk7+G3Yalzu0mBkJE1e+JSLMuCpZ2npdVQZJL
	 ONcssUsLoPN3Uy7aQXeyhEJcMlIaLhaQlwaKcHvk=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 8A2BFE7D; Sat, 22 Aug 2026 19:34:34 +0800
X-QQ-mid: xmsmtpt1787398474tqa1njo83
Message-ID: <tencent_CE16CF998D9A25B20DEF1275DDCEDDB61907@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85NohDmAPvvalHs8n4h1EOeA5RJV5kZyfD489FSIsafKXB2rqgXx46
	 fVjTwQlKpls3TArIY35CZUuqwMm2n9oldVx86j/GqSX0KejzRNV41lWwKpPyeRZllEZJnJBpRkOs
	 k7SQgbWnplxhtdgo1z382+P92qh1HVfsk82w3Y7b8E5CVtqqTZzSnm3+kCSjTGhEGyKoYKDd91xC
	 0WkRIRS+rIhSjI/K9YGsm/t8ws2piUendeB/XE1PgkVYsWumZMp7uE7GTdHPq1eAgerzvUiXwVGE
	 7lAyAAdISBVMDIaIhOfdeiYEy9Ip8Ml2ANbFFfGKPYeWsMgHWmqQLWYvrXbYkbmb628xmNW+YVv3
	 E6gb/QMJrxuEJ2vjgvC1SLgwbTkNIPg3ozxlkdi8lC7+5wnlIMDD5G8zVzgNpGv7sp25fStye4Hm
	 Dq3+HkgehBJ+5jjPWEYNr1lBD2wILsCDis8U6uNGWdxHi2TP10muI92nDjlZQzzjpK88AKi/m6Qf
	 2mbgKTlTBXMFAE4cZNS5JIt37LhkMTKYBYciUtP+CyV2HEXIJSnyn+I8PqpB/V9k5eztAb80RC1o
	 dtW+pY60lO0q/xljxmHYDHy4+xRwKlJJRbq+zMGNSNigRGISF/Gnt6jnbTU5amtza6YqBwBhXent
	 8m2mcD1TDiFWtT/vX3NnOdQcSZvQ/WavuSRVVKV4qylkfIHes3D9ctd0sczUJk/M4jyopS1o+ke7
	 M46poVtUkx+FdtDjrB93p5DgZoHOrcXNJh2vbhFF9xUVYmT8047Rkltv9uYrUeD+Zb73tmLa3X+P
	 x/HiDwavMHES4+ntmslUVPcs8gnFRaTU5G21EQolLwE4z9vMiwqkSvlWc+91QQaN5f0Fq2RdTv6d
	 kgQS/RiBi+IT66er1DrDdCrX73DhZAEfVWjUYQGgr2utVxIvDeUPEm4tEowjSQ/vP/dCswSKH+7+
	 P2grIQG06H6191uUs7dkd/75yh0x03zWEXZgef5cTni8IL/VyjOoUOeMSpZLthfYL7g7e6L82If3
	 v8BKD9Il3f/JaAVkZgaCiP8KC6nPgUiH54CzPHyj5yDDRHwcNUJoTQfLKrC+90Sldxv+R2r7Mtxr
	 m5BfKP
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Edward Adam Davis <eadavis@qq.com>
To: sashiko-bot@kernel.org
Cc: linux-hwmon@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	me@jackdoan.com,
	savicaleksa83@gmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v4] hwmon: (aquacomputer_d5next) valid the data size before reading the sensor data
Date: Sat, 22 Aug 2026 19:34:35 +0800
X-OQ-MSGID: <20260822113434.83716-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260822092616.B9B121F000E9@smtp.kernel.org>
References: <20260822092616.B9B121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The user-forged sensor data is only 65 bytes long; however, aqc_raw_event()
fails to handle cases where the sensor data length is too small when reading
the data, resulting in [1] during the read process.

Add a data size check, if the size is less than that required for the
specific data item to be read, abort the sensor data read operation.

[1]
BUG: KASAN: slab-out-of-bounds in aqc_raw_event+0x213e/0x25d0 drivers/hwmon/aquacomputer_d5next.c:1327
Read of size 2 at addr ffff888108aba257 by task swapper/1/0
Call Trace:
 get_unaligned_be16 include/linux/unaligned.h:48 [inline]
 aqc_raw_event drivers/hwmon/aquacomputer_d5next.c:1345 [inline]
 aqc_raw_event+0x213e/0x25d0 drivers/hwmon/aquacomputer_d5next.c:1327
 __hid_input_report.constprop.0+0x319/0x470 drivers/hid/hid-core.c:2168
 hid_irq_in+0x55d/0x710 drivers/hid/usbhid/hid-core.c:287
 __usb_hcd_giveback_urb+0x38d/0x610 drivers/usb/core/hcd.c:1657
 usb_hcd_giveback_urb+0x3ca/0x4a0 drivers/usb/core/hcd.c:1741

Fixes: 0e35f63f7f4e ("hwmon: add driver for Aquacomputer D5 Next")
Reported-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9ee5f5dc18673d6b2f37
Tested-by: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
v1 -> v2: change to check the data item and update comments
v2 -> v3: check all sub items and update subject
v3 -> v4: add speed and flow check

 drivers/hwmon/aquacomputer_d5next.c | 104 ++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index 1ca70e726298..89c9fc0c77e5 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -1324,6 +1324,107 @@ static const struct hwmon_chip_info aqc_chip_info = {
 	.info = aqc_info,
 };
 
+/* aqc_raw_data_valid()
+ * Does not support special-case sensor readings data size check
+ */
+static bool aqc_raw_data_valid(struct aqc_data *priv, int size)
+{
+	int off, fan_off, i;
+	char *msg;
+
+	if (!priv)
+		return false;
+
+	/* +1 for get_unaligned_be16(), it reads 2 bytes */
+	off = priv->serial_number_start_offset + SERIAL_PART_OFFSET + 1;
+	if (off >= size) {
+		msg = "serial number start offset";
+		goto invalid;
+	}
+
+	off = priv->firmware_version_offset + 1;
+	if (off >= size) {
+		msg = "firmware version offset";
+		goto invalid;
+	}
+
+	/* Physical temperature sensor readings data size check*/
+	for (i = 0; i < priv->num_temp_sensors; i++) {
+		off = priv->temp_sensor_start_offset + i * AQC_SENSOR_SIZE + 1;
+
+		if (off >= size) {
+			msg = "temp sensor start offset";
+			goto invalid;
+		}
+	}
+
+	/* Virtual temperature sensor readings data size check*/
+	for (i = 0; i < priv->num_virtual_temp_sensors; i++) {
+		off = priv->virtual_temp_sensor_start_offset +
+		      i * AQC_SENSOR_SIZE + 1;
+
+		if (off >= size) {
+			msg = "virtual temp sensor start offset";
+			goto invalid;
+		}
+	}
+
+	/* Fan speed and related readings data size check */
+	if (!priv->fan_structure)
+		goto flow;
+
+	for (i = 0; i < priv->num_fans; i++) {
+		fan_off = priv->fan_sensor_offsets[i] + 1;
+		off = fan_off + priv->fan_structure->speed;
+		if (off >= size) {
+			msg = "fan speed offset";
+			goto invalid;
+		}
+
+		off = fan_off + priv->fan_structure->power;
+		if (off >= size) {
+			msg = "fan power offset";
+			goto invalid;
+		}
+
+		off = fan_off + priv->fan_structure->voltage;
+		if (off >= size) {
+			msg = "fan voltage offset";
+			goto invalid;
+		}
+
+		off = fan_off + priv->fan_structure->curr;
+		if (off >= size) {
+			msg = "fan curr offset";
+			goto invalid;
+		}
+	}
+
+flow:
+	/* Flow sensor readings data size check */
+	for (i = 0; i < priv->num_flow_sensors; i++) {
+		off = priv->flow_sensors_start_offset + i * AQC_SENSOR_SIZE + 1;
+		if (off >= size) {
+			msg = "flow sensors start offset";
+			goto invalid;
+		}
+	}
+
+	if (priv->power_cycle_count_offset != 0) {
+		off = priv->power_cycle_count_offset + 3;
+		if (off >= size) {
+			msg = "power cycle count offset";
+			goto invalid;
+		}
+	}
+
+	return true;
+invalid:
+	pr_debug("data size (%d) is less than the %s, %s\n",
+		 size, msg, __func__);
+	return false;
+}
+
 static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8 *data, int size)
 {
 	int i, j, sensor_value;
@@ -1334,6 +1435,9 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 
 	priv = hid_get_drvdata(hdev);
 
+	if (!aqc_raw_data_valid(priv, size))
+		return 0;
+
 	/* Info provided with every report */
 	priv->serial_number[0] = get_unaligned_be16(data + priv->serial_number_start_offset);
 	priv->serial_number[1] = get_unaligned_be16(data + priv->serial_number_start_offset +
-- 
2.43.0

