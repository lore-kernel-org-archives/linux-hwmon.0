Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED238125A0
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Feb 2026 16:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770481311; cv=none; b=pOXFGLYnHI2qi9W7p8n8JzKM9tl7hbA6hsVKL8OTheEUbi6pwzZy8U2kHA0oJLpxtgUc1QUwOFSiWhPTtUXvlWuZ0UwFOuoBKWrdIkQKnkQeAYpLNGLQecJJcy1W8jLzI/GNSTNsH9OBrBSQH35OiB0vWE911JeNWMHGop1SFnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770481311; c=relaxed/simple;
	bh=0wLp3S9WMCg5iFn83SJAlI2xUOuhmKnhC+oxMLP0AAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vEPPK9I7QqEqN+HpYcx/dFMrk4YgDa/tKzeKbaj62sWLPLgLvPELYMIbMC9QqEbTKxRDJDD9oSanGekEGV4ce6wKqMqMKvh6+L52H9taMub25fvbY5RdZZlfY4Zu43TZ/bdSugWGG6i7LkRLfPBgwd09NalUbb/B3Ugy8fFDMl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWnWe/2F; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWnWe/2F"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1233bb90317so3007823c88.1
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Feb 2026 08:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770481310; x=1771086110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bN8iaEMB/sPo/G/blTL3KXQdqWeom9PfBw1fZipaMyU=;
        b=lWnWe/2FiG3fCLXM/lMaRLul07NjIjWh22y/NbHkfhtaEX/4I+Yrt2nr0I+TmduNlj
         EpPmTHitpi7OgVaHdFJ/O/rNTbvU5wYUerjvR2tWx513TDoWsbvXuc880g+usKA+OA5Z
         kvM41MirSJtRMBcPkrsm7JBAy4lqW6pHU+vdTOJ7TqCpxO99JWTUhssDly5vAXH5zGCv
         BxsWvB6hLk8iEqLHSAxSPUHPlokH5s35+MZg1zHHA0pI3OVNXXFZdM0Gt5e8CknUYSiJ
         NFE+l5iZDX2orPtlVRVXHOYGETFkohJOYXfGRiDUB5EhjCBgpdhK/SLf8Kg6JjDGshlM
         1SWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770481310; x=1771086110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bN8iaEMB/sPo/G/blTL3KXQdqWeom9PfBw1fZipaMyU=;
        b=CwpjXPO3DvP6yoSJG3EubMai4CVhtW9WPb94ie3FXFS7kK7HQQK4+SuWTM+nR8Ccbe
         rzBBNrVLI5Hb+nM/wi79LxWGZihPKQ6v4i5baxfd+Fe97dmcTqiq1Hv84ZSJncdw1dUX
         rrk91GMVPewi80Ozr38qyYHU44/IN+dnFHn8NmLySbuyggwo9aVyuWU2Ml4jw9/D1gU/
         Rte5Txa7F4Enaq5TDoHFb0Ojb78mvL6dLoL2FbQDKkyVxHGeDKnbKicmYRruy4SyKwJN
         xYQMsmapQf10YN9RFYs/l2aJnwtWAkI4zqlGrwZbvgLmODnvqX6kpsmcqMIDIlmdPI9F
         lGfg==
X-Gm-Message-State: AOJu0YyjQRSLQyP9rkWnoDK/r0IHNIeGLVLDmsGs84VoJTYgm4sdm0zl
	8mkRFQ00ga6MVddih+/rP1DmR9TqVWj34S1ufTQWcnKZYMyPU7O5AYWnlBy8unXa
