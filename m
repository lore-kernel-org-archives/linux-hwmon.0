Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F025013A3ED
	for <linux-hwmon@vger.kernel.org>; Sat,  8 Aug 2026 00:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786147925; cv=none; b=IH5Qr2uafxLf0CfFrN2mYuopp69sqvleJAkyfpMaYCJjnbjW8KwG9eKrpatMCwwcrV2MMlHC5I7JvrVWCb6DLCkC9UlcSjOSDXPUTtxxnLvkj4FHV9yIEK9u4/rJspd1mH4C5avRO9OkZZwSExlPUhnBAyEDQVF2ym/0i71iBJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786147925; c=relaxed/simple;
	bh=1hQ8C5Wan49fiN9j28/w0A1xweeWzh3YDmaN0qPUn08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mgKy1y/kHXjRckxG5iP1LmhPmY0LPsr5IG6ttir4wLP5YosABNdUi2cfeDHo+5PJHlpljlTL9HoRJbF+OwZjEa867JmnFc9q8DO9v15kaPDagTu+mYCE7ojwIM6rXGSwCqljtEruoLShEp1TvQL4gSlzKsR+FMwnKyUj2+28t/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/wIw81c; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/wIw81c"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84847482584so75035b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Aug 2026 17:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786147923; x=1786752723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQcjaKo8QwdgK1udfFIHOA2aRE7LlkhFRFXhYQ6O08s=;
        b=Z/wIw81cKNuZLDP6ESa0UbETQBzLN+PD6BsEAqsIEu4Bkd8fseKa5XdCm9Act5RaLV
         ROBpp4/n9pHyw6otVSrBCN08YkfVYnDOQYzXPg+EeViKTPK4swRikr5HQMsa43wF7Hax
         Ta4hTHhLdslJlB19hu5QHYInwFj08vNdHyg9aKN0BHcngDUuiyOy44s80A292WDyAxRn
         uDUyDT2houFEawcEyZr6Ucox/LQjWVrO6NAq1Nfnygcl2bJbxLiFOTok40+/sTOqJkvF
         irHfELv+NwpN6Tr1uGC5Wq+7F+bIe/CFgXg2GCRfMhy3Htpg4ZqbyMNRdRuPZ8+ozFqb
         026A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786147923; x=1786752723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQcjaKo8QwdgK1udfFIHOA2aRE7LlkhFRFXhYQ6O08s=;
        b=g5rHbiZAv4G8rS3Z78VillkNnRGML+1rPf+Z+3CVW+80aM9KGz0kUexKIz6n0yUoGh
         RRprh9JS0i0yyLLPfKncSofwg6BHXa1VnVo70b99eqqlNDQVJrSJcj9EhM6mAzlG/8F7
         4r39OPT5LcZ6DUaJUds4JulghnHpGzQWYaf+kuFcGEJL84OW355tD0MMFeEDSFudper/
         qH9WXmE5TMt1MkqsVhkkPxfX2E8ssEIl1pqzuizUKL9uoHcWASykO0I8Xi/M2uf08GFL
         jKsSVOGMjhPswguyko06DmhilDa0IMGXZPKnUu4LjEhWcpSuW98ogGEbR97AYgOEcU2k
         iX6A==
X-Gm-Message-State: AOJu0YxYut+1hNLAtEhgMR9Ryn9dErvKSIIlXRUjZKEdAsOD+WYjyZiX
	c/krBfSS74teXO0C9nl8r/kWABTQ4kjncaniReuHVMId3AOZxi//0gLC
