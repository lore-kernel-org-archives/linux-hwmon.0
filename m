Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D700405C5D
	for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 08:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779005098; cv=none; b=bbXBdT/RPao5sELdR/JXu7Q5d8RC/0L1mkP8uquVjk0IjZ6Wh99dJuZlUV49xBnpVM6ypvQ8HJPWQiY+o55s1LrHAeLEXtfZD8483wTLEH0T1GpHlIH2+al9A/rP3Poe1GCFzl+SOefDvrJA3F9KwQKjgULfhSGQYaaw3VXDVZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779005098; c=relaxed/simple;
	bh=usAOCOiGdp19nhtvQJ3dcvU9o3HkmfOBh9yPAC8m85A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sg1ThV4pf5/bSxQdRtPbC1Nkq0iSN27iu55R1EY6o5lW+PX6YlGZwpKYerzIiyNoqbc7HGyNVVLPmoZ578vBXGD0UXXwIHJHgC9Skrc5n3soXgD1n76yVtzD2jot/z4atB/AvDs9yb7AURYLKZ4Df6HY1gv2XYeu4utXfb/jgx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kixbvrsv; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kixbvrsv"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b9ea536877so5902105ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 01:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779005097; x=1779609897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwEMal98Epkv3bylVhHBHykFgLUZqAnOwEA4hmXeJeY=;
        b=kixbvrsvUKxji0h4D6G5SWHJ4Q3+RlnqhFAmmT939SOi8XymXK18RMCoYshpdqpZTv
         /TAvUU9E5ECaV1GrJZN0bMr+aU7H2JMXFJwBn9NGQLoo9PNnXRtIrYLKuzQenKX0Ef1b
         RXddmnRuo6sOf3WEJUwcZ9OHEUSDOKTVzIPIlaBtJ7ZEctM/g3zTxN7naoIjM6ssRtXb
         y83nJUU0vB8N6ZvM2GaCQVd9fBzmbujXFVy9eJN0HK8hRoeAWqfeE2utUH+R/vXhvl0n
         tbXSY9iGaTr3FqNReZJmGydKDyQuLQjPX5LlEUVFY/GxiPRQUMhtCBdwZmRW5hv/xDE6
         hYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779005097; x=1779609897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cwEMal98Epkv3bylVhHBHykFgLUZqAnOwEA4hmXeJeY=;
        b=Mu9m7S5BCtQsMzgQ991Y2mqX6jGxKtaT29jKmrILvffoxOJUytn8FujHh9c9TVaM2m
         ailjTFHsBwZh/VMp1S/uWzAvEWJf6UvVCb5xeWi7z3GPV7pu/WYJufIZzo5YtEMusk6t
         q/xTbUnpNl5zT7Z3T64rFf/TY7BCl2DTHLrDXAHJN/ZLgch+KxPhQMTxcfWLS+DMCTla
         OiO+IUgyY/13ky7S6YzN5Fw9ruGC0cDvEhkmZho1zfFpmxuwDo4XFQfK6maIGu9gnoam
         0XZlyv5w+kJqoolY1Y/7Gw0NIC9Uyk/R8xKvcFl7turNjOE44k7ufgdQFkO05IWNgVjs
         LMNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/kRvIrcXvqnSRAoTezcT2XXcQBE7hskTuWXrDECwJnh4thzf6ipYCd8bsDBBMc5BwnVpZFGL9x9TIS3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmKkSBFmLRQCLQYORkky7Oh0z/STAV4NoygJLihdwwPXxuj+Sg
	W544mNgwEzNIa9pp8viLNV7WHuAuljiPfcR4QIdNqhsY2V4PcUoniTst
X-Gm-Gg: Acq92OERapx7g/ckfiAr0oIZLBlJ9YwTrtM9QNTOMkRM6HIgIJBBhgHRsNzs3NT+1uo
	41Y2Ud4DUTSjv9Kl6QrzPOLRaBgW1Ix2E6qyYfUmuvIZxiBnusNoxrn7E83vsxlrSkoBQqe9pM0
	uN9ytkgFJFChi7lS38Q2nYvoMvd+f2VXOknySdsCJgB7LKFnKTE79gTA8qOHsKjbDUNJGTHsD8A
	/a6D8NFM9FJ+QWVOGN4kqljkk5xWGdh1V2YSd4IDQJI8NyhNwMeb/UE1i0Hj1TaIIIVMSep9CM9
	eWGRF01FVBCPROh7wiTam5R7rwbrHy8tBovsRjq2NibrMEsrCMPDZzExR1YMkwet1ON/ixrGi9b
	yJv8f7+Jlh9avP2rSPFgCeXfmEk3P8gmS+cBG5NteGkbJA/q0U2IgcxP+y+cQ2IYk2PkvBYpo8U
	zzKV7rp5gky/nLIEIqebScQdJa1kq+iuprH36XvMK7w+uYaUwqx+wMkCfT2ybH
X-Received: by 2002:a17:902:ebd1:b0:2ba:bab2:a867 with SMTP id d9443c01a7336-2bd526fd16amr125158475ad.12.1779005096859;
        Sun, 17 May 2026 01:04:56 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:4064:2d80:75ca:8541:272f:2bb3:5e55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fb17sm109834595ad.1.2026.05.17.01.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:04:56 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v3 0/3] raspberrypi-hwmon voltage support and teardown fix
Date: Sun, 17 May 2026 13:34:42 +0530
Message-ID: <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds firmware-backed voltage inputs to raspberrypi-hwmon and
includes a separate fix for the delayed polling work teardown path.

Patch 1 adds the firmware voltage IDs and the shared voltage request
structure to the Raspberry Pi firmware API header.

Patch 2 extends raspberrypi-hwmon to expose the firmware-provided core
and SDRAM voltage inputs through hwmon and documents the new sysfs
entries.

Patch 3 addresses the delayed polling work teardown concern raised
during review.

Changes in v3:
- corrected the SDRAM_P and SDRAM_I voltage ID mapping
- moved the voltage request structure into the firmware API header
- made the voltage request structure voltage-specific
- split the delayed-work teardown change into a separate patch

Tested on:
- Raspberry Pi 3B+ running Linux 6.12.75+rpt-rpi-v8

Shubham Chakraborty (3):
  soc: bcm2835: raspberrypi-firmware: Add voltage domain IDs
  hwmon: raspberrypi: Add voltage input support
  hwmon: raspberrypi: Fix delayed-work teardown race

 Documentation/hwmon/raspberrypi-hwmon.rst  |  15 ++-
 drivers/hwmon/raspberrypi-hwmon.c          | 139 ++++++++++++++++++++-
 include/soc/bcm2835/raspberrypi-firmware.h |  25 ++++
 3 files changed, 171 insertions(+), 8 deletions(-)

-- 
2.54.0
