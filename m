Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49D638F938
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 07:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928784; cv=none; b=l0wF66+oaoQOPAMYBfXhOWdg85g5A5MQqtdduc1t+EbSAl0q0AKC1yLmQA+VdS2ETsMRIVBjOWhDWorhSsMViQ8/Rlc6pvBZBodq8JO73QQcZpI5iKFqEQZVUMKep0ehpcMX9QKtVh//6qbVTqXih4z34cVGmdiNarn5l1GN89o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928784; c=relaxed/simple;
	bh=0ocoxi7CHZcv4ySK2i4LPeVm3pWLM2FBVNGsTmn9l3o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mSdqy8YpzxLuuePF214ml8mU7r7nC6XzO+geOGNA65hwfVjQYBHofJ5glmzU6Wac5+IRaQQSChQ7F7f/Fk1/KrHuPfZgwHeccEQ8V9HJKTrdqwTVn5FHbPI0oCUMb6J7Nh9c4besptyF894PFIYl16KesUB2Y8p+sG2ykcEtbUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKGg9136; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKGg9136"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so44529045ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 00:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783928782; x=1784533582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lcyi2dUUtvxrXwOPfd5hmyhdh03HvfTHVOaEJNs2rJw=;
        b=gKGg91369vBJ+Zq4kpCWMR0R4kE0KSZaOuvMeBMO3LQZjgyioBMNvWBTA+vgb+VccO
         6hgXiRmKPJ3PkKpkCcLbIDzVbhFTCkL4h2287WC7kxG4u31pwqIalzjynZdetaOoExpN
         V6GG4oZse2LkmwLEZPvppfZlqcve2hbdualnb1WIm24aMrKVIiwQfh7ivLgU4EXkvH4H
         EwQy3E8DZYR95/2IjN4VWFc7TEchs56FhK8hrRVxBYcX2VDAWjnPQ700yZ9GvmBk5xNE
         U4il/CsC1OmffuaHv+fe2PsBDlT/E2sITFwHeLmtS9wreUZKWRqqQPYqX0hQ3JiLtWX6
         6QIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783928782; x=1784533582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lcyi2dUUtvxrXwOPfd5hmyhdh03HvfTHVOaEJNs2rJw=;
        b=Y0aj2g/zn7z8E9TQX8V0Lm/GlyenMqXxS67yYxNgSgPOLs5Ea453cmFqTNCR6OwybZ
         j0yPYs2LP0VbTP+vdtjZw3FZhomP2WQQWnaNxB6+btKENiuK0ri8p9Nc4PsafBDXt0IL
         yFTMDunN6TVhagYMhArv9dUOesagfQ0cook3atPtP/bKtLR4wzCFD7Qwm4eWIRnP5XUu
         pYoJbAV3kKxtoHpPEWaMrntQkk2gHNJKDzlSacv4mmwIkP8gWSktFRSgP7s/oOiKna8K
         PypARhZASdCEupND+u+z3bmOxXGcEkix0iKtIPbNeVRv3yb/7J84NrmjBACaZF/7F1oU
         hJDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpl3qIsr8C96dJvemQGDEGU2N3nqe1VZPplReECtpIBZJ1LUAkyKQJIDfW9eghfm6OlVrscVsMfEc3NCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd/M/+bZFVAWcbmNrcitRCxaiqJ8QshyyE7Yo8W6+t8v++3xZu
	ZCu97/9Fm6/OXow5y+puqYRTZPlmAIyqtyqgjebmR1aAtYyG1pB4sWUg
