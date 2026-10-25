Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792940403;
	b=RJM1bnRrqmO3gbWsKfi0gqX1VHoY9F3SDXzL3EQIg8JeLKKekdrLSNYo5l5fFeuDbfrX
	 rlvsxx0vqV5YtzLKp4AoMpHhR5OYtR8CTXtTn80OEVStJrkW98elElLBioPdXhpzLHKFm
	 6DCprm/uJzI4qKPisfvKrU97WfZsTEz0OHlZ7XGGrTmYMhQQMM9j/eBw8/X6yQ8a0tYZ+
	 kCWHlokm6tto7yAJxmWIhyQiGMEv1jVEl5ZRovVKj+BbMkEMbjnEN+USidsucbR/YOr9m
	 Bw2JuLjVsbGuRV8caFabtt0qWKRNiphPBoppnpqR3WsQWbylGAasS2mA+Q/WoVtXLGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792940403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CYlLTIUHrpkrhGiaBbh26oVfeR65PZ4aFDXOFX36wWo=;
	b=A9swhIuDshj3I1jyWPeMX1mnPGCbilE1EX38kq4xpj+8mHxcK0OguJHR+k3Qhm6Cr8K0
	 uGKG9dhrSNnpZK2bywOSoSK+N+89gqPAk96ZOGrdpMgWPRkX+gccuF3K4IdLbEDGMtikN
	 vleQI+//qB4P8/nhhb6YLXIEIYNrnBmqTkHpbmVGjRDomFd542oMWfcvDHssJsJQKryum
	 Z0umiOV0i9glUkPryWq5mSgbN5+wmhhsEIcxc6ON3RaYfiTz53xQWigi+dD2/7UZ4Nwl+
	 31kKRw5nmnvWrLGHka1j0GXCE5/vp3xR6FIVCvbwtV+NYIBwr6SZw2khu+G/hKnXFiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d90EF1mR;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18586606A321
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 15:00:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18586606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d90EF1mR
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9d7791b00so12949435ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 08:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792940402; x=1793545202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CYlLTIUHrpkrhGiaBbh26oVfeR65PZ4aFDXOFX36wWo=;
        b=d90EF1mR/kXPITjA8UFqr5F9aZGY/Fn+EEfLVJcNkrV8iqrJrilI85FkaOglauMGgB
         EKAy2oTirdroq3IgIBv+ISnxqN8AsFjyVCRZXyP4YCpFsuOlAvDJ+HHbsSxB01i8YFM3
         /4z9/oqyXzhyItqF5TOThkI7BFlIlk9y29hkMZq7xJX+UYp7h00x+Q02Z2w+zUkR6F0I
         swsMIs+PBU8rgBkFOmEnqf+A8vJ8Mpemsi5LBGttzTpyzW8KI+4LNH6YYmX5SfbzPkYi
         jLD+lzQ+uPhauj4xi0KK3jI+y/oJVDTdTzxIjmBHjXd5pMdVIwRC022K+AFP+ZjcFYNV
         KAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792940402; x=1793545202;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CYlLTIUHrpkrhGiaBbh26oVfeR65PZ4aFDXOFX36wWo=;
        b=lNYtWOotHW1tN/K9kWvqkIRhCpfaVzEYzU0skCdrwvnQfYOs59c6zU2+3QMdp1FQdy
         ERgsSgECu3w38rgunDiSwzwG6PgMAt4X/FMQHZybsL4VMoIJhdwyBQY8+wvpNtBLFS6N
         VLoKv73DuXOAws7mLybSCKmorWgobTqV0M96AE6WZtur70iNwQ+lhk176STscVJIzlk3
         vlX4fCzA3Ht26X+IyHCwlcxyQXFXJf6f3APDI5Gz1/pJCql3w413W+yt33sAM3N9PqDL
         38SjB+th+Cx2XPAZUmMBcAHuLT24HoEEBGM7uKeXjbXR8WmWr97r2eGyDaW3ob6QpPpI
         KiRQ==
X-Gm-Message-State: AFq9FYI5g1k+fXBp9rpj3ublChJsp7s/zvjQ711PrnMhou/h0AzTVDbV
	xJpWHgqZZdYhkHfHupXHDU2+gTQlSdqFp6QKZq9PzDCMo999M2uUXgKARfv8xg==
