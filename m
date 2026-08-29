Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6532B12CDA5
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 22:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788040917; cv=none; b=UNkHsYs8e6htwRxDhcHIx/o0i3FDap4vmwIJj/hk0cVz5j9WSJYXbSyXvda50N/P4TYaeO3QOHrnxVbX5CIIMT3IjWeg5aIAbbfsbChe5m/yEcqrzyK0FiJl8XeGW07JIR447V4829OClFXe/btxhM1jGIWGxXCinhWBQAR2jzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788040917; c=relaxed/simple;
	bh=OWJ/cnf42WS5a/GFkrkoM+MYTuKU67JuIv6hIHnRmpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CF+X2vJHY8P0xRo3dHbdUG4eGPeDeyzZGmM/N6SVlon/vqKlZxfMiRlbPk4dC9rmo70z36aRBEuuqWCyk3UjPHcSBuYVuOyolQuJ2hgyoHcvWoCtcT9gh0j0y1Nsn/brcO1uB0qiNTU8v9VK8DUjcl4zzOJVkAIY/M92NbAP7Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqvAvO54; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqvAvO54"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15e2dab83eso381972866b.1
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 15:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788040913; x=1788645713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4q6i7gnF2/mA+QvMbueOophZ1II2F/Z+l3iHK4wtiAI=;
        b=XqvAvO54GCwFu4V6y+1m5dRkEcrQauhuQM+uPVaPMQH2xUlGLqA7oHmr7hftex9dcg
         e/raV7DL0//FD+BmeXP1LOu9/tWd6zkOypGNhEi11lWk9ra7Cb8OEY/vkHz678XkYlMM
         eP77PxgJKJ1biUalN23EBgfrht+vvFtRbAl0+BbGtWqwU8SuUNtntaj6bppQ23DuMVuB
         mupKmXoIlqBO9ZTa1v1azM4voLwxFFAFmFpz6JGG6ceI0Cp0B3BHWtB1EwQaHHpvqYfP
         9fSAysV4uDRankaxkokUxw2tQju7XKP3A4YM3cqZMWbNuubkUCj4QJb7X7Db/hEt4JQU
         8u5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788040913; x=1788645713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4q6i7gnF2/mA+QvMbueOophZ1II2F/Z+l3iHK4wtiAI=;
        b=bQHAOg8g8mru6dvjHrBkXMJC3eOGYJYLojmPSpFOr+bFQFF9xswvmh95u4NdfWZVY3
         yQcgJD1iDUMjKaoP30UBUFX9qC3T2n34xzz7Jf631TvEw3lJtm/UC1ZTNCgg4XmSJVdP
         T/yj/g4p/jQehtcvHGGkitJny2sfLW/19yKF2vrHJ7ft2XQurkocExfrX2zkZnd7QRED
         LBR3P3KCJw68rDEFsLmFe76c37EzIRnbmlUA2waRUPw+aqsLafgd8BKlAfzo60T5MCFR
         xkJ8rN/zl6bbyZQPbGdG8z52xExM21aBV7YH+IQpe2pCeM7B2avUw/s/F/csGphXS7+n
         ROzQ==
X-Gm-Message-State: AFuF++n2A17NnMivYgF5dZWstoP17ngNCsQBqqNyx5BUcOK+NjKJ5R3+
	+Aiei+s824Uhu67QdguxFKDm0v+sZ0aa6m9ewCVFNp0WGa+hjRwe4+M7