X-Gm-Gg: AR+sD10E06+Kg4z5ve3QZmbUb5fl+Ew95+SFTYyzhBX75QOI++fp7ZAe6os9fyOIYen
	R1pOKkXzuCEKY9A2ihjPp1X9J9JF8pTQd4fklubi6hWIFv1jD8mdXMU7rrVhJ+MMpCELIJds7nT
	PP9SYuN4DsbazUJGNu4taOlYOFtHpDQojqzo65I00ddiHA06e/lO8v/KbGPfFKlxVZ1duSBg1sI
	HovywccRcQyDn8mVgZ3Ef9DW/bGtxeG1EovySUDfhw9BSaBzIybNzjVLCLff75URfFZu0aadD/U
	Wr5upzcMoDTmaNGEZg1pwNHNUB8xfRnopRfzMcqN/4dWgs2UC4yNVx14i+8eH3JhOWR7sptOlYv
	crTsRBvGlPdxRLpJKYuiprI1jdiqGPMB7tBzWemNCHbun5OjWZeFxP3ZhXy5dk+jb6K1IRfuwmJ
	iUHw+kUDEVP2q6PXFyDwai922PLDQ0/DDHMgSbVcP0SjDiWtf9sLVBPOaj+VE+9lIXz8/ggQ/jv
	A==
X-Received: by 2002:a05:6a00:450c:b0:84c:241e:9070 with SMTP id d2e1a72fcca58-84f6b84b32fmr2559329b3a.17.1786147923105;
        Fri, 07 Aug 2026 17:12:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a58e6c4sm1606295b3a.59.2026.08.07.17.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 17:12:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v7.2-rc7
Date: Fri,  7 Aug 2026 17:12:01 -0700
Message-ID: <20260808001201.2405051-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v7.2-rc7 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.2-rc7

Thanks,
Guenter
------

The following changes since commit 075b74841bd0065a3bda3440873c747938e69b68:

  Linux 7.2-rc6 (2026-08-02 16:24:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.2-rc7

for you to fetch changes up to c6c4234928d2eb4f61fecb61067e612d9bdbd2ff:

  hwmon: (corsair-psu) Fix linear11 calculation (2026-08-06 22:37:45 -0700)

----------------------------------------------------------------
hwmon fixes for v7.2-rc7

Various fixes, most of them fixing critical or high severity bugs
reported by Sashiko.

* ads7828
  - Fix external VREF regulator handling

* corsair-psu
  - Fix linear11 calculation
  - Serialize debugfs access against hwmon
  - Fix possible out-of-bounds access on missing string termination

* ltc4282
  - Fix parsing adi,current-limit-sense-microvolt
  - Clamp negative current limits
  - Avoid overflow in maximum power calculation

* nzxt-smart2
  - Check return value of init_device() in probe

* PMBus core
  - Fix type confusion in notification logic
  - Avoid race condition during probe

* PMBus/lm25066
  - Fix PMBus coefficient calculations

----------------------------------------------------------------
Ali Ahmet Memis (1):
      hwmon: (corsair-psu) serialize debugfs access against hwmon

Guenter Roeck (7):
      hwmon: (pmbus/core) Avoid race condition during probe
      hwmon: (pmbus) Fix type confusion in notification logic
      hwmon: (pmbus/lm25066) Fix PMBus coefficient calculations
      hwmon: (ltc4282) Avoid overflow in maximum power calculation
      hwmon: (ltc4282) Clamp negative current limits
      hwmon: (ltc4282) Fix parsing adi,current-limit-sense-microvolt
      hwmon: (corsair-psu) Fix linear11 calculation

Qingshuang Fu (2):
      hwmon: (nzxt-smart2) Check return value of init_device() in probe
      hwmon: (ads7828) Fix external VREF regulator handling

Wilken Gottwalt (1):
      hwmon: (corsair-psu) fix possible out-of-bounds access on missing string termination

 drivers/hwmon/ads7828.c          | 11 +++----
 drivers/hwmon/corsair-psu.c      | 31 ++++++++++++-------
 drivers/hwmon/ltc4282.c          | 20 ++++++++-----
 drivers/hwmon/nzxt-smart2.c      |  6 +++-
 drivers/hwmon/pmbus/lm25066.c    |  5 ++--
 drivers/hwmon/pmbus/pmbus_core.c | 65 +++++++++++++++++++++++++---------------
 6 files changed, 87 insertions(+), 51 deletions(-)
