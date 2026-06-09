Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C663B19D1
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 07:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989802; cv=none; b=RkLveynF+1J3JIvudv9/B6UxDXmdI4ON//emEu8p2IrMGye7nz/XweW+IIosvosZK3wjGk4WlkK7plU74vGvINBGLwj34SmkEiCd1VCE60TAdl9YB00BZtaoLdYpZq16whToXJUwR0ExMdBXaa/Ueo5uv2q5u3sfyr4NrFMFCKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989802; c=relaxed/simple;
	bh=zxJY5IonfXfu8tKSMwhdy5vQNg7ATQ4BXUtspsMMwVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=flbnkVSRGGgEVB5/EwcidQneOC3BDekgEPxxDFoikhUFOmaLdc1LE5hQBe13gDEScqOqxcopruWKkM30liMGBcfMES/BofM2x3S0UzKWZE1GJsciMzV+4Fk0NyeYI2iDZIoAbgV4s7TGLG0ao/xKFYQqsA8fjk4DP4uZtkbI2cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrPSfkWw; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrPSfkWw"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c85b2139015so1725225a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 00:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780989800; x=1781594600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVQHwWBDJB1LhCos/li6eb9i1MA5j3meRHtKF9Li0yA=;
        b=ZrPSfkWwCo0UDzzUB4ifHGbN97DafVog1wG2UNdFhMTAvwBuEP1GMYh06pAer1qZQw
         SGwEh+Rkt2l/grI/nAS6UPDrLCuZZVTBloVIZcPhpKN1IND/V7bBCDsuHTyIGWnPz/fQ
         SFuz73O9edo6EVgq35+n6Q7aMJXIJvJNX2SxBnj9/2qNnjyuXkBRrqfDS64rdHxQTuC2
         qrMCdIO9dUXNM+jacB92zaR1eSdVLVRNfcA1wAUhKeVSqoh+S0RNCFDWWG2x+SG3Yzny
         bNTLiMFXnBfKP9RHy7Er7DvImNqTJVq3erf/5lrjW0BrOjQ3Pkf8AZzsMgS5nI1+nJb4
         eHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780989800; x=1781594600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lVQHwWBDJB1LhCos/li6eb9i1MA5j3meRHtKF9Li0yA=;
        b=OtIBnuyf9VXxOh5rf56q8fLsM3r8tArj3OMgn7PBzpLiBpa/sHkO0tqB1MWD7RNs44
         3ai24CitNrv/Sv+1n/cSy2aTiNLR+sb/dVHgNYP/jhHmHyViesSDyjJSb4HLa0SLEMtm
         Uni9agBMEfoDpTHt/HJYWekgI69jQLDhwvJ1JL3mq5pPlNvE3LP9+XewS4I5sSDAgInh
         tOj4pGLME0ocr8imGEZG0oNhWRds+PwAVUB6POOIms8Zh82eBvHXlpmMv6Fp862Ph0rv
         KT1Ph4GI7S7pR7RMWb6sVWCGsi+pyrTAZ3oqNhy37v+wgqaNmwzAlnAK3i3S/7RKsyVb
         SG0g==
X-Gm-Message-State: AOJu0YzfApuI81sDi8beVc8WbHUNjeGM9hQ7gczo6Oeu15b0DWRM3cqU
	H/4tdPoXOHNuAzulwAaY8j75hhUVC258O9Il1a3ahmqNTNa1zi/YstKu
X-Gm-Gg: Acq92OG5FGzoofpqmf5wDb73U+NI8+QCEOrAXsyGU8VWWR6+Eths+CY+LJ+5NWHTrc5
	gmw1bhx5SQ5rChsvqpjua9AribJu4vGvtTNfP+ay2dBHT7cYOkJ9P3ZsmobmY8nZ2X4yLsjjw8E
	+MB7ekocbGc3BEyUpoNaVWpYbtbjIqsAFeEJ6ETQXJCo+UbDjIIplUTHxiLHvahuAsm5nRoZ8c7
	BZy/VM3TmohdVEQ230dE/q3jxvwuXd9FZnt6xF2Xk1be8o0qQd95nWUXPs2e74oZw94DM3mR5nc
	aC/bLoNaQYtBiVe45zBbgj6PDT6ul6KtA6SZxqc1BU2orpha2/OWrht/J0cqu3r0RrD8Eg2dAzM
	IWRZufdSZMOcQIatXFkHLWDJDKjc0GFisJBqf3T8gOAKUqlrFIBfjeRxvvJ/tR9t9Ueef4XRgXZ
	UnP4fRkYtfFDc1IngveUF6l1TL+IhZI7fnDEM3cAs57fzNQhSPp1S+z1tkhl7oSanEzxQ=
X-Received: by 2002:a05:6a00:3909:b0:842:614e:cc97 with SMTP id d2e1a72fcca58-8430a70f66cmr1936912b3a.23.1780989800251;
        Tue, 09 Jun 2026 00:23:20 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:c919:66b5:f0e5:3e9c:92e5:3878])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221671sm21702448b3a.4.2026.06.09.00.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:23:19 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v5 3/3] hwmon:(pmbus/xdp720) Fix driver issues xdp720/730
Date: Tue,  9 Jun 2026 12:52:31 +0530
Message-Id: <20260609072231.15486-4-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260609072231.15486-1-Ashish.Yadav@infineon.com>
References: <20260609072231.15486-1-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Fix driver issues:
- Adds the missing regulator and property files in include
- Declares XDP720_DEFAULT_RIMON as unsigned constant
- Declares struct pmbus_driver_info xdp720_info as constant

Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
---
 drivers/hwmon/pmbus/xdp720.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/xdp720.c b/drivers/hwmon/pmbus/xdp720.c
index 0f106c13e7ca..b273e53a01f3 100644
--- a/drivers/hwmon/pmbus/xdp720.c
+++ b/drivers/hwmon/pmbus/xdp720.c
@@ -17,13 +17,15 @@
 #include <linux/of_device.h>
 #include <linux/bitops.h>
 #include <linux/math64.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
 #include "pmbus.h"
 
 /*
  * The IMON resistor required to generate the system overcurrent protection.
  * Arbitrary default Rimon value: 2k Ohm
  */
-#define XDP720_DEFAULT_RIMON 2000000000 /* 2k ohm */
+#define XDP720_DEFAULT_RIMON 2000000000U /* 2k ohm */
 #define XDP720_TELEMETRY_AVG 0xE9
 #define XDP720_TELEMETRY_AVG_GIMON BIT(10) /* high/low GIMON select */
 
@@ -38,7 +40,7 @@ struct xdp720_data {
 	struct pmbus_driver_info info;
 };
 
-static struct pmbus_driver_info xdp720_info = {
+static const struct pmbus_driver_info xdp720_info = {
 	.pages = 1,
 	.format[PSC_VOLTAGE_IN] = direct,
 	.format[PSC_VOLTAGE_OUT] = direct,
-- 
2.39.5

