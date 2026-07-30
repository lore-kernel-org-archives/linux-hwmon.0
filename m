Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5013332916
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 21:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785447020; cv=none; b=EZHtkRgdW6whf3LqKHGmIcii/I9JG4Wz07MXxPKONCYI+zeNei8LzY0GJfXapAvcQRehg6RKk8rsLSoST+sKUGxU03JCYIG71JSJO78sQNIlvBXU88/NXxm46CHDqozLQJyTohtqdBjaUmHBmuQ7n0q/9P6ftD/7zUmiTPANdQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785447020; c=relaxed/simple;
	bh=62lcbR9+Va1j0R9nZb47tv42cOYtl5ojtrYnuKAsAyk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nVV3WnuZpRDeFIK5YpqMhkkKyJgTLI10OQ29KaOjdm+q5cszWCpPksDrxbl7Zu2gyVNBIlRe04qJG3pWiRG81yjMN6/AcfeZ4xmQWcbpV4e57tRbAmZTsg3PwtBZxyJJNTNUnY/N6hk2kjYggLM+VJhaApVXZo2g4H712TcK9k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrL6Qn0V; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrL6Qn0V"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so304676a91.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 14:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785447017; x=1786051817; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bwpLtkucjUT6I4TmAoZ2ORiRbxHjHtLbtFrl1jewPys=;
        b=WrL6Qn0V6+Z3zD68YAhL70UD3WVF+Dqt8hHFvvsyHKUnTGeh1sGzxufaKhTsz82w/5
         4ojJ+aD34vqS8DOl3+GAs8YjoGxO5qva3sIIpu0xlvgJNhRCrKiD45aXfUa1zHjvgrAu
         8LZJeVF2w/3tUGZGPbPhqC6GsQVPH6XaxuueDSaH55OKGLJK44caJQ3iU9Q99IWkumaS
         IKRcgWqehI8ykKLMmYe4akjf7RpqeWUsJoLFEA2aQPAkcCKPsalEEpokYTkFGKZ6t8o+
         SquWweYhIMvR0b2s2A9ZJ1p3ZBOz7EpwZ65iqorNFT+KJB/S+htheQALLSvYy7xWnLyJ
         XRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785447017; x=1786051817;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bwpLtkucjUT6I4TmAoZ2ORiRbxHjHtLbtFrl1jewPys=;
        b=Kgnyn1k/GM9DneGC+leWX5FofD9ESgEWJ/TNfa9zt31D7KMBUZrcr5qriZ7HiU9JIA
         t/s/F9BKc0+80aqKjXg9M6DrIQE2z1pOgoBqLgw1DGR2+Ui/4f5Jqw+tZC6omsCWaU8z
         piPCJaS3b+2o/JLaT1IYzB0/+hEfLELkX1j7N/ybwGhOJg5Jv3dcSxZzdXjvqCeZ4jd3
         oRpRcTfgFnU+BIqm3Jn/a0u3zjD/iGvvVboJwYViAi05mZbplsJoZ1QOg6J57wsKtK92
         jytVfFIMUHTO5YBi1sckwSDIZD1TL9Xdzr9acbM9wb15tf1c5TOcxiuFM3ELFYl8BH6I
         vIMw==
X-Gm-Message-State: AOJu0Yw4z2SJLT4hG6S9anDR14yQrI1If/Z1VYgIMXoF7SBoD8YLKwQn
	BSL0Ysvm+dqN1deliYesxgJNWixNDNbslqAy63kNddXgvdsO1aD79agyBxvpYNIc
X-Gm-Gg: AR+sD10lunmw7qj4X/WeOqtPtR98iAqbipLUSEfl0tdhT0ot+Mo49qzF/3+gPYxEo7/
	prlogKaGhTuCaSaj0rgcXI5zd9xJn3V+0Pegc6n8M3mwSf9+COSoQYRJjkRlTyWW4VYXgE/DEDN
	+BJqTUpYvJAXBg2nORUoS8Zv7eZmkCuLFJgCAWKN29Rjkt3vBKR7E5Oj3DRHT2P9KILrjI/mlHP
	vvVb1o93VUEq5gpL8YEEI79nBT3Yn5+maKj6Ga08v57PvzgZVEHtWAw5EcZcHx5HmfKD7vUhves
	FVeuEFf0mlvpKr/oJXyRxK4icQFDjRs45aOTzS2tFg6O0PUHytttKjoT558rifJRi2Rnn/cgwBc
	73npawMWAf53sTdNlN65kaq1TyisQyKN4ZXYC5HFyyesLyYO1tnVfV/a0eOjeUYdKfvroAyz2jI
	gyzGuvkFPhcSHiNmhY10eYIYvRhB62CMlGl4vpS4GbfZ9amdOB7JbZJzAPy3cx9fIu11GJpQZP6
	vvK
