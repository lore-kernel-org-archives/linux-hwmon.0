Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3872133DED9
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 19:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774555161; cv=none; b=IRCDyhzEBWgOt0EwadTanaZ0i1DHtddtOWMbpESwH4RYYsbiV9eu1IwsZCHmjAgBx1DsS8xFRCwTupTrvtyrNCvLZK7TZ7TE8Ps0gEqPS+mVtgkKfPAOfy8CDLxNvEZqn5Sq7lZPoZVc/bV2R1SOc3DyjN9L4OhjUotmKUNTUOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774555161; c=relaxed/simple;
	bh=8dEreTq+ClyahaXJ6jaZkn9ylJrISDINPNdiqWkJrGo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aC6sy0HmJcwlv0BSZLKh2xfuwiu31otAOWoB5lD3geXAtgk+lideL4ylo67m/nHW/j/lL0WCHdB6j1G27idrZXoR6gmk0C6VTj9O3fp8dsXTp9mhTvsxyO9DtSbI+fqL0yCU09398fivaf1q6466WgKS0DLLyfuO+MjFqgRtTaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=r6kr1aM6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="r6kr1aM6"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b7c2788dso844432f8f.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 12:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774555159; x=1775159959; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pyiyouDNO/j0IqzSw//lozm1XupWUO2SGUR/Oq71IO4=;
        b=r6kr1aM6uQ04qD71X+Fm7bBMK5bDExJnWnc702+hUGiRxq//5+A73rdNHRd0BJsg13
         j4hnAJkw+zTs6pWgdXuSiQCNO7zP73RxkbVFImJKAypITsoq51V9DOP7Non8GpBSoWe3
         Yg5fXSpd7bXNAzTHn0Dav9BmS2SjyDZdQHlANHb+KyyehbR84eW5QfWrf/YmH8vVVcRV
         zvw/SUGTdjKDiDVX3zyudzNBH8ZRJ11n7/3RSGx2l6ftVh5kveaBvm8snx0IOdniT3ed
         V5PBxWw2dnAF0lqTurf+f+CTnbLw8t5fi/VGNI90yU9DLkUVqDHCYhR53KC2k2oQld8w
         QAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774555159; x=1775159959;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyiyouDNO/j0IqzSw//lozm1XupWUO2SGUR/Oq71IO4=;
        b=bHB8Q/hbQtFXvAF9bGHeCy+rehRTXCTd27WvuFLF3q9PtBIMhTIOVd4TYbJmAhe+Zc
         CB3/S5INrEceixpRUd35piaf6GWWzEJKlX8qHtLDGFURWBiEWvw3OLNG7G+qxz8KlLMk
         kF14/fnLJOgSmLjqj8xzwxunmG5Cf4cmSPSJh4UlT0w9WIicEknLGFqKkbdAwGLe1O60
         uZs+isY1oiwGcFOhPs8jgp9uNOnR7ef7n67mcf6t4UF99r8u6h3DqlDIbwV4E6LJEIUp
         cvrFlAeCbVXDklxDcSyOAnwpl9swqyPxkjxgawzQfYjvJ5X+d8KETd5hVFd94le3qau5
         wrAg==
X-Gm-Message-State: AOJu0Ywht6xMTFcRbkhLdOnG/G1seBL06FYqWDZsckppClRCifaBt1gX
	jQMsoh1v3UdJR8+AxS3v0xfTYyQlHzKt/joyGfAuMXF1hGWkMy93pYb3qtffqQu0euk=
X-Gm-Gg: ATEYQzyWfUR3zIM5uN778U7Ihxbac8oTtIBzHieK10j5paoGUQ8Ty4nLCUy5MP2XkJi
	9W/tUjIR15Gs/XxCCGEBGmIzFt+W7wozfcnPfBGNuxMEzEyEXWcElL/fBFx77vkrZmnuAasHiTE
	agSD8uV8gYKzkx7mZ5NiUFWlmguYA+zsTD+hq4h/mkWKrzMA8HFHRPOAKhzPY0B03uFWc1cVASW
	1n0ZB522dwWMxSQIEFY95Ta1VjcGTWhNlN0KVMSRIWCafOyGZScybxZ4WoK1yuGlHTqtmO0FKAu
	4WQm8JhXpmCi5egtstd3v3C3n4qR4AhDJ3MvbxRe/mCuQ6yI3gkCbGN3+IYZpQ6P6wiYIc591Oj
	GOlh0ronAQjKrqF/rX3Rn0rBvEbnJyVVctJODlJsZ3mgheZqtVnwG9DI+yzSU5Rrz+PFysF9/xe
	9nn5bfaS4vCCbmu60wD8PdhmwBmNF2GDaVnFOxHOgEOLVaTfMocNK5tUswUZFCB1Wf9MjUTp/un
	zalcw==
X-Received: by 2002:a5d:5d0e:0:b0:439:ca9b:1f61 with SMTP id ffacd0b85a97d-43b889a4a1bmr13790147f8f.17.1774555158127;
        Thu, 26 Mar 2026 12:59:18 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df7dcsm11339012f8f.27.2026.03.26.12.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 12:59:17 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v4 0/2] Add support for Texas Instruments INA4230 power
 monitor
