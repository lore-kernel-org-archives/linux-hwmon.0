Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E457419E992
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775804526; cv=none; b=DQ+NC5qISWAlHD107+BCkItsvmmWsptFYvMCkZ8blleXdiC/x0PhYJcnQPMIyofQOooahRQDkDDlUmTK9AJQ7Dze3BN/o5dLyYGMXv+e4P6DYRvv4lnTyP5GtkrEz92zdcnydlmNyJStlKjAmqd/SoODXd8rB/gVAVgoXUjOFcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775804526; c=relaxed/simple;
	bh=7Y86DDo5VAMBiAxY2PuF300xq9sbLZaZNgSm5f2SADI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cPcAAvuR/GQtZN3BhfOUjC9umIvZH6M5HEmVKKa2hSGnpxSi6Q93yqMjcShUheaSnx9/gxB7Jgw8TLN/9uq7KIpVA8fd0NXAAmHP99kHzBGe1D60AFUNreFf3PW1ah6Nn6CIHj9pUFYcU3FpAcPUNHm5EDk7l1jmhZIyw8ldBbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crSUlu3D; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crSUlu3D"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ad9a9be502so10745215ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 00:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775804524; x=1776409324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6xcIRlgzl419gPL55350Fr2NFng9A0BPZpNjuc0Pchg=;
        b=crSUlu3D2DMAHd5h3TmrIzPfZf/V7U7TsTh0As513A1tM65p4FfDCOWgBt+BWZvcz6
         K6PyJTHJ+q41o81twglu08Wzk3O6fxFt8yt90kBI7C7ox2TYNu1Y2mXYyXy/LYpjhphJ
         kXb/KgvRRiZ9380or/xkusa+lz8r30bTq1Bcbpk62t4YpAQr1Nj8z3SqYrkcVoQTpzr5
         yDh/wf88pNPgUjuvaeAblPTOkU1f33bdv38Ni6EjWV8YNLHfCb45UYyrwnJ+aYHq6nOK
         zDHfbboQkKiw7GyVjfzCOiCbtOZ+m/HRlkCpVdYUcZOAsPb5OGUMRSRmAedPrbSfcwu4
         Y1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775804524; x=1776409324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xcIRlgzl419gPL55350Fr2NFng9A0BPZpNjuc0Pchg=;
        b=KyfHfmQD5j7Qf1iDfKZQXsI+ksqVsrhABJbad1keJ9RZqRVyM6E0J8IpKdkk4HjP1Q
         GclW8bi97ZNWodNmqY1c6lNEbr0H91Oqr1PH1d7aSmGMsbHtwH/OHlIQ0NV9UcS0OlgA
         smmkhIs8NgfNj8FkWITwB02XXbb6YaLIENluAhDHlQ69mog+mSh1yAGXFAq4y+Sp3yv8
         cY9M6Goj80m2kSlDeO3PrVHA7TmT0VUbPeldW5PedIs1qVE3kOPyt0idu++kB1JwL1EH
         69glAd1/j07LByB+WzU5wAFgtiajvhK96JPzDP5tbGOXNL1jPeDesEVTroefyUJV+aJk
         Apig==
X-Gm-Message-State: AOJu0Yw+7FKNgauldbeGwqCj9Ix7EeHSdaggTswLH8ayFyPPP2FPo1Df
	3QwAQsfQCemLjXqM8BT069AsFWtA7wAwlK5WDZicxIdhAmFyViJxUroN
X-Gm-Gg: AeBDietZ5M8oCVr4hXDoEo3OdPhuwj5GOXpju9cbkeS1YGlQQzbp8pHuniMSQqJ+IU9
	3o9JaTy1dhir1HDG2v+63KpLqt7ti/WjK+9pwT56gLSmiIRo2FhLWmw0NjeqjGeXt3tWzjQyz/d
	hsvLxPiCXJmHHFH9b6fUc8Ao6p56Fe5FXGF0M1/Hdrkau5rBK4/p5g/Fg7thQAdVHAD+COPip3d
	Y3rVEYHA79uKvVizParueeMfnQyGLAFyQjpEA7bbO6uHOz0xnE7BpNHz5c8c9dQ9+lT4yG6aIUm
	0TIYwLP6IfmfPCtc/WXxAATTvCSfeag6A8+GFa3I3etevdIJcErhsijPtoSB8jlPshqghN6gTYw
	VjdW4UhoVXUo5BZ+O3cY5NsZy/bWa0Hu1mnHpG3EOGNWRDJdahDhNEqG7xV54nY7rvK+n3h+9pg
	KZAP5Mn8bLBL22cFGmPyQDlkinYuwk9iDYo03HzoNoy/W+RQ==
X-Received: by 2002:a17:903:32c7:b0:2b2:4d78:eeb4 with SMTP id d9443c01a7336-2b2d5a29f2bmr23218675ad.22.1775804523970;
        Fri, 10 Apr 2026 00:02:03 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d025:c808:7be3:a746:1e98:3ec7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f09e85sm19310315ad.47.2026.04.10.00.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 00:02:03 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Add support for Infineon Digital eFuse XDP720
Date: Fri, 10 Apr 2026 12:31:52 +0530
Message-Id: <20260410070154.3313-1-Ashish.Yadav@infineon.com>
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
Changes in v4:
- Link to v3:
https://lore.kernel.org/all/20260406101647.109667-1-Ashish.Yadav@infineon.com/
- Fix commit msg for devicetree binding patch.
https://lore.kernel.org/all/20260407-monumental-mastiff-of-sunshine-fb27ab@quoll/

Changes in v3:
- Link to v2:
https://lore.kernel.org/all/20260401104550.115715-1-Ashish.Yadav@infineon.com/
- Fix commit msg, added missing supply info in devicetree binding document.
https://lore.kernel.org/all/20260402-enlightened-analytic-leopard-ddc512@quoll/
- Fix .m[PSC_POWER] value issue.The divisor value is 10^15 rather than 10^12.
- Added devm_regulator_get_enable().
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

