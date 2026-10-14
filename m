Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F98415B67
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 13:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984207; cv=none; b=g0ga8nNH3/ihPwTaPHnw6kKY9ty9pLunf6ljkviLCiu7aniEj+hLqji/Ata7y2f5nnu5HeOzBIuEN2en0/SlCCAf29QsQ5JMgIaBCd445GAV0KGJfQ3Xjoxy5VMLVEnH9Dg4VfWKyy+kZ7P34+iip8RnyeMfNJ3FYZ9Rw16XEts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984207; c=relaxed/simple;
	bh=rnAfDQx7rD0LoelzY+i08EvNOwwd5qC1oOG3COH6+C4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OuBWg1ik1dwUJabZzQ02anDBMtfca8JdoOGWiLXv8ZmykdL5WCW/Z89v56bVwEwwttE/BHuIHRchSKRwej2rKbrMKe2Exf9nu7+tN6aoHU1p/doWlju0ItHLFkpF2pgmRBfQNsE71mDrHwKMjof1OsmbgAsQ8HkwgU3IgD3r8gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mw4YGq4U; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mw4YGq4U"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso1290247f8f.2
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 06:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791984204; x=1792589004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Exht4vpfvBf2QY5fB2SjsZesTTxLrNkrbtQgeDFiJPs=;
        b=mw4YGq4US6dyConrSiwMzbSKUZnzmYXn+q2oUQKE3ngEAEPeHKm7Wtx/XMfW/qjv8O
         5NwuZDhx6XsMrakuW52vtNepo8UT0IKxUZ1/6UB/UjFN73PDz/P/uYyMabJ5fRc6P91u
         gIuqTWUtym96ab/p4T13VzmtwCgu/8Irx3SpKuKZ0sDKrjMVx9BGOddjaDm3a1L9GkSF
         AQS0jQ1Tmkm04Vv6MoyLtkKx/BByr9X3DgL0iYZL8Ag40E40jSpnWchq6vixGN3Q7eyz
         XF+2uP+gdb+eGcRwhcX90gzuRPbHyHJi3NMbOuWrrdL3lOuduDYF6fm218Pnas3oo414
         NrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984204; x=1792589004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Exht4vpfvBf2QY5fB2SjsZesTTxLrNkrbtQgeDFiJPs=;
        b=KLKZ2WJ4XnFjMQkWX1tpMBK9PdGPOeU9vDmDUAM05zE9mkzOgtyhfvS6J1FWUKH8AD
         lz0kcZ9A3oeLk79OrNF0Pn3pOns0gFFLIsU2Ba02llKVrLMrYJ6uBlnYqrHKZ6kU6Yi4
         7hYl3ogozbqC49TF1gwv6QG/1u6qvfwuLJRUBZezKjSKWvPXkMgV+1ehUtxaSP/OV7Yn
         nCzpUfvYIJ6A7w7ypO0Gg3E3mGSobL5AW7M0MrNuNWZM0ffasEkqkih9t2Ha0kDFPBbC
         UE5K8Cfw57UYB5wJ689PJPJTh9pXgO+qkrBT6P6uabFvEEb90oDlwi32N/aA3xCbnE1v
         btUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpWzbs6i09mKUcg/+6KJgNSXyWrApSVhw6V9liceOa+cai2m1ScsjKNEeCrh3+jRWDscJ2i8A3cJNL4w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJaar+dusBd4NmX9pAQ2CeRgxIiL1yH+lhOgC0Me41S1YZRB/x6
	Y+nVoXd2zwbjVe9c7y3EHtpuFdYfaL3GIpap5bINuS2sd3y29L1+5xZX
X-Gm-Gg: AYBFou2OoLODPxlQv6fBJt2k4drTPJyl8/CPhqpGpogCIs/Ug73p+j/8eCWf10H206C
	LKoho9x7aOKAHdEyHudOSRw+vLWHiCHeAee58GSm/4wzLfN2uMl5PcAyXlcDUyzt3xAb/YeTZMq
	by8bjKgdu0Om06yRHljMVmOPdqiAnwxlkMQGXOP2Dq7+8hYujg4V0aq4NC32nsj2ycuBlvNJb/T
	iCoRSHCK+i/FFUayY1XLj44z2WArGLSl11eg2QKshTnp6XZ2i1nq80XYJn1y7DbfumnIfH73rgt
	CoBBfmZqDX1d7Eu0N502+gFZWaW+K/dC/ZrDGLZXfsiApc5NKtJsur1vdC0hPM5FkviBG9jpUTU
	xMY18shyg8nk0TQzAIySBPMshKtuJ4/UCtPKoN90IGHpQsBVW32zoWn4BQJJp64pfz1XeZT9RPh
	MOAVkdel/CIwc3Td7RJLnQdJ1pcEePnw3IaFT6HveUmmzQSrgrvHF4vb/BdU+TVUC7B5mztwdN3
	AZ6c899r7lGmA==
X-Received: by 2002:a05:600c:8217:b0:4a1:a496:fc17 with SMTP id 5b1f17b1804b1-4a1a4bd3da9mr153963305e9.5.1791984203545;
        Wed, 14 Oct 2026 06:23:23 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bcf69402sm782515e9.14.2026.10.14.06.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:23:23 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v6 0/3] platform/arm64: Lenovo Yoga Slim 7x Gen 11 embedded controller
