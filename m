Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628D1547071
	for <linux-hwmon@vger.kernel.org>; Sat,  3 Oct 2026 20:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058917; cv=none; b=V6UUjd++GIO9QLb9/w8wmcM5i90HJd4PPEUIKIQ24Xdw/E/FOQ+w6Sqsi9vmcAQEsWhnjPblu1nBzBNQXnBea/oP3kcji/8dwToRGjTmZ4/kDf2ozu/Nn9nVq5vyLaRpDQ1zqw+BFEXJmfkuW78Yj6tfGE3QSfwjTrda1TTVlkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058917; c=relaxed/simple;
	bh=2u34eksTJWhirfi4M5VyDEfsUceCwd7uw1Xs3JVyAls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KCQcQ1uq4AwEJbw3d9DGpFK161SUyJIxO3H+3A16odpDubShNgoHwORcEqLjmxVlV++FEBYYQiw+lpdRcUPAbyzlDWBBHDUw+dCZMVlBmC/Cl4MeIhSR5WFL9Lp8kWyIXoapY7Us+7qwG3NRK5L2q9bT+kBFUjc2IE/UIpbyg4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKfEU408; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKfEU408"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b0fc598f8so286137f8f.2
        for <linux-hwmon@vger.kernel.org>; Sat, 03 Oct 2026 13:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791058914; x=1791663714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C75l2wsXWFqHqj6w9JaZEjjSQbkyybpKUQfglyD3Zx0=;
        b=mKfEU408/R4DQSr3VCjM6QQXSSJwVHffiYXis2+lY/1tniotMiUiAmH14YG4yJRfqR
         yC8OCyWxQprr2RlXdyhOdF6Q2A/qWXnjZQXQOOOdWbzjtPQGaji5fW2ZQXzglCrMibig
         b1rQEIxHVLdxLllUGECEbObYSKuF3qXHSH64JFNWr0N6yhSp8GtbP0T4NgBMkjryxH3/
         ncqBznGkC7vR2wcN/0xIs6cPF4s7NmvbKtad+XFJhP2GNlDn7JDpaucf1gec1BrIho1m
         1k21WqO7ta7ECKB+ukoq5YPcDrNW6yEZ6JuUb9lf4desHXdbndYlwcgxLIWgbeFSp6aN
         SmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791058914; x=1791663714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C75l2wsXWFqHqj6w9JaZEjjSQbkyybpKUQfglyD3Zx0=;
        b=r0x5jyL91jBBnzhNn4V14KVgAEptP1ni13NcMAPpH6a6mPoUXFP0jrg8GGnYmSjvr5
         hQ6qOf/T1511H0tlrF6Ks1Hq2hTP2DNrGcHg0GqD7i0izz7XkrZ/qTQAb+z1pku5pat4
         m7/hM9xCPwPkk/ymLRpHHYSn0Sn4jSR3r7+23R6YO4lih7N9XmqI8aY60PhCnd2x+YCJ
         XZr97o07EFx+g8Sz3X5iMBaH56zSEDGP0K6lJJJFR3VmofAdeWuf5HCjVOGlECwmZgcb
         I8jIs6PoEBBJjJGp4TofBKD6Y1ZD1vYO8A2bD+iVSzWVRGtSf/+zXeEE6+UJNkKXEZS3
         t6dQ==
X-Forwarded-Encrypted: i=1; AKwUvByifPpxF+qyQkx1PpyBAB2nsOrB1TUIuwioTlgDhdwE7CVkgE5tIBes5NB/iVbi06tIkiUckGmupy5PXw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIq9OYd1OtMXE+XfZjTISfYkMdMLqMpz5Wf0unKAfmS0PLqCRPs
	56C84TeC3zrKNOoRT1lYVw4f4SfQRxPjRblFM8LXQsIbJ4cM0w/v3ZLz
X-Gm-Gg: AYBFou39l9XSdlTocwumpMCVqkBMXft/CFHVk8CaBV9PVOJ69DMYXYFo/d9SPlp55pA
	EPqX/tGUXNENLH/6Xknbjb0X1jtkn7MTCQOBjiQOgLTViygpKvNQ1NtKiX8XjYAPlcjomOICXew
	3kEN/8XLLQdMsRZQN8DY8FRwRmtCSGJxtEQIYIDUsErRZLvRL8HhRrz7hwakrOagwjMuYSuIRkq
	O/Vi+g/Xu44wCTZY3INol2Ovx378hWjmRwMA1nKiOUnHcRKt5kWVRDJcCnEZt9rsz693OPD/Kzt
	3eVq0RT9GFIJ3KkNgW+j3d2Fac85kHTzgAksJf3agmNxl3K6B8d61TboMCSOxIrByYNM5JCZjuc
	WwkrGYEbv371wvK6itNpdk6tdtEqILB5iaRoC7Hb62jylrs76wazmutfvPytAaulFU8cCGh1GlJ
	E076tBYlJxxGE637WxdEfM25iGb3nRHC7qWlZTHpGeeZ+E5RNY3VM47/Eq7HJVB2dlKPi6zPgd3
	MydOPF6EClgpJ5z
X-Received: by 2002:a05:6000:4905:b0:48c:50db:30bb with SMTP id ffacd0b85a97d-48c50db37b2mr1760785f8f.26.1791058913464;
        Sat, 03 Oct 2026 13:21:53 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48b380facfesm15083316f8f.23.2026.10.03.13.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 13:21:52 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v5 0/3] platform/arm64: Lenovo Yoga Slim 7x Gen 11 embedded controller
Date: Sat,  3 Oct 2026 22:21:40 +0200
Message-ID: <20261003202143.4697-1-okerixx@gmail.com>
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
 drivers/platform/arm64/Kconfig                |  23 +
 drivers/platform/arm64/Makefile               |   1 +
 .../arm64/lenovo-yoga-slim7x-gen11-ec.c       | 547 ++++++++++++++++++
 7 files changed, 667 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
 create mode 100644 drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c


base-commit: f0406245cb9855e6318335a8a223551354291a46
-- 
2.55.0

