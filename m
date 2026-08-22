Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82DB384233;
	Sat, 22 Aug 2026 09:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787390109; cv=none; b=YESSAu5om4Kk2vWj1N39PYebdMCLq7BEZe9JjL9WuRaCAKh7GRBzcs5vApR4ZALLS2/diUh6+8MiKpdqPgKjWsWZ1FKi+EfG+69zlMjUjPKH/B7+cJ7Pe22RHafStNL/Oxy702OJppAJKtndfQdt1nYxaTXJocv5hjUCEFTiXMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787390109; c=relaxed/simple;
	bh=d4ARJnk7VS8Fu+z0+1E0c8aT/41OsCHOq56TJD20kVc=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=rmwgPbd8eFKalcZGArU1c26/PaFYt3YoJ28WmyFpdlc9M5oU0BxQsdiiEAqZOd6lb9TLNQXJaZNQAebG11VnmadHrqaDPKWRd77ew+rW5huIlgEf4m17cA//9BkmdBXegzz1dZyqWi0drmda2Cy2wQs2ZEyaTy6QdIrDefZ3s7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=K7SA0jYC; arc=none smtp.client-ip=203.205.221.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="K7SA0jYC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787390097; bh=cS1L627AZp+g7X5rvA+b0VY6gBz/wSpek/w2ucOuEcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K7SA0jYClLReh2Vximyz7FrO9h78BUaYD5ACTSVINQtIRBPT8zKNQQCThKpqirHPW
	 CkYXCPzTpIqSIyWvbY/Ul1VkThDA4wT4eMmMtAFFzQtbkxQbe7Dhli1SQBap3PvhDN
	 zyYyNYveUZTVwrVSE4FgSE5puxEu09YpGbNgUt9A=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 3B68A672; Sat, 22 Aug 2026 17:14:54 +0800
X-QQ-mid: xmsmtpt1787390094tiokki7fq
Message-ID: <tencent_54372C4A0A752D77EF66BC3CA9377097F009@qq.com>
X-QQ-XMAILINFO: MmpliBmRb3iCrHc21V1NQ/IMB7pFiKvgUCxdVGsbI2tnZ0fz94Agpfl+i/h5uo
	 rQ4k904NgmdyH6XBgSbUOwDpdHwUGg39Dcx8j8kpLppq8ACjb/BlAYWOHlrx6ypFCBvCNHQ7CJek
	 Mk00O6DVtEHxwFyAM3eAJaJGFXetA+icfSa4E9MMEJzkVnaMPlqC4LmTVfyWVnV9ld+gD5JCvSMI
	 gi9twyJVVQAOyfb4f5h+LHQbwRCDdCUdROP1DazzVfCujs9gDkpxOnI4I4kmsX8Sx36y2Cj7Ia1Y
	 QiK+annLdHR0WYFkT09In78lf4ZCblFCOu23Y3oZYuA1XwgYCuvlw1skZabLXxD5ZcHYCbiAoy+G
	 1xsNpAEOrEpbV6uPUkTseRSTYGd0Ky9vL/V10GO4JgzI5Xs5CP3TQXNRqgeUCsUG0a6cGfCJSmhm
	 OowcUkFaAYacM/gE9Y7lN4IokL2e0MVJEpDufpHul87ojJJzz6Uv65qR1NEsJNpHSQw74oRpPIcm
	 vVh5SmxRZjz4HPqPWuOGTZCckH3BDE/ENNCuifJDGyrPpLS1MgFLy9/VucybDzoxlqaQQDeePKJs
	 qxbHWfWxyXJXhG0Id7Vwq2H28Etf9TGj0USeRBAibJjk1cAusfWaQhMZhbVxd/7AiKEkUmJS80/H
	 f0CD9koDjcmk/xnnckwTlrbVmNecGJYMbzG+rOzBPyW6uFsp11YzM81zJF1E2jp6PvCmFSf7/c2P
	 nD8OYhetCu8VHgV4Jg9vaPcPSx7JTX+G9c23YQGGpK44GpoGsT9tgdhMtKCxK98D9Dh2csI8C7XV
	 FilnSQM6PoWpU7oytZldRXzLm6kAbd/HbXPlKjCWz72BxhARJan/xRGF0S2AEPOQmhzIep1wxnID
	 +JcHANJq3aFVte7l4Yba1eMHPUxyg2RFHVchlDC98h4UQRU0+2pQhyj8CbPRFRJAKuHg6CUE/tDx
	 PduXR/+FnCWbevmBZhi4Dsi/TC97SUFjhB3P1ozWtC/WmQsHjVfdNrrznYX6oWvHy2CtxD6wL1Tm
	 MCAmTo0+jk1cypXWsajglRseQPQVC58Hp2WybtzdYYIhdcBVCxPLoge2atUVqs48aOAflqIw==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Edward Adam Davis <eadavis@qq.com>
To: sashiko-bot@kernel.org
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	me@jackdoan.com,
	savicaleksa83@gmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v3] hwmon: (aquacomputer_d5next) valid the data size before reading the sensor data
Date: Sat, 22 Aug 2026 17:14:55 +0800
X-OQ-MSGID: <20260822091454.78126-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260822075716.D9C4B1F000E9@smtp.kernel.org>
References: <20260822075716.D9C4B1F000E9@smtp.kernel.org>
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

 drivers/hwmon/aquacomputer_d5next.c | 74 +++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index 1ca70e726298..2381a74eb4a4 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -1324,6 +1324,77 @@ static const struct hwmon_chip_info aqc_chip_info = {
 	.info = aqc_info,
 };
 
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
+	for (i = 0; i < priv->num_fans; i++) {
+		fan_off = priv->fan_sensor_offsets[i] + 1;
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
@@ -1334,6 +1405,9 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 
 	priv = hid_get_drvdata(hdev);
 
+	if (!aqc_raw_data_valid(priv, size))
+		return 0;
+
 	/* Info provided with every report */
 	priv->serial_number[0] = get_unaligned_be16(data + priv->serial_number_start_offset);
 	priv->serial_number[1] = get_unaligned_be16(data + priv->serial_number_start_offset +
-- 
2.43.0

