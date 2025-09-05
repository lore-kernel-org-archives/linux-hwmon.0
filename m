Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F032C21CC;
	Fri,  5 Sep 2025 20:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104926; cv=none; b=si9VSKkGcwAmpfB2rHVwGRH6T4iOu4qqnjIcKBU22L3zGtFkB3h7RT23IPuqVlv0xGtU/IIMLPMKJxP+QqM+PI1CW5h5TFpR/elcb8jNnWGurfWkuveRwKSkmrNuTTWjaCB1MJODMBOKfI7f454kD6/83F9GfglsG14aAgRjT3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104926; c=relaxed/simple;
	bh=RiE7HLi/8RW22tofvOPOTX9C4LGz1djq7/onXpwcZCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hV4NbISLOi/GqVz+1eRd/RzVhr5+kpMZRIVFSVR/dQlYh4R/yQjI9aK9aHs0VvzT6Cl5HeWmFF00gy4CpQ5n2GMoD3EIOiFugvEH0sGgR6ZnFhT6HXGCK3SKx3jJ4gkmCP+q73TfMU7IQDtl43pl2qTO6kLg3Bps1Kp0lauDdew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rxsg8rlT; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rxsg8rlT"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-244582738b5so21457585ad.3;
        Fri, 05 Sep 2025 13:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104924; x=1757709724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KPl/v81/2aCB4pYYcsFWua/LKBvxlFxYIc233gl3uqc=;
        b=Rxsg8rlTQWvjugFN+4RKMQxXExVjoi5Z5nODNEx5I5Hx7Bhm0vJCJUX/Fi11GplBih
         douQ8sJ7f/InMaqCct08SmYXke+Gf4S8STIXaEKbDotKjsSsbHiuyfWVG81AS1N4rUoo
         R+ui2PGnJPcZzQIaF4OUGo3qIC8rBrpInbfXPoKsOhYoQw10pgziVFMg6ECS+ddzkQsp
         C1pSjp2oaEBtigwr5nn7ObzPgg7JXNOePHB+vxJHGdfRDJj4psbF57IltQ6HwsHLCHzr
         NA0vrmCIG1qlk2gyVq3mzQ0r3DSAgh/N4LRDe8w0t/6jnGe7gFVe/Pw2WdxFubS5gXcD
         m7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104924; x=1757709724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPl/v81/2aCB4pYYcsFWua/LKBvxlFxYIc233gl3uqc=;
        b=MZJRmqVJT1JlX3YnochKg2YCvXA3MsgRjNl0/KpZH0DYVT1FIFD5WCTVN2v4ROym5L
         mzJuGsk/KKegttnIjRZGpIQ6p5wqhxFPuPrSWmvrDE9z8lWhP5a5nCvVUDai9GTyDQPD
         nD5joBq6TUNa0SAc1NvjS3z5dURSzWE2jiPUOJUgBgF3yJNXEC8eY19owQrfibDfPOiR
         2tuVL5YwLUZowMNYh/O1oLLLwt1kEhP5idDhs717YGCxk5/B3drnRo5LEKmUyR6F1sVb
         +FSxKkrcF5oQmZHMfTxc+tpcDANkbUo6HyGpAIaQ0oEcrL8ZiIjCuZqf36OPo1HLxW+B
         7r9g==
X-Forwarded-Encrypted: i=1; AJvYcCXYGZSxHbmZNTVbJj7QkC6HzY9dTC1avGvfDlmEuq9eNBrl916keGFL57ckU3cejyUipQj6KkXfWrCH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3fxaHqrdXhZ2eziNejnuPaev8h+qE16q/6hxXn1xbZyxx/urR
	NLSvy0ASgy90E/vLSkMq1mdcI8agfmKjZ3H+rGR2Cdi1JB6zB7ru62bX/1X5ybSW
X-Gm-Gg: ASbGnct9CE9DSB1g60X9jr61SPwucWe0CfrSUOyMuukYmyS2rsL2tt8FP6PUeb7cAOB
	99QjnR4nSFX2Do/2q4p7biJlCbcF66a+/4ZWCWy0wr2MG0qh2OVCEMoyeqlkB4Gjre6okLpH39L
	YTJr8An7pPrcjNcZyVoTjOuhQWGb9j1f8lScpJyj6tGUlzn78/GGObMNr0nvmh4q/l0m/G3hZY1
	fo9YyQHnD9F9PsUxt9LyN2NIgQ9RrOTbRfvA+zRJWl6b3H3nRW4QJAEhleF5P5maFA0A9yxjV/0
	sQBL9NfhUqR9XahUH+9NL0qqj2rTD4zOdAYzdud0k/X2uYN9Sbyb7Acn16ZVPb71OvikBzLmyi8
	Rajw8lo/36pSAFNjJgfzr46Kw0v0h5QJD1fAncQH5upvDSw==
