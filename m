Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA82288517
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Apr 2026 10:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775470657; cv=none; b=TvLYNsQpsgokCmrzHGGc06mRnGCFUVdt7H+CPThaAAWfvwHiw5OD23B5/s9HqA0AfYseCPuxCSlJFirb5q1c/FVoW/0Kw5roy4lNOQsu6sShf2DXA5ZFx3Riu/RCPgdKCl7B0SNtbQGQiCCwNdxkjLbLgdftKjVWCsBX0GscdLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775470657; c=relaxed/simple;
	bh=63elwyNmPr3tbn5WCA3hlZKwTsIPJ2+6R496IOmWyC4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HekJSNfnrhSCvE7Xl8rJhSHpLUTN97qsuf4sHvpf+zy6aZApW1KoOAa2PBYG/BpdNbQnP2VQKHBKphDfmaJV02abqqGh5gH9rd4+m+VafODzorq5I2G0ebjRUnP4aFR3szKv0gvbCAM0lgTQ+hkLkoB881Omy6P2dWWGKxZ7bqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NABoEtZR; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NABoEtZR"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35d95017a68so2008726a91.3
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Apr 2026 03:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775470655; x=1776075455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AoSsEM5O4ac9h2V33FBAbsK6vxbKDf/9prfLiXzD3QI=;
        b=NABoEtZRw/fl0esP2t2l+j1PxdFoKLiEKJjPONaVxAvUp4O5KfkHz7nVDk3VA6mr8K
         G9NaFz6hrd/lgLxG5T2SpytOdo6O+hbyPfEGIan93wEPubjU6XGhSH5/1OFLGxu1zBfU
         eIK+Rcq8ORbRS5F8Liq4UYTxOyCdHFiD/CyvqSBhcNBtoVeIBD9rY0J9t4kkayI85Dxn
         GBNXjQBLUgxDcaB2pUXE6lcsDo8mwoIdA/HSId8KPtN7moB2W9YD3fgFP+RG/TL/3y0I
         /W3HLKvUenaQFMKZg7B+rxccwnyJt4AKAvIGrdcgMbCTqVKJBrVn/vpGPX8LNyJeVXaT
         3UmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775470655; x=1776075455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoSsEM5O4ac9h2V33FBAbsK6vxbKDf/9prfLiXzD3QI=;
        b=KcK9rIoesR51haSdukPSsbg0jyoKLDTg+4T2zVxpbLGpWWnGfseMUA7j83D51Ou7dY
         G5nholUwsQVAx0wbAbMSpEDF24xZnQXkaOCo17iI9x+TG9UyrQ3dSr2amQJLIibMuIJy
         WU7pUHvSuCDbIUrotGk75sHfXKvsxh1kmKb/UuzW6fv/mwXas8ERjnUODxEjB92ijsFL
         HGLjIx4R4KcfchIUzLV7i8D3FhiieQX0KibI44etRk/Q4iGU0sy53hUwW9nt818R/K0+
         ITpD4b2EhQiCW8XLmXafkZM8/RVHHnmVEBk+EBC0olmnMHF60ot0NzDkBfQYadtFtulU
         imJg==
X-Gm-Message-State: AOJu0Yy4OfF2hF4NCObZYvkkRIUdER6savNM9o+pr/zVwA6MzXnQoVRX
	2rb3SbdQTNnQ5Wr/00k99TWjqzEnfPCBf9GNQyFyeBTkO1DkfDmP3vKd
X-Gm-Gg: AeBDiev5FirIRSteSR34+o2CaG0AlGA0S4za7XpoxeqfZJlfXZ4K+Vs1y9ON1ujp5T2
	sRdLo9jWJJMzzWxH1nwoDNiuQisDzpLL1A/nWFZrai/UxL9Aj8VJZt8FualMXcjl08uboCIBz+8
	Lf7u+RPaWMFtyuXo9TgKw38w9UHRvrQrKF0lYsyBaqz48DP29RCV9VRhrPM+jmvOTtM4bbHTlES
	ItbPq6ddWl09GPw5mo7kkEyErYrrhS92JwYtAxdaCMWXlcHeqjf+7tkF6tOl2ePkq4HgJGx08sS
	bjwuQqknnOSRk0dzNAgSmVgNFApOUKzXn+6mWPNySHH5j9g9YZEal+Q4DFTi7o0r8gkYL/bs08P
	zK2ztq7SSCkzUa97f/sQZewPWn65FAnpWfIZoR3g6o9YFYiM2x/31TZxPnE6dGvspyj4xAMvi3Z
	ATcnOQgTfNqfs+3fApTSko7L+NgUM9hC2pIqHKf+kR1IaA
X-Received: by 2002:a17:90b:562d:b0:35b:c900:79a6 with SMTP id 98e67ed59e1d1-35de683ad7bmr11330437a91.4.1775470654643;
        Mon, 06 Apr 2026 03:17:34 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:c94a:aad7:a860:f869:a68d:92e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe624756sm23332527a91.5.2026.04.06.03.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 03:17:34 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Add support for Infineon Digital eFuse XDP720
Date: Mon,  6 Apr 2026 15:46:45 +0530
Message-Id: <20260406101647.109667-1-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>


Hi,

These patches add support for Infineon Digital eFuse XDP720.
XDP720 provides accurate system telemetry (V, I, P, T) and
reports analog current at the IMON pin for post-processing.

The Current and Power measurement depends on the RIMON and GIMON values.
Please look into data sheet sections 5.4.2 and 5.4.4 for more details:
https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf

With Best Regards,
 Ashish Yadav
---

Changes in v3:
- Link to v2:
https://lore.kernel.org/all/20260401104550.115715-1-Ashish.Yadav@infineon.com/
- Fix commit msg, added missing supply info in devicetree binding document.
https://lore.kernel.org/all/20260402-enlightened-analytic-leopard-ddc512@quoll/
- Fix .m[PSC_POWER] value issue.The divisor value is 10^15 rather than 10^12.
https://lore.kernel.org/all/258dd77a-a8d9-4540-a32a-91a3f13c6ed5@roeck-us.net/

Changes in v2:
- Link to v1:
https://lore.kernel.org/all/20260330102345.37065-1-Ashish.Yadav@infineon.com/
- Fix make dt_binding_check issue:
https://patchwork.kernel.org/project/devicetree/patch/20260330102345.37065-2-Ashish.Yadav@infineon.com/
- Address reviews comments for infineon,xdp720.yaml, Kconfig, Makefile and xpe720.c:
https://sashiko.dev/#/patchset/20260330102345.37065-1-Ashish.Yadav%40infineon.com
  It includes fixing of extra space, non-ASCII characters and use spaces
  instead of tabs.
  The xpe720.c driver file update with DIV64_U64_ROUND_CLOSEST() and 
  MODULE_DEVICE_TABLE() as suggested in review comments.

Ashish Yadav (2):
  dt-bindings: hwmon/pmbus: Add Infineon XDP720
  hwmon:(pmbus/xdp720) Add support for efuse xdp720

 .../bindings/hwmon/pmbus/infineon,xdp720.yaml |  59 ++++++++
 drivers/hwmon/pmbus/Kconfig                   |   9 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/xdp720.c                  | 128 ++++++++++++++++++
 4 files changed, 197 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
 create mode 100644 drivers/hwmon/pmbus/xdp720.c

-- 
2.39.5

