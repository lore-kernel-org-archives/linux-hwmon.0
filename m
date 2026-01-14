Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B6137F736;
	Wed, 14 Jan 2026 12:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768393702; cv=pass; b=eu3gHK8mMFtr0zMH+MGR57xg85wDT3dRgJKda82lIDjCvGgZ/tB67jcZwoGx6jzGVI5oZaKJCHNGo+lhmql8K7k2i4ameA6hzj0syaZ3xqzZyf7U0nXetLfpa74ETOLLYlWF2o9nB+gWTHT52duZMZf+Mkrl3GB1uAveSTGxjV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768393702; c=relaxed/simple;
	bh=bJxx+BBuu5wOpM8I7XOoLpP/fg4e7MsHw458WiZKB8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rc8A5VscVvHGX8uyT3Yts2ivDSI4OV7Y+/HC7s45B0t34jCcreznhFtTmLr6qI1OGKA31ItPlwMCbiBJFz6MXZaLCUvDEgp2/LIZSQvDaFJCHRjGwgmkBVL0y5p+KI+GAyjltugu/bgl+4emnC5A+iADjl6LuF4J7WzRbs3GQfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=bMf3DmVZ; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="bMf3DmVZ"
ARC-Seal: i=1; a=rsa-sha256; t=1768393680; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qb8mAW+Eh+/O60SPjlavgM9WgLzdK5P2clqrqP3JYcdra3UVfhjOsA71pHqHQEuo5739Z6FOaOvUvVDY/6XvNIcQYKTZSTUNiKCYr1fLqfcMXxn4ZS62ToKDakKxcBiPwCI9VNrZzIQgn45UTkybtn5qAZ3yk6q5SHPEgIjyJUU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768393680; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ONW/Kjo4Iy8zIk9zApmrQ4M3TAi6EzH5b9Jv+iGr0Ys=; 
	b=D9cgF0DoXM0eDSEcUYu0tPn0CfrlLQKz4cLJu4sdyzwhZaDj6i46YvKyYb8U4sBySLkFQHDIQP+r41+Fulfvh0Zp6+QM+wSw/znggaCVtDITZQFFtHzSLwIjmunSxzAwleACz5b7Dp/omT+bmjEtWhV0kjeSvk0r6OyAaz+kWRs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768393680;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ONW/Kjo4Iy8zIk9zApmrQ4M3TAi6EzH5b9Jv+iGr0Ys=;
	b=bMf3DmVZOU1Sk5iSNHvh5HiGatGtXLsCAHnllG21ZgWGXpIrIF58Bht66qn2cOyi
	Q0zzYJbd5kEAhlRFJWejMryz+fFxKGm9MlLC7hrZebfBudhWMJvWhLW6uf4NgNZ7etd
	FEI5qhw1L358xPb/iEZmg9H0upg6nQ9BFI0LhU6A=
Received: by mx.zohomail.com with SMTPS id 1768393677986421.9815738811509;
	Wed, 14 Jan 2026 04:27:57 -0800 (PST)
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
Subject: [PATCH v9 1/7] platform/x86: lenovo-wmi-helpers: Convert returned buffer into u32
Date: Wed, 14 Jan 2026 20:27:05 +0800
Message-ID: <20260114122745.986699-2-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260114122745.986699-1-i@rong.moe>
References: <20260114122745.986699-1-i@rong.moe>
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
index f6fef6296251e..7379defac5002 100644
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