X-Gm-Gg: AYBFou1h+Qq3JspiuLT+rLxEVw2FKTnM+ccd3RjMJZK5oBeffip4qCLehJXlR9rUKuo
	iFWE+EBoSsKYNT2+Zzgi+NdTkFeBik8h3ImbznOCqCaMm+lMESRPBE2ETrEyIgD6tbp+smUoge6
	TlgqmF6aseJeDTaQuw7eV7TDUER9YM2hYxPMY7L49PLb3e71rPXUiL/8FPt0hJ0ljz/gTsiR0/e
	EGSISfk4O72Bh1TFQFRxQB+zfr94HoSELLzC9QmBRta8w+io85v8lkSHqBD+XpDXvtP9WoCxlPW
	XNhijoezBBIrhjkSJlbusjcurXLCrO8pmOpYa5+NlDNdsMb0Jqf4NNzf1ELdQEMMGjWPniqCZ/f
	RXXvMxxAlyyfcIBgPoT5oA24SaL8Sf9rZaQd4wwbmLP40t8zOmmyYjTHWUUDX9K/bxLKrwi7CMD
	yCVHMBMu3eYd8Tji8z4ob9DbAXsj2/brgn/41L0feVJkAQxt7/ZpFdQFdKIM+dR6ymM4dBq35y/
	VvRl42GpN5zziBJRnSMhoSCBFewzKUV7SWHpRBDO+7wP2y+sB32XlmGXvwQQaoEBEER6g==
X-Received: by 2002:a17:90b:2711:b0:3ac:9259:1234 with SMTP id 98e67ed59e1d1-3adead502d4mr3827268a91.39.1792940402116;
        Sun, 25 Oct 2026 08:00:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebaca727sm5270937a91.3.2026.10.25.08.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:00:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v7.4
Date: Sun, 25 Oct 2026 07:59:57 -0700
Message-ID: <20261025145958.3032379-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon updates for Linux v7.4 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.4

Thanks,
Guenter
------

The following changes since commit 93f51579e7df248780214094418f205253383cc5:

  Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.4

for you to fetch changes up to e1b3c2630d5b8bc755fe4ba86d20d08c734eb504:

  hwmon: (npcm750-pwm-fan) serialize PWM register updates (2026-10-20 15:41:38 -0700)

----------------------------------------------------------------
hwmon updates for v7.4

* New drivers

  - Axiado AX3000 and AX3005 PWM fan controller

  - AX3000/AX3005 TSADC

  - HONOR FMI-XX

  - Minisforum UM780 XTX EC monitoring and fan control

  - pmbus: MAX20826, MAX20855B, MAX20908, MAX20912, MAX20826, and MAX20916

  - pmbus: Infineon TDA38740/TDA38725

* Added support to existing drivers

  - asus-ec-sensors: ROG STRIX X670E-A GAMING WIFI and
    ROG STRIX Z490-A GAMING

  - asus_rog_ryujin: ROG Ryujin III 360

  - dell-smm: Dell 16 DC16250, Dell OptiPlex 7090, Dell Precision 3650
    Tower, Add Latitude 5420

  - it87: IT8613E

  - k10temp: 1ah/80h devices. Drop support for Hygon devices (support to be
    re-added with separate patches later)

  - lm63: Sensylink CTF2301

  - nct6683: MSI MAG B550M MORTAR MAX WIFI, MSI MAG B650 TOMAHAWK WIFI,
    MSI MAG B650M MORTAR WIFI (MS-7D76), and MSI MAG B850M MORTAR WIFI

  - nct6775: NCT6122D and NCT6126D

  - pmbus/isl68137: Renesas RAA229639 and RAA229640

  - pmbus/max34440: ADPM12300

  - pmbus/tps25990: TPS1689

  - pmbus/tps53679: TPS53622, TPS53659 and TPS536C7

  - pmbus/xdpe1a2g7b: xdpe1a2g7c

  - sht4x: Sensirion STS4x

  - socfpga: Agilex 5

  - yogafan: Lenovo Yoga Pro 9 16IMH9, Yoga 14cACN 2021, IdeaPad 3 15ALC6 Ub,
    Yoga 740-15IML

* Core updates

  - Support for currX_emergency and inX_[l]emergency attributes