X-Gm-Gg: AZuq6aJxTm74oUh9QOR/blJ2QeV1ezRLQEcibUzzZrjOyhFLzqfLEtesV1T2PimqMBB
	NqOKWynijGNUJ/ix6uB1pHi8LLdJsQppyYdoa7Uwf976Ia/hMsTftj/YB9hgnzd0nV06NBd57M/
	KfIiU1AdH5X/IQ6Zxu8CqGvIwMcet0eeYlI81g0ipQM3dBnytznDm6jSY+R9UjgXaiTtruQnpFc
	sLYhU/wVTRVbhVpwERgtKyimEl/T9vUcUSRd+UMRsMn2CIZ1pO+uw6zG07JM2QhoNNaddGSqQB1
	xA1F5W7EBL02js9Fh+FZw/LHE/hd7DTb7ZuHYg/HFWK1RyAhNeNIvfRpiW3spYs4GqVGhg75/X9
	keU7ySQAmVpCgQEAXo3R0C8x/rdUoXBeBsC14Bq6MIv/94RfAYXBTB7xhG1nvbBT6c/oWfu51YD
	Mtvn75Aw1JXykfy5C0dfT0ZBkHhOhKUTYruZk=
X-Received: by 2002:a05:7022:418f:b0:123:36f3:2d2f with SMTP id a92af1059eb24-126fc1f1000mr5005069c88.26.1770481309648;
        Sat, 07 Feb 2026 08:21:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12706faa047sm3535613c88.14.2026.02.07.08.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 08:21:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.de>,
	Junrui Luo <moonafterrain@outlook.com>
Subject: [PATCH] Revert "hwmon: (ibmpex) fix use-after-free in high/low store"
Date: Sat,  7 Feb 2026 08:21:46 -0800
Message-ID: <20260207162147.467133-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 6946c726c3f4c36f0f049e6f97e88c510b15f65d.

Jean Delvare points out that the patch does not completely
fix the reported problem, that it in fact introduces a
(new) race condition, and that it may actually not be needed in
the first place.

Various AI reviews agree. Specific and relevant AI feedback:

"
This reordering sets the driver data to NULL before removing the sensor
attributes in the loop below.

ibmpex_show_sensor() retrieves this driver data via dev_get_drvdata() but
does not check if it is NULL before dereferencing it to access
data->sensors[].

If a userspace process reads a sensor file (like temp1_input) while this
delete function is running, could it race with the dev_set_drvdata(...,
NULL) call here and crash in ibmpex_show_sensor()?

Would it be safer to keep the original order where device_remove_file() is
called before clearing the driver data? device_remove_file() should wait
for any active sysfs callbacks to complete, which might already prevent the
use-after-free this patch intends to fix.
"

Revert the offending patch. If it can be shown that the originally reported
alleged race condition does indeed exist, it can always be re-introduced
with a complete fix.

Reported-by: Jean Delvare <jdelvare@suse.de>
Closes: https://lore.kernel.org/linux-hwmon/20260121095342.73e723cb@endymion/
Cc: Jean Delvare <jdelvare@suse.de>
Cc: Junrui Luo <moonafterrain@outlook.com>
Fixes: 6946c726c3f4 ("hwmon: (ibmpex) fix use-after-free in high/low store")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/ibmpex.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/ibmpex.c b/drivers/hwmon/ibmpex.c
index 129f3a9e8fe9..228c5f6c6f38 100644
--- a/drivers/hwmon/ibmpex.c
+++ b/drivers/hwmon/ibmpex.c
@@ -277,9 +277,6 @@ static ssize_t ibmpex_high_low_store(struct device *dev,
 {
 	struct ibmpex_bmc_data *data = dev_get_drvdata(dev);
 
-	if (!data)
-		return -ENODEV;
-
 	ibmpex_reset_high_low_data(data);
 
 	return count;
@@ -511,9 +508,6 @@ static void ibmpex_bmc_delete(struct ibmpex_bmc_data *data)
 {
 	int i, j;
 
-	hwmon_device_unregister(data->hwmon_dev);
-	dev_set_drvdata(data->bmc_device, NULL);
-
 	device_remove_file(data->bmc_device,
 			   &sensor_dev_attr_reset_high_low.dev_attr);
 	device_remove_file(data->bmc_device, &dev_attr_name.attr);
@@ -527,7 +521,8 @@ static void ibmpex_bmc_delete(struct ibmpex_bmc_data *data)
 		}
 
 	list_del(&data->list);
-
+	dev_set_drvdata(data->bmc_device, NULL);
+	hwmon_device_unregister(data->hwmon_dev);
 	ipmi_destroy_user(data->user);
 	kfree(data->sensors);
 	kfree(data);
-- 
2.45.2

