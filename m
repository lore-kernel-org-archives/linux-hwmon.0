Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C16625B0B6
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 00:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786060882; cv=none; b=r4OL+EQ5/1KdLXoTMjQTwR5PKslxLl3hToB2lQ9R4yw/uAy5x5GCDTrBcs2SvKl4wPMN7xpACxnHOEIbcLcoNBBs7DtnbohXMdzMI5ztpisKsazyw/D8v5/0zF/T/NcF1u40ctQSze9V9gnVk5OVlCbuy7btysaAfJ5CVZnQWBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786060882; c=relaxed/simple;
	bh=k2RXB/lBpEZb0Xvy9dDABovXMTpTDSPEDT43rkEWuCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JyxhnsX1lBjs3iRwTZylB80KWBZA0Ezg203PuONB7v39nQSEioLB5fPCR6YCJMecm1Pv8tPChGa7y2cnt/8UHROx/c4g2BDDEC6lhDbgDbAq0J42lc7WQOfr4uM4vmEV+gKWWPvTbjyreCf2qpVT2E2SlVx6yBecZDFnXER3YCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=lSGdeLJi; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="lSGdeLJi"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-92e85499ffbso188498885a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 17:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786060879; x=1786665679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rIhsby11fc8DrjdIUcLHC64tuvgWtC8uYK9JmHgOEVw=;
        b=lSGdeLJiLEhiyeZz2/gsGf4nJKUtq9adeB17lZ5ejVHUcOd+mLQ7qE2GNTPdfSVvac
         +HyXAkd1RQqP2/kbLx+Bss2TlN6R0t5rltoOCcBi/IrApA+5h5b1Vww1ZKFtuaFXK0WH
         ZJXAbdBbEW58+xkUQN1sNYme9vTuUGECndpCkXT3f22HOVOgtgMPdF+uaFpYqS2ZTcgq
         i1FCJkm0Y208IYeYv8y/kbwSaF8kDQ1QFPWZRxkFIXb/NZyU5RfXVxNm8FTqmZAkOKkd
         uN5X6NPgqewipRGOAORixfEDgZCrzWk+0eBSF98dbzY/bogDWwfESGlssUq9CCDwGf72
         AA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786060879; x=1786665679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rIhsby11fc8DrjdIUcLHC64tuvgWtC8uYK9JmHgOEVw=;
        b=l2DuycaEfph9RLGjehg5sKWG46BsQyBSrvPVOt+taxPKPbErm5KUqCzDo0JmztM1PJ
         JQWLnYzoqtmeaBUPqZy+bZYX9mS/a1NJxMDfCWZktn0haWbx50OAudaIhVdpll62ckBZ
         1f1Xl44Hdvkf0pln3wVgO+srRcTlcrgrCT2WcmQp4v7yQngWqe4JjkE/9h66V9O3uHEP
         BiW4fwvjZFgpzURnnosMT1pzTNGtmZVb6h14s66+C0rx2BX3/xd4ehXU5FVoxhBlak04
         5Gd+r3WAUTV31zf61TVgurzfkjaS1tB98OfZad/SjdUyh1mUbXL07x6XXnshTJIyDdwQ
         TRAQ==
X-Forwarded-Encrypted: i=1; AHgh+RowADyMRvRHNmHVZfz6GzSutfkBG2vKIrsSHrGPts+VKI9pgm2hgDGfAuzGbFyU1kl4uIsFn3FUWO10fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1OAWgsskMjG9BxrnikNwiaSrRFxHM/C1mb10oN2G4sPB2pfxC
	5M9MBduEUetk2GluW/QKHvna28OTULlPKjBgArATkD7a4CVWvpGMLWF8jAl11ARdI5E=
X-Gm-Gg: AR+sD10r5K/buOKgRrtz2POuVqo+mLxcp3kb9+mmYIJ4OiQFeGChALe3f5jrqaXFEXX
	L3NedqilZAN/R3PQR/kKc33pOdVcv3F28wzLxRveX9S35cJ+LMUHjMtMEpfrrqTl8N/uAni77gL
	djqVkjTCf7ubJtW3WRGnSKE6aTlShHRopGlSuWnWiK0LQ67PLGd+mv2O1orWS7cWjGBxwtqvh4K
	2gU5GY3VtJBRhpG5xJEBQc8Oi1k8IzyMJbNk30SMCFMy/Mvd8U/W7vBfXCS3n9bF5b4iV2Y5GKG
	Xe9LPFF0gd9ZMUrdGvdTxTPe32WEdT19zpK6AEgNwLr6ssAKymbgg0s8fWfivr4ntKPxAj7BqUO
	f0NyI8afPebgMgMiD/Ufo143N7BdEe3Z5YA8BPPB/wRL20ZTCBbslW52J6PenbZ4a9pimuc4DSi
	UYgoUXzGYgM7a94jYd3Mpa9Bx8+e3fh8Iqw7JiR2ugDk4UYoK8bgJhZ3nYHNUjJJYXYaVhBwolU
	szlI5NL1T43rvnWS/7C1t0nWXABhSIWkeOOn9VG4ckn
X-Received: by 2002:a05:620a:29c9:b0:936:5771:2b42 with SMTP id af79cd13be357-93666401242mr639770185a.10.1786060879234;
        Thu, 06 Aug 2026 17:01:19 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e279f0esm27341485a.38.2026.08.06.17.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:01:18 -0700 (PDT)
From: Arie Miller <renari@arimil.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arie Miller <renari@arimil.com>
Subject: [PATCH 3/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III White Edition
Date: Thu,  6 Aug 2026 20:01:07 -0400
Message-ID: <20260807000107.1786892-4-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807000107.1786892-1-renari@arimil.com>
References: <20260807000107.1786892-1-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Will Smith <github@notthatwillsmith.com>

The ROG Ryujin III White Edition uses the same report layout as the
other supported Ryujin III variants. Add its USB device ID and list it
in the driver documentation.

The device was tested with the driver on the author's hardware.

Link: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/pull/10
Signed-off-by: Will Smith <github@notthatwillsmith.com>
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Arie Miller <renari@arimil.com>
---
 Documentation/hwmon/asus_rog_ryujin.rst | 1 +
 drivers/hwmon/asus_rog_ryujin.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/hwmon/asus_rog_ryujin.rst b/Documentation/hwmon/asus_rog_ryujin.rst
index cfdfe3712f19..b0d7ce8dd921 100644
--- a/Documentation/hwmon/asus_rog_ryujin.rst
+++ b/Documentation/hwmon/asus_rog_ryujin.rst
@@ -8,6 +8,7 @@ Supported devices:
 * ASUS ROG RYUJIN II 360
 * ASUS ROG RYUJIN III EXTREME
 * ASUS ROG RYUJIN III EVA EDITION
+* ASUS ROG RYUJIN III WHITE EDITION
 
 Author: Aleksa Savic
 
diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index 5bc60c6036de..9b34c6e06bf7 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -19,6 +19,7 @@
 #define USB_PRODUCT_ID_RYUJIN_AIO	0x1988	/* ASUS ROG RYUJIN II 360 */
 #define USB_PRODUCT_ID_RYUJIN_III_EXTREME	0x1bcb
 #define USB_PRODUCT_ID_RYUJIN_III_EVA		0x1ade
+#define USB_PRODUCT_ID_RYUJIN_III_WHITE		0x1ada
 
 struct rog_ryujin_device_info {
 	u8 temp_offset;
@@ -587,6 +588,8 @@ static const struct hid_device_id rog_ryujin_table[] = {
 	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_EVA),
 	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_WHITE),
+	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
 	{ }
 };
 
-- 
2.55.0

