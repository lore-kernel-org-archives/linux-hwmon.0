Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CF31F5851
	for <linux-hwmon@vger.kernel.org>; Mon,  1 Dec 2025 20:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764619595; cv=none; b=QJ2am6b/woO3IVxFy1rK1fzvgqX7evApocNG0zUlB9tKxXjRWdShnOvjjGPgD7kpdmoB36F4rHVj55hNmH91sL1YLP8ToK7ZjgQEHKIYHndcrYeLYTIqfZPTu1l3nD4VZM7oYMFDXV00sj8UJ2xTJlIVtWO0zvdhoRyVVycE7uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764619595; c=relaxed/simple;
	bh=40oGY/HudD8bbxamI6QNHQe2NE3tqvHoUjs50tu5BZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LQ3sTwZaE0N2hxxsqoHKJNdb1+Eoh0vcoNNMqYWA1qIeuRFX3wviTT3VNvNfxPpPYdqKTHR1ncEzVJB13fFbK9U4iJaaxAx1AQkZ/4+Bn0Zf1eod/E8Vlb/x2RxvZAOAA9732qF20ibM8ygOAz2UX6zLf73uM+LkWiAj02myNzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9FbYjBL; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9FbYjBL"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-298456bb53aso61126675ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Dec 2025 12:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764619591; x=1765224391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CF4BH5pFIo66bwHtnGR7qifEKqakkucOL3CbMke9nKY=;
        b=l9FbYjBL/lSuyX/OULnnOjfaqWRrYtgarCUH6QcQuVY52mFt1hpnqsnzegvNAGt60a
         vDUfaelgvFUnpYYkLUnXRQLnribMk3ZRrh5WOY52XVaP+T1LkGCgB1BOI+H0ObuCYgIZ
         hSCBisIzi4Qe/4dEg1zYq0XcIYUIp9oDzACkwL1wpzaJ0jr8qI6zK4ZRkHqZtL2G/xHZ
         XiKBxXSPxleSNHslYZeribKZiPkp39fHsPw1htm5yYQ8ZwshXjXWozNkqA/EW4sM8mYY
         AqCKrwgDM/WPCpc37SPiz99qzU/0c9u0FpTKEJWZ5p27UI81AlSlJKxzoshqVpSAD2LK
         0LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764619591; x=1765224391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CF4BH5pFIo66bwHtnGR7qifEKqakkucOL3CbMke9nKY=;
        b=dlcX8CApjEH87kSJBJfaQEVIU6p4MEuygnf7G8tOT8XPFslsKomQeNtzq4g7+wWCX7
         vl9XDV76m5QsF/S92PLUlV0QDd/Q2CJHA/uksFXARRnD3nTf1gjzi18uAVyHWgHKtgKi
         OZOpXc5PZJXHek+osDYZQ/TAgBstbhEGe6vT23UYzrXzSwJOo177voNLq1fTUD7KjJbO
         SK6MfioSQMEYNhF8HYU9p/usqFI+bGT8s/gsM4zAPawTXSOR31OCB20HDLULRASmXEdr
         KWx/mNQa96pqn8kv720NHIZM/NIL2nsZDZcD81LCSI2tpim/Hj9XzE+2kM6/IxiVnKYL
         nZOA==
X-Gm-Message-State: AOJu0YzZ+PaEWgGutJq7T59+NVeZjHjNWGZzbqXWBY5tGCq6PwkJhgKe
	WTYvn1c8kg+xyszCX5JAViadNcPfdRe9UXXqFedqOMnzIV7yUJ/SRzbl23l8gw==
X-Gm-Gg: ASbGncsNnS8XEUbMGfZlnmRUzFwDz1x0gNbORpX23qcQCAJrTm29BvAOwxKH2Rk85TX
	G9xwmmn/gYvU4IHcaGv71dR7hc7NRBWvacWnfccAhZu1byzXOMKUhb/fGUmjrwg2JpnWfxUqSXO
	1FIacxILGnMeksGDOVL70RdriIr3rB4Ic/IL8R00Lnjav0a9dKYfF1NYPrugI+whDVQAgi5GKJL
	ty0KDgmStnO8T8u89ZWifYwcGPfX7MHZRCinL9ZZSFLYOvicAkiX5LBVj2z3gJQ8W+MvGZI4r/O
	qGY+WlCEEAQAC98ldgc50sHtVvwf2vnX5W4dZ/3+8Xdw66kSL9V/RjjHjsUxfjFjAAyBf9gAwkv
	Y3nkwlnl4R+IDbxO8p4ParsZZIKTzA+tPkEhf4cKIkKnRJ41bNGz18ORaF+EmFEYIBi67xDfXMN
	2y6CXtCJqvLpsZwDlcb8ADroI=