X-Google-Smtp-Source: AGHT+IEKksGNlM8tPa5Uv9e4ksFW2MvNzaItBOh8gqkSROjktbquvsoUB7BQwg+3LKCidQYhVqzlwQ==
X-Received: by 2002:a17:903:32d0:b0:24c:b39f:baaa with SMTP id d9443c01a7336-25174ffb236mr136835ad.49.1757104923523;
        Fri, 05 Sep 2025 13:42:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c8e94b34esm80184475ad.94.2025.09.05.13.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:42:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Christian Kahr <christian.kahr@sie.at>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 00/17] hwmon: (ina238) Various improvements and added chip support
Date: Fri,  5 Sep 2025 13:41:42 -0700
Message-ID: <20250905204159.2618403-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for INA700 and INA780 to the ina238 driver.

To prepare for this, implement various improvements.

- Update documention and Kconfig entry to list all supported chips.

- Drop platform data support. The driver supports device properties,
  and there are no in-tree platform data users.

- Stop checking the attribute value when writing the power_max attribute
  as unnecessary.

- Simplify temperature calculations. Instead of shift and lsb, only
  require the resulution and use it to calculate temperatures.

- Pre-calculate voltage, current, power and energy LSB. The values don't
  change during runtime and can therefore be pre-calculated. Also use the
  equations provided in the dataasheets to calculate power and energy
  LSB from the current LSB instead of calculating it from scratch.

- Use ROUND_CLOSEST operations instead of divide operations to reduce
  rounding errors.

- Improve current dynamic range by matching shunt voltage and current
  register values. With that, the dynamic range is always the full 16 bit
  provided by the ADC.

- Stop using the shunt voltage register. With shunt and current register
  values now always matching, it is unnecessary to read both.

- Provide current limits from shunt voltage limit registers. After all,
  there is no difference for the ADC, so the shunt voltage limits translate
  into current limits.

- Order chip information alphabetically. No functional change, it just
  simplifies adding support for new chips.

- Add 64-bit energy attribute support to the hwmon core.

- Use the hwmon core to report 64-bit energy values.

- Add support for active-high alert polarity

- Limit shunt and calibration register writes to chips requiring/supporting
  it.

- Add support for INA700 and INA780. Both chips have internal shunt
  resistors and do not explicitly report the shunt voltage.

This patch series was inspired by Chris Packham's initial patch set of a
new INA780 driver, by his subsequent patch set adding support for that chip
to the ina238 driver, and by Christian Kahr's submission of a new INA700
driver.

The series was tested with INA228, INA237, INA238, and INA780 evaluation
boards as well as with unit test code.

----------------------------------------------------------------
Guenter Roeck (17):
      hwmon: (ina238) Drop platform data support
      hwmon: (ina238) Update documentation and Kconfig entry
      hwmon: (ina238) Drop pointless power attribute check on attribute writes
      hwmon: (ina238) Rework and simplify temperature calculations
      hwmon: (ina238) Pre-calculate current, power, and energy LSB
      hwmon: (ina238) Simplify voltage register accesses
      hwmon: (ina238) Improve current dynamic range
      hwmon: (ina238) Stop using the shunt voltage register
      hwmon: (ina238) Add support for current limits
      hwmon: (ina238) Order chip information alphabetically
      hwmon: Introduce 64-bit energy attribute support
      hwmon: (ina238) Use the energy64 attribute type to report the energy
      hwmon: (ina238) Support active-high alert polarity
      hwmon: (ina238) Only configure calibration and shunt registers if needed
      hwmon: (ina238) Add support for INA780
      dt-bindings: hwmon: ti,ina2xx: Add INA700
      hwmon: (ina238) Add support for INA700

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml       |   4 +
 Documentation/hwmon/hwmon-kernel-api.rst           |   3 +
 Documentation/hwmon/ina238.rst                     |  64 ++-
 drivers/hwmon/Kconfig                              |   9 +-
 drivers/hwmon/hwmon.c                              |  16 +-
 drivers/hwmon/ina238.c                             | 583 +++++++++++----------
 include/linux/hwmon.h                              |   1 +
 include/trace/events/hwmon.h                       |  10 +-
 8 files changed, 382 insertions(+), 308 deletions(-)
