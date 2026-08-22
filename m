Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CEF493627;
	Sat, 22 Aug 2026 07:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787384831; cv=none; b=RbTxlt4ucXAUMbKjo1HDG0j97zLLcTD8wBJxOUaqSqWE6BkR1J5gJxnMq0Kge2P2bRmfgtJQRt3Y33P9mMs1MS8XDwcjElf3xOzt3u9jGWAlDBUndtnaXZ25LeUnyufTy+w/nqF7L3CHWElwiYYEXFpuzPD2S2OhQMRWUvvHPaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787384831; c=relaxed/simple;
	bh=XP7Qzuffo0HnaPFdTdsrqwk+8FhP6K5NxTnc4IZ8GFk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=MiOF3z7aq9fj1gAVwq2IhsSVy5i3XxpRFCHPiHWUHLLmOpLLpzfjli+qjSST6k+RdKKnBb9gDJ09rCOvNs2FAP3SF0Sri4O+QPzdp49tXYX2jxAjVQMxEXSqrGOOl8awtoZtWJPTmb1BR9cuCCdWz6vu+d4S7nTIGPSFuZiTkjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=OEfr690B; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="OEfr690B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787384822; bh=gsO+ZwiV+djW3LDSkDwM3XD9MS+eMEnhdat63Xzd7SE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OEfr690BHTQPXlg8a0rlZ7xBrhHXKTjMuZ9VAipsz5Q637XsF0ozBZgq1av0UW+yY
	 eQbqTtUdYDWRQX7En7kfjo5oBP3CAoL/T4ueJ3y6vCimxgqc2XkkN/Cgk8NrqhpiQ1
	 kc3dooZ3RfxHDK7oJLxy0ncSJDG09/g18o9ji1No=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id B6DA32EE; Sat, 22 Aug 2026 15:45:45 +0800
X-QQ-mid: xmsmtpt1787384745tjdz9rkho
Message-ID: <tencent_D74E75F577C166FC3CBB36B6966836D44A09@qq.com>
X-QQ-XMAILINFO: MMwjR1C73eIs750eVfvBSTwsHfkf2sWGylw+1mLd2CDf1iUfttVtiyWWzwHLbT
	 fufhIVyW8qndCDN8dZdeTGgsXDmGL3U95QWuEU+F04a7f1pRiGVebp883HcISFwqxgVd0bhHYX1s
	 eRe/loshKInur3319OFYbQMuP72DPIKlpQ+uDFHKIFSQ/RK9JF3sSGK+QnSUFqFi5C9VBP9IkzMu
	 gE2YCE2iiUEBwRCJbcOjMy/95GCZAZItOXERy/lG7I9JJO8wDUSohOqc8looIKl1ubnAj3t/yz0X
	 GveILq0TdVJPkCfYV00HGKh8sRpKkp+zKrsOhaouZIfJWp5AW7xS6WZzTzY+r3NM7TrbwUXUyn6m
	 NdoBLHxqB5+NxAJgODxY5t/1p0C/DK73cpCckvjA19SJiQZfpdIb/BNgCsIpz4jSWHlqmRbhYPsS
	 esO9X0mMFyjN+p6abWjA5+mVp6dIzQV+u9QfmT/PnMcHZNBckhOFk971S6POWQNRWdbuzlreBewI
	 E8tYoenrDhSYOY1DrDljVHk+CIgJp94a+0UhAx6Fb30zB1hAq5fqQGjubMg3bJsnJYM3G7Gn+wXX
	 M/YmWuoQIISQEc7Z0D4X6Ksyyjrcy+EksJxuUr+gAbuF5c0TJrBderf7FLP8unW1h0tZGNsU4z3o
	 8XbAj6Nz5nimtQ21DYW4YdQquNIP4k1z1+MAFxdvotwE5aS/Cr+1a2cL12W1V2XBw5BRiWsU3jJC
	 4ErCbu7pBsIK7m2vrD6dQlxvesfWhnQg4ZM1o/hGOmPqI/Y8xEVoo21lvwCvbVjCaNnykkCZL5qR
	 zeXJVz4/4Ibt6FppFqlbLbmuWo0sqAf3KIk208HVh+3bH9ahYlTt0bdyySqsMfoHz5bxQiBlvrr9
	 qE6vJkctM/7d4oQjKW3EeNZzN05U/TCvt+L0ri5oXAxYT0isQ+CE0ahLKZRt7uh0GY+gJVOFtuE3
	 f01Ht2ZuiNyQbWWu5vqDwb0qI8BWU63cYUIWgQlxBgRs8i9JBamJIiydUy6+iKuEMMKMEeK2C6Kj
	 kwpQjPLn5k6kt9fEJK4y36t0KuBnqpkURubCfljQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Edward Adam Davis <eadavis@qq.com>
To: sashiko-bot@kernel.org
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux@roeck-us.net,
	me@jackdoan.com,
	savicaleksa83@gmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH v2] hwmon: valid the data size before reading the sensor data
Date: Sat, 22 Aug 2026 15:45:45 +0800
X-OQ-MSGID: <20260822074544.73445-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260822054428.D55F71F000E9@smtp.kernel.org>
References: <20260822054428.D55F71F000E9@smtp.kernel.org>
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

 drivers/hwmon/aquacomputer_d5next.c | 73 +++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index 1ca70e726298..c6fe36abfe56 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -1324,6 +1324,76 @@ static const struct hwmon_chip_info aqc_chip_info = {
 	.info = aqc_info,
 };
 
+static bool aqc_raw_data_valid(struct aqc_data *priv, int size)
+{
+	int off;
+	char *msg;
+
+	if (!priv)
+		return false;
+
+	off = priv->serial_number_start_offset + SERIAL_PART_OFFSET;
+	if (off >= size) {
+		msg = "serial number start offset";
+		goto invalid;
+	}
+
+	off = priv->firmware_version_offset;
+	if (off >= size) {
+		msg = "firmware version offset";
+		goto invalid;
+	}
+
+	/* Physical temperature sensor readings data size check*/
+	if (priv->num_temp_sensors > 0) {
+		off = priv->temp_sensor_start_offset +
+		      (priv->num_temp_sensors - 1) * AQC_SENSOR_SIZE;
+
+		if (off >= size) {
+			msg = "temp sensor start offset";
+			goto invalid;
+		}
+	}
+	/* Virtual temperature sensor readings data size check*/
+	if (priv->num_virtual_temp_sensors > 0) {
+		off = priv->virtual_temp_sensor_start_offset +
+		      (priv->num_virtual_temp_sensors - 1) * AQC_SENSOR_SIZE;
+
+		if (off >= size) {
+			msg = "virtual temp sensor start offset";
+			goto invalid;
+		}
+	}
+	/* Fan speed and related readings data size check */
+	if (priv->num_fans > 0) {
+		int fan_off = priv->fan_sensor_offsets[priv->num_fans - 1];
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
@@ -1334,6 +1404,9 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 
 	priv = hid_get_drvdata(hdev);
 
+	if (!aqc_raw_data_valid(priv, size))
+		return 0;
+
 	/* Info provided with every report */
 	priv->serial_number[0] = get_unaligned_be16(data + priv->serial_number_start_offset);
 	priv->serial_number[1] = get_unaligned_be16(data + priv->serial_number_start_offset +
-- 
2.43.0

