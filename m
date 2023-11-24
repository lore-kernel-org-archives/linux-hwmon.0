Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF342C842;
	Fri, 24 Nov 2023 14:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pT2Q7tgx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7D20C433C8;
	Fri, 24 Nov 2023 14:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700835506;
	bh=uUJTbaCd7Vo6Sti9JdVroV1uYWkZ/cQnxQ94paZ9TME=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pT2Q7tgxVbcYaGHxeVSKIkLgWIoc68CzY+U4JjsobpYR1mhgMc242nmysD3dkhQsX
	 Cz7c2j8/7npn9sJNEmHjF5bjr6LKbnD2/yV6c3JhPNYq9j1nvq417bdSixKuBzT9yq
	 YyLUf4BogZcFrWjocKDCyHWlW2H0PIeUfoeDUb77hJ+HKa7fjAbLU1hYkiUpUeq27x
	 ROCU/Y5Jkrwj+QRDcD3LsuBtu5FmD4Vo0v/SL4iQWpk/TI2GbRXLSv+ElkKAIqyD+J
	 EUHRXo3azAK5wvPfgMqP8qC18m7bvSsX+fxEt+o9QEXP6sl4XwkOuBDnVYwjViW064
	 +IcpG4ScGbJJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9666AC61DF4;
	Fri, 24 Nov 2023 14:18:26 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH v2 0/2] Add support for LTC4282
Date: Fri, 24 Nov 2023 15:18:15 +0100
Message-Id: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKiwYGUC/03MQQ6DIBBA0auYWXcMA6LoqvdouiB0VBIFA9o0M
 d69pKsu3+L/EzInzxmG6oTEb599DAXyVoGbbZgY/asYpJCKSDa47K6RRmI+ti2mHY2jttOsSAs
 DpdoSj/7zOz6exWOKK+5zYvv3IUGaeqFranVvOoUKwxFine3dBrvEqXZxhev6AhJ3lvafAAAA
To: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700835504; l=3566;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=uUJTbaCd7Vo6Sti9JdVroV1uYWkZ/cQnxQ94paZ9TME=;
 b=H5MYSzpyc32lZ4hUJgkdgeMFQOSC4eZWgSewE5GQ47D4cIXnrBOpDcVJUCq5kGNyymx93rZRK
 3cSqwG1QrG4Cz28KoMtFZiVigFY29HP/QRzjGVMDvUXKyl4BeDO8QTd
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received:
 by B4 Relay for nuno.sa@analog.com/20231116 with auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: <nuno.sa@analog.com>

v1:
 * https://lore.kernel.org/linux-hwmon/20231110151905.1659873-1-nuno.sa@analog.com/

v2:
- driver
  * Add Docs to index.rst;
  * Removed ltc4282_power_on() - Not very reasonable to enable/disable
    an hot swap from the driver;
  * Removed struct device *dev parameter from struct ltc4282_state;
  * Error out for rsense-nano-ohms < 100;
  * Return 0 on .is_visible() - not a negative error;
  * Moved to 80 column limit (Sorry about this one - it adds a lot of
    unnecessary diffs);
  * Replace ENOTSUPP with EOPNOTSUPP;
  * Return 0 on .is_visible() - not a negative error;
  * Remove Power Average (Should be done in userspace) - With it, no
    need for handling energy + tick overflows;
  * Return 0 instead of 'ret' in ltc4282_read_energy();
  * Add adi prefix to 'vin-mode-microvolt';
  * Changed 'adi,current-limit-microvolt' to
    'adi,current-limit-sense-microvolt' so it's clear the device expects
     volts to be configured;
  * Moved fault logs to debugfs while adding a new interface to clear all
    faults in one write;
  * Keep historic alarms in ltc4282_read_alarm()
  * Cache energy status so we don't have to read it from the device on
    every energy value read;
  * Use enable attributes to switch between VDD - VSOURCE;
  * Support reset_history;
  * Sync with bindings - use strings properties;
  * Move to clock provider to support the clockout settings;
  * Support gpio valid_mask;
  * Use field_prep() instead of a driver specific macro (to be coherent
    with other drivers);
  * Add comment on the big sleep pos reset;
  * Be consistent in hex letters;
  * Use BIT() in the power formulas;
  * Make use of in_range();
  * Use SENSOR_DEVICE_ATTR_[RO|WO];
  * No comma for the terminator line;
  * Update ltc4282.rst doc.

- bindings
  * Use string properties for gpio_modes and over/under voltage dividers;
  * Added #clock-cells;
  * Add adi prefix to 'vin-mode-microvolt;
  * Changed adi,current-limit-microvolt -> adi,current-limit-sense-microvolt;
  * Updated the dts example accordingly.

V2 ended up with huge changes. Specially the introduction of the enabled
stuff between VSOURCE and VDD since these are mutaally exclusive (share
the same registers and we need to mux between one of them). It feels
that I'm overdoing things a bit but OTOH, I'm fairly happy with the
result. Hopefully, it is acceptable.

I would also like to mention that there are still some questionable
custom sysfs interfaces as I was not sure if I should remove them and
got not reply in v1 (which is fine).

Lastly, as one can see, there are lots of changes since v1 so I'm sorry
if I missed some of the comments given in review. Not on purpose... And
it would be really nice if one of the GPIO maintainers could look at the
GPIO stuff. Please see my V1 cover where I speak about it. I'm not
really sure I'm properly handling the pins.

---
Nuno Sa (2):
      dt-bindings: hwmon: Add LTC4282 bindings
      hwmon: ltc4282: add support for the LTC4282 chip

 .../devicetree/bindings/hwmon/adi,ltc4282.yaml     |  206 +++
 Documentation/hwmon/index.rst                      |    1 +
 Documentation/hwmon/ltc4282.rst                    |  108 ++
 MAINTAINERS                                        |    8 +
 drivers/hwmon/Kconfig                              |   11 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/ltc4282.c                            | 1891 ++++++++++++++++++++
 7 files changed, 2226 insertions(+)

Thanks!
- Nuno Sá

