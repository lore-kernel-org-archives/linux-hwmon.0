Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D7F274FD1
	for <linux-hwmon@vger.kernel.org>; Thu,  3 Sep 2026 00:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788396075; cv=none; b=ZAK7xIByqbqYqbJFZCQu0ifV+NYK6OANQ4tbkRQS1lb/knDaDgQWtrlR7Uh9OniSLlYRBkBLNJGGUb5KvqyZw7PmmBIrot8dE5YHfpYhdyc5kjb4gRggE1NwXsSzbTRQCRnDj2GB1EyjLHGdMp0G4ZWF78IwFhgtgEcQkVQQaOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788396075; c=relaxed/simple;
	bh=O3TQq4A5rX9f1yvF4DkCKPUCSm2FMHIrce9wen45HNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=roS35kUxEl3uZuCya73PqQcTd4v0/F1K+c1M/tB1iJj7RsOJjc/a4oCG8/s7JBc/PYW+xBKV46MhMGiRds1bEEMUAbs8QlAArCFGJ5OD2FIXM/9Vo29NgULpMX+JoGReShaMaOVtHX1BeySDI75vauoHNEXSiNetCFJCUaDc+Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFvVa10E; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFvVa10E"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5304310b3e0so5656591cf.3
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Sep 2026 17:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788396072; x=1789000872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YiZZY9+C0sK8isY9Ljf0XKem2w9pAuwvHHUN/mOpXUE=;
        b=aFvVa10E+tWJOS388wbrJ4I1JyUs6ZkROqaNv71cOI3Dy32qmB/F5JG9CUFAXvj+wF
         tg7/FhJ/TVX4EnZZjN5/rYbzitdVw6OLMMcpMdX/IR9vrlAofY6xX3D8w0vGzUJ0rCrv
         8JG+b5FwjNvq0+/NJneEywzLhiW9wgcMjqdIqud4a9RpKxWqcvhUrftNTRaiCIi5O0CV
         lbDfKasXCrMVqxGN3rraDu6acU8C8cXpv+o9HljE+HZqGqIs9d97t3vpohJInXuHrype
         LQeEv2nGBhvRiGYHrZdtMEIisgq7dOJpXHbxWP0dQaFovSCcypMXetTbn8wzLKkQrgwM
         rIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788396072; x=1789000872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YiZZY9+C0sK8isY9Ljf0XKem2w9pAuwvHHUN/mOpXUE=;
        b=ds3kgDERduNssxUNF4NSrJZ07glvDmt33OmtllxbD2HZmiY4JFaZaaKRCtoNWxPKxK
         QLOkw4+2A7NR8KHRwFRTAEZJq7FX3LW97NpUhf/JpsJA2wfIZgup5/P1sQErzuxWeVR0
         OLfheTcOBpVm84XSmT4nuWFbcmxx9DAZL8+ln3KE1sHncffTJpscVslG69n9w/Rj+qGA
         C5MM6GTzHzyPE2iUJrMa+4tObH17O74ajVWFJRUqYUDMBlRdmrvNtQs1KPeKRxCX/izs
         WIY91uzh+WsXnSj2nEktzSk+hfgH+sMZiyWdCHRzQRVuKnDl2RUrDxo1oK0iftsiBUX3
         xolA==
X-Gm-Message-State: AFuF++mClWclzV2Y4W+e+UDzkaN51ShcotHAYvPvKG8ZU4Zv78/DNh6S
	R4cW4HmD/wk2bA2LsvO4npoHfRF4xFC7cMAl+z5N4rjLGvlXMokLw3ET/MqTl+BK
X-Gm-Gg: AYBFou0stuOgLjPEZk7duEIPSFG5evRNaUt0YJBTZSrGyDOCjtfB7a8w9ki3RdBRCkU
	HF9kNqRCg4o+j4VLVlPG/2BQ1oQdI1xXX03ka6mytorcBCDrE+wWqBgUeiVRYZAtFsV52mqTv/l
	lAexRdk9FWx23y9bNVlnGQJsx5lgcMxgVu2jiQCRRwpemKc6dohzpkErZ7zpX55g+/edHPAAZ3t
	JXBVncstJ/ojAJ20bb+loly+PJBlF8WK6Hh2EupjEsRZSA04RVszNVFULbKZoghlLof8ibIkr5V
	wLx0P9h43HqM40+k1Py0mxz+kpR6VSZcK1jDl/bn79LIDNx/bWJ6gz3reR/LIIXgD2uF/Q++orw
	AKpFJH7Hp7YEmn9QR5G6rj4cm7HObHKb4+CIzg63qZSYUrOlK7ugC8A16dPZaPcKBsq0dRNDbyK
	1RVHDSkOBMUIg8zcL60sLAdorHszLctStojRZxyyRxpcgPImLEaEX+/0McIhh+zYwwPUAnR7r/E
	1wwlskLlhloURKL+DKLDGtfosPYm6/ZSP5sL1zQxMsIit6OWx/ZtYg=