X-Gm-Gg: AR+sD12QjKXZsehJb3Fh4wwNQWsI8bkA4cqwnKPRNyaDeTnV+iuADR2lBUKoIz8rGXo
	J9CVqFIVPqyuBT0ga+MDH9n4212Uyzt/d8O6283yYZ83iTU+WurmLk7wKMoAivtme5qjpjaluCN
	4QzIQ3yJ9KCMyufAffWerPvk2O6eZyBXsrvLVeikfd2v2JXnPwLaCw/3deWINWxpR3C74I3qaRQ
	gvdsizlT8BIZbu/rep28HLFOpOOmrhc2nsw7ZQ1dQssNzE+MPnohY4GzH5UKARbXyzReAXny8NK
	Jh8R0Mor3WwOlK5SZrFCdH6mhyvi82oRXTwei0OsDmWh5GFZV9AgEL5NwjtYO4/0NGMuedSMD/F
	Z7/V2Hip1xegJaSwIMqWaaoKVKVQMqNARlL5/7mV+6Aqn9EFVCmGBg4W4IS/r4BOu2M+/4MarAV
	r0wXVAxp2Jr2GrJACMcei9JZbKCzNEbASRN/8JOULkVy5Z0eYZEoSKigxLQWpG2E65pd8+oiUGi
	+vBl60hVrdYPi0=
X-Received: by 2002:a17:907:c02:b0:c25:4612:2efd with SMTP id a640c23a62f3a-c2557167f51mr1064577866b.9.1788040913345;
        Sat, 29 Aug 2026 15:01:53 -0700 (PDT)
Received: from localhost ([2603:5004:20a0:100c:4701:1ac4:1c21:4a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f25177bsm243906566b.57.2026.08.29.15.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 15:01:51 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Benoit Masson <yahoo@perenite.com>
Subject: [PATCH v7 0/3] hwmon: it87: add IT8613E support
Date: Sun, 30 Aug 2026 00:01:46 +0200
Message-ID: <cover.1788040385.git.jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829210036.61136-1-jerome.tollet@gmail.com>
References: <20260829210036.61136-1-jerome.tollet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a respin of Benoit Masson's v4 series, with his permission.
It replaces my fan-input-only RFC with the broader hardware monitoring
support requested in review.

The v4 series was dropped after a NULL pointer dereference was reported.
The IT8613E device entry did not initialize reg_pwm, while the probe path
unconditionally dereferences it. It also advertised six temperature
offsets but the register table contained only three entries.

Changes in v7:
- Keep the existing three temperature limit and offset resources. Drop
  the unused per-chip limit and offset counts and the extended offset
  register table, so the driver no longer accesses unexposed resources.
- Limit the first patch to describing per-chip PWM temperature maps.
- Apply a deferred legacy temperature mapping when switching from manual
  to automatic PWM mode instead of clearing it.
- Leave the existing PWM polarity repair path unchanged. The first three
  PWM control register addresses are common to the register maps used by
  this series.
- Clarify that IT8613E has three known temperature inputs and six PWM
  temperature mapping sources.

Tested on an IT8613E at 0xa30, revision 12. Every intermediate commit and
the complete series build as external modules with W=1. All three patches
pass checkpatch --strict with no warnings or errors.

The module exposes fan2_input and PWM2, PWM4, and PWM5 on this system.
The PWM2 temperature mapping was changed from 4 to 1 in manual mode. It
remained 1 after a cache refresh and after switching back to automatic
mode. The original mapping, duty, and automatic mode were then restored.

The PWM2 write path was tested by switching from automatic control to
manual full duty (255). Fan2 increased from 2636 RPM to 6553 RPM. The
original duty (65), automatic mode, and temperature mapping were restored.

An S3 suspend/resume cycle with an RTC wakeup completed successfully. The
PWM configuration and sensor readings were preserved, with no it87 or
hwmon warnings in the kernel log. The legacy mapping correction was
compile-tested but could not be exercised on this newer controller.

Link: https://lore.kernel.org/linux-hwmon/20260114221210.98071-1-yahoo@perenite.com/
Link: https://lore.kernel.org/linux-hwmon/20260829210036.61136-1-jerome.tollet@gmail.com/

benoit.masson (3):
  hwmon: it87: describe per-chip PWM temperature maps
  hwmon: it87: prepare for extended PWM temp maps
  hwmon: it87: add IT8613E support

 Documentation/hwmon/it87.rst |   8 +
 drivers/hwmon/it87.c         | 308 +++++++++++++++++++++++++++++------
 2 files changed, 263 insertions(+), 53 deletions(-)


base-commit: 75f2c0b3690702c90863c2e138cb5520670845ea
-- 
2.55.0
