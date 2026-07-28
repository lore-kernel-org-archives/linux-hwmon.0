Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE6D2D592D
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 01:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785203945; cv=none; b=dE6KcBzHntj5yVXZjJhmcVboCs9Ns7QmnZPCnHKbbxuqw2JZnAi7dXlES6/b4QjDX1/wzkENABymjY47KI6hWaUPzYo7e5hWxlVmgGJte1XnFmeyPziLQrVmpNVvxwIA0tXwm7UukCLfQOR+2/sq3BFHvjPa4LO91Z/MS2wYvYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785203945; c=relaxed/simple;
	bh=S1eToT9Emvo9T8yZiXhifldUnql1fMHQdpabftaPcS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RV4b17nHsKJK1hP/Xdwc8dlAMI/TOPANm50ATznXBwZvkbZ7544Uozok997S26rgkmrs8HCc0tMk1LvlU5sp1VJV6TiAec8PG7VdP+EZ3aI9WiaEIyF8klST6oxKrvFKJWr9JhdH5SyaTmERrx0A7/OTq8ixdZ68MKnod5YIs9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SC5YlTb2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SC5YlTb2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49557167508so31732185e9.1
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 18:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785203942; x=1785808742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lghiWACiInEXZwMGRDi/paNv9u2DW3lyEoUnCFOiJiY=;
        b=SC5YlTb2CjyAWyQLmN4HrDHtp5Iza/w0FWs6d4emHh3YC8tMMaWr7/1qH548ELoEqz
         6yVO8sj61UaK4gE7x+VKTb5HWuYrhvmrCSwB1ZRzHWoXtLLmuZ9zmO2U73uM6naZCdyw
         VFH9UiArmlv15IByYaWGyp6nFX17o+sD2xW2UR5thC0LpbGR7iMNAJogvvKyqMlFCJ5J
         9+th+lEXrMcri1D2BteKx8pIsXeWLc9dUxjcUa5ccFE9CiFezaoKHhvPPW1kKGidB+Gr
         Nnhdjob+m1jFFpFn2bzg9Fh+JgetNPdQWkeV97lYQnXqPcbx5LsrBKLaXq6cSFlXxjwO
         ThZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785203942; x=1785808742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lghiWACiInEXZwMGRDi/paNv9u2DW3lyEoUnCFOiJiY=;
        b=l+3Qk6i1F8Sovwyx66pxrQGYQDPsq0/uOdvVspxX/IdAE3MBSByGOCVf2ch1q2UXI+
         +EqxacoPrNJQl5R/TteDjaaom+v3o1XMDjxwxfYeMPFWUzYehiP04ysuOdDVV4rWtXTn
         Na3KY3g39JYXA4FrnyOWCS9iQMuZy0u6sLRXh8erj/O86wo80RnG+YcShki4aYB0qK1r
         k296fiUCwz8krz/XugALSV/hNDC6aj0QJxZOPo1HZdpJLkwqwVjPe2emv55meL0jpmhq
         6Ryemqyn1shA1lYovm5p9IBQieau1h2BVohwpmTy3Z5bwUy+PCW4JNSz+exVhRySue+4
         QJkw==
X-Gm-Message-State: AOJu0YxjQF7x9SGq8zYosUppA1w3JaUdzJuo9XmE1vpSn9WZOSH6nrl0
	qFNuekqQVAK6FBR+RsHB2MX29xqI1Tcr1UGSfYP423UrGg6cdIhuM0uT6+tCyW0zNVE=
