Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F212336896D;
	Sat, 22 Aug 2026 05:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787376899; cv=none; b=hwQJTMB01FnLa7EI1fiBuKECKgROKqCrGg2G3jB6EHFOZI7m9kamM5MNuLjhJ0bLDv1/ltLXo4HK89/hZrY/VvtaoH/K1XfOm2X15Tgfv9vIimx0DAnimSjFak0Ls2gCaM7Gi2GhoiT0BUm/8TlHlThtK3Gt2dW4awz3fZEhO30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787376899; c=relaxed/simple;
	bh=z7HxbAmaU0YJUjD4Gltf8qmU5eqL53I5kcu3nF1qWGU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=aXV59ub62AUK6q0Oj/vcRljDfZtDQyg5w16uPDIMFO3ch34ycsPqU9sEQJfC4BEHQdJinLGnsdHO+JQBI+Jdfiw6nDxyUntBiHfr2RdcAogAEVRAUChdDyPNtHxHPfEVG0k8xqI2hS2BWMXEteEDbqQxaaa+Z1B2G6ZJMd2HX3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=eTzK/AIE; arc=none smtp.client-ip=203.205.221.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="eTzK/AIE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787376886; bh=cmBAUkFfpYYladPgnLF4XWKw0ZgOTDrDS8YEVukhy4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eTzK/AIEFAnuA2xPibC4aikWSp3ThvYdT6gBdKQANkzcZikVePfiaIBZcmgNqcuBD
	 mErMtHRtvX8axmB7Auu40jud8yAdgnzm5iFYgv9ijaT83STr10VWNB5vWWItfhR987
	 N5ZUluSrL4ojsVq5PEtPZBCX3eQvn+NlBxq5iTLM=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 8ABB74E1; Sat, 22 Aug 2026 13:34:43 +0800
X-QQ-mid: xmsmtpt1787376883tu5vmqf1j
Message-ID: <tencent_8FCF9A8DDF25A10DCC12265DF45DBE995307@qq.com>
X-QQ-XMAILINFO: NVJ0hJNx7N5SVloqH3Cc3t+0fP/wkwBnmWZVuPoFTh42YWizk2PoM2p0Pi0K8c
	 9xlB7dCVWS/msTvjyM1nhWhkfSY2ZKmgVjFDGJlahiiqxeMGaVwu1ro2MqFhePG1B3SyUb51Enx5
	 FxOwTm4VkhmDBmuSQ6zPTuzYX+JuwnJArspvf+999kxcquNVB6Q3Lv3A3mXNzzUaeifsZ58OFYR0
	 gNGqGIKMR/FmkzLLkl+pZLFempiyeaT+6UslvR3N1tbi4N/HHZtNxzKbmZn9RGDArPB5NUfwp8cy
	 M1lbt+lISEWUzrFE/mS4IfMzZODoBk4AlbHFUDMhH1WfSl50XTy2ZWeGmW3CQzuGaGBMlmdvdvK7
	 Q6kygMGCLLL0dYXASW76/VqKK+Zx+qi/o/4Gufc/Uvroqe5e3ONxMEXsBdhs4LPcVf8DG0muU6BV
	 ofTvnpQbpsj10egikL/hHfKpfwpSLr1JnFw4SthILCXmJH5ZDBwi7Xg3fPXpJKEqZrdOJh/BJh/G
	 Bi5GYQlRcUCI0Ucnk33M0s5Tdw9drHEUr/vWDKjJFiPrG20V8x9iaWwW9hhbhtYduSpQ4NQYjJzN
	 29qSZ0g3dZlaY2aaKx6sQSvfPeAVexxmj7zLx1J3tHLsMUcOKFGjSdJhLkKE+/6EJFbfzxVrG6sx
	 zWefjWconVhv3SsuR1eGQXqjAN+kY+aVvGaJiA88vjIng/SOfd++Wl5urcvwJRjKX1/cqPTplcWd
	 aZMmG0lN7Id89R9wOnqEZ1ZEDBS9Tl0tL3TOd0MyefESFItge4wvD46bsLAA8UYrXWV3zyz0DWtP
	 W70aBBhfLMJ7xPdiKjidWKDr4/pCWGyp7F17yvvHtFT6FxnBitiGqMsah7VNk4ecGnvh0d7EmdSM
	 EcPdp0vu6e4GV4pTLClrMKoXUnlUNNuKIYBCJhQNoQuAZm3aYJDru11XDxnVDYT59XWtDjE51R6D
	 zsIN6wIodgD9IE8Rmd1IGu5ji+zEePrIhAJLVyj4v5go+vBadOnuv4ZCH6xp7Y1PU4/xikb5E0Vd
	 B6WfdcjACA4rHYcbLmW/zW+vEhQl7V1vGFppZvouXEGigr1EfLXMBKzU2vlJM=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+9ee5f5dc18673d6b2f37@syzkaller.appspotmail.com
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux@roeck-us.net,
	me@jackdoan.com,
	savicaleksa83@gmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] hwmon: valid the data size before reading the sensor data
Date: Sat, 22 Aug 2026 13:34:44 +0800
X-OQ-MSGID: <20260822053443.67966-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a891232.91706f20.16b6e3.02b0.GAE@google.com>
References: <6a891232.91706f20.16b6e3.02b0.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The user-forged sensor data is only 65 bytes long; however, aqc_raw_event()
fails to handle cases where the sensor data length is smaller than the buffer
size when reading the data, resulting in [1] during the read process.

Add a check for the data size, if it less than the buffer size, the sensor
data read is aborted.

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
 drivers/hwmon/aquacomputer_d5next.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index 1ca70e726298..1cc6c220ffe9 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -1334,6 +1334,9 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 
 	priv = hid_get_drvdata(hdev);
 
+	if (size < priv->buffer_size)
+		return 0;
+
 	/* Info provided with every report */
 	priv->serial_number[0] = get_unaligned_be16(data + priv->serial_number_start_offset);
 	priv->serial_number[1] = get_unaligned_be16(data + priv->serial_number_start_offset +
-- 
2.43.0

