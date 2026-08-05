Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47303ECBD2
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 08:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785919971; cv=none; b=PcB3ccjvfS9hmtjIWSJjFVdUgjTHadnu8KeHteYIbGfF7QPaBFdBbQtZRgYNynkKFrs3D0ywTRVaw0wfVCWAhEDdlXR2S1Ut7ES5y77h5arAk1dzX8znfm25UqY3W4yCFmW6HJDaJzrLJhpf0WukaUjphuFNek05GsA5I7zXJLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785919971; c=relaxed/simple;
	bh=ti+K/qbCna4x73H0nCznzAUBC54xgxZKhZFl+GDk1OU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=loHfaFyUs1bVI76MIJSmIs9b0Dh9rSc+lFpoxKKOLd35kg+xFK5GuVJA28cdFxcIL4T9oQ+liZxw7vQTNbvxa8WBI7KzPvKk7AT9Djnh3Bs8DJOnFNrCNmbW99TeAy9jzBN9MlI66SqzNMr0MtZFDtUQtcHp1FksOkSIjXxeSZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GYNze0Ra; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GYNze0Ra"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785919957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tscwLloeuHeKikv6fxJbnoM9flEfp8SS4g24wd5euO8=;
	b=GYNze0RahhxKiAKCnWOf5DUhFtL4MN1/rXEkFj4CpwYvjAtpGWHtosDWYTuhlPx0mhGmxS
	tDrTF3vgFyJz7SDTfJl+sVy1jhQyvKOypS5i7QHbfBvf361zVDr4ZUCGXgqVtS0I2y9V06
	stwlVOjSOnkrL4feWV2TDFW0hy0ByX4=
From: Troy Mitchell <troy.mitchell@linux.dev>
Subject: [PATCH v3 0/6] hwmon: (lm63) Add Sensylink CTF2301 support
Date: Wed, 05 Aug 2026 01:52:14 -0700
Message-Id: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WMwQqDMBAFf0VybkqyiUZ76n+UHjRu6oKoJDZYx
 H9vFEoLPc7jzawsoCcM7JKtzGOkQOOQQJ0yZrt6eCCnNjEDAbmoZMHt3IMSkgsti0YYZaEULL0
 nj46Wo3S7J+4ozKN/HeEo9/W/EVOGVwaNLbUDq821p+G5nFuMbG9E+HiFMCC/HiQPXe4apaE0U
 P9627a9ASv2mTHWAAAA
X-Change-ID: 20250916-ctl2301-0416b073c280
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=6020;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=ti+K/qbCna4x73H0nCznzAUBC54xgxZKhZFl+GDk1OU=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlFPw+uYPNY+yps5fcU89ayj+5WF92dPyXN7qt+EVfTX
 Lj+/INHHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABOJ0mNkmBsqECB8ZVLBj74C
 pXWH5n3ecmja8alPchfejvCeLjkhxo6RYUu2y83Cr8e3ya9danf4g5aX+hyfwIkWMzezLrytuPZ
 jACMA
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-Migadu-Flow: FLOW_OUT

Sensylink CTF2301 is a system-level thermal management solution chip.

The CTF2301 is an I2C/SMBus compatible device featuring:
  - One local temperature sensor with +/-0.5 degree C accuracy and
    0.0625 degree C resolution.
  - One remote temperature sensor for external diode-connected
    transistors, offering +/-1 degree C accuracy and 0.125 degree C
    resolution (temperature range: -40 degree C to +125 degree C).
  - An integrated PWM fan controller capable of operating in two modes:
      1. Direct-DCY: Open-loop direct duty cycle control.
      2. Auto-Temp: Closed-loop automatic fan speed control based on
         measured temperature.
  - A 1-channel fan speed monitor (TACH input) for RPM measurement.

As Guenter pointed out on v1, the CTF2301 register map is a near match
for the LM63/LM96163 family (local and remote temperature, tachometer and
PWM fan control), so this version drops the standalone ctf2301 driver
and instead adds CTF2301 as a new chip type in the existing lm63 driver.
This reuses the shared temperature, limit, alarm and PWM handling instead
of duplicating it.

