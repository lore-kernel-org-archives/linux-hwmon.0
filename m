Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EAF2DB7BF
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532914; cv=none; b=aSRq/EYYNzeVJ705fWwSBiJNSiUIXZYO3eQ4+mkaWky/uX8kq4buH8cUM4CndGVF+OGK9GRWlzyHZGDHCf3bEZa941ZVDHICyRn9jPN9Q8fHGsJHz7hhrSiF1ccnbCIgj+SNndsm1WKaIaUNdGFYu+nDefc8s89JRoKCfsniFh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532914; c=relaxed/simple;
	bh=fkANkZGrlPyyPf87t+LAjl2jdK/qL0Ex3c77JETrFyE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rL5eFXPkWAlP8TA3KWiEbjwMSTB569yjXnyUZ/EGMunZIB94vA6mCm14ZPB+S/touQU3JTPN69zm2l1PG3CaJWkK5Upt6O673KrOQk9LaWk963qicoSFxnLLZDDMs2xMr1SI8IL5CH3zdwos3hSJ4He0jFO4IuvMjMAwXPKG978=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=D9MydwTy; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="D9MydwTy"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c7412b07f22so963255a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 06:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1774532910; x=1775137710; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+h3PhzbBEUuFG1BSZSLnovJIQ8tNsqLyZwY5UDDcc4s=;
        b=D9MydwTyDj2CE8tQxaRsZUKh98sjs4sPVs+L2sS0gqTUJMqgH4Y+p9VXi98IDxlgYX
         LZBSSUs2dmTDHcaIu+KSBqQPm37TuTfCMLYkLtX8UQocSciitxk2LP+PNPa+khzsCa/T
         3w5QBva58/2Ve3n4ASw4CrOFhquUDC4kywgytBE4JoCHaCL7FqqQFQqNjlGrfKPnMxlH
         GKjt/4bMnoBhUw7hYFMEjfkyCpQcU+5BqDi9d0W6CxAicGgGDIi+GIg0x1hgZnKk+M+H
         w6o5utn6JpvB2wY37V805DoREx1Dd5VtniezougU3BrNA+AKoaOnB27MS/921haMMzS5
         hJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774532910; x=1775137710;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+h3PhzbBEUuFG1BSZSLnovJIQ8tNsqLyZwY5UDDcc4s=;
        b=mYx+66jiHsgDfCfbPGedWlHpbJIDv4mTAnBXWsxn2d9y3iSBTDU5yCTN+JDk6G+b9J
         fEBd2dOWW3Fo93DCaSRFMZmbUXE9PyGi+ouoKefIW3BjiRtzHyTshJ8kkHEpx4FIIwKv
         A94vCAU+iy2SYyqJP2n4rnk4DTH7PkfJ62kofiB++z1zncq7+10OIeTgomOAxWbASLxo
         Swi1Vz0ZOYooyUxmBs1XZkoghGl9eXmIZ+4cDFwZI5n13qFy+rK2MysDouyHnKkhV+5g
         6GZGhGFH9nkl9t3gt6ricrSq+tW25DODy/FGW2QaofINzBgEgazRI8YOjEqKsxovAJxW
         WLZw==
X-Forwarded-Encrypted: i=1; AJvYcCVa7MmvrIEvPFLcUQPnkZ6YxguqR/jxQtfTz/FlPVrzzNh17a+ggHw9I/GPFh74naMOoS6fRUdyGbKz5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVJOgtrUhHEkYy+W6fVnk5dCVEwgJ69By3o/lQ63rXWhfeV7J4
	JXHFTkMghfJd7wFj6hFLT072DbxuPSJ79FP1lne6velK6xwYpYMXDKxUNulya0Ch88s=
X-Gm-Gg: ATEYQzwiWWNdIMbifhdeDO0f4CimXSr9M15OxAnejrEwTRME5cnXw5+LDdKyFOL/1W+
	k+eSX5wAaRcaKwgMzPPX6mrQ2IVq3/LB9SmQKCl1VmrLDyQEN6FrUn/h6tmI2XwCIDdT18WjvyQ
	pap7/wpXim7d1KcLI4aO4KWOhT0gjuNQwEEJlkU8tbXOkDKt76Ufl5eHlmhOWukPO9mslrAQmCp
	7N9+lz7l1gMNf77khpQQCidjEytt5+P2v6dkuPlDX5xuIE8uaNCWfleN6bPg/bIEPOJulXBL5+W
	+bR2+adVrqSdryxmbw94S4vXIIxkzX2qzZ7icZ/fn13Cx9GzVekOhVD6fiMxccG9EMHJvBxHh1K
	zc50uAGpbtn9N8s5TXTp5D+zLD4GgN1+13SmkeQy6KND2dd6/+vERoKwIcmeVBI/xXdyA9/AAJm
	enVuJpH7W23MHXM/2/KgYbeYovzUky373yUXWJoO4c+PWLGjiGOGB5eKw4o+R20kM=