X-Google-Smtp-Source: AGHT+IGp31lUDBgP6vaiDPWMsn/UaDiv/UQZfEOPsfChoSTCIVt0ozjezbuauKLwlgkkOfbNlebrwA==
X-Received: by 2002:a17:902:ccc4:b0:295:54cd:d2dc with SMTP id d9443c01a7336-29b6c4047efmr417621535ad.16.1764619590787;
        Mon, 01 Dec 2025 12:06:30 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb277d0sm133034115ad.53.2025.12.01.12.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:06:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon updates for v6.19
Date: Mon,  1 Dec 2025 12:06:27 -0800
Message-ID: <20251201200628.2203308-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon updates for Linux v6.19 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.19

Thanks,
Guenter
------

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v6.19

for you to fetch changes up to 30ca0e049f507001c6377e28482a636689351f64:

  hwmon: (dell-smm) Add Dell G5 5505 to fan control whitelist (2025-12-01 11:13:27 -0800)

----------------------------------------------------------------
hwmon updates for v6.19

* New drivers

  - Driver for Apple Silicon SMC

  - Driver for TSC1641 I2C power monitor

  - Driver for MPS MP9945

  - Driver for MAX17616

  - Driver for MP2925 and MP2929

* Added support for new devices to existing drivers

  - dell-smm: Add Dell G5 5505 to fan control whitelist

  - aspeed-g6-pwm-tach: Support for AST2700

  - asus-ec-sensors: Support for  ROG STRIX X470-I GAMING,
    ROG STRIX X870-F GAMING WIFI, ROG STRIX X870E-H GAMING WIFI7,
    and Pro WS TRX50-SAGE WIFI

  - k10temp: Support for AMD Steam Deck APU ID

  - pmbus/isl68137: Support for raa229141

  - aht10: Support for dht20

  - adt7410: Support for ADT7422

  - peci: Support for Intel Emerald Rapids

  - nct6775: Support for ASUS ROG STRIX X870E-H GAMING WIFI7

  - pmbus/max34440: Support for ADPM12200

  - ntc-thermistor: Support for Murata ncp18wm474

* Infrastructure updates

  - Utilize subsystem locking in various drivers

  - ltc4282, ltc2947: Use the new energy64 attribute

* Bug fixes

  - Various drivers: Fixes to avoid TOCTOU, mostly in macro functions
    evaluating parameters multiple times, as well as missing locks

  - max6697: Fix regmap leak on probe failure

  - sy7636a: Fix regulator_enable resource leak on error path

  - asus-ec-sensors: Correct Pro WS TRX50-SAGE WIFI entry

* Other changes and improvements

  - w83781d, lm78: Drop REALLY_SLOW_IO

  - Fix broken datasheet links in various drivers

* Various other minor fixes and improvements

----------------------------------------------------------------
Akhilesh Patil (1):
      hwmon: (aht10) Add support for dht20

Alexis Czezar Torreno (1):
      hwmon: (pmbus/max34440): add support adpm12200

Andreas Kemnade (1):
      hwmon: (sy7636a) Fix sensor description

Ankan Biswas (4):
      docs/hwmon: Fix broken links warnings in lm90.rst
      docs/hwmon: Fix broken maxim-ic.com links to analog.com
      docs/hwmon: Add missing datasheet links for Maxim chips
      docs/hwmon: Update maxim-ic.com links to analog.com

Billy Tsai (2):
      dt-bindings: hwmon: Add AST2700 compatible
      hwmon: (aspeed-g6-pwm-tach): Add AST2700 compatible string

Bruno Thomsen (2):
      hwmon: (tmp421) Check error when loading label from dt
      hwmon: (tmp421) Remove duplicate return in switch-case

Cosmo Chou (2):
      dt-bindings: trivial-devices: add mps,mp9945
      hwmon: (pmbus) add driver for MPS MP9945

