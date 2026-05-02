Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFCA4414
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 02:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777687735; cv=none; b=U3zjzuScbeuh5JlyRxPhfwTk8SXP+Cq3RBd5QRVYJ0ByTD5dxIK62xe78SyvbUwod1k066U0HHAygTdNaMejMRA1W/5+TxY1oDCZm8MDIGBUy4MN0jRgqHzPphlLv0oOIAsh3tzk/nUsHo+46uyyDTIy9BCZCw4bk0UqDyaOIb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777687735; c=relaxed/simple;
	bh=JKELtPICm0Y4GU8eGwgBIF6Bs3Cb4R6NfHJySNHN/Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=so2X0czQBL4fjty4I/Q/6xZ0GXCnuVlELBSIBWcSJH9W973AtNsz44AMz0W21PxyIeosWqZp2VhlxRTRXEf3+ADCcaZufINAEyhhn0UgHzZr2zgADMJ1urGT1ccER68oPO68VRbidvBsGx9LWgLXT9nxlPr3ZAKkl6vjucAzk5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7HRnvEm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7HRnvEm"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ad4d639db3so10640335ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 01 May 2026 19:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777687733; x=1778292533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XBt/l3jWfKXc8bNfH30LgnD2nUmBDN51Ow0lHkXIc/k=;
        b=Y7HRnvEm2JEDCe9KdeVVgJLo0GDT63LdWxfbvidBF/yqXJB9HACfC/0IlnJGZ9r1+w
         SJ5c9ykEsy8441SlFknOsshA3D71Dq4YCiTcL7nus2iGVuL/6YRMl+A3uAMwI2Kao78d
         arWjMVsBgUgIByVybPVq7k6vV5ZKonfb1dMe1/yNSIn7ITzLUk5oMQzpe0/ZjNXK7gak
         0l0c8UkvGsHRN/C0vkqifmFtP/+G9n0CuedsgezZ6Em36PWVqHL9NUvKnJsbY7/+TjKa
         taFQ+AEOofHETl0zOqWuU+7N/TOdZlyo4JedzjnFhmG3jtWRvMON3TFcrdoZ1d5/chn3
         +Jxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777687733; x=1778292533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBt/l3jWfKXc8bNfH30LgnD2nUmBDN51Ow0lHkXIc/k=;
        b=iGXY6FlW04BFPw/rYHwoaBRQO+5hLLpNkefhz5ucAwuhVxm0vW50xZB/FCxRwtJcZ1
         IhVFV/asocGV53HCnR0W92JMs31F6cqH+Xw7VTHrhjeSg1tF/yzLvjGvtXOe+TqC5TOc
         fZfVLsy8DyiXt9CKNIbC4VPTFnOiwx9kyfcGzbl8QiBZlZfHbHhXjr+FKjuP8ebkwirX
         WfPdoUY1AXY0lJ3pE5mC527xHyAUWAXaomyTPA8csXMEBwryVANdQT7XVLx3KI2igHQl
         bNNu1LlfPB7pDr4A58H3IonCams4/FkjyfWaUev8toQFBVTmhIcWYQPw8uMUiFJfQuWu
         V8cQ==
X-Gm-Message-State: AOJu0YwDpteksTNcA0H/Rz7haWFw+b01HNDQ2wX13QE9z/zH01TQ6N0e
	tfEIDOWGw66eY2Jvcrn0+ikDJnoo+SieIJh17A6yDkWktuLh77b7AjTkRtsZjw==
