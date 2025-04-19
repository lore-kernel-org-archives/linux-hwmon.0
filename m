Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107EA15A85E
	for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 16:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745079247; cv=none; b=qNurLhohGTD7Wbodt7Sfx6k5gdoCYWX1AfMbUyPXKk+EqO+ypCLodDd0NalYrurEN3d/zdVq1E7vrgZc7nK+Quq/dzeyeoIo5jEhjgE0rBEp36kS62l/7nsJq3jv//LdVInqbPf5VGYBnn2x1uTDFRG0C6kwfzJsYHmlWAysBIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745079247; c=relaxed/simple;
	bh=2kyn8w8suf5PI/V++bAEB0qEcYEgt0vQVzx1hjKNnj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rf4aDeDPiHNXEqwVo9uP1YiLuhBTObuyMFVmcf51sfZIOge0vSlXQn6vICJL4qIhUuSER4rS9lW8wyCI6JmKS4hiVjoFT/2xCunAnhCaptgqnS1meCTbhekThzPsgugCf48nVxElLorX6HucZo7P4WVnp/OZVJerfZ522FHfyHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBOyl9tJ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBOyl9tJ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224100e9a5cso32608245ad.2
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 09:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745079245; x=1745684045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=K3GQi7KtED0ltxiBmhk19lqGkWR1Zrjho/oN69nEOqc=;
        b=NBOyl9tJDv28LTyUaZ0Qa4KrwXyzo9p2AaKCEvFN17oioo9H3K6fJytb5RW/KVW1dH
         HVm9X/Z6vtFGUR8GBeV9Pn6ui7+rQI9aKSfxFRg7c5NU6spKNHBsOfpYtewT4gM9/Is5
         sMrUDp4P8EJX/DrwkUK94exTk4rPK/YPjRzWG9htJyc/xLuwwLUd+3A36N68UqZQNw0U
         ky9+wTERPcWFVbQrO+alIuih14HDIZcBfJ17My58/KQlXaky0sLVfz0u3mElnS7n72e/
         knWOWIJyLJlYyVIEjUMMpHMbc3e/7IpjvXJHhEqLAKLIWFL6xPfkD0DyBSmowwlDzG3r
         hqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745079245; x=1745684045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3GQi7KtED0ltxiBmhk19lqGkWR1Zrjho/oN69nEOqc=;
        b=aPLh/p+99xMPNwJtCLuit9Qrp3cArAKSrluagziNxKCyjd281dTAHptWHPrTSFljnl
         lHplU471FlLQSnEgXDfoAkcrZDXWPkAi0F87TBy5B1UO34F/G75+Zs/3qs69KJ7VNho8
         bYWD8FAnXnv+rIqjHxC66SypxedM+FI9v+nNCbZcg3zo78DuOB0O+CE2GY11dcyTY8gb
         6Ac3AQbDGVxSiSsYx/vUaoXLj1RiSJPMpEH30mt9BatTMp2bhJS7JA8gWGQe7ff4nIQM
         arbeea0FPvM+62FOHgxiYfjruRN8Trv2nJjlOXLzDUJeoG1zpW7r/LwdKeFJwIO58cGe
         bTYw==
X-Gm-Message-State: AOJu0YwZYQ70teDU4isv5Qi/KNc5dz/zWMK1zNQb/WvYttoilgn6doHX
	8d71CcqSWwUhyip0VbKbRBhpdvnmdBv0IarLvsO7jhe7bVupQ6FZughBMQ==
X-Gm-Gg: ASbGncvQGZWuVu70nV0h21O6o2/rq/gw0mC2yZYhNeH1+yu6ev3jCWWM0yehd0M0v08
	2GVMHYm/bYCgaART92oMutc+JGwBIrNjtLJT0SADjseQ5kIizM/fcwJuxpzOwwsEH+f2Hlv34cn
	fRaaC/o9EkRx7r7LjmaIXfdu+fvCW76GgOAw4oBvHOidXBTLxYWphvq7ZurlBIaUOwFTWYqLyKV
	Kuf91kc8U2FXD9CgxjYIPwK6OZO0/GrmElc8jSu4+AtXqCbBUSbzzfuGO+lDeG/Mob4Bd93YX4V
	vJ/GeyOqZnif5RgQFk79c2a3OXA3LeYHQHe6QmtruSTuXQZi1z3R3g==
X-Google-Smtp-Source: AGHT+IGFb1ttqiIWOkSE/Hy7C/DVqGsdazn8KLLl8FxjAa+lmNIIz8n2EuthDPZxtmc9sPGyeMWM3w==
X-Received: by 2002:a17:902:e88f:b0:220:e9f5:4b7c with SMTP id d9443c01a7336-22c53581248mr97606775ad.17.1745079245095;
        Sat, 19 Apr 2025 09:14:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ed297csm35310715ad.196.2025.04.19.09.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 09:14:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yo-Jung Lin <leo.lin@canonical.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/5] hwmon: (spd5118) Add I3C support
Date: Sat, 19 Apr 2025 09:13:50 -0700
Message-ID: <20250419161356.2528986-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for I3C to spd5118 driver.

The first patch splits the spd5118 code into common and I2C specific parts.

The second patch adds a note indicating which chips are known to take the
specification literally. This patch is purely informational and does not
change the code.

The third patch adds support for 16-bit addressing when accessing NVMEM.
16-bit addressing is configurable for I2C but mandatory for I3C.

The 4th patch adds support for detecting 16-bit addressing in I2C mode.

The last patch of the series actually adds I3C support. This patch is
untested and will not be applied until/unless test coverage is available.

----------------------------------------------------------------
Guenter Roeck (5):
      hwmon: (spd5118) Split into common and I2C specific code
      hwmon: (spd5118) Name chips taking the specification literally
      hwmon: (spd5118) Support 16-bit addressing for NVMEM accesses
      hwmon: (spd5118) Detect and support 16-bit register addressing
      hwmon: (spd5118) Add I3C support

 drivers/hwmon/Kconfig   |   2 +
 drivers/hwmon/spd5118.c | 408 +++++++++++++++++++++++++++++++-----------------
 2 files changed, 271 insertions(+), 139 deletions(-)