X-Received: by 2002:a05:6a21:339e:b0:39c:5952:eab8 with SMTP id adf61e73a8af0-39c735564dcmr1832586637.15.1774532900411;
        Thu, 26 Mar 2026 06:48:20 -0700 (PDT)
Received: from [127.0.1.1] (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76737f28d6sm2706683a12.6.2026.03.26.06.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 06:48:19 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Subject: [PATCH v2 0/2] Add support for q50sn12072 and q54sn120a1
Date: Thu, 26 Mar 2026 13:48:04 +0000
Message-Id: <20260326-add-support-for-q50sn12072-and-q54sn120a1-v2-0-77bc77eedc76@inventec.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABQ5xWkC/53NQQ6CMBCF4auQWTumHUWoK+9hWJR2kC5socVGQ
 7i7lSO4/CaT96+QODpOcK1WiJxdcsEX0KECM2r/YHS2GEhQLRohUVuL6TVNIS44hIhzLZKXJBp
 C7W3heacun8qQUnyxrbRQ9qbIg3vvrXtXPLq0hPjZ01n+rv9UskSB5tQ2vR4Utaa/OZ/ZL2yOJ
 jyh27btC9kKL0nlAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774532898; l=2270;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=fkANkZGrlPyyPf87t+LAjl2jdK/qL0Ex3c77JETrFyE=;
 b=QKSSsi0U06Lyy2yupRpEXwso8Uj+nschuIGsT4CNzi11AkUy2lp8bG+pGv4Ri32gd0ouUv0jX
 8gIek8OSF38BfYKUdxawPHq0WDE2bLCPkOmfkQ8TOCGJ+WO9gTqygKa
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

The Q54SN12072 and Q54SN120A1 are high-efficiency, high-density DC-DC power
module from Delta Power Modules.

The Q54SN12072, quarter brick, single output 12V. This product provides up
to 1200 watts of output power at 38~60V. The Q54SN12072 offers peak
efficiency up to 98.3%@54Vin.

The Q54SN120A1, quarter brick, single output 12V. This product provides up
to 1300 watts of output power at 40~60V. The Q54SN120A1 offers peak
efficiency up to 98.1%@54Vin.

Add support for them to q54sj108a2 driver.

Signed-off-by: Jack Cheng <Cheng.JackHY@inventec.com>
Co-developed-by: Brian Chiang <chiang.brian@inventec.com>
Signed-off-by: Brian Chiang <chiang.brian@inventec.com>

Changes in v2:
- Drop Q50SN12072_DEBUGFS_VOUT_COMMAND debugfs entry
- Add .format[PSC_VOLTAGE_OUT] = linear explicitly to all three chip
  entries for consistency
- Replace hardcoded MFR_MODEL check (ret != 14 || strncmp("Q54SJ108A2"))
  with a loop over q54sj108a2_id[] using strncasecmp to support all
  three chip variants dynamically
- Remove of_device_get_match_data()/i2c_match_id() early chip_id path;
  derive chip_id exclusively from MFR_MODEL hardware read
- Remove unused .data fields from of_device_id entries
- Guard store_default, blackbox_erase, blackbox_set_offset, blackbox_read,
  and flash_key debugfs entries under psu->chip == q54sj108a2 check
- Add dev_notice() when configured device name differs from detected model
- Update MODULE_DESCRIPTION to "PMBus driver for Delta Q54SJ108A2 and
  compatibles"
- Fix commit message typo: "Q54SN12072" -> "Q50SN12072"
- Link to v1: https://lore.kernel.org/r/20250701-add-support-for-q50sn12072-and-q54sn120a1-v1-0-c387baf928cb@inventec.com

---
Jack Cheng (2):
      dt-bindings: trivial: Add q50sn12072 and q54sn120a1 support
      hwmon: (pmbus/q54sj108a2) Add support for q50sn12072 and q54sn120a1

 .../devicetree/bindings/trivial-devices.yaml       |  4 +
 drivers/hwmon/pmbus/q54sj108a2.c                   | 97 +++++++++++++++-------
 2 files changed, 72 insertions(+), 29 deletions(-)
---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20250701-add-support-for-q50sn12072-and-q54sn120a1-a9c299e6d81d

Best regards,
-- 
Brian Chiang <chiang.brian@inventec.com>