The CTF2301-specific differences are handled on top of lm63: 12-bit local
temperature input and high-limit values, nine conversion rates, 12
fan-control lookup table entries, and optional 22.5 kHz high-resolution
PWM. When no IRQ is described, the shared ALERT/TACH pin is configured as
a tachometer input. The LM63 family can also register as a thermal cooling
device when the device tree provides the #cooling-cells property.

The required SpacemiT I2C controller clock series has been merged but is
not yet included in an rc release:
https://lore.kernel.org/all/20260508-k1-i2c-ilcr-v7-0-8c2dde5c3ed5@linux.spacemit.com/

Apply that series before testing this series on K3. Without it, the I2C
controller cannot generate an accurate 400 kHz SCL clock and CTF2301
accesses may fail.

Tested on a SpacemiT K3 CoM260 by booting an initramfs and verifying the
CTF2301 probe. Temperature, tachometer, PWM, and conversion-rate behavior
were checked against direct I2C register accesses and the datasheet.

Datasheet:
https://www.sensylink.com/upload/1/net.sensylink.portal/1689557281035.pdf

Register description:
https://github.com/TroyMitchell911/ctf2301-datasheet

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
Changes in v3:
- Add the Sensylink website link to the vendor-prefix commit.
- Preserve the optional interrupt from the trivial-devices binding.
- Explain in the commit message of patch 3/6 why CTF2301 cannot use
  national,lm63 as a fallback compatible.
- Check both bytes of CTF2301 local temperature values before caching them.
- Use the schema-valid 25 mA drive strength for the K3 I2C6 pins.
- Link to v2: https://patch.msgid.link/20260721-ctl2301-v2-0-ef5fb342872a@linux.dev

Changes in v2:
- Replace the standalone CTF2301 driver with a new lm63 chip type, as
  suggested by Guenter, reusing the existing temperature, limit, alarm,
  tachometer, PWM, and automatic fan-control paths.
- Add the temperature thresholds, alarms, and automatic fan-control lookup
  table support which were missing from the v1 driver.
- Handle CTF2301-specific 12-bit local temperature values, nine conversion
  rates, 12 lookup table entries, shared ALERT/TACH pin, and optional
  22.5 kHz high-resolution PWM.
- Propagate SMBus failures from lm63 initialization and write paths.
- Add optional thermal cooling-device support for the LM63 family using
  the existing manual PWM control path.
- Move the National LM63-family compatibles from trivial-devices.yaml to a
  dedicated binding which permits #cooling-cells.
- Add CTF2301 to the LM63-family binding instead of keeping the standalone
  schema from v1. Do not declare #cooling-cells on K3 CoM260 yet because
  the board has no thermal consumer.
- Fix the binding errors reported by Rob by using a plain compatible string
  and wrapping the description.
- Document CTF2301 support in the lm63 hwmon documentation and provide the
  detailed register description used for review.
- Add the K3 CoM260 I2C6 pinctrl state and CTF2301 device node for hardware
  testing.
- Link to v1: https://lore.kernel.org/r/20250916-ctl2301-v1-0-97e7c84f2c47@linux.dev

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Yixun Lan <dlan@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev
Cc: linux-doc@vger.kernel.org

---
Troy Mitchell (6):
      dt-bindings: vendor-prefixes: Add Sensylink
      dt-bindings: hwmon: Move LM63 family to a dedicated binding
      dt-bindings: hwmon: Add Sensylink CTF2301
      hwmon: (lm63) Add Sensylink CTF2301 support
      riscv: dts: spacemit: Add K3 I2C6 pinctrl state
      riscv: dts: spacemit: Add CTF2301 on K3 CoM260

 .../devicetree/bindings/hwmon/national,lm63.yaml   |  55 +++
 .../devicetree/bindings/trivial-devices.yaml       |   6 -
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/lm63.rst                       |  22 ++
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi        |  19 +
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       |  11 +
 drivers/hwmon/Kconfig                              |   8 +-
 drivers/hwmon/lm63.c                               | 414 +++++++++++++++++----
 8 files changed, 453 insertions(+), 84 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20250916-ctl2301-0416b073c280

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.dev>