X-Received: by 2002:a17:90b:394b:b0:387:e0db:bc24 with SMTP id 98e67ed59e1d1-38f9c09984fmr3332390a91.36.1785447016666;
        Thu, 30 Jul 2026 14:30:16 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d2ec2asm28584728eec.21.2026.07.30.14.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 14:30:15 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Subject: [hwmon-next PATCH v5 0/4] hwmon: (adt7470) Add PWM provider and
 thermal sensor support
Date: Thu, 30 Jul 2026 18:29:55 -0300
Message-Id: <20260730-adt7470_thermalzone-v5-0-42995a6bb8c5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFPCa2oC/33RS27DIBAA0KtErEMFGAzuqveooorAOCaKoQXip
 o1892B7Y0VWliNm3ny4owTRQULvuzuKMLjkgi+B2O+Q6bQ/AXa2xIgRVhNJa6xtllySr9xB7PX
 lP3jAotGUMCaVlQyVyu8IrbvN6ifqfvvgsYdbRoflLV2PZzB5YqfszqUc4t88wkDnmpfdBooJN
 kYIaCsB1sLHqdfu8mZCP3cY2NqQ2wYrhhaCctkI1Wr7bFQrg6ltoyqG5ULVXCpjj/rZ4Guj2Tb
 4tAvlpGpsqwnUa2NczhXh51r+JS/3PIzjA3yxf9e1AQAA
X-Change-ID: 20260716-adt7470_thermalzone-59a102278d72
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-pwm@vger.kernel.org
X-Mailer: b4 0.15.2

The ADT7470 is a temperature monitor and PWM fan controller capable of
monitoring up to ten external temperature sensors and controlling up to
four PWM outputs.

Currently, the driver exposes these sensors and PWM controls only
through the hwmon sysfs interface. This patch series integrates the
ADT7470 driver with the kernel's thermal and PWM subsystems. This allows
temperature sensors to participate in Device Tree thermal zones while
exposing the PWM outputs as generic PWM providers for consumers such as
pwm-fan.

Patch 1 adds the YAML device tree binding documentation.
Patch 2 introduces the ADT7470_PWM_MAX macro.
Patch 3 registers the four PWM channels as a generic PWM provider.
Patch 4 registers the external temperature sensors with the thermal
framework.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

---
Changes in v5:
- Hide hwmon PWM sysfs attributes if "#pwm-cells" is present in DT.
- Register PWM chip before hwmon in probe() to correctly initialize 
  sysfs visibility.
- Fix waveform rounding math to strictly satisfying CONFIG_PWM_DEBUG
  expectations.
- Return 1 in round_waveform_tohw when the requested period is too 
  short for the hardware.
- Link to v4: https://patch.msgid.link/20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com

Changes in v4:
- dt-bindings: Dropped redundant descriptions for standard properties
  (#pwm-cells and #thermal-sensor-cells).
- dt-bindings: Conditionally referenced thermal-sensor.yaml to preserve
  ABI compatibility.
- dt-bindings: Switched to unevaluatedProperties due to the imported $ref.
- Link to v3: https://patch.msgid.link/20260728-adt7470_thermalzone-v3-0-d4586478cdba@gmail.com

Changes in v3:
- Migrated from the `.apply` callback to the PWM Waveform API.
- Moved fixes to another patch series:
  20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com
- Use guard(mutex) for simpler locking.
- Link to v2: https://patch.msgid.link/20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com

Changes in v2:
- Fixed 2 previous bugs uncovered by Sashiko-bot during review.
- Dropped the thermal cooling device registration for the PWM channels.
- Implemented generic PWM provider support using the PWM subsystem.
- Updated Kconfig to safely handle the PWM subsystem dependency (depends on PWM || PWM=n).
- Updated Device Tree bindings to require #pwm-cells instead of #cooling-cells.
- Link to v1: https://patch.msgid.link/20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com

To: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: Andrew Morton <akpm@linux-foundation.org>
To: "Darrick J. Wong" <djwong@us.ibm.com>
To: Uwe Kleine-König <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pwm@vger.kernel.org

---
Luiz Angelo Daros de Luca (4):
      dt-bindings: hwmon: add adi,adt7470
      hwmon: (adt7470) Add ADT7470_PWM_MAX macro
      hwmon: (adt7470) Expose fan control via PWM framework
      hwmon: (adt7470) Add thermal zone sensor support

 .../devicetree/bindings/hwmon/adi,adt7470.yaml     |  58 ++++++
 drivers/hwmon/Kconfig                              |   1 +
 drivers/hwmon/adt7470.c                            | 203 ++++++++++++++++++++-
 3 files changed, 258 insertions(+), 4 deletions(-)
---
base-commit: 4c2e8c377915496fbe9cc1c9d91a7297aaa01783
change-id: 20260716-adt7470_thermalzone-59a102278d72

Best regards,
--  
Luiz Angelo Daros de Luca <luizluca@gmail.com>