* Notable bug fixes and changes

  - Add missing locks to corsair-cpro, ftsteutates, nct7904, and npcm750-pwm-fan
    drivers

  - Fix jiffies wraparound in tmp102 and tmp108 drivers

  - Documentation updates (document missing chip support, typo fixes,
    clarifications)

  - pmbus/ltc4286: Add writable shunt_resistor sysfs attribute

  - coretemp: Document sysfs numbering and label meaning, fix handling of
    isolated SMT siblings, read TjMax only when refreshing the temperature,
    refresh the temperature on the first read, and return -ENODATA for
    invalid temperature readings

  - spd5118: Avoid probing when 16-bit addressing is enabled, and select
    page 0 unconditionally during probe

  - arctic_fan_controller: Default PWM cache to MCU 40%, Dual-license
    GPL-2.0-or-later OR BSD-2-Clause, and update maintainer address

* Various other minor bug fixes and improvements

----------------------------------------------------------------
Alessandro Zini (2):
      dt-bindings: trivial-devices: Add Sensirion STS4x series
      hwmon: (sht4x) Add support for Sensirion STS4x temperature sensors

Alexis Czezar Torreno (1):
      hwmon: (pmbus/max34440) Add support for ADPM12300

Armin Wolf (5):
      hwmon: (dell-smm) Add Dell OptiPlex 7090 to fan control whitelist
      hwmon: (dell-smm) Add Latitude 5420 to fan control whitelist
      hwmon: (spd5118) Select page 0 unconditionally during probe
      hwmon: (spd5118) Avoid probing when 16-bit addressing is enabled
      hwmon: (acpi_power_meter) Fix 18.45 TW bug

Asaf Nuri Bertizlioğlu (1):
      hwmon: (coretemp) Document sysfs numbering and label meaning

Asai Neko (1):
      hwmon: (asus-ec-sensors) add ROG STRIX X670E-A GAMING WIFI

Ashish Yadav (2):
      dt-bindings: trivial-devices: Add support for XDPE1A2G7C
      hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g7c controller

Aureo Serrano de Souza (3):
      hwmon: (arctic_fan_controller) Default PWM cache to MCU 40%
      hwmon: (arctic_fan_controller) Dual-license GPL-2.0-or-later OR BSD-2-Clause
      hwmon: (arctic_fan_controller) Use shared maintainer address

Baek Kyu, Kim (3):
      hwmon: (sht4x) Reject incomplete heater command transfers
      hwmon: (mcp9982) Update the interval cache only after successful writes
      hwmon: (sht3x) Return the consumed count for heater writes

Carl Lee (1):
      hwmon: (pmbus/ltc4286) Add writable shunt_resistor sysfs attribute

Colin Huang (4):
      dt-bindings: hwmon: pmbus: Add Infineon tda38740 and tda38725
      hwmon: (pmbus/tda38740) Add driver for Infineon TDA38740/TDA38725
      dt-bindings: hwmon: pmbus/isl68137: Add Renesas RAA229639 and RAA229640
      hwmon: (pmbus/isl68137) Add Renesas RAA229639 and RAA229640

Eduard Zateev (1):
      hwmon: (pmbus/ibm-cffps) Avoid format truncation warnings

Emanuel Ávila (1):
      hwmon: (dell-smm) Add Dell 16 DC16250 to fan control whitelist

Flaviu Nistor (2):
      dt-bindings: hwmon: national,lm90: Fix channel constraints for temperature offset
      hwmon: (lm90) Reject channel 2 on chips with only one remote sensor

Frank Li (1):
      dt-bindings: hwmon: tmp102: move ti,tmp103 out of trivial-devices.yaml

Guenter Roeck (3):
      hwmon: (core) Add support for currX_emergency and inX_[l]emergency attributes
      hwmon: (pmbus) Validate number of phases per page
      hwmon: (nct6683) Add more MSI boards to list of tested boards

Hemanth Selam (1):
      hwmon: fix typos in comments

Jiale Yao (1):
      hwmon: (gigabyte_waterforce) reject short input reports

Josef Bacik (3):
      hwmon: (ftsteutates) serialise the watchdog and sensors
      hwmon: (nct7904) serialise the watchdog and sensors
      hwmon: (npcm750-pwm-fan) serialize PWM register updates

Kees Cook (4):
      hwmon: (asus_wmi_sensors) Fix info[] allocation type
      hwmon: (pwm-fan) Add const to channels allocation type
      hwmon: (scmi) Fix info[] allocation type
      hwmon: (hp-wmi-sensors) Fix info_map[] allocation type

Lin Wang (1):
      hwmon: (k10temp) Stop matching Hygon devices

Manuel Ebner (1):
      docs: hwmon: sysfs-interface: Fix bracket

