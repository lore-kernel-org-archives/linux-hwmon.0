Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1F731690A
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Feb 2026 05:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771823307; cv=none; b=hnO85qTh6s4WwQCTUm17yK7oXu9f4fBQxqmkA33UfHdUC348GOFzX3ZSD8qBYAhszmk2x6Q2JPbF88vXvZmoY4xR00TM/UfwgGcNmzQ8CqFQgBUN1PeFMONK1I69LZ2EjJCOkHKCBgL4Brhbs86uZKGGRGC9kEZ0fP9AyUxMFzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771823307; c=relaxed/simple;
	bh=gK5UcnP7+ryexzD62DSrxNF+8euRw6xkI4U8en+SiXo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=jUhNaWEp+FOp8SaZ23G3RlKfgMs0XyhYUga/nFQj+hmOG8taItguPbI46gYjR0qNnyMND217SVF8qrie901MUfFbiwT8O8vvOjF5A+OVzBAfHGkbRq/R7IfT9NjruthRTXHq0SAZJtJwgQ33cZfCHy4ZC92+EiDQ5E2dfLTIgPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWcpIYdX; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWcpIYdX"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-824b32875e7so1900668b3a.3
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 21:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771823306; x=1772428106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tSn1M4K/T38mI3fXvMLaaAuFU4OXK5FwHXc/BnLf4A=;
        b=bWcpIYdXEftWXOvOFRucv5SbdJgrkb4YLNrnQVzYud+Al3jaB6qUX+QRCUKXjqsWRP
         ylq2c3F8CCWoH54TwaKisZJopUUd+W9E2EhSHb8G8ye/jQcJJEoPodfuZNIno0EIFTqv
         vuXnqGJD5nEh3oTFAGTKUHMUVceEW/DfcXB9WHKkphnsAK8Y5udBDBsZv2E3ggxryZYk
         TsI+SYBzmruG0nSWBfrbfn6SMCBoeYLJc9Fk6lZSfGbXcn2e8r7ftVlOusfat4C73pVy
         Hfv7gEItzye1iikRG3UlFjpUt2ifwQHdU6/DIy3EZ/hWPM+rln1+VsLFM2B287g1+44z
         Oycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771823306; x=1772428106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tSn1M4K/T38mI3fXvMLaaAuFU4OXK5FwHXc/BnLf4A=;
        b=O1j8dgefvfluwd+JeaV8X3P9a857QRrdH0ZusAvh5JvuR7jdysc3t/uGgj0u132rV+
         DUZzJB734eBSZLNrZ6lBmImfy2gkUuvf+4joF9Aqpt0gWQeXjA720Pk6/Gyb/+j9ltHs
         RmAG1i54iqVy9lXs3D7PZ1aECnYqbL8OpkOts0IjaX3gWQhZ0EjhNo3SG+oRwbreq7Ra
         EOslwky8TZcIDpjvdMDp83qDQ8BuqSeQRVgDd5LQgP3Eut6cQN2XWLcqL+REIKdEzqnx
         N6cxVG7T5dsFjUsyRPF7Cjkn3g2r/g659yGhvztHKlmo95RHdbU+N8JUZghGsDDfwbPQ
         VSYw==
X-Gm-Message-State: AOJu0YzF7xQE9mgYAVU8GcTJtssfz7Bi/STZ1Bx9MBcnBnwc7v9EYDLM
	yCTeikqNX/FZnPYKGba906170CPJzc1shuTLAbDU3jm5y0ZLxkabId8KxwPLDBEd
X-Gm-Gg: AZuq6aI5asL9TW55CdEx37WMPGwBk0Ldi41bD5clAkVU8iE4Z0vDil9A7PTZZH4UgC/
	HN7Eta/m8hoM5AXzzF53U8kLBZAJ9zVji4i0UUiprXI+C0uH94G/MdWSGC2EIAVbkjMKoPOnqsm
	Td2ZF5KyspGB/zWwnOmZicbrbK0XgxwFXN5Bjisv7JqSXcgenrGbcZayH5L2Q/Bc2195MJTWr4D
	iLZCBZYEdEq/QHattekLJ0ojT2jkI/KlR1ok/u8xlgx7APv767bzVqVmywo+WRg3iibxC3E6QYR
	5X2ZtnlcFCuns8h2R2tMJGY8qNhUOw74I4aBolH3Pzuu3RO+cZQtS3Saxw8OEkjQ/6+jtfKfm5z
	k+aD4RRwbA63FCHYfs2s8016NyO2A495OYAZqS8m4KbD5UW88Mc17hUAGzfavnak4Z4Fd/kfLaO
	LPl5M5ubGZmMgBmhyiYTs57zeJ775Z+/PRwylWZz2G9UDbZ+MDpZgIRPHk
X-Received: by 2002:a05:6a00:4188:b0:781:2291:1045 with SMTP id d2e1a72fcca58-826da8c0d56mr6066727b3a.8.1771823305779;
        Sun, 22 Feb 2026 21:08:25 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:93aa:64a5:666f:7ac0:de3b:1659])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8bf9besm7502022b3a.55.2026.02.22.21.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 21:08:25 -0800 (PST)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v3 0/3] Add support for Infineon Digital Multi-phase Controllers XDPE1A2G5B/7B
Date: Mon, 23 Feb 2026 10:38:01 +0530
Message-Id: <20260223050804.4287-1-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Hi ,

These patches add support for Infineon Digital Multi-phase Controllers 
XDPE1A2G5B and XDPE1A2G7B.
Both controller supports Linear and VID Data format for VOUT using 
VOUT_MODE command.
The configuring both loops/pages of the device independently is not 
supported for VOUT_MODE.

In case of vid mode, NVIDIA PWM VID vrm_version is supported:
Vout = 5mV * (VID-1) + 195mV

With Best Regards
   Ashish Yadav
---
Changes in v3:
- Link to v2:
https://lore.kernel.org/all/20260219105630.11929-1-Ashish.Yadav@infineon.com/
- Address review comment for [PATCH v2 3/3] about return value of
  VOUT_MODE (vout_mode != 0xff).

Changes in v2:
- Link to v1: 
   https://lore.kernel.org/all/20260202080355.53061-1-Ashish.Yadav@infineon.com/
- Address review comments for driver documentation, pages with different
  VOUT_MODE, Indentation.  
- Created separate patch for PMBus core changes.
---

Ashish Yadav (3):
  dt-bindings: trivial-devices: Add support for XDPE1A2G5B/7B
  hwmon: (pmbus/core) Add support for NVIDIA nvidia195mv mode
  hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g5b/7b controllers

 .../devicetree/bindings/trivial-devices.yaml  |   3 +
 drivers/hwmon/pmbus/Kconfig                   |   9 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/pmbus.h                   |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c              |   4 +
 drivers/hwmon/pmbus/xdpe1a2g7b.c              | 119 ++++++++++++++++++
 6 files changed, 137 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwmon/pmbus/xdpe1a2g7b.c

-- 
2.39.5