Eddie James (2):
      dt-bindings: hwmon: Move max31785 compatibles to max31790 document
      dt-bindings: hwmon: max31790: Use addressed fan nodes

Emil Dahl Juhl (1):
      hwmon: (ntc-thermistor) Add Murata ncp18wm474

Eugene Shalygin (1):
      hwmon: (asus-ec-sensors) add ROG STRIX X870-F GAMING WIFI

Gabriel Marcano (1):
      hwmon: (dell-smm) Add Dell G5 5505 to fan control whitelist

Guenter Roeck (52):
      hwmon: (ltc2947) Use the energy64 attribute type to report the energy
      hwmon: (ltc4282) Use the energy64 attribute type to report the energy
      hwmon: (jc42) Rely on subsystem locking
      hwmon: (lm90) Rely on subsystem locking
      hwmon: (adm9240) Rely on subsystem locking
      hwmon: (emc1403) Rely on subsystem locking
      hwmon: (tmp464) Rely on subsystem locking
      hwmon: (tmp421) Rely on subsystem locking
      hwmon: (tmp401) Rely on subsystem locking
      hwmon: (tmp108) Drop mutex.h include
      hwmon: (drivetemp) Rely on subsystem locking
      hwmon: (max6697) Rely on subsystem locking
      hwmon: (ltc4245) Rely on subsystem locking
      hwmon: (lm95245) Rely on subsystem locking
      hwmon: (tmp103) Drop unnecessary include files
      hwmon: (tmp102) Drop unnecessary include files
      hwmon: (max6639) Rely on subsystem locking
      hwmon: (max31827) Rely on subsystem locking
      hwmon: (nct7904) Rely on subsystem locking
      hwmon: (nct7363) Drop unnecessary include files
      hwmon: (max6620) Rely on subsystem locking
      hwmon: (max31790) Rely on subsystem locking
      hwmon: (max127) Rely on subsystem locking
      hwmon: (lm95234) Rely on subsystem locking
      hwmon: (lm92) Rely on subsystem locking
      hwmon: (hs3001) Rely on subsystem locking
      hwmon: (sbtsi_temp) Rely on subsystem locking
      hwmon: (ina2xx) Rely on subsystem locking
      hwmon: (sht4x) Rely on subsystem locking
      hwmon: (ina3221) Rely on subsystem locking
      hwmon: (k10temp) Rely on subsystem locking
      hwmon: (mr75203) Drop unnecessary include file
      hwmon: (powr1220) Rely on subsystem locking
      hwmon: (ftsteutates) Rely on subsystem locking
      hwmon: (ina238) Rely on subsystem locking
      hwmon: (lm95241) Rely on subsystem locking
      hwmon: (aht10) Rely on subsystem locking
      hwmon: (adt7411) Rely on subsystem locking
      hwmon: (ltc2947-core) Rely on subsystem locking
      hwmon: (peci) Rely on subsystem locking
      hwmon: (adt7x10) Rely on subsystem locking
      hwmon: (sfctemp) Rely on subsystem locking
      hwmon: (lochnagar-hwmon) Rely on subsystem locking
      hwmon: (ltc4282) Rely on subsystem locking
      hwmon: (aquacomputer_d5next) Rely on subsystem locking
      hwmon: (gpd-fan) Rely on subsystem locking
      hwmon: (i5500_temp) Drop unnecessary include files
      hwmon: (asus_rog_ryujin) Rely on subsystem locking
      hwmon: (chipcap2) Drop unnecessary include files
      hwmon: (corsair-psu) Rely on subsystem locking
      hwmon: (corsair-psu) Rely on subsystem locking
      Merge tag 'ib-mfd-hwmon-v6.19' into hwmon-next

Gui-Dong Han (8):
      hwmon: (vt1211) Convert macros to functions to avoid TOCTOU
      hwmon: (emc2103) Add locking to avoid TOCTOU
      hwmon: (vt8231) Convert macros to functions to avoid TOCTOU
      hwmon: (lm87) Convert macros to functions to avoid TOCTOU
      hwmon: (adm1029) Add locking to avoid TOCTOU
      hwmon: (adm1026) Convert macros to functions to avoid TOCTOU
      hwmon: (w83l786ng) Convert macros to functions to avoid TOCTOU
      hwmon: (max16065) Use local variable to avoid TOCTOU