Marek Vasut (2):
      dt-bindings: hwmon: tmp102: Document TMP110
      dt-bindings: hwmon: tmp102: Document TMP113

Mario Limonciello (1):
      hwmon: (k10temp) Add support for 1ah/80h

Mario Nuevo (1):
      hwmon: (asus-ec-sensors) add ROG STRIX Z490-A GAMING

Massinissa Ghoul (1):
      hwmon: (hih6130) Replace sprintf() with sysfs_emit()

Nikita Dubrovskih (1):
      hwmon: Add fan monitoring support for HONOR FMI-XX

Nuno Sá (3):
      hwmon: (pmbus/core) Add mapping function to pmbus_read_block_data()
      dt-bindings: hwmon/pmbus: Document MAX20826 and similar devices
      hwmon: (pmbus) add support for MAX20826 and similar devices

Patrick Pepin (1):
      hwmon: (dell-smm) Add Dell Precision 3650 Tower to fan control whitelist

Paul Louvel (4):
      Documentation: hwmon: nct6775: Document NCT6116D/NCT6122D/NCT6126D support
      Documentation: hwmon: (nct6775) Document NCT6116D/NCT6122D/NCT6126D support
      hwmon: (nct6775) Add support for NCT6126D
      hwmon: (nct6775) Add support for NCT6122D

Pawel Zalewski (1):
      hwmon: use named initializers for acpi_device_id

Petar Stepanovic (4):
      dt-bindings: hwmon: Add Axiado AX3000 TSADC
      hwmon: Add driver for AX3000/AX3005 TSADC
      dt-bindings: hwmon: add Axiado AX3000 and AX3005 PWM fan controller
      hwmon: add Axiado AX3000 and AX3005 PWM fan controller driver

Petr Pavlu (1):
      hwmon: Replace __MODULE_STRING() with __stringify()

Qian Xiao (1):
      hwmon: (asus_wmi_sensors) Reword BIOS upgrade advice

Quchaosheng (1):
      hwmon: documentation: vexpress: point the DT binding reference at the schema

Ricardo Neri (3):
      hwmon: (coretemp) Refresh the temperature on the first read
      hwmon: (coretemp) Return -ENODATA for invalid temperature readings
      hwmon: (coretemp) Read TjMax only when refreshing the temperature

Ridham Khurana (2):
      hwmon: (lm95245) Fix negative temperature conversion
      hwmon: (lm70) Fix rounding of negative temperatures

Sanan Hasanov (1):
      hwmon: (corsair-cpro) Make wait_input_report_lock IRQ safe

Sanman Pradhan (5):
      dt-bindings: trivial-devices: Add TI TPS53622 and TPS53659
      hwmon: (pmbus/tps53679) Add support for TPS53622 and TPS53659
      dt-bindings: trivial-devices: Add TI TPS536C7
      hwmon: (pmbus/tps53679) Add support for TPS536C7
      hwmon: (pmbus/tps53679) Select page 0 for single-page TPS536C7

Sebastián Peyrott (1):
      hwmon: Add Minisforum UM780 XTX EC monitoring and fan control

Sergio Melas (2):
      hwmon: (yogafan) Add support for new Lenovo models
      Documentation: hwmon: (yogafan) Update model reference table and contributors

Stoyan Bogdanov (3):
      hwmon: (pmbus/tps25990) Rework driver for multi-device support
      dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
      hwmon: (pmbus/tps25990) Add TPS1689 support

Tom Verdonck (3):
      hwmon: (tmp102) Fix jiffies wraparound in conversion-ready check
      hwmon: (tmp108) Fix jiffies wraparound in conversion-ready check
      hwmon: (sht4x) Fix jiffies wraparound in heater-ready check

Tomasz Bojanowski (1):
      hwmon: (nct6683) Add MSI B850M to list of tested boards

Troy Mitchell (4):
      dt-bindings: vendor-prefixes: Add Sensylink
      dt-bindings: hwmon: Move LM63 family to a dedicated binding
      dt-bindings: hwmon: Add Sensylink CTF2301
      hwmon: (lm63) Add Sensylink CTF2301 support

Tze Yee Ng (1):
      hwmon: (socfpga) add Agilex 5 channel mapping

Vincent Jardin (1):
      dt-bindings: hwmon: ti,tmp401: add #thermal-sensor-cells

Ximing Zhang (1):
      hwmon: (coretemp) Fix handling of isolated SMT siblings

