Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD47556B856
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 16:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096271; cv=none; b=lzqXAQhxbfZEu8hZeRgU9i+gqtWcV4cmUWbrOZgXbfsMrGUsSV0XyWUTz4jxw8RihBDNKmAoXrv0yPNyT+JQKF8bhNkERu6y8KBBRrnhVsudmbk7sWDXopU/S4ZxE73z7i4CBIWMCpvctJJCKuxURCHUSbkwKJTqz5vQ3Fo8opg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096271; c=relaxed/simple;
	bh=Opaa4qHTu1RKoFEExt76ZG9DA7XfTBlmgdj8DMxvDi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YlC9atEk5kbOcRXMrJumnp8aG8WckBo6IgfhzJR38aUVyEKkQUXkHUuF/gq3LHsm38sn7IX/XGrpLfggMg4hTHBNPAPdi6sB+B7uguU2bDoWiqcoT82xryxbLBWhUsoE7pfFbYlP8CGIb7IrRvxgo6y3puJUY2QYmzqxG+b/Seg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnEiaZxY; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnEiaZxY"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso13425e9.2
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Sep 2026 09:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790096267; x=1790701067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p3ag/oHbtIM6+V/aikFJfaAMmVWKBVeRaNNTxQrHoig=;
        b=CnEiaZxYlCcFKrue00aSvhPWtB/d7nqxEZpWgsQctLGEZBQNgA/pNYVavt1KZ/u7ul
         OS0/uyDX7uPaEIiiUKEIom14Hih7nFp063qxKTXlXufzl9IWjrWLRCONAxJ4F60kX5TP
         r35sj4dmtn5eNbebrSWYu12v1Kd9zkJZu6Iey6UYQP84l7SeYB9iDOYANua28a+WzlhZ
         emur1YpEi775qTinH8wyEoBR+oPAQxocysyy+uUKXnQDOwH0n+WNOuYKeIgH/xQVa6hq
         DAvR57FZ2lKpW/CqDu6FsyEA1QvC8aDC1yfrpcO2IXKvd4FRxXALyED4LWy0Rc2gKgu9
         gIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096267; x=1790701067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3ag/oHbtIM6+V/aikFJfaAMmVWKBVeRaNNTxQrHoig=;
        b=bbbot0+f0lNHSSAPVGiiRlCSAvWhbIKIdo1NABicFXVj0S8WbR/u7iMB7L4OQmoSjr
         uJopq3Psb0AtKoqsIFPcP2BKP/ZgQUQIcSF56+HxSjer7IZsXIr/9rKc5kgtV4j5ID1V
         IQv+0g+CxOUw0/017HF4k3fzG0efGE2cJzQCrEttxc/HyfgriHBSMc2F65A+Axv5joH1
         opxtfQY802uEDgArQDYDdBlD1EbU77RaI+m0Vr5yluCP2yiggbOCAcJPIxXP50GPsLiF
         FGBXyHTwNg9225v2Go9+KRRvbqva8CYi4wUGezT1yvIOe4Bn77YUKmGgRxxqL7LiOffD
         WkcA==
X-Forwarded-Encrypted: i=1; AKwUvBxPQdT2a6i/RJT7/Y+3Op00gJCOND7LHLWPRmB/Hzt3Ntrgpnm4egKj8acHR3aWywU5H47g4GGvgvrGqQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nFFBRYCeOUwlAdIIX9ljQuW/5ZspZeKaIW+SUkukoT9+dpZwMT
	do8jhPWY+PqOVlf5ZDsTV7RyLE/dS7dvcktD7PXDp3ouxC3BxIzsj+UD
X-Gm-Gg: AYBFou0URRHg9nPruK/oGwa94mSdcLEbjJ45f3uhnlswP+0vrN+mtn/xS78Tf+rl8E4
	FI7khbHNzLDs1KEdjgrvJfsbeOYenIXFyaor1qyruDzq8vPb3k3xS+6vuj+6sEITokj1WS7Df37
	rftakzAcqn5iTAndDgQniVqr9iziMuuST4aIBm+NMABZux7uy6puY3i6tZ8qQaGMktBWPa926Tn
	vGVOns1dtNlwn9jYm6ABb84SPFXcgsTdHz2GrYdBBnFq/Y/HMuAmlweRLm/sLdc8gjjiaWdrp8Z
	RoOsIrab0cvxeU/xko38ciQ3bNubttPZn+ecN9f/G48GemIWTDle4bmLuapmqncgH2+zD16dwU+
	XXyXsfZthqr9IFK8AAuIO9E5ysjMop4cggPyC72Ak/2q78HOjZHyLyeTrrf6YuCNkYG0enBKYZm
	caVTKroaxL/FXHT+mM2B4UczDVDrIj7mKVD9XnKemJrRlof3+uZFsGoKPja8Fyo+iG4YKiI7gNh
	gPTBTHq
X-Received: by 2002:a05:600c:3493:b0:49f:bd3c:bc21 with SMTP id 5b1f17b1804b1-49fc573b55emr199224285e9.28.1790096266769;
        Tue, 22 Sep 2026 09:57:46 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fdabe8a2asm68693625e9.4.2026.09.22.09.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:57:46 -0700 (PDT)
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
Subject: [PATCH v4 0/3] platform/arm64: Lenovo Yoga Slim 7x Gen 11 embedded controller
Date: Tue, 22 Sep 2026 18:57:34 +0200
Message-ID: <20260922165737.260443-1-okerixx@gmail.com>
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
  arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller

 .../sysfs-driver-lenovo-yoga-slim7x-gen11-ec       |  21 +
 .../lenovo,yoga-slim7x-gen11-ec.yaml               |  56 ++
 MAINTAINERS                                        |   8 +
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    |  12 +-
 drivers/platform/arm64/Kconfig                     |  23 +
 drivers/platform/arm64/Makefile                    |   1 +
 .../platform/arm64/lenovo-yoga-slim7x-gen11-ec.c   | 671 +++++++++++++++++++++
 7 files changed, 790 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
 create mode 100644 drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c

-- 
2.55.0
