Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDE42E736A;
	Sun,  6 Sep 2026 22:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788734117; cv=none; b=mIJYJGe4I+eaxmSb+J7pfRs7TKHaVIMwRvlmHoQCOLGsXAhzn7pxTqVFLSXLmXIXtkrSP8ujaEFX90PihwilvXdBgpBvVhKRI60SEeV5D0/S3ENM8MzkV2Mp98tS1oyEaaAALaQymgJ02cOVxVHoPZ9tz1aiC8e2J+LHVNu2UFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788734117; c=relaxed/simple;
	bh=2b66tyf40CPjDrRMx0MKDWRR25VJTr1dquIvtg/bz5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X6V7N50PgwydIEN3OTYDb72/85miuGf1Q8aEYTYaZ3z7MabENyLSzYKk7Crkr1w3Pafurrz2GNONvEGeQKxAPdBMk0dSvpRJOYZ4wNQR3TorQkxFyDuRr8agw9PWoUKfne41W8tA/W62WIbOTKg2memDTy7cAmmbVXQbgfcSPAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dP6m3O1M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dP6m3O1M"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44CB0C2BCB8;
	Sun,  6 Sep 2026 22:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788734116;
	bh=2b66tyf40CPjDrRMx0MKDWRR25VJTr1dquIvtg/bz5M=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=dP6m3O1MgZEBRGYEoya33pWG8Tyt9eWOq8TpddMlHFMNStDkY36De4EXk2cdFXG6G
	 1qdlZMRB8o0CLZ9JKwtr37qB2R/NObjlDswlhruw0cLR+HQdvjvniMvWYUu0SYGx6r
	 w8Yj3Yevl4mT7Kvlfcul18DIPkE0XMJbrc4r1hujsv2BCAaXfliJLLBNe4CflLDCns
	 WbCiUXnqRoazgPf+qX3yuQR0f7OpJuSeZkfSZq0A+F6U7TXLMri8RMz5Z1nnhVcs10
	 PZkeYNb1hMQ2mILOzdOiZ/rF7TMy0f3u0wAt+9SDuA8A112HwmH33EbVF2GyAfIE1p
	 3LXfsGElq8A/Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2244DC79F9E;
	Sun,  6 Sep 2026 22:35:16 +0000 (UTC)
From: Massinissa Ghoul via B4 Relay <devnull+massigh680.gmail.com@kernel.org>
Date: Mon, 07 Sep 2026 00:35:02 +0200
Subject: [PATCH] hwmon: (hih6130) Replace sprintf() with sysfs_emit()
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-hwmon-hih6130-sysfs-emit-v1-1-a1adb5245d0f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw6CMBBA0V8hs3aSaQlt4FeMCx6DHROK6fDQE
 P7dqsuzuPcA5SSs0BQHJN5EZY4Z5lJAH9p4Z5QhGyxZRzV5DPs0RwwSnCkJ9a2jIk+yIPnKGGd
 tSd5Dzp+JR3n91tfb37p2D+6X7w/O8wPa9ngofAAAAA==
X-Change-ID: 20260907-hwmon-hih6130-sysfs-emit-075116223077
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Massinissa Ghoul <massigh680@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788734115; l=1351;
 i=massigh680@gmail.com; s=20260906; h=from:subject:message-id;
 bh=MHrNwwTYchzU6LrretLfcd95AXrW/h9RfnDFCAgZNm0=;
 b=unx4Z7I7LuzIi4htsnORzaqD09Y9jKfD2Qo05QcVbmBMf4/DmsUC/HgmJOUS79pQDS9tvVlQx
 fXDHIFG33fJD7ZwoJMqIPXwD5m9utQG/rPwvt28MvN0+yoyCSX8axKR
X-Developer-Key: i=massigh680@gmail.com; a=ed25519;
 pk=0sdDIn8rwwQcfQLT4kpMuP9iTaPw8YMcqI9B3U/GS1k=
X-Endpoint-Received: by B4 Relay for massigh680@gmail.com/20260906 with
 auth_id=1012
X-Original-From: Massinissa Ghoul <massigh680@gmail.com>
Reply-To: massigh680@gmail.com

From: Massinissa Ghoul <massigh680@gmail.com>

Use sysfs_emit() instead of sprintf() in the sysfs show functions
hih6130_temperature_show() and hih6130_humidity_show() to use the
preferred kernel interface for writing to sysfs buffers.

No functional change intended.

Note: Not runtime tested due to lack of hardware.

Signed-off-by: Massinissa Ghoul <massigh680@gmail.com>
---
 drivers/hwmon/hih6130.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/hih6130.c b/drivers/hwmon/hih6130.c
index 7984be1e706d..6a79aab5d128 100644
--- a/drivers/hwmon/hih6130.c
+++ b/drivers/hwmon/hih6130.c
@@ -168,7 +168,7 @@ static ssize_t hih6130_temperature_show(struct device *dev,
 	ret = hih6130_update_measurements(dev);
 	if (ret < 0)
 		return ret;
-	return sprintf(buf, "%d\n", hih6130->temperature);
+	return sysfs_emit(buf, "%d\n", hih6130->temperature);
 }
 
 /**
@@ -189,7 +189,7 @@ static ssize_t hih6130_humidity_show(struct device *dev,
 	ret = hih6130_update_measurements(dev);
 	if (ret < 0)
 		return ret;
-	return sprintf(buf, "%d\n", hih6130->humidity);
+	return sysfs_emit(buf, "%d\n", hih6130->humidity);
 }
 
 /* sysfs attributes */

---
base-commit: ba08432bda66a7889d8f3d1581dabf10f59b25eb
change-id: 20260907-hwmon-hih6130-sysfs-emit-075116223077

Best regards,
--  
Massinissa Ghoul <massigh680@gmail.com>