Haotian Zhang (1):
      hwmon: sy7636a: Fix regulator_enable resource leak on error path

Igor Reznichenko (4):
      dt-bindings: hwmon: ST TSC1641 power monitor
      hwmon: Add TSC1641 I2C power monitor driver
      MAINTAINERS: Add entry for ST TSC1641 driver
      Documentation/hwmon: Fix broken datasheet links for zl6100

Ivan Mikhaylov (3):
      peci: cpu: add Intel Emerald Rapids support
      hwmon: (peci/dimmtemp) add Intel Emerald Rapids platform support
      hwmon: (peci/cputemp) add Intel Emerald Rapids support

James Calligeros (2):
      mfd: macsmc: Add new __SMC_KEY macro
      hwmon: Add Apple Silicon SMC hwmon driver

Jeff Lin (1):
      hwmon/pmbus: (isl68137) Add support for raa229141

Johan Hovold (1):
      hwmon: (max6697) fix regmap leak on probe failure

Juergen Gross (2):
      hwmon/lm78: Drop REALLY_SLOW_IO setting
      hwmon/w83781d: Drop REALLY_SLOW_IO setting

Kim Seer Paller (3):
      dt-bindings: hwmon: pmbus: add max17616
      hwmon: (pmbus/max17616) add driver for max17616
      dt-bindings: hwmon: pmbus/max17616: Add SMBALERT interrupt property

Marek Vasut (1):
      hwmon: (scmi) Enable sensors to assure they can be read

Marius Zachmann (2):
      hwmon: (corsair-cpro) Read temperature as a signed value
      hwmon: (corsair-cpro) Replace magic values with constants

Maximilian Luz (2):
      hwmon: (nct6775) Add ASUS ROG STRIX X870E-H GAMING WIFI7
      hwmon: (asus-ec-sensors) add ROG STRIX X870E-H GAMING WIFI7

Nuno Sá (3):
      dt-bindings: trivial-devices: add ADT7410, ADT7420 and ADT7422
      hwmon: (adt7410): Add OF match table
      hwmon: (adt7410): Support adt7422 chip

Paul Heneghan (1):
      hwmon: (asus-ec-sensors) add Pro WS TRX50-SAGE WIFI

René Rebe (2):
      hwmon: (k10temp) Add AMD Steam Deck APU ID
      hwmon: (asus-ec-sensors) add ROG STRIX X470-I GAMING

Rob Herring (Arm) (1):
      dt-bindings: hwmon: Convert apm,xgene-slimpro-hwmon to DT schema

Sascha Hauer (1):
      dt-bindings: hwmon: ntc-thermistor: Add Murata ncp18wm474 NTC

Wensheng Wang (2):
      dt-bindings: hwmon: Add MPS mp2925 and mp2929
      hwmon: Add MP2925 and MP2929 driver