Date: Thu, 26 Mar 2026 23:58:59 +0400
Message-Id: <20260326-ina4230-v4-0-c1e312c09de7@flipper.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAOQxWkC/2XM0QrCIBTG8VcZXmccjzqzq94jutDpmhBr6JBi7
 N1zI1rR5Xc4v/9Eko/BJ3KsJhJ9Dinc+zLEriJNZ/qrp8GVTRCwBmSaht4I5ECVMIACNJPckfI
 9RN+Gx1o6X8ruQhrv8bmGM1uu7wbKTyMzClSjZc7rA3OiPrW3MAw+7ns/kqWScZMccJNYpJRWa
 Me0Q2P/Jf+SDDbJi4TaWG6UaqSCXznP8wv/o7edFAEAAA==
X-Change-ID: 20260219-ina4230-74a02409153d
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5538; i=alchark@flipper.net;
 h=from:subject:message-id; bh=8dEreTq+ClyahaXJ6jaZkn9ylJrISDINPNdiqWkJrGo=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQencAj6xXUey9psUKGesU3ln+XT5yIXrPaZfkuD96Hy
 9blVn5h6pjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DA11jHWMGLg4BWCqOXYz/I9j1DFPb9IO+SfjXhG4ruzyxoivp8+/OWKvv2ix8CeW07cYGe7JXPx
 3IGU645fA1EijU/bnt/Ovt+550GCo3KPIkr9jCTcA
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
Changes in v4:
- Aligned the maximum value of ti,maximum-expected-current-microamp property
  in the binding with the one expected by the driver (Guenter Roeck)
  "2147A ought to be enough for anybody (c)"
- Actually requested the optional vs-supply regulator in the driver (Guenter Roeck)
- Program the ALERT_POL bit according to the value of ti,alert-polarity-active-high
  even though the alerts themselves are not yet implemented (Guenter Roeck)
- Added a check for manually disabled channels in the is_enabled() function to
  avoid reading invalid data from them (Guenter Roeck)
- Dropped support for the single-shot mode as its operation is not clearly
  documented in the datasheet and there is no pressing need to support it (Guenter Roeck)
- NB: AI feedback regarding regmap_noinc_read() producing incorrect byte order on LE
  hosts is incorrect, as its implementation does a byte-wise read and doesn't care
  about the regmap value width or endianness flags, so it produces a 4-byte output
  buffer in the same byte order as the device returns, which is BE in this case
- NB: AI feedback regarding fail-path pm_runtime_put_noidle() potentially being
  unbalanced if the probe loop failed early is technically correct but practically
  irrelevant, as the driver will simply fail to load, and the usage count won't
  decrease beyond zero anyway. The alternatives are cumbersome for no real benefit
- Link to v3: https://lore.kernel.org/r/20260310-ina4230-v3-0-06ab3a77c570@flipper.net

Changes in v3:
- Updated the description of the ti,maximum-expected-current-microamp property
  in the binding to clarify how it is used, and drop the irrelevant mention of
  the PMbus (Guenter Roeck)
- Use div64_u64() instead of do_div() for the final division in the calibration value
  calculation to avoid overflows in the denominator (Guenter Roeck)
- Avoid overflow while scaling the voltage values on 32-bit platforms (Guenter Roeck)
- Use regmap_noinc_read() instead of regmap_raw_read() for reading the energy values
  to ensure that the regmap / bus driver don't wander off to adjacent registers
  during the read operation (on INA4230 the whole 32 bits should be read from
  the same register offset) (Guenter Roeck)
- Remove redundant call to ina4230_set_calibration() in the current read path,
  as the calibration value is already set when enabling the channel and restored
  across PM changes via regcache_sync() (Guenter Roeck)
- Add missing write_enable() function to make hwmon_in_enable writes work as
  advertised in is_visible() (Guenter Roeck)
- Add a check for disabled channels before calling pm_runtime_put_noidle() on them
  to avoid refcount underflow due to imbalanced get_sync/put_noidle calls (Guenter Roeck)
- Dropped unused include of linux/debugfs.h
- Add missing return checks on regmap_write() calls
- uO -> uOhm in the error message to avoid confusion
- Move probe-time calibration after enabling runtime PM to avoid it being reverted
  by the PM sync
- Link to v2: https://lore.kernel.org/r/20260302-ina4230-v2-0-55b49d19d2ab@flipper.net

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

 .../devicetree/bindings/hwmon/ti,ina4230.yaml      |  134 +++
 MAINTAINERS                                        |    7 +
 drivers/hwmon/Kconfig                              |   11 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/ina4230.c                            | 1032 ++++++++++++++++++++
 5 files changed, 1185 insertions(+)
---
base-commit: 66ba480978ce390e631e870b740a3406e3eb6b01
change-id: 20260219-ina4230-74a02409153d

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>

