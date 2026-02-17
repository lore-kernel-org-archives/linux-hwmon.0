Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DB22D8798
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Feb 2026 08:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771315933; cv=none; b=HRhfEor6CMl5BPe644x19mZZXmLRENeBxWZPitkBSq6y7QooLSTp9TGeGoRQmdCicc3J2qAAzcsOMdPB4RO0pAfgrLkyRE5c9nhqOeiJSZJ6QOMHesKhAHZt4aUvRzcdps2sbfqBxMvkyJE7ITKFKqWOgE2t66V6TD3SzzVVACQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771315933; c=relaxed/simple;
	bh=nUEhTFG/7UBE/bp1GdYkZho+b3xUavo+boubP6XYsBw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hRpJf/YiIdzTvtk9dBeqriJnAOmkzflzdAQ8iDu3YOWvBnoH0Vy3GSRJKHBN/ma8wO4HOq8p41LTKkougiEPDz0TFUAusGlkXzGC++fW8KkvdGMnqhXgv87t93pgHaEv22JQiw1tnFpctwErqnjHktJTcodT5f3gCzbj6A6xO4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jUJwPgRG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jUJwPgRG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4807068eacbso29966815e9.2
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Feb 2026 00:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771315929; x=1771920729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gb6W1GryaZfBbGOxIz34ZV52pWSStvnj73mIghaUYWU=;
        b=jUJwPgRGOdcXz9utJSkIrokB+h+hNDJpOIhmYbEEGxq50sWZ2dDPoZ/Vi2NAvUNkdd
         plJMKeR8pBbdg9DwPtW93YaO8l0qXFlZy6MlfrPXnd1fMi6GduR6nzCe27wuJMUwHhdb
         EFChAFAhmMTBHSe6u36h1Pe+amsCEZxcQBGcqkhx4CtzDLjtwNaCvpt8aoSXOR/g3iCy
         ScCiCTsMlq3q5cxwbaUqZnlHbmitj6CB9t+BJO1CGTYw8faG7Behj9LrvRqzZT2UmwsZ
         Ap9jhvu2r8zF94ft42+jOpdN+6Qi02F7WBUUV8/bnKukaKfzNrodyj1dcAi/fwyf/1JS
         3cXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771315929; x=1771920729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gb6W1GryaZfBbGOxIz34ZV52pWSStvnj73mIghaUYWU=;
        b=pmJnqaTWPL0vck/V+j41Eb4fdy8zMafmgiU4m3Qw/AEyByLA0cENV72ruVPpIXN5tW
         hFvlGrI+E5FKX9eFN+aFHMBuLouiIH6qKZQmdraJwnbC/ic7XZe0r3Kg1t/vKjOAspA5
         4+KpapAHSOLIg/WO/dN3SLDN8FkUVwi4fq8mT4Z5OLJ3+M7Pd7HaYzXboOJNSuTe/w8x
         swAIVc4guhe2ht3sg/H56HprABLw8ceHTVXxJnyofCRD96wniZx8+clZ5i5Ty+lA4SDj
         RosM8+0gpG7C1XOATmkPZXXKlSUxf73ZcWX7QeJ+e+jb9Ia42Uo5Pyxscc5cXzbwDS44
         J7Xw==
X-Gm-Message-State: AOJu0YwPgct0U8fMqxiZItnJJtR6Lxs1tQmJtHPiEpM3WFFzkh/CAdJT
	UEpONLCUERsioqYp2Y43FuvxRUzbRQYKCCyU8sodgKe4kL5OiC36OQPQiaFbKjYH7Rw=
X-Gm-Gg: AZuq6aL8mQ0qs4WlkCMcqPXLWmdPjaA7v/HeIDQ47nb4ZCUmKfVJEuuVsADL3B//hd7
	hSFB5CMc5oFJEVxaa19XiviyEmJiGoUSK2WHTv/SLpGP6+Xe7Sni1OVzRyAwy6lw1XzebeDSFpl
	/tCru4NyJPYfFZvFBmtSmHMs4RzSct5ydoIXZes8uV1W3Rl9p1EBoLUc0NV0P5D/E/+7G6eth8Y
	qP+ZaE9J3v5UXr1lK7DleMZNUf0awxDWfR+2R8XlqCTNqheND6XHYK1M1VMSdMQdplhBnvRF1PD
	SDqCoJdzoL8OcYbX0pOQEfaCkFm28CBsDXln1nkGWUM0IUsJ+Llsn++/3n9jUizjTqhUVw9VPZQ
	rAnOC17LOk4UnDwTMM9b1j5M5xZOO0xqfVieBXLyM4jhLeNu5Udxwol3gIyMO6XtdleiZL6XeTf
	Z8G5EwsMXlxDhCH+lIVcvfShUQ0gSvl95Skm1rHpSN3C3kSrMvBRW4WwSDAxiVBJZqCgca6JMp8
	0MfUf7S1A==
X-Received: by 2002:a05:600c:3d87:b0:480:3ad0:93c0 with SMTP id 5b1f17b1804b1-48373a5d6d5mr188570635e9.23.1771315929400;
        Tue, 17 Feb 2026 00:12:09 -0800 (PST)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5d156sm35757690f8f.5.2026.02.17.00.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 00:12:08 -0800 (PST)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: [PATCH v3 0/3]  Add TI TPS1689 pmbus eFuse
Date: Tue, 17 Feb 2026 10:12:00 +0200
Message-Id: <20260217081203.1792025-1-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework TPS25990 eFuse pmbus driver to provide more unified way for
non standard direct conversions.Remove existing defines for TPS25990
conversions and replace them with enum listing all supported parameters
and structure using m, b, R. Add functions to covert raw to real value
and real value back to raw. Add data structure to hold pmbus_driver_info
and local_direct_values for direct conversion.

Add support TPS1689 support to TPS25990 driver, since both
chips are sharing a lot of similar internal functions with exception of
work range like Voltage and Current.

Change log v2 -> v3:
- Fix error detected from kernel test bot regarding division

Tests:
- Test builds for x86_64, arm64, i386
- Retest driver on arm64
- Validate driver direct conversion functions manualy

Stoyan Bogdanov (3):
  hwmon: (pmbus/tps25990): Rework TPS25990 non standatd direct
    conversion
  dt-bindings: hwmon: pmbus/tps1689: Add TPS1689
  hwmon: (pmbus/tps1689): Add TPS1689 support

 .../bindings/hwmon/pmbus/ti,tps25990.yaml     |   4 +-
 Documentation/hwmon/tps25990.rst              |  15 +-
 drivers/hwmon/pmbus/tps25990.c                | 190 +++++++++++++++---
 3 files changed, 175 insertions(+), 34 deletions(-)

-- 
2.34.1