X-Received: by 2002:a05:622a:1354:b0:52e:1e5:4754 with SMTP id d75a77b69052e-53036cc5520mr89907741cf.24.1788396072113;
        Wed, 02 Sep 2026 17:41:12 -0700 (PDT)
Received: from Z-System.tailddad04.ts.net (c-68-83-199-219.hsd1.mi.comcast.net. [68.83.199.219])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eef50c4sm30837506d6.33.2026.09.02.17.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 17:41:10 -0700 (PDT)
From: Zac Lanzon <lanzonza@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Aleksa Savic <savicaleksa83@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zac Lanzon <lanzonza@gmail.com>
Subject: [PATCH] hwmon: (asus_rog_ryujin) Add ROG Ryujin III 360
Date: Wed,  2 Sep 2026 20:40:54 -0400
Message-ID: <20260903004054.502171-1-lanzonza@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the USB product ID of the base ASUS ROG RYUJIN III 360 (0b05:1aa2,
USB product string "ROG RYUJIN III"). It uses the same status report
layout and cooler duty channel as the RYUJIN III EXTREME, EVA and
WHITE editions, so it can share rog_ryujin_iii_info.

Tested on a ROG RYUJIN III 360: coolant temperature, pump speed and
internal fan speed report plausible values that track load, and the
internal fan follows pwm2 (30% -> 870 RPM, 40% -> 1590 RPM).

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Zac Lanzon <lanzonza@gmail.com>
---
One firmware behavior observed while testing duty writes on this unit,
kept out of the commit message since it is not about the ID itself.

The first duty write, a pwm2 write that re-sends the current 40% pump
duty alongside the new fan duty, takes the cooler out of automatic
mode and the pump runs at maximum while still reporting 40%. Writing
40% back does not apply; only a different pwm1 value does. liquidctl
behaves the same with the hwmon driver unloaded, so this is firmware
behavior. Only a reboot returns the cooler to automatic mode.

Measured with liquidctl 1.16 (pump-fan is pwm2, pump is pwm1):

  automatic mode        pump 40% / 1710 RPM   fan 30% /  870 RPM
  set pump-fan 40       pump 40% / 3690 RPM   fan 40% / 1590 RPM
  set pump-fan 30       pump 40% / 3660 RPM   fan 30% /  870 RPM
  set pump 60           pump 60% / 2400 RPM
  set pump 40           pump 40% / 1740 RPM
  set pump-fan 40, 30   pump stays 1740 RPM   fan follows

So the firmware applies a pump duty only when the stored value changes,
and leaving automatic mode does not apply the stored one. Does the
EXTREME or EVA do the same? If so, the driver's read-then-rewrite of
the pump duty on a pwm2 write may deserve a documentation note.

 Documentation/hwmon/asus_rog_ryujin.rst | 1 +
 drivers/hwmon/asus_rog_ryujin.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/hwmon/asus_rog_ryujin.rst b/Documentation/hwmon/asus_rog_ryujin.rst
index b0d7ce8dd..3ebab230e 100644
--- a/Documentation/hwmon/asus_rog_ryujin.rst
+++ b/Documentation/hwmon/asus_rog_ryujin.rst
@@ -6,6 +6,7 @@ Kernel driver asus_rog_ryujin
 Supported devices:
 
 * ASUS ROG RYUJIN II 360
+* ASUS ROG RYUJIN III 360
 * ASUS ROG RYUJIN III EXTREME
 * ASUS ROG RYUJIN III EVA EDITION
 * ASUS ROG RYUJIN III WHITE EDITION
diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index 702edb831..4b9859351 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -20,6 +20,7 @@
 #define USB_PRODUCT_ID_RYUJIN_III_EXTREME	0x1bcb
 #define USB_PRODUCT_ID_RYUJIN_III_EVA		0x1ade
 #define USB_PRODUCT_ID_RYUJIN_III_WHITE		0x1ada
+#define USB_PRODUCT_ID_RYUJIN_III		0x1aa2
 
 struct rog_ryujin_device_info {
 	u8 temp_offset;
@@ -593,6 +594,8 @@ static const struct hid_device_id rog_ryujin_table[] = {
 	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_WHITE),
 	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III),
+	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
 	{ }
 };
 
-- 
2.53.0

