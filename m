Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0573572666
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 18:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892462; cv=none; b=MZe3gm+1uh1KOq7qFg3sQ/1dusNDPvzcaWqmktniaf2/OI7pRE3MloH3KL+HLfWdXmFHm7qwfkxtD/9ilgCqiXnwSNPDDL6o8tsEY4us0yP7ISoljCgQ2mpIKHMPqqpnZYrj03kCMXDQJcMcJdfh0UicP2A9Cq8i4nufns0Hy54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892462; c=relaxed/simple;
	bh=4eGTP4LUxsjfl69Msy68378nEsw33bHsm07+fTnlLT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QwO2MRYO+ZSmrBi9K8Gi4nCa3hcHeSkVfzDIz7odHStF6ZLmnCjlGij4o6qiIaFwYxYpTKiQ5qUErVqtFLcaPf4hIY4hQFEwa/XHQY6hExrAeE6dhC6WSTENwIOm2p9PD3UnEPjkYN2ceG/FBFoRm/1f9bxyNhBVYmv4SMIxoXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efl7mipp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efl7mipp"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso41959925e9.1
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 11:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892455; x=1789497255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DlzHWsXat6ojDJ/DAFZB3TdvYphSiZcgNgIhwrwJoq8=;
        b=efl7mippk5rRe/T7glofPen+X0bnSTrkcumgHFCpVOH9vMwvAgiFBC4k5YQKMNcJvf
         9iJfRpUipv3ZaeZcGr9QxGTbFWy9gXY2NTCF7BR9Y7zvN1IANDO1jx24AZbneLEm/ncb
         JwCVSbjXjibhsaKNAQXlall3wQGcKvgPPVmRLhoRFJhXV1H1aHGg70O5rj/e7Gs3UKzF
         daYD+SSshnPNCtD8BhLfTLqI3Thxn9bVd48UH5pEMLQzWhG1ivHRaZhLDDbU2J04e+aT
         HYNbWxErBoiguchpzQW+if1OtFHlUCUAIRorxZcsz99r6AaFtle5gThTb9fybgra8vHK
         n8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892455; x=1789497255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DlzHWsXat6ojDJ/DAFZB3TdvYphSiZcgNgIhwrwJoq8=;
        b=sn9Kb4nHdvdtyvkjHi0sFK86UNBDmEYLzWS3j0mP8gtOV3NVsXqgP7VkkKjNsEbTsg
         Tq6F0w3D9V6fCqnO25ImqOlw/9++cVYbRJsmcUs0HPL4Q9U7+m2fHCFtD/RO7bWgKf8x
         43TWpFtcrX7erDrn+t6r7OpJkleddGbduDpdBLugDXp3PD2v7T2br4OQbXaXdRgNh0sk
         Nj0yG8F/sB/lLXTjGqfGwCQZWu0WU/mU+1keT5oU/aRyEqJ7Lg7Rf+e40pQScOq3Ibq9
         5FphYChjZ0esdIMx3PuL7d5bCHf079BuTHPcqN9kUKE5zsk+IX+U4Fr/0NXBT863zBpw
         iiQw==
X-Forwarded-Encrypted: i=1; AKwUvBzetn5Y28vWocbAHbpNN12Q4gI2WLpNI11lGn6KJ4Zik3el4N0ixwa71ZT56k+dM4GdElt3XiiXZ24oqA==@vger.kernel.org
X-Gm-Message-State: AFuF++ln3oOSW5xkSoYObUj3W2ISwHYX2xMfk/zOUDJKo/DDNjVPUppT
	wIjkMSwHXzrBcVlu71b0LmC5SaO8kZyHbKAiQB+9MM7UvyY/tdJiAdiLywn9UFOQ2E8qzQ==
