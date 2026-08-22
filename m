Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CFC37755C;
	Sat, 22 Aug 2026 14:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787407540; cv=none; b=LoV12zjCHgj9ESDjtjvYxIj8D6SSLvCCjTjpC0OPIwUDEHg84HkTpmqpC+uW4Uhg6DNjEzaWy206wifJlXeoywuD5UBLVmoSjLJiTZNc9A7W8VgkYRqckXpkLGU5m7R1MyNL1vZg8FDfxNGBL0pR+0VcODCcghH7NMeTGBVO3Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787407540; c=relaxed/simple;
	bh=KGiCOZS8kERx8kfMf60v2mw/RupajdLO8c2xUpyJGl4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=gobn/j/vLxSOFWd0CTxs+IxHbezDQPLaIK/m8aC/zeNpu5Ptdj9I27YZ5NM4g053AMxcoS6qP2DUvI8r71ooOHUPZZsIlB7ez2pTpCI+ZQBAGZCrO1iXKo0bF94GNfj/az1gW68XYvaAsoG2ztPAOSSlg3zQGf5rwux7CUjfup0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=U817WLZM; arc=none smtp.client-ip=203.205.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="U817WLZM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787407531; bh=ayWFH8lg+cV+7MtbfXcuspaQjvqArQfxMK8dBwUoI+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U817WLZMuY3eKZwiZ5FWi4O5OKmmmYaAvbisqfR/Z+FOAPpaSpZOUG0cbKo7Gsszw
	 iTzQoxxbEnYRvoke50jyhsJp+5Ozmw5Oo+GLx23Xf8Zbsqmb3qhqD3JunP2x4p5Snx
	 AUtZ9uCXeXi7wZKiQoFBMD0+epVHqSdJIPwu4xBw=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id 15BA18B1; Sat, 22 Aug 2026 22:05:27 +0800
X-QQ-mid: xmsmtpt1787407527teaasgipo
Message-ID: <tencent_5F7DC370E96643AEA458177FB76E86C8F305@qq.com>
X-QQ-XMAILINFO: ND6iFS8+YfQb6EKkgoFEmBQi39Q1RkOdnCgUJLgnQXULb6hfVcoKv4kiWHaVVE
	 aljn+o5n+z3FTcykek1BAycmHENPv1AhnOZkzpZ/c9lGTaQmpQySlh/yo1xivvnMGNQrcqM6Yo0S
	 DCLZ5vkxejwLjvj6FOIjlgUT/16fXSjY4Hw4apCPdijhVNaX636EnqNEpL3qOugeXBqn+EqXO8uv
	 Lac8+mzDN9rLbjwN9GZmJb09rmRgWVQ8N6/R3ikMUdIuUmBT7muWocpfc4urxx+n2uvj+UTNqt4H
	 W/7IRIFIOcEUtyqvvEf7+KDm/K8qm2187sbtWpm2GxJx5yuPlLntELwV48mf77Ve0V44uq6Bl6Ws
	 Ww0hSSkixFAJkobbKwaq+hqCAT84AgR15I7mN6wqxx5bss1NptncY6O3U0xX2YOZXhmIsS8YUVLE
	 gwEFB5JmUsAwvegvUTlSvDQ8IvigVcDLikNGyVC8Tu+66x9/nUDL/Oaquzbb0TCtSHZvcMOHmgm4
	 fVxOy5oB9UXD5vfBDrADDPFFGWgTVzcXeKjbSvBuCO5+/bgH375l8okXcd9YyQF73EwJozoOc76X
	 K34/pFJpSKlcjQsofcoCyRYKPBZ0y9TXQpBfT0hQQgOsPsncfcali6b/fkMkx1phv/Bpc/Sz+p40
	 nsAoYxvXUvtQs2fN7LBSqDj7i1LKhJZuORPaLdiPTlcz1xsXWxyv0tLSbt3BQBwQsqI2+szVmsbD
	 voaizJNBrgsnMlwQf3btr4DMiFa83yg46zFuJTuwu5AUKbYwk56wYUDeBLxVJLxu5QNbegS75y0B
	 tkVgSq3g8oGmQfT2nJmdGm6oarSPEUr9hxIp/wUOHXefDeYD1Am7/r014mE7Mfxp+HjUsEuP1pqC
	 ARljrcfMaTxs1eJYbOJZPagcjPqx+EjyfqQG6Yj1w8LOl6Rozx1eDH8DtxBY+GGDwNM745fSfTj8
	 OUvfihQw6gJdbyTuoKFs0jASNZKRm0LNEixcFfU/EDS+JakmccKFG7zx8VrZzUVZVuYzA3wEm8zU
	 gqbzS7p9xdY0u6Bn0ELuThmZyI1vGJ8qrKx6BSQncjCkrzzgWtWxoDyv7wX9USKYcqAAtZA0SYzB
	 hY0n7bOczg3ky34U1KyUXq7Eji+gRpQIx4xPAauzg5x4qBW2TloMo1qSgX0g==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Edward Adam Davis <eadavis@qq.com>