Zac Lanzon (1):
      hwmon: (asus_rog_ryujin) Add ROG Ryujin III 360

benoit.masson (3):
      hwmon: (it87) describe per-chip PWM temperature maps
      hwmon: (it87) prepare for extended PWM temp maps
      hwmon: (it87) add IT8613E support

rahlquist (1):
      hwmon: (yogafan) Add Lenovo Yoga Pro 9 16IMH9

 Documentation/ABI/testing/sysfs-class-hwmon        |   36 +
 .../bindings/hwmon/axiado,ax3000-pwm-fan.yaml      |   72 ++
 .../bindings/hwmon/axiado,ax3000-tsadc.yaml        |   45 +
 .../devicetree/bindings/hwmon/national,lm63.yaml   |   55 ++
 .../devicetree/bindings/hwmon/national,lm90.yaml   |   28 +-
 .../bindings/hwmon/pmbus/adi,max20826.yaml         |  102 ++
 .../bindings/hwmon/pmbus/infineon,tda38740.yaml    |   55 ++
 .../bindings/hwmon/pmbus/isil,isl68137.yaml        |    2 +
 .../bindings/hwmon/pmbus/ti,tps25990.yaml          |    8 +-
 .../devicetree/bindings/hwmon/ti,tmp102.yaml       |   16 +-
 .../devicetree/bindings/hwmon/ti,tmp401.yaml       |    3 +
 .../devicetree/bindings/trivial-devices.yaml       |   17 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 Documentation/hwmon/arctic_fan_controller.rst      |   26 +-
 Documentation/hwmon/asus_ec_sensors.rst            |    2 +
 Documentation/hwmon/asus_rog_ryujin.rst            |    1 +
 Documentation/hwmon/asus_wmi_sensors.rst           |    5 +-
 Documentation/hwmon/axiado-pwm-fan.rst             |   38 +
 Documentation/hwmon/axiado-tsadc.rst               |   41 +
 Documentation/hwmon/coretemp.rst                   |   15 +-
 Documentation/hwmon/honor-fmi.rst                  |   32 +
 Documentation/hwmon/index.rst                      |    6 +
 Documentation/hwmon/it87.rst                       |    8 +
 Documentation/hwmon/k10temp.rst                    |    8 +-
 Documentation/hwmon/lm63.rst                       |   22 +
 Documentation/hwmon/max20826.rst                   |  139 +++
 Documentation/hwmon/max34440.rst                   |   28 +-
 Documentation/hwmon/minisforum-um780xtx.rst        |   68 ++
 Documentation/hwmon/nct6683.rst                    |    4 +
 Documentation/hwmon/nct6775.rst                    |   32 +
 Documentation/hwmon/sht4x.rst                      |   17 +-
 Documentation/hwmon/socfpga-hwmon.rst              |   52 +
 Documentation/hwmon/sysfs-interface.rst            |   14 +-
 Documentation/hwmon/tda38740.rst                   |   65 ++
 Documentation/hwmon/tps25990.rst                   |   15 +-
 Documentation/hwmon/tps53679.rst                   |   39 +-
 Documentation/hwmon/vexpress.rst                   |    2 +-
 Documentation/hwmon/yogafan.rst                    |   46 +-
 MAINTAINERS                                        |   45 +-
 drivers/hwmon/Kconfig                              |   57 +-
 drivers/hwmon/Makefile                             |    4 +
 drivers/hwmon/abituguru.c                          |    4 +-
 drivers/hwmon/acpi_power_meter.c                   |   14 +-
 drivers/hwmon/adm1177.c                            |    2 +-
 drivers/hwmon/adt7x10.c                            |    2 +-
 drivers/hwmon/arctic_fan_controller.c              |   22 +-
 drivers/hwmon/asus-ec-sensors.c                    |    4 +
 drivers/hwmon/asus_atk0110.c                       |    4 +-
 drivers/hwmon/asus_rog_ryujin.c                    |    3 +
 drivers/hwmon/asus_wmi_sensors.c                   |    2 +-
 drivers/hwmon/axiado-pwm-fan.c                     |  416 ++++++++
 drivers/hwmon/axiado-tsadc.c                       |  275 ++++++
 drivers/hwmon/coretemp.c                           |   54 +-
 drivers/hwmon/corsair-cpro.c                       |    9 +-
 drivers/hwmon/dell-smm-hwmon.c                     |   32 +
 drivers/hwmon/emc2103.c                            |    2 +-
 drivers/hwmon/fschmd.c                             |    3 +-
 drivers/hwmon/ftsteutates.c                        |   28 +-
 drivers/hwmon/gigabyte_waterforce.c                |    5 +
 drivers/hwmon/hih6130.c                            |    4 +-
 drivers/hwmon/honor-fmi.c                          |  178 ++++
 drivers/hwmon/hp-wmi-sensors.c                     |    2 +-
 drivers/hwmon/hwmon.c                              |    6 +
 drivers/hwmon/it87.c                               |  308 +++++-
 drivers/hwmon/k10temp.c                            |    7 +-
 drivers/hwmon/lm63.c                               |  426 ++++++--
 drivers/hwmon/lm70.c                               |    8 +-
 drivers/hwmon/lm85.c                               |    2 +-
 drivers/hwmon/lm90.c                               |    5 +
 drivers/hwmon/lm95245.c                            |    6 +-
 drivers/hwmon/mcp9982.c                            |    7 +-
 drivers/hwmon/minisforum-um780xtx.c                |  503 ++++++++++
 drivers/hwmon/nct6775-core.c                       |  116 +++
 drivers/hwmon/nct6775-platform.c                   |   33 +-
 drivers/hwmon/nct6775.h                            |    4 +-
 drivers/hwmon/nct7904.c                            |   19 +-
 drivers/hwmon/npcm750-pwm-fan.c                    |   11 +
 drivers/hwmon/pmbus/Kconfig                        |   41 +-
 drivers/hwmon/pmbus/Makefile                       |    2 +
 drivers/hwmon/pmbus/ibm-cffps.c                    |    4 +-
 drivers/hwmon/pmbus/isl68137.c                     |    4 +
 drivers/hwmon/pmbus/ltc4286.c                      |   96 +-
 drivers/hwmon/pmbus/max20826.c                     | 1044 ++++++++++++++++++++
 drivers/hwmon/pmbus/max34440.c                     |    2 +
 drivers/hwmon/pmbus/mp2888.c                       |    4 +-
 drivers/hwmon/pmbus/pmbus.h                        |    7 +
 drivers/hwmon/pmbus/pmbus_core.c                   |   29 +-
 drivers/hwmon/pmbus/tda38740.c                     |   64 ++
 drivers/hwmon/pmbus/tps25990.c                     |  249 +++--
 drivers/hwmon/pmbus/tps53679.c                     |  146 ++-
 drivers/hwmon/pmbus/xdpe1a2g7b.c                   |   10 +-
 drivers/hwmon/pt5161l.c                            |    4 +-
 drivers/hwmon/pwm-fan.c                            |    2 +-
 drivers/hwmon/sch56xx-common.c                     |    3 +-
 drivers/hwmon/scmi-hwmon.c                         |    3 +-
 drivers/hwmon/sht3x.c                              |    5 +-
 drivers/hwmon/sht4x.c                              |   80 +-
 drivers/hwmon/socfpga-hwmon.c                      |   22 +
 drivers/hwmon/spd5118.c                            |   67 +-
 drivers/hwmon/tmp102.c                             |    8 +-
 drivers/hwmon/tmp108.c                             |    8 +-
 drivers/hwmon/w83793.c                             |    5 +-
 drivers/hwmon/xgene-hwmon.c                        |    6 +-
 drivers/hwmon/yogafan.c                            |   48 +
 include/linux/hwmon.h                              |   12 +
 105 files changed, 5315 insertions(+), 458 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/axiado,ax3000-pwm-fan.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/axiado,ax3000-tsadc.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/national,lm63.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,max20826.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740.yaml
 create mode 100644 Documentation/hwmon/axiado-pwm-fan.rst
 create mode 100644 Documentation/hwmon/axiado-tsadc.rst
 create mode 100644 Documentation/hwmon/honor-fmi.rst
 create mode 100644 Documentation/hwmon/max20826.rst
 create mode 100644 Documentation/hwmon/minisforum-um780xtx.rst
 create mode 100644 Documentation/hwmon/tda38740.rst
 create mode 100644 drivers/hwmon/axiado-pwm-fan.c
 create mode 100644 drivers/hwmon/axiado-tsadc.c
 create mode 100644 drivers/hwmon/honor-fmi.c
 create mode 100644 drivers/hwmon/minisforum-um780xtx.c
 create mode 100644 drivers/hwmon/pmbus/max20826.c
 create mode 100644 drivers/hwmon/pmbus/tda38740.c