小太 (1):
      hwmon: (asus-ec-sensors) correct Pro WS TRX50-SAGE WIFI entry

 .../bindings/hwmon/apm,xgene-slimpro-hwmon.yaml    |  30 +
 .../devicetree/bindings/hwmon/apm-xgene-hwmon.txt  |  14 -
 .../bindings/hwmon/aspeed,g6-pwm-tach.yaml         |   7 +-
 .../devicetree/bindings/hwmon/max31785.txt         |  22 -
 .../devicetree/bindings/hwmon/maxim,max31790.yaml  |  22 +-
 .../devicetree/bindings/hwmon/ntc-thermistor.yaml  |   1 +
 .../bindings/hwmon/pmbus/adi,max17616.yaml         |  52 ++
 .../devicetree/bindings/hwmon/st,tsc1641.yaml      |  63 ++
 .../devicetree/bindings/trivial-devices.yaml       |  12 +
 Documentation/hwmon/aht10.rst                      |  10 +-
 Documentation/hwmon/asus_ec_sensors.rst            |   4 +
 Documentation/hwmon/ds1621.rst                     |  10 +-
 Documentation/hwmon/index.rst                      |   5 +
 Documentation/hwmon/isl68137.rst                   |  10 +
 Documentation/hwmon/jc42.rst                       |   2 +-
 Documentation/hwmon/lm75.rst                       |  13 +-
 Documentation/hwmon/lm90.rst                       | 127 +--
 Documentation/hwmon/macsmc-hwmon.rst               |  71 ++
 Documentation/hwmon/max127.rst                     |   2 +-
 Documentation/hwmon/max15301.rst                   |   2 +-
 Documentation/hwmon/max16064.rst                   |   2 +-
 Documentation/hwmon/max16065.rst                   |   8 +-
 Documentation/hwmon/max1619.rst                    |   4 +-
 Documentation/hwmon/max16601.rst                   |   2 +-
 Documentation/hwmon/max1668.rst                    |   2 +-
 Documentation/hwmon/max17616.rst                   |  62 ++
 Documentation/hwmon/max197.rst                     |   4 +-
 Documentation/hwmon/max20730.rst                   |   8 +-
 Documentation/hwmon/max31722.rst                   |   4 +-
 Documentation/hwmon/max31730.rst                   |   2 +-
 Documentation/hwmon/max31785.rst                   |   2 +-
 Documentation/hwmon/max31790.rst                   |   2 +-
 Documentation/hwmon/max31827.rst                   |   6 +-
 Documentation/hwmon/max34440.rst                   |  37 +-
 Documentation/hwmon/max6639.rst                    |   2 +-
 Documentation/hwmon/max6650.rst                    |   4 +-
 Documentation/hwmon/max6697.rst                    |  20 +-
 Documentation/hwmon/max77705.rst                   |   4 +-
 Documentation/hwmon/max8688.rst                    |   2 +-
 Documentation/hwmon/mp2925.rst                     | 151 ++++
 Documentation/hwmon/mp9945.rst                     | 117 +++
 Documentation/hwmon/pmbus.rst                      |   2 +-
 Documentation/hwmon/sy7636a-hwmon.rst              |   4 +-
 Documentation/hwmon/tsc1641.rst                    |  87 +++
 Documentation/hwmon/zl6100.rst                     |  16 +-
 MAINTAINERS                                        |  33 +
 drivers/hwmon/Kconfig                              |  36 +-
 drivers/hwmon/Makefile                             |   2 +
 drivers/hwmon/adm1026.c                            |  16 +-
 drivers/hwmon/adm1029.c                            |   3 +
 drivers/hwmon/adm9240.c                            |  17 +-
 drivers/hwmon/adt7410.c                            |  11 +
 drivers/hwmon/adt7411.c                            |  59 +-
 drivers/hwmon/adt7x10.c                            |  27 +-
 drivers/hwmon/aht10.c                              |  43 +-
 drivers/hwmon/aquacomputer_d5next.c                |  37 +-
 drivers/hwmon/aspeed-g6-pwm-tach.c                 |   3 +
 drivers/hwmon/asus-ec-sensors.c                    |  67 +-
 drivers/hwmon/asus_rog_ryujin.c                    |  48 +-
 drivers/hwmon/chipcap2.c                           |   7 -
 drivers/hwmon/corsair-cpro.c                       |   8 +-
 drivers/hwmon/corsair-psu.c                        |  13 +-
 drivers/hwmon/dell-smm-hwmon.c                     |   9 +
 drivers/hwmon/drivetemp.c                          |   5 -
 drivers/hwmon/emc1403.c                            |  46 +-
 drivers/hwmon/emc2103.c                            |   4 +
 drivers/hwmon/ftsteutates.c                        |  84 +-
 drivers/hwmon/gpd-fan.c                            |  56 +-
 drivers/hwmon/hs3001.c                             |  10 +-
 drivers/hwmon/i5500_temp.c                         |   3 -
 drivers/hwmon/ina238.c                             |  26 +-
 drivers/hwmon/ina2xx.c                             |  28 +-
 drivers/hwmon/ina3221.c                            |  19 -
 drivers/hwmon/jc42.c                               |  11 -
 drivers/hwmon/k10temp.c                            |  12 +-
 drivers/hwmon/lm78.c                               |   5 +-
 drivers/hwmon/lm87.c                               |  16 +-
 drivers/hwmon/lm90.c                               |  25 +-
 drivers/hwmon/lm92.c                               |  11 +-
 drivers/hwmon/lm95234.c                            |  12 +-
 drivers/hwmon/lm95241.c                            |  16 -
 drivers/hwmon/lm95245.c                            |  16 +-
 drivers/hwmon/lochnagar-hwmon.c                    |  18 +-
 drivers/hwmon/ltc2947-core.c                       |  92 +--
 drivers/hwmon/ltc4245.c                            |   8 -
 drivers/hwmon/ltc4282.c                            |  68 +-
 drivers/hwmon/macsmc-hwmon.c                       | 851 +++++++++++++++++++++
 drivers/hwmon/max127.c                             |  23 +-
 drivers/hwmon/max16065.c                           |   7 +-
 drivers/hwmon/max31790.c                           |  48 +-
 drivers/hwmon/max31827.c                           |  60 +-
 drivers/hwmon/max6620.c                            |  43 +-
 drivers/hwmon/max6639.c                            |  23 +-
 drivers/hwmon/max6697.c                            |  11 +-
 drivers/hwmon/mr75203.c                            |   1 -
 drivers/hwmon/nct6775-platform.c                   |   1 +
 drivers/hwmon/nct7363.c                            |   2 -
 drivers/hwmon/nct7904.c                            |  63 +-
 drivers/hwmon/npcm750-pwm-fan.c                    |  11 +-
 drivers/hwmon/ntc_thermistor.c                     |  43 ++
 drivers/hwmon/peci/common.h                        |   3 -
 drivers/hwmon/peci/cputemp.c                       |  90 +--
 drivers/hwmon/peci/dimmtemp.c                      |  36 +-
 drivers/hwmon/pmbus/Kconfig                        |  28 +
 drivers/hwmon/pmbus/Makefile                       |   3 +
 drivers/hwmon/pmbus/isl68137.c                     |  14 +
 drivers/hwmon/pmbus/max17616.c                     |  73 ++
 drivers/hwmon/pmbus/max34440.c                     |  44 +-
 drivers/hwmon/pmbus/mp2925.c                       | 316 ++++++++
 drivers/hwmon/pmbus/mp9945.c                       | 243 ++++++
 drivers/hwmon/powr1220.c                           |  17 +-
 drivers/hwmon/sbtsi_temp.c                         |  17 +-
 drivers/hwmon/scmi-hwmon.c                         |   9 +
 drivers/hwmon/sfctemp.c                            |  36 +-
 drivers/hwmon/sht4x.c                              |  40 +-
 drivers/hwmon/sy7636a-hwmon.c                      |   7 +-
 drivers/hwmon/tmp102.c                             |   2 -
 drivers/hwmon/tmp103.c                             |   3 -
 drivers/hwmon/tmp108.c                             |   1 -
 drivers/hwmon/tmp401.c                             |   8 -
 drivers/hwmon/tmp421.c                             |  28 +-
 drivers/hwmon/tmp464.c                             |  13 +-
 drivers/hwmon/tsc1641.c                            | 748 ++++++++++++++++++
 drivers/hwmon/vt1211.c                             |  53 +-
 drivers/hwmon/vt8231.c                             |  18 +-
 drivers/hwmon/w83781d.c                            |   5 +-
 drivers/hwmon/w83l786ng.c                          |  26 +-
 drivers/peci/cpu.c                                 |   4 +
 include/linux/mfd/macsmc.h                         |   1 +
 129 files changed, 3852 insertions(+), 1284 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/apm,xgene-slimpro-hwmon.yaml
 delete mode 100644 Documentation/devicetree/bindings/hwmon/apm-xgene-hwmon.txt
 delete mode 100644 Documentation/devicetree/bindings/hwmon/max31785.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/adi,max17616.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
 create mode 100644 Documentation/hwmon/macsmc-hwmon.rst
 create mode 100644 Documentation/hwmon/max17616.rst
 create mode 100644 Documentation/hwmon/mp2925.rst
 create mode 100644 Documentation/hwmon/mp9945.rst
 create mode 100644 Documentation/hwmon/tsc1641.rst
 create mode 100644 drivers/hwmon/macsmc-hwmon.c
 create mode 100644 drivers/hwmon/pmbus/max17616.c
 create mode 100644 drivers/hwmon/pmbus/mp2925.c
 create mode 100644 drivers/hwmon/pmbus/mp9945.c
 create mode 100644 drivers/hwmon/tsc1641.c