To: eadavis@qq.com
Cc: gregkh@linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev,
	me@jackdoan.com,
	savicaleksa83@gmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v5] hwmon: (aquacomputer_d5next) valid the data size before reading the sensor data
Date: Sat, 22 Aug 2026 22:05:28 +0800
X-OQ-MSGID: <20260822140527.91597-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_6A66F77626CA5371C36D2968E3AEC4409705@qq.com>
References: <tencent_6A66F77626CA5371C36D2968E3AEC4409705@qq.com>
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
specific data item(includes: Physical/Virtual temperature sensor, Flow
sensor, Fan speed and related, etc.) to be read, abort the sensor data
read operation.

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
v4 -> v5: remove dbg msg and update comments

 drivers/hwmon/aquacomputer_d5next.c | 81 +++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index 1ca70e726298..352b227c3015 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -1324,6 +1324,84 @@ static const struct hwmon_chip_info aqc_chip_info = {
 	.info = aqc_info,
 };
 
+/* aqc_raw_data_valid()
+ * Does not support special-case sensor readings data size check
+ */
+static bool aqc_raw_data_valid(struct aqc_data *priv, int size)
+{
+	int off, fan_off, i;
+
+	if (!priv)
+		return false;
+
+	/* +1 for get_unaligned_be16(), it reads 2 bytes */
+	off = priv->serial_number_start_offset + SERIAL_PART_OFFSET + 1;
+	if (off >= size)
+		goto invalid;
+
+	off = priv->firmware_version_offset + 1;
+	if (off >= size)
+		goto invalid;
+
+	/* Physical temperature sensor */
+	for (i = 0; i < priv->num_temp_sensors; i++) {
+		off = priv->temp_sensor_start_offset + i * AQC_SENSOR_SIZE + 1;
+
+		if (off >= size)
+			goto invalid;
+	}
+
+	/* Virtual temperature sensor */
+	for (i = 0; i < priv->num_virtual_temp_sensors; i++) {
+		off = priv->virtual_temp_sensor_start_offset +
+		      i * AQC_SENSOR_SIZE + 1;
+
+		if (off >= size)
+			goto invalid;
+	}
+
+	/* Fan speed and related */
+	if (!priv->fan_structure)
+		goto flow;
+
+	for (i = 0; i < priv->num_fans; i++) {
+		fan_off = priv->fan_sensor_offsets[i] + 1;
+		off = fan_off + priv->fan_structure->speed;
+		if (off >= size)
+			goto invalid;
+
+		off = fan_off + priv->fan_structure->power;
+		if (off >= size)
+			goto invalid;
+
+		off = fan_off + priv->fan_structure->voltage;
+		if (off >= size)
+			goto invalid;
+
+		off = fan_off + priv->fan_structure->curr;
+		if (off >= size)
+			goto invalid;
+	}
+
+flow:
+	/* Flow sensor */
+	for (i = 0; i < priv->num_flow_sensors; i++) {
+		off = priv->flow_sensors_start_offset + i * AQC_SENSOR_SIZE + 1;
+		if (off >= size)
+			goto invalid;
+	}
+
+	if (priv->power_cycle_count_offset != 0) {
+		off = priv->power_cycle_count_offset + 3;
+		if (off >= size)
+			goto invalid;
+	}
+
+	return true;
+invalid:
+	return false;
+}
+
 static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8 *data, int size)
 {
 	int i, j, sensor_value;
@@ -1334,6 +1412,9 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 
 	priv = hid_get_drvdata(hdev);
 
+	if (!aqc_raw_data_valid(priv, size))
+		return 0;
+
 	/* Info provided with every report */
 	priv->serial_number[0] = get_unaligned_be16(data + priv->serial_number_start_offset);
 	priv->serial_number[1] = get_unaligned_be16(data + priv->serial_number_start_offset +
-- 
2.43.0

