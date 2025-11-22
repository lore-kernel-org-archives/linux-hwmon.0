Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com [136.143.184.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43282BFC9B;
	Sat, 22 Nov 2025 18:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763837168; cv=pass; b=RO1SMLoDkBli8b6Gurdpl3jWKu8u+7lZgf+nHxSanIhJSN+3GOUYqENp7B8md6ci0/ctyA+G3pSf6SxZHk993xANE/xns+/an4gfwzGsNiLZW9Z/fAT2LoTXD9KBYjyYR+aKHo/VE50Mny+v9vfg90wpmKZyfxOUtuLhBch1vyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763837168; c=relaxed/simple;
	bh=ecTJTw+oSM3tNSlCIkDlAVotPboRQh09ty+YLMBG9+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EC2F+XNEKqaKfR+d9Lwtq/ejzY64U2rIeQZauTor1QypCOoWVOD19pASA2fjf4kkjxlvBgXoyYawQqU6Tpgr1aQk3tZeevKwFWJ13p6zDiV7326knTOYJ/5cEEM6xNrigU5Z6QEWnZfEPhrXVwPR1KT+ncdR42PrrpekY4MgwdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=iKzKFhjP; arc=pass smtp.client-ip=136.143.184.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="iKzKFhjP"
ARC-Seal: i=1; a=rsa-sha256; t=1763837135; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eHFdma/aMNmR58bO2yvtvm95aciDx7MKk0MiRnv0sk1K7849KDZdTuR2TTa9/g/txlE0Tqz5vwT0xfElEjiqPWujpU/3xsPwwkIWWWIeaW1ht9D+T2jMlQyZlMnFWu7vcCgrwEfG80Q6/fn/p8dSlevdiCBXFRH/s5AYsIHAJLY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763837135; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=V6mbcUNzlPdSDzsDR3A8k6pv+SFp4Kt/TUyeTT5ilsw=; 
	b=LpobsT5FANNNL19Q4srL/jvOq9228WWDqDcrB6wOLmFYFP8Da0IGQ17HeZ8Zz0uoz7ehOfOTxWnZG+8ABLifOyrHF+PQM/1YQ72aZUgiez2jYda23ZHw9DLcqfkaqhIo0bgOAOQPQKEAyejht6Aph1Z4a+o2+Jz5gbBdfOt618c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763837135;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=V6mbcUNzlPdSDzsDR3A8k6pv+SFp4Kt/TUyeTT5ilsw=;
	b=iKzKFhjPn4aP4WGxN4+sx1j11dnY5khS9ADDDgwEwjzHD31suylLxUWQxK9H+LWH
	sce29Gm+aVGoO27b40lbkblT21RGmfQJy1sX0rIwlVhnUb9Tumk2GP9CPjUWNUIjNy0
	K0VUms1RtLUFRORLjOgnm8KrEHR7F67rf/hDIk/I=
Received: by mx.zohomail.com with SMTPS id 1763837132846337.00065785290144;
	Sat, 22 Nov 2025 10:45:32 -0800 (PST)
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
Subject: [PATCH v6 1/7] platform/x86: lenovo-wmi-helpers: Convert returned buffer into u32
Date: Sun, 23 Nov 2025 02:44:41 +0800
Message-ID: <20251122184522.18677-2-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251122184522.18677-1-i@rong.moe>
References: <20251122184522.18677-1-i@rong.moe>
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

