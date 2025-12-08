Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6F52BE62E
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Dec 2025 14:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765205820; cv=none; b=XSj/eZWbDqHN8f2upssGL7kt8eQY4lyIZ6l2qgGB273pnYgY31QEzUgJIMMGSWrLga4Dsc3geKkMuwgrqMtEjg0reAOULxG9K0V3rY2wWrWHX2CU3/jGCkkOHF6b7WftQYSZVWR73MgJBW3LCMoZ4YlEc74ZBf5HhcScE26StOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765205820; c=relaxed/simple;
	bh=097X5ZT6jLO9fZl11d7yn55InXyvoHluh/Doi5sXnIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KZisg+xTxGLNSkjtOsRUzsev4y1kn2MftjA2x+4OM5o+Dd36EUZPihGmCSg4mLZADQB2cODrZS2ljWVqpuPm00hEuz7uUWaz8MeSf6kHdtpPPnMoN/xEwYzc3fqj8WIzXBq4mi/4U/1NLRP4KcK5/A5Ai9Xyqwv0oOsAkQTTUQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSQqLQ36; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSQqLQ36"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2981f9ce15cso62696815ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Dec 2025 06:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765205818; x=1765810618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RMwxkqqdy+F7QA1lEvjKkQSChwQTag+/1CbbS16M5zE=;
        b=dSQqLQ36pdfwzLcu9EGa1XnTKPThNTznYEALVjs9gnl1DyFfE8anJrosPePWLDiX+u
         T7zCnb1GiV2n7v3R7Sli/esBV8i9s9kd80o6xAXjY1Y6hooC0gN+9B4Fe6bSyLD6Kc2v
         czQQF/FnYGjoBBzQ9hiRYJe6x+WUBBqD71J8whbBRo6IZsX1UCCO5/vCrbLhb925H5mO
         nEkmqu5g+28E/8+f5NsOtWskfVDytI5yRMwSV9grJlamcXS6L6+9h3jFRQXlyU69iafz
         l6X+8znJNXNdm0tvTJDsPumHWCnFNqckPifopuvD9GEA6Wv6wwhCaK1PFnVvFAdfauyc
         z53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765205818; x=1765810618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMwxkqqdy+F7QA1lEvjKkQSChwQTag+/1CbbS16M5zE=;
        b=fcp4lBlA7r3Cs5HMIm1ndv5iyxxIu4NllxrXUGtx6l49Q2hoF6iaGCxy4P3GdV7vpw
         eT8qbI1yH1HiW3QDGcBSbzY7nKBQZbgumtEgdHXcdkMlL33Ci2eWTQF36z5nVGgOGFIt
         pULol2aqnDtcaaghclgW8iopExNdQ/t4LZ1EPdUIzF9rEl379zMW6kSDHzTbuAO1L+yH
         3hW9/gv7wPm2wqOji1sa3YJ+cYW9hQVtJngouks9EEpGUwZHQKxGNDSoG6CRIXf7ekU8
         jL249KDn7kr1OI9VIvP7Xly7I32SyjjjN0wfflTAJPA473Pi0jaUeQyHkcM3nZXLzwQF
         /82A==
X-Gm-Message-State: AOJu0YwWlOc5CCPuoUUCGNbOZa2cNa0b1RWHCSpbexrV5eZRooWjKO1g
	VcuOGpwHGzoufz5SAiy9K5NSPTDfa2b6+oYNVgTT8+nZTyPEHcwJbYeU
X-Gm-Gg: ASbGnctHE8vrAJIMsTAqMPis1+FqrAXso1SxajSeKPjl7m/cW1OwlesA0og0yWV0c9r
	y+bR39A+Amf/3KBkxrK1vO5Eu/0TgODLjOCFIhMLjeFbuoIJb9M6ggYjAfk5YsaGgZcsxvPqFS5
	DL5Nfu+XHdlPzANQ9ejj9fDWLJ7oUkLx5mLKj+owKKiZqpgFlS/9d0LRUcxd9YrIFP1KxMhF0KU
	RdqZyefAUWCirmVnnr0RKjrbC4Q+DaDAbexjv8uEq87KIYupj0f98zF7+qbDOMJumJWXeKxeNiB
	UoArpdFy7dlFZxSGSkRCEMyFGBK/J51zPDcp7s7/cNqCpzgedvgr9VzWbZdxvnRB7OVwDVpATYL
	v1pyPjGDwRlaATFsMkZMUUgjdY2ykrVTJrxo9/NAZiRa7bks+yMeTokfjwGNL/TErvEKxj6CoIy
	XDTVyf+JMk1Ist0iCPNw1aj8k=
X-Google-Smtp-Source: AGHT+IFkgA3/Br0HL3+GPjIukiPRvrRYk4q4REmm1+XhghdoHIm8zH12TjWzI4sBJcyfz8fQoW3GjA==
X-Received: by 2002:a05:7022:f415:b0:11b:9386:a3cd with SMTP id a92af1059eb24-11e032ed8fcmr6071117c88.46.1765205817620;
        Mon, 08 Dec 2025 06:56:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76ff44asm61611420c88.9.2025.12.08.06.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:56:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v6.19 (take 2)
Date: Mon,  8 Dec 2025 06:56:55 -0800
Message-ID: <20251208145655.1868400-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v6.19-rc1 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.19-take-2

Thanks,
Guenter
------

The following changes since commit 67a454e6b1c604555c04501c77b7fedc5d98a779:

  Merge tag 'memblock-6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock (2025-12-07 08:56:10 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v6.19-take-2

for you to fetch changes up to 08bfcf4ff9d39228150a757803fc02dffce84ab0:

  docs: hwmon: fix link to g762 devicetree binding (2025-12-07 14:10:18 -0800)

----------------------------------------------------------------
hwmon fixes for v6.19-rc1

* Documentation: Fix link to g762 devicetree binding

* emc2305: Fix devicetree refcount leak and double put

* dell-smm: Fix channel-index off-by-one error

* w83791d: Convert macros to functions to avoid TOCTOU

----------------------------------------------------------------
Armin Wolf (1):
      hwmon: (dell-smm) Fix off-by-one error in dell_smm_is_visible()

Gui-Dong Han (1):
      hwmon: (w83791d) Convert macros to functions to avoid TOCTOU

Kathara Sasikumar (1):
      docs: hwmon: fix link to g762 devicetree binding

Pei Xiao (2):
      hwmon: (emc2305) fix double put in emc2305_probe_childs_from_dt
      hwmon: (emc2305) fix device node refcount leak in error path

 Documentation/hwmon/g762.rst   |  2 +-
 drivers/hwmon/dell-smm-hwmon.c |  4 ++--
 drivers/hwmon/emc2305.c        |  8 ++++----
 drivers/hwmon/w83791d.c        | 19 ++++++++++++-------
 4 files changed, 19 insertions(+), 14 deletions(-)