X-Gm-Gg: AR+sD13/GlLI+FZNpT1FOAxVP8GcmBvcEWNkiGSO6B0ssCC4q+bTGcJx33BwKNhmiuv
	QNcWUGRbmJz9zOJUkwRbAnLvMm/S4zl5nhBjTcJDpeS2Akpq/azKkS/dZfhTNKEOudTvYeCEui3
	gELIqDzETQl2nmADVj+2EATEgwrTymIGlblVUdUB20HQsauq5ljllPqyBt/ioW4rxcQ+zhhJgBs
	/zyo4wZR9KvrKF4g+rG50LBjdKVY8x6YhZLGrBuLugMcBh24fmaYIF90vjl8TZgkLOxKpKjGpcG
	bS6DcoNgAEYK7iBBoEsGmqos6+SjJ+EGT3h40a7eP3ylaE2e2tubvNR4sz6OFbOJJoloPsDMxFB
	dMBoefwVmbZjEzf6JB9bajpEBabje8lvfbu2HaXvIYRv+dt7hAxX7/d0X1fdMyP8ZwkiNA/kv9y
	VnW3e7X2R6wfoAxMBVZ/vPGnh/3WM2sqg1j/X95buOsxeDeiTAldj3jS482MeBF1vqnjTZ/vWrb
	c1XXFTpQE1xctjQrZLzrS7BqwwUczrwVAfhPNTOypHrX8U=
X-Received: by 2002:a05:600c:46cc:b0:496:c06b:9fb4 with SMTP id 5b1f17b1804b1-496c642c89fmr3041035e9.14.1785203941722;
        Mon, 27 Jul 2026 18:59:01 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bdac28sm52380930f8f.16.2026.07.27.18.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 18:59:01 -0700 (PDT)
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
Subject: [PATCH v5 0/3] Rework TPS25990 direct conversions and add TPS1689 support
Date: Tue, 28 Jul 2026 04:58:45 +0300
Message-ID: <20260728015857.193890-1-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series reworks the TPS25990 PMBus driver and adds TPS1689 support.
Both devices share most internal functionality, differing mainly in
supported voltage and current operating ranges.

Link to v4 at [2]

v5:
- Simplify implementation and remove calculations from the driver, as
  they are not needed and were implemented incorrectly. Thanks Guenter
  for taking the time to explain.
- Drop pmbus API changes, as they are not actually needed.
- Add conditioning to separate TPS1689 and TPS25990 by chip_id in
  tps25990_read_word_data() and tps25990_write_word_data() for
  PMBUS_VIN_OV_FAULT_LIMIT and PMBUS_IIN_OC_FAULT_LIMIT. The TPS1689
  value is not 4-bit, so it does not need adjusting. Keep the current
  adjustment logic only for TPS25990.

Link to V4 at [2]

v5:
- Simplify implementaion and remove calculatinos from driver as not needed
  and being implemented in wrong manner. Thanks Gunter for explaination.
- Drop pmbus api changes, as they are not actually needed.
- Add conditioning to separate TPS1689 and TPS25990 by chip_id in
  tps25990_read_word_data and tps25990_write_word_data.
  TPS1689 value is on 4bit so it does not need adjusting. Keep only
  current implementaion for TPS25990

Link to V3 at [1]

v4:
- Fix non-devicetree support as reported by Guenter Roeck
- Rework direct conversion handling to use exported PMBus core helpers
  instead of driver-local implementations
- Update dt-bindings commit message and ti,tps25990.yaml
- Clarify commit messages to better reflect the final implementation
- Add and export direct conversion helpers from pmbus_core
- Eliminate duplicated conversion code in the driver

V3:
- Fix error detected from kernel test bot regarding division

Tests:
- Test builds for x86_64, arm64, i386
- Retest driver on arm64
- Validate driver direct conversion functions manualy


V2:
- Fix error detected from kernel test bot
- Add Acked-by to dt-bindings commit
- Drop "support" from dt-bindings commit subject

[1] https://lore.kernel.org/all/20260217081203.1792025-1-sbogdanov@baylibre.com/
[2] https://lore.kernel.org/all/20260522082349.2749970-1-sbogdanov@baylibre.com/

Stoyan Bogdanov (3):
  hwmon: (pmbus/tps25990): Rework driver for multi-device support
  dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
  hwmon: (pmbus/tps25990): Add TPS1689 support

 .../bindings/hwmon/pmbus/ti,tps25990.yaml     |   8 +-
 Documentation/hwmon/tps25990.rst              |  15 +-
 drivers/hwmon/pmbus/tps25990.c                | 219 ++++++++++++------
 3 files changed, 166 insertions(+), 76 deletions(-)

-- 
2.43.0

