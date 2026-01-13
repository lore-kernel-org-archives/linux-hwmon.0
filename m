Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706EF350A16;
	Tue, 13 Jan 2026 17:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768325329; cv=pass; b=FdwWH0bNi2XM38ZZLcpYJoUTUEIKsvOuF5/ni/JHui9/J420lwO3D/I29nfwOPcenDlfy6qXxSwyAoWgxYm3yjk95forC9gYxR8K9hUje+fv8f7q64jf5JWYf66yGH0FpJlXzWz1S0J8r/kup+88wDYrDfVYaZquOyP9sQKnfIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768325329; c=relaxed/simple;
	bh=bJxx+BBuu5wOpM8I7XOoLpP/fg4e7MsHw458WiZKB8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uGyfliMDlPXbpKKL/QTf+KyB0H8YsL8eN/vso1cfkGQTwa3ELx8l5qi3jYI0ozfSCbcAvkE0dSLr9bLVlYjUS5rn0P3Yty26zbMLXl4K+KDUagaIp4DonprbYe2j+dxX+onmaoU81c1cWTYee6yOZlvw7Hv3fX+E+sO8tmOp27Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Loti3C1i; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Loti3C1i"
ARC-Seal: i=1; a=rsa-sha256; t=1768325309; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UCczzMkITw/E5JTC/tynu+7h33FyZNh0h0gEL6s7zQFXnhZc8VqAc7Y/6V9Gyr0VbEwjOs5u2OhyEDUlyo/EUKqpnQ6+9fIirGERR2Jg0JmVMLArF+SuovkHZbwFkqL4+RW++yBkWPzrxNw12EB18QRvITWirLtRnzi5WpkmQUc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768325309; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ONW/Kjo4Iy8zIk9zApmrQ4M3TAi6EzH5b9Jv+iGr0Ys=; 
	b=I88XF/WG6IXLl3fl23BQyAwk0eQpRyetnAlhiK/f3r+Hwnws1xfI97o8Aamd6MggkxTBeKCGVwoIhmhVVB3X7O0qsqgU9jDE9wCJYdpgUy9HWtcQWVgQgsQrsbvSV/755cnD3n97PVz+zWYfo6DRPdu6s+07zRHSk1bcqd4Ss+w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768325308;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ONW/Kjo4Iy8zIk9zApmrQ4M3TAi6EzH5b9Jv+iGr0Ys=;
	b=Loti3C1i8qjGobLnZOsrWryN7VlJCYrwv+kgKbavU/OWQWQu1/3FBrq6eI0iH0Ds
	UexnysA/g8TFueo0ywj/2EDPxwNNgUx4LY5CAYt9ZnEI86p36yi47XXuWGMf1vjzRKm
	h5DXFOG6KMgCcaT6DChB0Xz/alKe9htRgJhnwMlY=
Received: by mx.zohomail.com with SMTPS id 1768325305902498.1311479251202;
	Tue, 13 Jan 2026 09:28:25 -0800 (PST)
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
Subject: [PATCH v8 1/7] platform/x86: lenovo-wmi-helpers: Convert returned buffer into u32
Date: Wed, 14 Jan 2026 01:28:07 +0800
Message-ID: <20260113172817.393856-2-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113172817.393856-1-i@rong.moe>
References: <20260113172817.393856-1-i@rong.moe>
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

