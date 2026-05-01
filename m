Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D843519E968
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 02:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777602944; cv=none; b=hQ17zOrhqfqduSgoM0UpMSa4mZe3OWXZmoYuUTe4vRytMaE3FsvYkcrJv/KNuqeySnpeXDkLZ/2Qttl/rk8rJ2v/KJHxPXPz2QDCHq5H1uCAZ1YXffy8DLv5BLPdd9noO95OS0fIHKU0HghHj/7oDD1yQ+bEFROajIAre346BWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777602944; c=relaxed/simple;
	bh=2y2/y0G4xKegMxAeB9N6LvOQxHely/EGyWUZnJ3S/bo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VMMGepGag6mhxhpIuq2ESdWu7t8gMCAgx/fiz/iGxHmLQarkX2H97cTVZhHrqzipke6zj+nbkQw0ZNxoCvratvwpXs3L4elllzpVzlrVNKgEHqCH6xa/j0QBkRp21qsZg+LAzi4fYIwA3h0zsNHjmGHtgjZ07qMVGcnpsXyNLpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ke8d60ap; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ke8d60ap"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b0afa0210bso8257555ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 19:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777602938; x=1778207738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxEZzG7nuqjedaY2huiV2Gx6afd+VeNrKDvHH9D11HM=;
        b=Ke8d60ap51WMEsIiQPLNw+VcH1P2f87agFuPn5puZl/zm3lG/A6KrBak/jXurdHn3X
         oNMEqDToJzxX8+nbZGYH7W7gWw7QruTpMyQWqJZ2w/BdAMGo2MaK4WOTHJzVEhyuChmz
         SoM7aTYRlI/yhS7sRejQc7q+fvqx6SlrnVWBOwI6SwGUjYu09uEuB7VnmvT//rj9+RA4
         yeFe69bmXESXstuxF9DJ/bKvu99F3DItf9suwU2bn3CjRraG7jXdHq6iSWebtJpW1Ms8
         eaQvT/Ym/sJNHVJ552Is9CXcXvMoWk6nxLsUFAtRu/F+RE1vuCau1XiIuXZnEvlTlwfS
         Fybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777602938; x=1778207738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxEZzG7nuqjedaY2huiV2Gx6afd+VeNrKDvHH9D11HM=;
        b=Anc0ydgc2XbTXiyq06fNUrVZlczPT83bFVeZarJxXnUAaFhvspTkjcT2PqbXQXcQHS
         HdG1qbWJN/eVchyfJXg5Kebxt+THandQCBNWlP4Camxg8SKxpNyo1EC7ktYPuPFHXPXv
         rh+PJnGP0bxy3PagpJ96tiKbN9IuRKcD7NrQLZRPWwZrnSQ4NHRnw7upBkX4JjoHVkTK
         9vPsgKVNAc22PtAvaSVsXVZCxzAErvWdylbl/PulN+ffgadUU3Yw8tWtN6Rn3gLbVpWO
         HhrpQAVoh8Yhkx0PPYGddLrBiJvEvR1+D1tYNM36ieQe2BMaLIiPaQOjlmy8sCqR0lew
         X5yA==
X-Gm-Message-State: AOJu0YzFT0boGlwsGO1VV/u+sUvLrRBB3bFurZqRca7quXX6vLyrcLYX
	tBKGDnhWUa1wj13bZhNjCU6zpMVAKhd0mZOxlcaUDhlLAOiq/r+w0MgE
X-Gm-Gg: AeBDieuGD5iNBejlHdF0LpSyuLqUsZ+7TuKoVTT4tRdWJrQRMTeo7s/ZbwQJHg/0axJ
	c382xMKTywsf+lWAm1DDMG4bHE+u6YRXcJiySiUv5bqtiY1sfOgGl64wMAhkYzTvPX5TEv1OeEu
	PMBlYenJ2No5KOTJPCWBUhxe/5WAYcPHqRwdUbGablND/e43t6aRTy/FxonWf0nZQmq8mgkwsjz
	xv1qTHRIHNr5X3GRLAyJBsbAAL+9qwuTx/ZbfrUnR+1Yq3wo3tFeuSfq2WnuRQgANLQWLeXQJUe
	YdKV+TrJHnP6ZB2PVCqOGrl4WH8pASO/D24ANDiyRJSOMPXWyv1ZrlLkxliq8VnEUUYCIXwiqy5
	bnjp0mdC3JzZvoqhjlC880bTf6BGdx0LCIQVRhc8HDXYSwto2d3p+W9GbDACI0Frt5hjToLnA/9
	CoJ7I3zmdpQe5Azxz/G6AvkzrgptJ/yNHgxQlQ1Wc/CMDm3Pt7GMN4o5OLcrzhXOKegadGXBKB4
	4lChTX3tvZQXXR3
X-Received: by 2002:a17:902:b48f:b0:2b2:5203:acd3 with SMTP id d9443c01a7336-2b9a24b8916mr39052195ad.26.1777602938124;
        Thu, 30 Apr 2026 19:35:38 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([116.72.73.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caa7e791sm9341385ad.7.2026.04.30.19.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 19:35:37 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	me@brighamcampbell.com,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH v5 0/3] hwmon: (ads7871) Fix endianness and modernize driver
Date: Fri,  1 May 2026 08:05:27 +0530
Message-ID: <20260501023530.31160-1-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses several issues in the ads7871 driver. It fixes an
architecture-dependent endianness bug in the 16-bit register read logic,
migrates the driver to the modern hwmon_device_register_with_info() API,
and moves the SPI transfer buffer into the driver's private data structure
to ensure DMA safety.

Note: I do not have access to the physical ADS7871 hardware. This
series has been compile-tested only.

Changes in v5:
- Fixed a bisectability issue where the <linux/unaligned.h> include 
  modernization was accidentally squashed into Patch 3 instead of Patch 1.
- Ensured the 1-byte SPI command write in ads7871_read_reg16() uses a 
  strictly typed 'u8' variable to prevent a Big-Endian pointer hazard.

Changes in v4:
- Patch 1: Refactored 16-bit register reads to use a dedicated 'u8' 
  transmit variable, eliminating a 32-bit pointer endianness hazard.

Changes in v3:
- Added Patch 1 to fix the pre-existing endianness bug in 16-bit reads.
- Fixed multiple formatting and alignment issues caught by checkpatch
  --strict, as requested by Guenter Roeck.
- Added "While at it, fix checkpatch violations" to Patch 2 commit message.

Tabrez Ahmed (3):
  hwmon: (ads7871) Fix endianness bug in 16-bit register reads
  hwmon: (ads7871) Convert to hwmon_device_register_with_info
  hwmon: (ads7871) Use DMA-safe buffer for SPI writes

 drivers/hwmon/ads7871.c | 122 +++++++++++++++++++++++-----------------
 1 file changed, 71 insertions(+), 51 deletions(-)

-- 
2.43.0