X-Gm-Gg: AfdE7clRvFCVSK+moZhHbcWE3Bn1yzzEqef1Nh9rH4P2rAfpCNPSW+kmhhV/L/xmRF3
	jWorQlaFT8kbHgevV7v0h2UL7ODOj6YvJz9vfQ0yH81Wsp8izzgm+jKuGBfCboHcs3GtKbCWllF
	soKozufPrpt+ljaIDO0o2NZu0ErGJwfNYh2/p1Lz99F4h8hJckUZcPzLV9fR3Qn373XXGR6CyhD
	VJkoPyCAF9Xo+PE0ov4boRe6pH2ie6OOb0tJR2WnQVTNDei7HrVYxzrdmSZEZHL9yHK70agDPNn
	WT6OA865qQ9u4Bz80w+VrkeFoyMMVgc8f3FbwnwTwnVvIevYU08qZLfS3wRvnHyH5EFtEvB3koD
	WHqRUZMawVH3AlRLSHF+xDNFK6/3mILPXkDHyQKcZDzJ2VEIF2l1zBAL6t76Y23MXLXAwxrzylA
	TI1X1JEuN9sugWEDEwJvME4Q==
X-Received: by 2002:a17:903:120d:b0:2cc:864b:539 with SMTP id d9443c01a7336-2ce9e79feadmr90378155ad.6.1783928782036;
        Mon, 13 Jul 2026 00:46:22 -0700 (PDT)
Received: from HP.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bde9sm94960105ad.79.2026.07.13.00.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:46:21 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Subject: [PATCH v7 0/4] hwmon: (sht3x) Add support for GXCAS GXHT30
Date: Mon, 13 Jul 2026 15:45:55 +0800
Message-Id: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds devicetree support to the sht3x driver and support
for the GXCAS GXHT30 humidity and temperature sensor, a drop-in
replacement for the Sensirion SHT30.

Apologies for the long delay since v6.

Changes in v7:
- Model the higher accuracy parts as compatible with the base part
  of their group in the binding: SHT31/SHT35/SHT85 and GXHT30 fall
  back to "sensirion,sht30", STS31/STS32/STS35 fall back to
  "sensirion,sts30", and explain the grouping in the commit message
  (Krzysztof).
- Drop the "gxcas,gxht30" of_device_id entry and the "gxht30"
  i2c_device_id entry: the GXHT30 is handled entirely by the
  "sensirion,sht30" fallback, with no driver changes (Krzysztof).
  Patch 4 now only documents the chip in Documentation/hwmon/
  sht3x.rst and the Kconfig help text, following how SHT85 support
  was documented.
- Start enum sht3x_chips at 1 so the OF match data is never NULL
  and i2c_get_match_data() does not silently fall back to
  i2c_device_id name matching (reported by Sashiko AI review on v6).
- Mention all optional properties in the binding commit message
  (Sashiko AI review on v6).
- Rebase onto hwmon-next to account for the conversion of
  i2c_device_id tables to named initializers.
- Drop the MODULE_AUTHOR addition; authorship is recorded in git.

Changes in v6:
- Drop the trivial-devices.yaml approach from v5; add a dedicated
  binding and a proper of_device_id table. (Guenter)
- Split into 4 patches: vendor prefix, binding, driver DT support,
  GXHT30 support.

Changes in v5:
- Move to trivial-devices.yaml and drop of_match_table (wrong
  approach, reverted in v6).
- Drop wildcards, list specific models.

Changes in v3/v4:
- Standalone YAML binding, split driver changes from binding changes.

Changes in v2:
- Fix placeholder in MODULE_AUTHOR, fix commit message wrapping.

Zaixiang Xu (4):
  dt-bindings: vendor-prefixes: Add GXCAS Technology
  dt-bindings: hwmon: Add Sensirion SHT30 series
  hwmon: (sht3x) Add devicetree support
  hwmon: (sht3x) Document support for GXCAS GXHT30

 .../bindings/hwmon/sensirion,sht30.yaml       | 71 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 Documentation/hwmon/sht3x.rst                 | 17 ++++-
 drivers/hwmon/Kconfig                         |  5 +-
 drivers/hwmon/sht3x.c                         | 15 +++-
 5 files changed, 103 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml


base-commit: ca078d004cf58137bcf8cb24a8b271397431ba58
-- 
2.34.1

