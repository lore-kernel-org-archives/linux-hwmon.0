Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1880539282D
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 12:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307875; cv=none; b=V0ujapk2DNQSbhBkgFqQpY9egFDmsthQ3ASumrGSBRNIdxTUUTvpZb4SP96B38pZbezpsRRSVEdRmBqrzMYylLRgV9C2b8HCQw5KGO1KPK4hxEKDbQCgmcejjeXJGBaH4J4YczMAFVZ/CfbuSWdDiD5X7oH6p7us0QQuL5Hhyqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307875; c=relaxed/simple;
	bh=MxZjnyoTjZPXcSMm3+p11VDtCqa1QXLdN/oQCkmvRzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bw9S9Af5WfMEKYyU0f//5jFvC+sE9OfbRJ7wKVpurgLaQD3Y4Cs6pfiEM1Zm/JsvEMc8ofpk/jQsUPBjTWwaHU376NA7F9tmvmhbXe4Q8WuWkz0Iyvawfwep7JHaTYPP3iBKPJuMdAB5dcfo6ExnsXVOmuCJjK1T9h9RmuoLDr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBg2nsve; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBg2nsve"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-81df6a302b1so3626035b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 04:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768307871; x=1768912671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek8W9y2dSmyH8NdT5cyv4Sc3qF3sYWSc+37c6yKZ4wM=;
        b=GBg2nsvep9xmycM+d+VsY1gAtIvi285U0uDXfhWGguC3iCKmOZHkXAD5G+9L8ncu25
         eszEqLn2nUb+u7Cuq32+uxa1RMWqa7xL+Z3CTr5Qy+Xi1WpQ8mOqZUBA/LQyIRWUsjVA
         2sAIqYjkSq9ASU/oL5wSE7sThfZqsNFPF7CRyug9oq35hSJqEhBSlBao5RD+g0fO2eby
         rTSXgZPx934AaAe1suDhYOUM9Ae5xIKExesXwXGVJZlOGhe6LBpTrFYl+KQblYykPIdb
         aOc3DCT4ADRmHwBwHdpcwMQynqHP9Myo8s2H7lymjls9MzKYoEGAIKRzp8dRRlanQ69S
         S6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307871; x=1768912671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ek8W9y2dSmyH8NdT5cyv4Sc3qF3sYWSc+37c6yKZ4wM=;
        b=YUijT8AZJe+QP9wbb9GyN5X+tfUJ9Q/vHguUVadGdaygzm1vOyKo+1HvB6pDXUWPUf
         PGQVaHgeX34cadpJEVwRHo58KUZBU+WoIBgXpWYvrFVPuqxqlZH3hVhX19jqpVdHPGVb
         2ZyLgW0i6TdRfW1/S6up0HWbwvVwpvXyDUgW4tszgTiy7qhME4+B5NS4NZN1pyxmUioT
         3740zAOupMTg0+3OvM/w3qGIX2D7inwRlAp2aYK4P9NHjLaInnWgvoC/jjOaycyrQosJ
         RzCQFPr3b0dPhfilwFHQ27ZQVgiujXwzenRIZTf2YC5sk+gNiz21y0i5KG+kzVylGVZz
         oF5A==
X-Forwarded-Encrypted: i=1; AJvYcCUoWI6WZebyI57yVywYcQvEYVV6B1oLNtrADSPc2Kkz6pIV24ssLTlVVUxVnnfsBWsDbvgVXH6Zt8Tl6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUdEgKyKiIUjE+ExhrCPmvvF2gkwwGwC0UBakiqZ0hdKFCALI7
	kvjxBpE6RQ+yUOUYbBbNgpXwE6OYFnGv8Be9rQYPeodCXLBbFDSDnMLB
X-Gm-Gg: AY/fxX5QU/XVtsL3LJqEKOKefZJComrZIgFhrTEKlRBuazZ37+/5Eo1XpnnSLQr+Dxh
	SvoH2k084akNydo7f/HSASaDDYFMJnbv6DTVMIuxBS7G9UUKKjuIDocQ6emRrmw1cio6ck9Xcp4
	0i2nl0cTrc46SG/Ytf40isIWL/h/mf4F37qIvHa3E/x4MKifdWYhHG5KlAfCdTdGNQ/fOPt9Nu4
	9NiTIM+gYBGyzZ62xjSIPrBAfiKLA1gCcy9gvnBPaklopJMBBga1Uu14ONzT40KuiKUgVVSY2x9
	TVUsZP/lhn+QtWfX4OWKsZN3JPxTvby+dcjbIlR1SFaEh5icW1HDrs2UkV0iknLAU843jmkpHE8
	Vm1ex3i+R8vnC6NhfjfKyKSnT1nnfmL6pMHMKv3QR4s+dmGT4/tfBzRoFJRJPO/j/43TZyhs5zi
	dFX5OMdmoZ0oFKjyzVJWU=
X-Google-Smtp-Source: AGHT+IG8e45P51e2OmFz4s7Q7ej/2pZW+W1U90Wu+Xy4EBZ5q2CmssSDDyFnRXP9uzzT3G4y4GiWYA==
X-Received: by 2002:a05:6a00:35c6:b0:772:8101:870c with SMTP id d2e1a72fcca58-81b7d260374mr16760305b3a.11.1768307871275;
        Tue, 13 Jan 2026 04:37:51 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e9dd8fd8dsm11409000b3a.10.2026.01.13.04.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:37:50 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	linux@roeck-us.net
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH v3 1/3] platform/x86: hp-wmi: order include headers
Date: Tue, 13 Jan 2026 18:07:36 +0530
Message-ID: <20260113123738.222244-2-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113123738.222244-1-krishna.chomal108@gmail.com>
References: <20251230145053.516196-1-krishna.chomal108@gmail.com>
 <20260113123738.222244-1-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The include headers in hp-wmi driver are currently not in any specific
order. As the driver continues to grow, keep the header block organized
by sorting them alphabetically.

Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
Changes in v3:
- New patch in this series
---
 drivers/platform/x86/hp/hp-wmi.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index f4ea1ea05997..fac8e227cee0 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -13,23 +13,23 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/kernel.h>
-#include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/cleanup.h>
+#include <linux/dmi.h>
+#include <linux/hwmon.h>
 #include <linux/init.h>
-#include <linux/slab.h>
-#include <linux/types.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
-#include <linux/hwmon.h>
-#include <linux/acpi.h>
-#include <linux/mutex.h>
-#include <linux/cleanup.h>
 #include <linux/power_supply.h>
 #include <linux/rfkill.h>
+#include <linux/slab.h>
 #include <linux/string.h>
-#include <linux/dmi.h>
+#include <linux/types.h>
 
 MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
 MODULE_DESCRIPTION("HP laptop WMI driver");
-- 
2.52.0

