Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4863285CB3
	for <linux-hwmon@vger.kernel.org>; Fri, 24 Oct 2025 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761316630; cv=none; b=aYNbflCkutFGghuLtOL+yFXhUICIEWhQIw4tguIveeathS2kyQPQ24etZXC5FemAzXWnYCyjSjJw2Pwp14vXNku09M6eqx04z2W17xinuggW4DB2AdlEcY3/t3I0lPrcR0VMGhEWk3A9YEOCGuro87qElF8UFDEB1kNhmSg3CR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761316630; c=relaxed/simple;
	bh=5bzAQm1vpD7lTerhTYq37aTukVXzrzouyw8pD23L98Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZwGaVB4hfUnf5oRt7czt/qSgjon5hB6k1tkRIIkMdQmhqJ+2MzRbAjqF1n0QjvRV8xtTR7t/ICd8rJcuQOG4gbvqxYLUWREbEXZaj7sE+u7DoCu/NArzOqbafgrW9x29Ff1NWk2C6oGFOUUAfRDW7E30q4xIGOWqgYxnwVwHNUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGCqHcJT; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGCqHcJT"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7a27ab05a2dso1771425b3a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Oct 2025 07:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761316627; x=1761921427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=z3plulC99H/+7ueocjB6qUXe51ScV5oNChMwjLtEQgQ=;
        b=SGCqHcJTyYG0CXfKAJ546w7XJZcym7C8Na1ke6Qybwi4UeJ9v4McgfcVa3hqidCPYt
         ZQ8cA5Dx6/W0Na7cFT77nEMNfYpCQdaWx2sDQMsJp6Pn+RUiBkrfW0uwXydmwGEkXhMq
         yL9a+tFGEA/JikU2njwiscCc0e/i8tzRtkQO0Qw7Hvb/r+r6PQYXiHTtyAzfu0As1alz
         PTy5D1XuSTAGg6Yih0VEpUx+L1DLMAPNbnkBgUOymQpthsy3McmWr0teH8qrgEiPHleR
         jBZ3KEpsQ1SzLacaVZOqeTFjd1f7Me12a13ulQoHJxOb/CtvAhoCTDdfK5yn7mlt/xOP
         XkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761316627; x=1761921427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3plulC99H/+7ueocjB6qUXe51ScV5oNChMwjLtEQgQ=;
        b=kPeKJn6AopptpSPMbt3vvyupC+uC2mF3n/xFD4NdgxsiLmVHnw0KhA6Ma7e0rt91LF
         +aHDKDupSz4w/mxPJEGWwuLgTADHfi5a1pG2Gj25flR8hJQrSV6mA5x32nACVMZJXwgW
         ynaozSPjLsXSljM0Q8c7CMKNDB/+LM+X+IAxlXudutxQ68wixEUIuU5cPtdVJZfGJT/L
         B99FZapMsw+zyV8P60c/Ksto5DBqbhwIkR8WFxfARnkiJLmDUYZV3CN5E8JzoW0LL1N9
         LTKR90rWEow3/1gxKIxo0apTATHz8EAPJxLHxz50NxD+UzqEWU77xoUbODZVnq8JD/eG
         WNGw==
X-Gm-Message-State: AOJu0YyYwBaFM4MOCGMDHjECRnPb+Vu6YZMSk4wy+/9LMhSolllCRgr1
	KtwFi3B+q1idervoXuX5XRFgCImlGfCf0HAJrNkchcQGXB1jiQSqA/Uk
X-Gm-Gg: ASbGncunjdgAqqlbkBwJx19EH0EBmKZOJ8CQj0A++YUTkGEsX4q7fFQzFEURpCDD17w
	pnOaUaEd7+0kyamgrPAbOGMhZl+FfN1hjwYJYE/+loT6yJqGHfNXXpoBn02YqauyvyPa66aOraH
	elmmcKr2v3s6In/ywUn6Qm0avqedLYLhk2IHblaXu0qwhyrfHcT+CcTfwXd1pPPUzySIJ6TIWTS
	HVqjHssaCZdjMR6zE4FAua9cEB2iJqxYq5kt5oxpEBxjI4StVkrydCsGB/bXdJewjlAmgO1sB1R
	xxO+U4su4/xqsrP+U3SGzuXFGnuEyx/JW95eJKUKC+QFueWprrkIjPgJE7ZwMzIfbn1Hs1NXQY6
	mIttxp3BUTAXiqjWd/UlYDtPyIsLJJPM/Ab6X7k2/gzXQPUrPWJcmGBOw7YN4GLQ+Xm21L1izId
	gLJvbnvjHiIeGcJf9LK+bSgunbqI7Gan3PxA==
X-Google-Smtp-Source: AGHT+IEAG9dCd057H6ZgsQJv28clY3E4+KDoFKMP468zgwqODZ4ztBCcpbGHu5MvdqVczkpUggcgHQ==
X-Received: by 2002:a05:6a00:1ace:b0:781:9a6:116a with SMTP id d2e1a72fcca58-7a2208f0777mr28482023b3a.9.1761316626603;
        Fri, 24 Oct 2025 07:37:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274b8a0edsm6091469b3a.35.2025.10.24.07.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 07:37:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v6.18-rc3
Date: Fri, 24 Oct 2025 07:37:04 -0700
Message-ID: <20251024143704.1144808-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v6.18-rc3 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.18-rc3

Thanks,
Guenter
------

The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:

  Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v6.18-rc3

for you to fetch changes up to 8dcc66ad379ec0642fb281c45ccfd7d2d366e53f:

  hwmon: (sht3x) Fix error handling (2025-10-19 18:56:14 -0700)

----------------------------------------------------------------
hwmon fixes for v6.18-rc3

* cgbc-hwmon: Add missing NULL check after devm_kzalloc

* gpd-fan: Fix error handling

* pmbus/isl68137: Fix child node reference leak

* pmbus/max34440: Update adpm12160 coefficients to match latest FW

* sht3x: Fix error handling

----------------------------------------------------------------
Alexis Czezar Torreno (1):
      hwmon: (pmbus/max34440) Update adpm12160 coeff due to latest FW

Erick Karanja (1):
      hwmon: (pmbus/isl68137) Fix child node reference leak on early return

Guenter Roeck (1):
      hwmon: (sht3x) Fix error handling

Harshit Mogalapalli (2):
      hwmon: (gpd-fan) Fix return value when platform_get_resource() fails
      hwmon: (gpd-fan) Fix error handling in gpd_fan_probe()

Li Qiang (1):
      hwmon: (cgbc-hwmon) Add missing NULL check after devm_kzalloc()

 drivers/hwmon/cgbc-hwmon.c     |  3 +++
 drivers/hwmon/gpd-fan.c        | 10 +++++-----
 drivers/hwmon/pmbus/isl68137.c |  3 +--
 drivers/hwmon/pmbus/max34440.c | 12 ++++++------
 drivers/hwmon/sht3x.c          | 27 +++++++++++++++++----------
 5 files changed, 32 insertions(+), 23 deletions(-)
