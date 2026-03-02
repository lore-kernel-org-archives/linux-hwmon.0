Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D4035CB64
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 10:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448974; cv=none; b=GoIxq8g0/YJxf1plBWZknYjkXtobugdHMdDWFVzhPf5/w3MEQ3vXou7iRKUVE0wOB0umMPH4gvobgx6ji5oBvpKsD1IIW0noop6D05LVKY5PUGsyadQBr+iXjTPCPDHsPi80cmXHLNSnXaY15ndiOixyjl5uvtCRgvoWhuAUx54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448974; c=relaxed/simple;
	bh=4HSKZzGhBURWAag1eSLNRfotJ7fSctcWyvc0D54FZuI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CVSO8RyayL4CYZ1NtFSqqa+WCQcKSofLE1AMGWFkAgN3SZy3YTQB+8UckA9WqJWGRq7jPsmzTsqX8AhYUSCLZlcoKh8mWKHylk9YOHV5xLM/vrAh1KiswA6iLSNxHecROrFLNZui2jnHJz1P988rykoRyBUzvvnRTUyWAML/vMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=vMrOXNLw; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="vMrOXNLw"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439b5d78592so854033f8f.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 02:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1772448968; x=1773053768; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b/u8LOKf6Nlm4OlaRu+tmbKm1RfDAT6qwhKI1+hf3Ts=;
        b=vMrOXNLwmaOMICBSAEuSaAOCvPqiPLJ0xkn9wBxNlgbu20uY/2pkNvCBduE0v/iaH9
         iwk/wTDFEqCYA3/f6P9ygmQN7Es4SLIBE1wjCs5l9k2TFmACFihoZ8tvFYMPYFfkOST1
         C7JvK9HVjoIJOTiKvaBhW8FCn1FFDL6+36/Oxa6OBMMuUJ2Mpt7LRpcBxK3G5IzFLe8S
         6Gz+DPyOHu2p/KvspjNMtDXIZmXbB7bb6XRYKSpgSD9CiswMSfLqFF9mXZJ+2DRWIy5E
         WJGseIOpcFgkN/gixPqt+t6cYeajeMK45OfYdrf/t7I8A1lwbxTT7g/yPIKKmiSCYzQK
         Vr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772448968; x=1773053768;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/u8LOKf6Nlm4OlaRu+tmbKm1RfDAT6qwhKI1+hf3Ts=;
        b=gWmlsJrWK6YN1SnMCU8xJq+0R7vVoqNRIbAZcwGK/IKG6KXCeyyKfT1cPbe/985i+S
         DvfYWnObtWeh0eO6Zx720g0CAN+rlkqvayK5t0CLBzxuzsf4MiWE4yFbuwME7GNejQ0F
         yLfxzlRcDAOw9qGxmddxKDLoKihrlin7o61Etshie2EuEcl4L0+AlYGztvcKJP95fh9d
         cGQfx87lzUBalRVSju8kxr6iVCyh96dIH+GNWvicjUBHHMEQCW6YT15Sinu11v5b+Oev
         v9j9WwoxpKyC2ZuqtAyDlGliw+oIjPX9Vf/JwThT9zWgvYO3jN6y5WgKZcFWp/eX5jWX
         Q8pA==
X-Gm-Message-State: AOJu0YwdQ+0BNKZin/lnRq058qyGkb0v6G3Zs/9Exxdwf07xznJ6F9mF
	dWKhaguMRx8VFBw8Hp38sdY5qeP4fq/CHebn3xIgz9Md6lWSZa8OT1oOrBvxAHZiaLs=
X-Gm-Gg: ATEYQzyciOhtrnRi8FDCcPeGO0ednGdJ9k2USGTm9wHk0cKrFXgWquNz0SYCYDhZIRV
	Hu5YqOfGCwkPgK+bXiSKuPQaxpl9jtCcFgXw8o4iKzpN1G9vdg5M2d/NK03a1jdwl9UFe88vXfq
	9lnxmBWmsgN/WH5XkeUhzpuOXcw39o7b4IFdBg79MRjaxQNm/wE3oXIG480NqosLA9bmTksKo+6
	skNNCkQUu3dccSuUkusGe08Ny9wz05XZs54nCmw+HSAWOcRu1KD/IzFZqQ3r+JGWRicL1XEiuq6
	GFXOAqgVM7J5mlGDTJtfqtM6PT8E5NlZV2HL/opMngZQU+vYKI/Ic0Fpa8ucjb4nfp38Z7HyjM1
	Ng0HwaGrYpRhnJArbrtxEmqG1kZGCS1RT+3Lq1ermEWwnLctU/ySZM3bLCeGVJBmPEoyOMpnCz9
	WuY5oYmItjiDBSvgX/9sqPH3Egyk255HaNKHaZQzdkzDs1SwR4G4OCx7ZtC0iSpWs8QJiRMXq+2
	/g=
