Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB01A33B964;
	Tue, 25 Nov 2025 19:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764100238; cv=pass; b=tLANtUNC3xGB9FG2iYwhRhS55kPM8JvcfFHSqV87n/BFyck7/OGSvY9fVjB257VF6TkG0csQTpryKDfrpvLt0BTJ0ZNhbjUtNDO2vOyby3+2mH9HmuV64n0YE7VrkXPa3/drQDfTdOgvNKdfzX+pV8YK+5vBnDDh73ZFqh+5I8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764100238; c=relaxed/simple;
	bh=kebOZHpqPeyRlZj4NGSn4H/X/050d9NonXWr4lfD4e4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BhKSm/wkWL88LBhyjAbJOHqzGRAskDd4MlzZ1i3Yc5sDCcXeXwTiW3ZYcYbSx8FXGLwXgLD4tvbwWXIoC6UMLF0c0BHHUZvqxZgwZEX5E91DmVe7ghVrxjhaPjhukYrxfDdANuk77Bk3N0EGgieKa48Cj1BqWJvik8wKqeg332I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=z3yZyDmV; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="z3yZyDmV"
ARC-Seal: i=1; a=rsa-sha256; t=1764100210; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gQ1BNHMQ/k75bICrVfUojfezbONqtfg8ifwYgxnqJJY8PxLl1ADk95dSOhXR8LjZqdH8SUv22deJXof7WMaea73fQbb2iW7BwWxBIRhFNJ7Z+sH/qThsgxwZ+r2EPQu3PZ1bmcdlZqw9ueou19KqVtRf6PSamo+GKECPgwsbjRU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764100210; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FvBCAeb2Dbocj1VriIqfO+jlOYKrjjA+A2x6poexURM=; 
	b=gmhB4Xo7LdkUMcSc7zpFn3KHR2tdeUegDabDQZWMBxEorX981o1DxR2c3fisFo9Hv3crvfohjup33uduMk4cvsEGGGVbinkFz7065ywKEPK5OFyVXB4lZr+yEyhkG8x4atHSQfscOmiOf8QwcMHwGSHbP2Pyu3Hr4Icq5M6p1Lo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764100210;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FvBCAeb2Dbocj1VriIqfO+jlOYKrjjA+A2x6poexURM=;
	b=z3yZyDmVImzo5LTvCS12achpv5jhCAM+edoFhbyMPI79L2o+IR5bytjiUMPdFDcn
	wWzlBMzuHONPQBry+Sy9IrGonVAODAKrjJYOYhOzQ00JVE7gOTmPbugfVVdeqLppA2m
	NEFM7AhKPqBuiAyjmgiIepyMffIA15FEoYTp71js=
Received: by mx.zohomail.com with SMTPS id 176410020940313.946781822030061;
	Tue, 25 Nov 2025 11:50:09 -0800 (PST)
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
Subject: [PATCH v7 1/7] platform/x86: lenovo-wmi-helpers: Convert returned buffer into u32
Date: Wed, 26 Nov 2025 03:49:22 +0800
Message-ID: <20251125194959.157524-2-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125194959.157524-1-i@rong.moe>
References: <20251125194959.157524-1-i@rong.moe>
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
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
---
Changes in v7:
- Fix mistakenly inverted boundary check

Changes in v4:
- Accept oversized buffer (thanks Armin Wolf)
- Use get_unaligned_le32() (ditto)

Changes in v2:
- New patch (thanks Armin Wolf)
---
 drivers/platform/x86/lenovo/wmi-helpers.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/x86/lenovo/wmi-helpers.c
index f6fef6296251..7379defac500 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.c
+++ b/drivers/platform/x86/lenovo/wmi-helpers.c
@@ -21,6 +21,7 @@
 #include <linux/errno.h>
 #include <linux/export.h>
 #include <linux/module.h>
+#include <linux/unaligned.h>
 #include <linux/wmi.h>
 
 #include "wmi-helpers.h"
@@ -59,10 +60,24 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
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
+		case ACPI_TYPE_BUFFER:
+			if (ret_obj->buffer.length < sizeof(u32))
+				return -ENXIO;
 
-		*retval = (u32)ret_obj->integer.value;
+			*retval = get_unaligned_le32(ret_obj->buffer.pointer);
+			return 0;
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

