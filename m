Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF301F3B8A
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Jun 2025 04:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749096539; cv=none; b=uGmRcyJAQnjMdSiE3206Hlp0o6JDhPth2CIoOzg3gQF2A2Zz+xW8B/vlnfM1+072n/RvD8hZGK1XFIxGjNeehVdv5ACPDw4LGw7mdZsp+g9ZbVRdDx+rhXoIIPU/rsxzhh4u/cxwUF4bvlYXRTFgPbymGtFrqW+WCegNqr3oWaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749096539; c=relaxed/simple;
	bh=S9Myu/EAwV+EabHUKboJwstByqgJNE42t4kceGhAaJA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qOf8c6kKY3jpGRP3dhHNADAAAY1Qx/nmu1ovuX4OpCVKEs0y1VMSaYK7sxWU3EQ/IQcHEtp4phi/+HxugvMtUGQc11Zc/XpupKJHhsIybE7xV78548+DtQYOdhvP2UF+XfFFCWckt43Tapc0RbddBgXahJqJi/bKRtMlgPOWCAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=WULquvlk; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="WULquvlk"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-747ef5996edso451602b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Jun 2025 21:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1749096537; x=1749701337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3reX2SYNoxgNAAZUbIwRQ8AO5e4F9o+0m3Nm0EB8qO8=;
        b=WULquvlkqAGjVR7Ze5cycx/D1ijtw5iyhqbXmH6oPfFbAkpV1g3TWH4UUHzygVdVJ6
         V5+/QU19+nRlPB5uiKW5/1WzVe2pWh93/bejElLViof+S61A8xocXKh/3yoeAdtM4Jh0
         4d2QVgHPJjVP4xJ2wKPJUIttptS2Ovm4w15g0B+D8qVc4fB28u3KEFI2vg0fC770IRpo
         l6nnMW4F9DPHX2UcW63tm37lML0cOQET7KrCb6qgyrUC20Z3OBkFh7RJa8W4hUiUKebn
         v/FrAZs8US0DWE6ZhC6RfSwX8YwA+bwmIKWOP7XyFQo5Q6LloVIILbor8i5Wjx7QtsEY
         4aYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749096537; x=1749701337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3reX2SYNoxgNAAZUbIwRQ8AO5e4F9o+0m3Nm0EB8qO8=;
        b=BJorazBKDfBUEdJz7cVnHQI9ZxbqUZ9Jiqf4MaXflhCniJ+Y0JoR26tLxK94uIpf2D
         K0eId+Wy3s0/X3CIfHodp29HLSqlFkr1COJDvrYeyEeT/zTkfaPhWVgx5LYo6HFml23t
         0ic9/LnLMjUKLJb4Vf7NTlhEW3q7pNjdZ0+mpznymUJIJfzzv2WhN6BuLSb0+4x73uoi
         4fN5AoI+CsZqPyl4ur6jvGYMp+P/eEoUcS3QWnULaHlVAIgFr2rOoB4OWl6KKoj00OEQ
         XK6CwMRVDsXney7eCzU9vvdxNsE6n53Jlu/h7rvf8Ma7dlMCkjEhHWzWfRDtMo09CHzh
         Mfkg==
X-Forwarded-Encrypted: i=1; AJvYcCUX+UarrMHbEXIvH+Si85bV/z6eEQNDIMQrwsIqj1QGUbHBHF+saX+Ma+DtEvXxZ8qvdG/YErUacMmbyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLeniLgyeU4wYfhdA+mMYgrAweWtqver/uS0gCUfoW2AOj3z+6
	NukEG7Bs5yCmSHPhyNqeKoaxtLFPQzc55AomkMiih3ksk8bpfAqkYEjl1kjtDr9grx8=
X-Gm-Gg: ASbGncvEOBRMTY7u8383kO8fMpLOQVoebTz7bK5T6eMAhqmPjP7HllZRDo3MImrLDWf
	nrP6nprX07L0/psxeHeG4pDZFgunMJ2b6SzhCAPPE0ujNLZyOhF96Gr8HKP0DYJnlAxJteh+Yvy
	nQjITVudCNv7BVGQ5kQhltNj87qf/tiA12pm4iQFU+pWKVdUUnpNxdiw7LeAxQU/VHRpUMhNrOJ
	o4UKhNnUChCBRlDGFIP/98EtaE3GY2BKP1KJqPI5/Vy9Dx82i0oEoX6o5spTNPJzZ/9G5bIvgeG
	yxF4kCsg1XayDyrszANfo3icrqHo5ziW6V7dztd95Cw/6zVT9by89+mo8+rLtlS0fgTTGGANoIE
	P3zln2YCB/gWf8saqYi/BNVp4n4Q7njRHm+wYWhIT
X-Google-Smtp-Source: AGHT+IE2dXMM5ab3l/XoJD8gyVgwjP3vN4WSpp7LcxfwoTcExqAg2Z8Xh83mw9HHU+8k37g4o8IuiA==
X-Received: by 2002:a05:6a21:60c1:b0:1f5:7ba7:69d8 with SMTP id adf61e73a8af0-21d22ab40bemr7387987637.15.1749096536708;
        Wed, 04 Jun 2025 21:08:56 -0700 (PDT)
Received: from localhost.localdomain (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb029fbsm9480924a12.13.2025.06.04.21.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 21:08:56 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: chiang.brian@inventec.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	grant.peltier.jg@renesas.com,
	jdelvare@suse.com,
	krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org
Subject: [PATCH v5 0/2] Add support for RAA229621
Date: Thu,  5 Jun 2025 12:01:32 +0800
Message-Id: <20250605040134.4012199-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RAA229621 is a digital dual output multiphase (X+Y <= 8) PWM controller
designed to be compliant with AMD SVI3 specifications, targeting VDDCR_CPU 
and VDDCR_SOC rails.

Add support for it to the isl68137 driver.

---
v4 -> v5:
- Include Acked-by tag in dt-bindings patch
- Wrap commit message body at 75 columns
- Remove the incorrect dependency description in hwmon patch
- Link to v4: https://lore.kernel.org/all/20250602050415.848112-1-chiang.brian@inventec.com/

v3 -> v4:
- Add Changelog
- Remove unnecessary "From" tag
- Add the compatible of raa229621 into dt-bindings
- Link to v3: https://lore.kernel.org/all/20250303083537.3312250-1-chiang.brian@inventec.corp-partner.google.com/

v2 -> v3: 
- Fix the corrupted patch by sending plain text email
- Link to v2: https://lore.kernel.org/all/CAJCfHmWJ9N1R8x6ikU02_RYq9ieq6yWY7CGdfvc4hRqHnX5szg@mail.gmail.com/

v1 -> v2: 
- Modify subject and description to meet requirements
- Remove the override of isl68137_probe
- Add the of_match between raa229621 and raa_dmpvr2_2rail
- Link to v1: https://lore.kernel.org/all/CAJCfHmXcrr_si4HLLCrXskuZ4aYmqAh0SFXNSkeL78d2qX2Qcg@mail.gmail.com/

---
Chiang Brian (2):
  dt-bindings: hwmon: (pmbus/isl68137) Add RAA229621 support
  hwmon: (pmbus/isl68137) Add support for RAA229621

 .../devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml         | 1 +
 drivers/hwmon/pmbus/isl68137.c                                 | 3 +++
 2 files changed, 4 insertions(+)

-- 
2.25.1