X-Received: by 2002:a05:600c:46cd:b0:483:702f:4633 with SMTP id 5b1f17b1804b1-483c9b9433bmr202932855e9.4.1772448968314;
        Mon, 02 Mar 2026 02:56:08 -0800 (PST)
Received: from alchark-surface.localdomain (bba-94-59-44-101.alshamil.net.ae. [94.59.44.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfccff00sm133263075e9.25.2026.03.02.02.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:56:08 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v2 0/2] Add support for Texas Instruments INA4230 power
 monitor
Date: Mon, 02 Mar 2026 14:55:54 +0400
Message-Id: <20260302-ina4230-v2-0-55b49d19d2ab@flipper.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALpspWkC/z3MQQrCMBCF4auUWRtJpmk1XXkP6SKaqR2QNCQlK
 CV3NxZx+T8e3waJIlOCodkgUubEi6+Bhwbus/UPEuxqA0rsJSoj2FuNrRQnbSVqaVTXOqjvEGn
 i1y5dx9ozp3WJ7x3O6rv+DOz+RlZCCoM35cicldP9ZXpyCBSPnlYYSykfKjU4eaAAAAA=
X-Change-ID: 20260219-ina4230-74a02409153d
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2422; i=alchark@flipper.net;
 h=from:subject:message-id; bh=4HSKZzGhBURWAag1eSLNRfotJ7fSctcWyvc0D54FZuI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQuzTlZocIoy6BXIjYnnVHlgaT2WYUH75zZhIo6efrMX
 h7Lu1HcMZGFQYyLwVJMkWXutyW2U434Zu3y8PgKM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFR/dmRkePZp010BxwKBp13p986fmFv6q6/F8pJofNt8T65lDRETbzH8FVgouCF
 xNYvT2nNBn/dHGP1tPqZYPmn3o6685WllbhW/mAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

TI INA4230 is a 4-channel power monitor with I2C interface, similar in
operation to INA3221 (3-channel) and INA219 (single-channel) but with
a different register layout, different alerting mechanism and slightly
different support for directly reading calculated current/power/energy
values (pre-multiplied by the device itself and needing only to be scaled
by the driver depending on its selected LSB unit values).

In this initial implementation, the driver supports reading voltage,
current, power and energy values, but does not yet support alerts, which
can be added separately if needed. Also the overflows during hardware
calculations are not yet handled, nor is the support for the device's
internal 32-bit energy counter reset.

An example device tree using this binding and driver is available at [1]
(not currently upstreamed, as the device in question is in engineering
phase and not yet publicly available)

[1] https://github.com/flipperdevices/flipper-linux-kernel/blob/flipper-devel/arch/arm64/boot/dts/rockchip/rk3576-flipper-one-rev-f0b0c1.dts

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Replace u64/u64 division with do_div() (kernel test robot)
- Add an example with ti,maximum-expected-current-microamp property in
  bindings (Krzysztof Kozlowski)
- Include the newly added binding in MAINTAINERS file (Krzysztof Kozlowski)
- Use dev_err_probe() where appropriate in the driver (Krzysztof Kozlowski)
- Switch to devm_regmap_field_bulk_alloc() instead of an open-coded loop
- Add a bounds check for the calculated calibration value,
  and a corresponding error message
- Link to v1: https://lore.kernel.org/r/20260225-ina4230-v1-0-92b1de981d46@flipper.net

---
Alexey Charkov (2):
      dt-bindings: hwmon: Add TI INA4230 4-channel I2C power monitor
      hwmon: Add support for TI INA4230 power monitor

 .../devicetree/bindings/hwmon/ti,ina4230.yaml      |  130 +++
 MAINTAINERS                                        |    7 +
 drivers/hwmon/Kconfig                              |   11 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/ina4230.c                            | 1006 ++++++++++++++++++++
 5 files changed, 1155 insertions(+)
---
base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
change-id: 20260219-ina4230-74a02409153d

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>

