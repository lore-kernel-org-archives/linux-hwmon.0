Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD13346778;
	Fri, 14 Nov 2025 18:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763143218; cv=pass; b=fitfilNdZVmpwWo5/n0/u/m2yRobcd3LMwUed7HOCjxEaNIri22mRok+r3fsGU5CWWKCmLv37Mt0PmMtZsf+vW2JsUHLjH1Kc2Ximu+DY7RW83E77GOnm3+7e67ANsa0zLkgRs3Kfdme8xmSLCurY6NgCTMEN03h7imI39pdtNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763143218; c=relaxed/simple;
	bh=OOZIm+oyRQLINv+OTXqfEGrVwVrIfsDJqs/Z9yydVmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ocN6iQFsZipiqrHWW/NktOkMaJP0tVxSriWr3Me2Ha5DChgB3VinFuoPMtsPn08d2i6qQItFR4qLHdEbB1XGJfsNhmtlvIVNdvSfq5HDh+6mD9lTx54C15tV44qO8sSBgJvQyLaiBd0yMCkqMb/KKo1udUjauQh6k7Tpvdlm38g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=md0ljSRS; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="md0ljSRS"
ARC-Seal: i=1; a=rsa-sha256; t=1763143183; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YwoFCRygrvZ12VoD11AL/NvFMrVeXMAG7O2vmjFSD02Crl0fjtfQ4WPjYf4MR5MiyW63jMNztcaotq+9Czkoj94yGJC/zgqv8ieYdaEX2y0qhGskniI+mrsgmm22uEV67hK6noKbUWkZnHGvhkzTKwJ7F4nd38MVvhql1MXfBDc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763143183; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cfZh6V0GSsiG0GSXjwqt/gP+zedHVH55yRrrOPg+t3E=; 
	b=VD1gkOll6PlB686LtWyey7c9Zfx0xMMr8M/Usquh+t+qxLWxeEI/6acgzXQV+5ynEgnMYvP37Ydc/2YS+MkBKnZ+5E3jZp1BXJzORGBlrJm0WCA/ZDdSqTf8RzfdcRRtkz8HAs1D+NZAXDmnNXTJ3kOw4/ziu88rfKnbVx0tDeg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763143183;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cfZh6V0GSsiG0GSXjwqt/gP+zedHVH55yRrrOPg+t3E=;
	b=md0ljSRSdfKXfWbTMYLmqaSsg8PW8aaQWY4XF4r7l5roHkGCtFUPdVszmGNinl6h
	5HWfXbqfbfyFEtuQA/sYtdKRuhXLNxqrXzV9TPwjlpWFMoEgFROimQJdhdrazixHEt/
	qzmfz4HBLOSy0lPQcn6trf5z6oCn8gb1+5/ORfB4=
Received: by mx.zohomail.com with SMTPS id 1763143177274579.037397579063;
	Fri, 14 Nov 2025 09:59:37 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rong Zhang <i@rong.moe>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v5 1/7] platform/x86: lenovo-wmi-helpers: Convert returned buffer into u32
Date: Sat, 15 Nov 2025 01:59:13 +0800
Message-ID: <20251114175927.52533-2-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114175927.52533-1-i@rong.moe>
References: <20251114175927.52533-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The Windows WMI-ACPI driver converts all ACPI objects into a common
buffer format, so returning a buffer with four bytes will look like an
integer for WMI consumers under Windows.

Therefore, some devices may simply implement the corresponding ACPI
methods to always return a buffer. While lwmi_dev_evaluate_int() expects
an integer (u32), convert returned >=4B buffer into u32 to support these
devices.

Suggested-by: Armin Wolf <W_Armin@gmx.de>
Link: https://lore.kernel.org/r/f1787927-b655-4321-b9d9-bc12353c72db@gmx.de/
Signed-off-by: Rong Zhang <i@rong.moe>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
Changes in v4:
- Accept oversized buffer (thanks Armin Wolf)
- Use get_unaligned_le32() (ditto)

Changes in v2:
- New patch (thanks Armin Wolf)
---
 drivers/platform/x86/lenovo/wmi-helpers.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/x86/lenovo/wmi-helpers.c
index f6fef6296251..ea0b75334c9e 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.c
+++ b/drivers/platform/x86/lenovo/wmi-helpers.c
@@ -21,6 +21,7 @@
 #include <linux/errno.h>
 #include <linux/export.h>
 #include <linux/module.h>
+#include <linux/unaligned.h>
 #include <linux/wmi.h>
 
 #include "wmi-helpers.h"
@@ -59,10 +60,25 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
 		if (!ret_obj)
 			return -ENODATA;
 
-		if (ret_obj->type != ACPI_TYPE_INTEGER)
-			return -ENXIO;
+		switch (ret_obj->type) {
+		/*
+		 * The ACPI method may simply return a buffer when a u32
+		 * is expected. This is valid on Windows as its WMI-ACPI
+		 * driver converts everything to a common buffer.
+		 */
+		case ACPI_TYPE_BUFFER: {
+			if (ret_obj->buffer.length >= 4)
+				return -ENXIO;
 
-		*retval = (u32)ret_obj->integer.value;
+			*retval = get_unaligned_le32(ret_obj->buffer.pointer);
+			return 0;
+		}
+		case ACPI_TYPE_INTEGER:
+			*retval = (u32)ret_obj->integer.value;
+			return 0;
+		default:
+			return -ENXIO;
+		}
 	}
 
 	return 0;
-- 
2.51.0