X-Gm-Gg: AYBFou3j3trPDykF2I2O0qJ0fxEii/XjDknd5ufqfvC1TirpSm/ZFBJdoRDZeAb0pwF
	ErdxGTkKeqIPKIZVCM3T9BQbDSr+u0P62KlOBq+Loo2YOb6TOzk08H8e6lurpcdsLhGc7znMD0d
	2uOukDFAciM81n3vf0IQLhfoXLxoJLamSXGUwQSrm0+F/SEKPXooYT4dQRtUu4UfxC8nqEW6V+z
	9GPsZugrqp8wi1jrbb2MJCxpvw+bnJqUC/CD4Z0e/5Oe0c+qtPYe4oswdCMterSs2fQZArUosjY
	XlrPk6KHBGFXM0IW9YpKc/4WfMlQRW8uMsRgl/HrTZeiE155oO27RdSiN0PltknKUtX6JQfOsdY
	Lw6ToC79QruD50G4rnEBeBVbrh+k6CyaKsurSYOBjzjfVrKBtO4/ykWyYaEWMznU0EZaayj3JyE
	uY/2Hv9X/vvZYY11P3EOiclnQQfO7apZ7GNqsBtCLC2Xk8U/VMolDMbzLCA0p3XGADazkIl/m5R
	A4nVaQiaYR0HUwts0hytBNvd2HC8ZOk
X-Received: by 2002:a05:600c:3145:b0:49d:1916:59c7 with SMTP id 5b1f17b1804b1-49d19165a7amr67722275e9.7.1788892454444;
        Tue, 08 Sep 2026 11:34:14 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm312095435e9.0.2026.09.08.11.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:34:13 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 0/2] platform/arm64: Lenovo Yoga Slim 7x Gen 11 embedded controller
Date: Tue,  8 Sep 2026 20:34:01 +0200
Message-ID: <20260908183403.2107-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Slim 7x Gen 11 is a Qualcomm Snapdragon X2 Elite (glymur)
laptop. It carries a Compal EF06 embedded controller on I2C at address
0x70, which is the only source on this machine for the board thermistors,
the battery cell voltages, the fan tachometer, the keyboard backlight, and
the mic-mute and airplane-mode keys.

Patch 1 documents the binding, patch 2 adds the driver.

Why this is not qcom-hamoa-ec
-----------------------------

The Snapdragon reference designs - glymur CRD, hamoa IoT EVK, Asus Zenbook
A16 - place their embedded controller at 0x76, and
drivers/platform/arm64/qcom-hamoa-ec.c drives those. This machine is
different: only 0x70 ACKs, and 0x76 is not populated at all. That is also
why the firmware reports every host fan capability as unsupported, since
profiles, trip points, LUTs and tachometer queries are all addressed to
0x76.

Binding qcom-hamoa-ec here does not work. It speaks a different command set
(0x05/0x0e/0x42), appears to probe only because it never validates the
firmware version it reads back, then reports zero fans and leaves the
interrupt asserted at roughly 25 events/s indefinitely.

The ACPI tables describe both controllers: one at 0x76 (OperationRegion
DVUM, fields FC20-FC2A) inherited from the reference design, and the one
this driver targets at 0x70 (OperationRegion ERAM, battery and charger
fields). Only the latter responds on this board.

Notes
-----

Fan speed is reported but not controlled, deliberately - the EC enforces no
thermal floor over a manual setpoint. Patch 2 has the measurement.

The DT node for the controller is not part of this series; it lands with
the board DTS, which is being upstreamed separately.

Tested on a Lenovo Yoga Slim 7x Gen 11 (DMI 83QR, "Yoga Slim 7 14Q8Y11").

Changes in v2:
- Patch 2: drop #include <linux/mod_devicetable.h>; <linux/i2c.h> already
  provides both of_device_id (via linux/of.h) and i2c_device_id (via
  linux/device-id/i2c.h), and the header is on its way out.
  Reported-by: Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>
- Patch 2: add "depends on INPUT" to EC_LENOVO_YOGA_SLIM7X_GEN11; the driver
  registers an input device unconditionally, so a config with INPUT=n did
  not link.
- Patch 1: pick up Conor Dooley's Acked-by.
- Link to v1: https://lore.kernel.org/all/20260908091752.5508-1-okerixx@gmail.com/


Oleg Keri (2):
  dt-bindings: embedded-controller: add Lenovo Yoga Slim 7x Gen 11 EC
  platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver

 .../sysfs-driver-lenovo-yoga-slim7x-gen11-ec  |  21 +
 .../lenovo,yoga-slim7x-gen11-ec.yaml          |  56 ++
 MAINTAINERS                                   |   8 +
 drivers/platform/arm64/Kconfig                |  23 +
 drivers/platform/arm64/Makefile               |   1 +
 .../arm64/lenovo-yoga-slim7x-gen11-ec.c       | 638 ++++++++++++++++++
 6 files changed, 747 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
 create mode 100644 drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c

-- 
2.55.0


base-commit: df2908090cda368b01ff43709f51890076c56157