X-Gm-Gg: AeBDiesftSgbId6zTv0zwmdXYy4DVbwp6gK7IPzpNB/45LYYMei4MNlgLk2h2Flm2gl
	PZJiJ7yKbNylmwN0svFbqmjBdOrxceuMneOwtIxhq11H60MCmGlmxFtplzZwC2EBGWjvW1BpGgE
	xtEkhem05FORUsZhQk1vfJ+qVVEBAXndzB8UL1DPo+MwDe3GK4Iu42xDDM9PtB851afapvMov2q
	mfaYsnRERX+CiecN6wMK8LYQRv/DzTlEcovc/v0CQhPAA2oUl0KcK5r42H6wTqQP6WA+EQsyKeN
	sjU929Q3sT4oGIbd9BEfVWxxXGV/8E3AMNBvYBwJVll8EAfk3DL4vFGk2zQbSkcAGvHphZ1K32x
	SzUbb9gOsCHKgQucr8hnF+yMvSB5XL5/E7S45Ek1RTA2GXIBJmVE8LDpOkMLQSq2NLVqegNf89O
	tKJOXCbF5VYUllhoKjk0fm+/sq1NYabkG3KIdI4dMvkcCq2WoyjuwtSegOxlAmkD+hSb3b7ujep
	lwd8kuwEAY2Om5n
X-Received: by 2002:a17:902:d2c9:b0:2b2:57f3:8d07 with SMTP id d9443c01a7336-2b9f252fcb9mr14345715ad.7.1777687732979;
        Fri, 01 May 2026 19:08:52 -0700 (PDT)
Received: from tabrez-VivoBook-ASUSLaptop-X513UA-KM513UA.. ([116.72.73.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae39e91sm34519135ad.56.2026.05.01.19.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 19:08:52 -0700 (PDT)
From: Tabrez Ahmed <tabreztalks@gmail.com>
To: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux@roeck-us.net,
	david.laight.linux@gmail.com,
	me@brighamcampbell.com,
	shuah@kernel.org,
	Tabrez Ahmed <tabreztalks@gmail.com>
Subject: [PATCH v6 0/3] hwmon: (ads7871) Fix endianness and modernize driver
Date: Sat,  2 May 2026 07:38:41 +0530
Message-ID: <20260502020844.110038-1-tabreztalks@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses a critical endianness issue in the ads7871
hardware monitoring driver and updates the driver to use the modern
hwmon API.

The series is broken down as follows:
- Patch 1: Fixes corrupted voltage readings on Big-Endian architectures
by safely converting the 16-bit sensor output using le16_to_cpu().
- Patch 2: Modernizes the driver by migrating it from the deprecated
hwmon API to hwmon_device_register_with_info().
- Patch 3: Ensures all SPI write operations use a properly allocated, 
DMA-safe buffer.

Note: I do not have access to the physical ADS7871 hardware. This
series has been compile-tested only.

Changes in v6:
- patch 1:
  - Switched back to using spi_w8r16() combined with le16_to_cpu()
    for the endian conversion, removing the manual byte array.
  - Added an early return for negative error codes from the SPI core
    to prevent mangling the error status before conversion.
  - Dropped the now-unused <linux/unaligned.h> header.
- patches 2 & 3:
  - Unchanged from v5.

Changes in v5:
- Fixed a bisectability issue where the <linux/unaligned.h> include
modernization was accidentally squashed into Patch 3 instead of Patch 1.

Changes in v4:
- Patch 1: Refactored 16-bit register reads to use a dedicated 'u8'
transmit variable, eliminating a 32-bit pointer endianness hazard.

Changes in v3:
- Added Patch 1 to fix the pre-existing endianness bug in 16-bit reads.
- Fixed multiple formatting and alignment issues caught by checkpatch
--strict, as requested by Guenter Roeck.
- Added "While at it, fix checkpatch violations" to Patch 2 commit message.

Changes in v2:
- Dropped custom mutex in favor of native hwmon core serialization.
- Split API migration and DMA fix into separate, logical patches.
- Corrected output scaling and sign extension to meet hwmon ABI.

Tabrez Ahmed (3):
  hwmon: (ads7871) Fix endianness bug in 16-bit register reads
  hwmon: (ads7871) Convert to hwmon_device_register_with_info
  hwmon: (ads7871) Use DMA-safe buffer for SPI writes

 drivers/hwmon/ads7871.c | 115 +++++++++++++++++++++++-----------------
 1 file changed, 65 insertions(+), 50 deletions(-)

-- 
2.43.0