Date: Wed, 14 Oct 2026 15:23:12 +0200
Message-ID: <20261014132315.4659-1-okerixx@gmail.com>
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
the fan tachometer, the keyboard backlight, Fn-lock, and the mic-mute
and airplane-mode keys.

Patch 1 documents the binding, patch 2 adds the driver, patch 3 adds the
node to the board.

Why one driver
--------------

The automated review of v2 asked for the hwmon part to become an
auxiliary driver under drivers/hwmon/. The hwmon channels, the LED and
the input device all sit behind one command mailbox and one interrupt,
so the driver stays in one file, like huawei-gaokun-ec,
lenovo-thinkpad-t14s and qcom-hamoa-ec next to it. It is documented
under Documentation/ABI only.

Notes
-----

Fan speed is reported but not controlled, deliberately - the EC enforces no
thermal floor over a manual setpoint. Patch 2 has the measurement.

Tested on a Lenovo Yoga Slim 7x Gen 11 (DMI 83QR, "Yoga Slim 7 14Q8Y11").

Changes in v6:
- Patch 2: style fixes from Ilpo's review. fn_lock_show() now checks the
  read error inside the scoped_guard() block, and lines are no longer
  wrapped where they fit in 100 columns. To keep one line short, the
  probe error "adapter does not support SMBus block transfers" now reads
  "adapter lacks SMBus block transfers".
- Patch 2: the Kconfig help also mentions Fn-lock and the hotkeys, and
  the commit message says the driver exposes the thermistors it finds at
  probe.
- Link to v5: https://lore.kernel.org/all/20261003202143.4697-1-okerixx@gmail.com/

Changes in v5:
- Patch 2: drop the battery cell voltages. They live in an EC bank shared
  with other EC activity, and 43-79% of reads failed the signature check
  across runs; retries, a cache and a stale window only hid that.
- Patch 2: fn_lock had the polarity inverted: 1 left the multimedia keys
  primary and the Fn-lock LED off. SCUK bit 7 selects the multimedia keys
  and bit 5 turns the LED off, as the vendor ACPI FNUS method reports it;
  1 now means F1..F12, as documented and as in ideapad-laptop.
- Patch 2: FIELD_MODIFY() for the backlight level; notify fn_lock when
  the EC toggles it on Fn+Esc; Kconfig help updated; the ABI entry dated
  October 2026 for 7.5.
- Patch 3: pick up Reviewed-by from Konrad and Abel.
- Link to v4: https://lore.kernel.org/all/20260922165737.260443-1-okerixx@gmail.com/

Changes in v4:
- Patch 2, after Ilpo's review: the missing includes added where the
  symbols are used; the cache and stale periods defined in milliseconds
  with the unit in the name and converted to jiffies at the call;
  lockdep_assert_held() in the command path every EC access goes
  through; each EC read checked right after the call; ARRAY_SIZE() for
  the cell loop; MILLIDEGREE_PER_DEGREE from units.h; braces on the
  multi-line returns; the ABI entry dated September 2026 for 7.4.
- Patch 2: the i2c id was 20 characters, the size of i2c_device_id.name,
  leaving no room for the terminator; now "slim7x-gen11-ec".
- Patch 2: symbol prefix renamed from yoga_ec to slim7x11_ec, naming the
  machine like the driver does. No user-visible name changes.
- Link to v3: https://lore.kernel.org/all/20260921144953.15113-1-okerixx@gmail.com/

Changes in v3:
- Add the board DT node as patch 3. It was posted on its own [1], and a
  node cannot be merged before its binding (Konrad).
- Add the "Why one driver" section above.
- Patch 2: name the driver after the module, and the i2c id after the
  compatible.
- Patch 2: spell out both SCUK bits the Fn-lock toggle moves instead of
  the 0xa0/0x5f masks.
- Patch 2: return -ENODATA for a thermistor reading of 0, as probe already
  treats 0 as "not fitted".
- Patch 2: ten tries for a cell-voltage sample instead of thirty.
- Patch 2: include what is used directly, devm_mutex_init(), comment the
  mutex, fix the address in MODULE_AUTHOR, say in the commit message that
  results cannot be matched to commands.
- Link to v2: https://lore.kernel.org/all/20260908183403.2107-1-okerixx@gmail.com/

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

[1] https://lore.kernel.org/all/20260914082950.9393-1-okerixx@gmail.com/

Oleg Keri (3):
  dt-bindings: embedded-controller: add Lenovo Yoga Slim 7x Gen 11 EC
  platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver
  arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded
    controller

 .../sysfs-driver-lenovo-yoga-slim7x-gen11-ec  |  22 +
 .../lenovo,yoga-slim7x-gen11-ec.yaml          |  56 ++
 MAINTAINERS                                   |   8 +
 .../dts/qcom/glymur-lenovo-yoga-slim7x.dts    |  12 +-
 drivers/platform/arm64/Kconfig                |  24 +
 drivers/platform/arm64/Makefile               |   1 +
 .../arm64/lenovo-yoga-slim7x-gen11-ec.c       | 530 ++++++++++++++++++
 7 files changed, 651 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
 create mode 100644 drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c


base-commit: 1fffefb00cc0b0da1f2ae24e3d33364530ea6515
-- 
2.55.0

