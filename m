Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BA938E8A5
	for <linux-hwmon@vger.kernel.org>; Mon,  1 Jun 2026 09:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304990; cv=none; b=HUW9yUt26DsTGJr236iU0hwKnfmN0ywNLcS9mmhtKBxGves0F3/HXvQuP6y2XCzKwiwmiMCXtbdOjt3HrbiVEouc1/1Q9nAGoKVn30vGCvHhCI5AeKczi5pr+J72RcpI7pZpKXTXXpIlGbmN43PJZmSo1cmaGe/3+VgSkIJO6BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304990; c=relaxed/simple;
	bh=kNCEzYPzX/rJ/SApTMGX5WH/UUkEoeCT6G51bSzeHzI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=eXNNMrXjdFVO5Fgn+NSIabP1O53d6x4XTvll9P/vp1hLBJ+XoEaTPujSYb9nH5QxJOE8XfArpej/BHE60inGUufzxCcqX2CrTr79i2rONEjVj7puIjjQSEdkyyx1A0kVj8DLnX1WnoRT1UnSNdkcInLm0VOm2VDTMLY9yWwV1V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7Xh7IaE; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7Xh7IaE"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c858cc9870aso543063a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Jun 2026 02:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780304988; x=1780909788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wXjsaeTbGU0KvnbeQVgIVZE9uw0k1+48T90bAJpfEMc=;
        b=r7Xh7IaEqbZLKoPwoxOyCQTCri4GqoesFBD4TCxPekqcr1Kq6a9QChdHJQrQIU8usu
         ttbWbzKdYkRwTQHYA64xdokbQOwrW2+PQxWuPCTVhB+vaplcSp6/LbLA0jcJcGygedgW
         w/rq3bIBukjYkoN93NmU/eITlPwgC75ZkTuTZcHTWbRiP8Mh8hKtq8hY1mm31Utw2x4P
         VqX9ot+1Gj/m+lnKmHrL/8vxsbyF+nW5hb3Bu3WouoJAUDR3mlqEO8GTSJGtlDeDi8Zg
         S3dd4+qPGsI2s6klc42SKqzRKHhUHv2IdudJa+Sla6amEJfd6C9wYC46pw1LqpzRWpP3
         P/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780304988; x=1780909788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXjsaeTbGU0KvnbeQVgIVZE9uw0k1+48T90bAJpfEMc=;
        b=CLWdkVh2xjXjMqmKDiKyGPSAbxilHGCHWFKG9Q1SFeMnmyimYzWRz9x6YgS9HL5sFM
         82NwtvtVffjlITQV+g2oVhU3vvgCxSxT5yxtk5zdjHA1jgSYSdpaB1ppF+K/1vJcV488
         VPumsat3TvhuVb8jEC08AMJ6YNrZD8apDf2+fIcVG0g3lAxAEOylTrMWoX2UxPWRW0fg
         KHMfCS/fPk5PgSnxyDBAcp6Uv8c8p8k/TZictCXnsHwQK1fFot9UIcPfnb8B+RysnfRH
         i2LzqLPRL6OIB0Sg4YQXUpb/qQ6wSD4vR5a6HoCzlIA3i9zso360iT7A7SPaLEdAQ4lo
         8DRA==
X-Gm-Message-State: AOJu0YyzxA2OuFRr/qaknDuGDEGzhNMMjq+/3SSNqpA7m39iDdkUlJ7Y
	2ONgLsW84qa0FyhffPWp3WNfENQwbBxOrSEB3jaLm8Pp0qkUOpQ+LS8r
X-Gm-Gg: Acq92OGZlVDYk5+w2K1gnAOT7VrkC1X9lWLlKM9utKTEVEig6V3zl6mmcHfMsEWvfhu
	xDPbpRpm0yq9K3TiXwINbej7XQgZ0S6rvkEcKKBCmZkD62hovj+A6sE/wTH6Bwozi82PeZV5YNK
	cG8DQXSO2t1U3y8S12GbHYAT5W+xCmZVTDHUje44umeVSuxFc1KcSdPNDmi3GtEzAshbdA54wl6
	ts0jVRhF37qNZC3ZMdUUY4952RFcx895dBxNrDgHgYlK9B8BlV/xKz5LBch1hQSCa2s7XoRMv5J
	NXiEFxRmo0ahmcKci/5Qe9NdgBzOveFE+YVVdUU45E7ubxrmDkkiCrjzznPRS+i3x84lr59LzPg
	NOlL+Iamz+YYR85ETMW+J5JiPvQSveWsBTdceaD49CXSaP//a0aqXM4QN5evE0esXWly7BBJB3/
	YiTqdFX6EeLDJs+mAtimuEfsH2YExpuvR6TO0Rizi/mXPAQcINGbsVAWy7SaKBKe4rp6Q=
X-Received: by 2002:a05:6a21:b8c:b0:3b3:21f7:15e0 with SMTP id adf61e73a8af0-3b40fdc7d55mr13052217637.38.1780304988061;
        Mon, 01 Jun 2026 02:09:48 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:91f7:9b52:3422:d8b9:6baf:c53f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85772df0fasm9105827a12.30.2026.06.01.02.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:09:47 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v3 0/2] Add support for Infineon eFuse xdp730
Date: Mon,  1 Jun 2026 14:39:23 +0530
Message-Id: <20260601090925.3781-1-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Hi,

These patches add support for the Infineon XDP730 Digital eFuse Controller
by updating the existing XDP720 driver.

The XDP720 and XDP730 are PMBus-compliant digital eFuse controllers
with an integrated current sensor.They provide accurate system
telemetry (V, I, P, T) and report analog current at the IMON pin for
post-processing.

Both parts share the same PMBus register map and direct-format
coefficients; they differ in the GIMON gain step exposed via the
TELEMETRY_AVG register (bit 10) and in the VDD_VIN pin number
(XDP720: pin 9, XDP730: pin 20).

The Current and Power measurement depends on the RIMON and GIMON values.
The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS Register.
The value of RIMON (kohm) can be provided by the user through device tree using
infineon,rimon-micro-ohms  property.

Datasheets:
 - XDP720: https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
 - XDP730: https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp730-001-datasheet-en.pdf

With Best Regards,
 Ashish Yadav
---
Changes in v3:
- Link to v2:
https://lore.kernel.org/all/20260529054218.5184-1-Ashish.Yadav@infineon.com/
- Revert back the DT info file name to infineon,xdp720.yaml and added
  xdp730 info
https://lore.kernel.org/all/20260529-partake-myself-baa76ed4e279@spud/
- Revert back the driver file name to xdp720.c and added xdp730 support
https://lore.kernel.org/all/20260529062937.646091F00893@smtp.kernel.org/

Changes in v2:
- Link to v1:
https://lore.kernel.org/all/20260519075558.91466-1-Ashish.Yadav@infineon.com/
- Integrated XDP720/XDP730 drivers into one driver.
https://lore.kernel.org/all/51133193-57fb-4a22-bf9e-9817f1f52ad5@roeck-us.net/



Ashish Yadav (2):
  dt-bindings: hwmon/pmbus: Add Infineon xdp730
  hwmon:(pmbus/xdp720) Add support for efuse xdp730

 .../bindings/hwmon/pmbus/infineon,xdp720.yaml |  41 +++--
 drivers/hwmon/pmbus/Kconfig                   |   2 +-
 drivers/hwmon/pmbus/xdp720.c                  | 167 +++++++++++-------
 3 files changed, 131 insertions(+), 79 deletions(-)

-- 
2.39.5

