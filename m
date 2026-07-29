Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B414030F55B
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 04:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785300395; cv=none; b=HY6Bnu2xFv1GCU+7942NwUmt2haSGJ2coum2yEouJpnUdWPeUMO6+7VevTK6oEfsADU6InAFPmPMfvZ/kP918hkVNT8qI8zyFUxmW+3Kfqisqa2ueLnWaYDkwsmonuFce97gSRSjm3bUbujB8sF1wc03YlS1fjlerVjGZBm5Ouk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785300395; c=relaxed/simple;
	bh=Fi0vOZ4jalvPpZIuCzGkTKUxkJ5O8zX5z9PHvD/InwU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qgmZOkW2oApIA5nG6O5rl9yMCmypHQjOQKWh5+/y7IMPRd8r6QV38aLUuQgpJzZmWyByUZQDo2rJRXpq6COkAKWgydkeQwWsgldaRCC3NghTferj1VLFfKBqCfSPCufasyCcc8yimkBpN8fv3lTwtDVVPXP7V3mprFnUywHFKwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EuaEPTKn; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuaEPTKn"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so559504a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 21:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785300393; x=1785905193; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ru0XT0Vwee8BIrhpYRN+CuhFxBsS6D9U/jFgcFF2Cvc=;
        b=EuaEPTKnf0idn0iQZ+PhvmnDoYrH0+btpPT+rHbM2kmpywL+Qn8mPYaJNBWiEhprgv
         eENtO2IzuMGC77WvQI6AnL7ptbCfCSy87ZZibUgrHDqIN60V61Z4JeDQz529gBIA+E47
         aG0d+CGHLTyd2Wyoj/f9rkYsftFLZd3vVbYyHl+fyNPS4pbaVMEGucUc1xy9fbWDa52E
         UFbIASgxuNuljXRZS5Yaa5wwdKjdzGK53DOHi9kJI6SVMOO/N0ep99uqBx7t6aXbEutg
         ACJcZhz6U7m2dHf4732Fm9YnKoQEzTOy1v0AsABTiw8re3ZFmdvY4NicQFcOVwVlV/Eb
         vwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785300393; x=1785905193;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ru0XT0Vwee8BIrhpYRN+CuhFxBsS6D9U/jFgcFF2Cvc=;
        b=feaxB4fZApp3y3FM96Pljmj1OK6atyX+x0bhk0n9O49MYVWP/4rptO1xfwijXXMQdS
         xKyTZJi5iFlu2MsE0MmzbnNjnmVhwfJVaChhr5gpFhIkuCs83xE9DhIMGqtWhgYmt8r2
         QH5EdFdWMkLvYsMuiEkiXRLeKaHVu24zaNFJWG/GYNN2hzJL9UeqWnjNgMYP8K6+HTzv
         WO6Hl+hW43/z3oTevzkydSuDtSXoSMoNRG1o2hPXfmXihxBchU/MRSfFw3dP2vUXuS6a
         jWwO2ahSyvrNIKUeReGeTWmQN/FWzmsS3r2eYm8FB/EIlyCqSBMH0Nm/jamJWKSZPX2G
         CZjA==
X-Gm-Message-State: AOJu0Yy8v3C1+mBKw7AkH93iWZJsakhjDnz6e4V2NQHxfJCwd1AHoTBn
	0CVKDbT15Ywg8NAmvHMNBNDYgcHrZyNqf0XUtNsfjOugYK2ia9cEKpVb
X-Gm-Gg: AR+sD11LDGD87fUR9KjAANuD1NPx7qyQPuhcth8r9HRgw5C4ZYoliiNqPKWBqwM9Lvy
	K3LaKW7rpBB3QU5ITG4AwLXzTyxqi2Ptgx+tk2rLaz/pnHZ27OwfZgSC7vuqUa9N1Fq7Zfrzrov
	IS9VMAe6EnjK3VGQE0qkPMswvs7RC1Oj7iNeUQR+kpgweWDCalCeN+gI6sp2m4ZIAM8NSCY5CWS
	/XWF8OhuWAvtrh4jfaXH/t09MGvhhMXHSKiWHYaA58fyeF9ZXrb/ixer+a1mfk4Vdnr+NIL8kBa
	htzij07bMp9+s1jZjkxk7zGqXtsn1H+WbfVJL1UYA0P3W6E94bR3ayGzpfqcqOZqFwVzGVQ3tJX
	HHjeoSF46Zy+jEiedAq0MYRz3q/FaCZ0KAdvnqhKoAbXrNpXoTNbXvdhqLH17acCaF4HYQct97l
	VHRhCk1TyTKovtOBTLRa1CG/ogGlmz+XqZBE5YZupexkd9CUcBY3WMq9LsEy5kEkipenT479/v+
	CqB
X-Received: by 2002:a17:90b:4d0f:b0:38e:5dc:af03 with SMTP id 98e67ed59e1d1-38f6a48103cmr5204321a91.40.1785300392937;
        Tue, 28 Jul 2026 21:46:32 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b6d14bsm4730437eec.10.2026.07.28.21.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 21:46:31 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Subject: [hwmon-next PATCH v4 0/4] hwmon: (adt7470) Add PWM provider and
 thermal sensor support
Date: Wed, 29 Jul 2026 01:46:08 -0300
Message-Id: <20260729-adt7470_thermalzone-v4-0-c14039dfa0e6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJGFaWoC/33QzY7CIBAA4FcxnBcDFAp68j2MMQhTy8aCAta/9
 N3F9tJszB4nM/PNzwsliA4SWi9eKELvkgu+BPxngUyr/RGwsyVGjLCaSFpjbbPkkuxzC7HTp2f
 wgMVKU8KYVFYyVDrPERp3H9Utam9d8NjDPaPdlEvXwy+Y/GE/1a1LOcTHuEJPx55/p/UUE2yME
 NBUAqyFzbHT7rQ0oRsn9GxuyO8GK4YWgnK5EqrR9q9RzQymvhtVMSwXquZSGXvQc2OYTo1wuZa
 f5ukXu2F4A0Q32gBxAQAA
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

 .../devicetree/bindings/hwmon/adi,adt7470.yaml     |  58 ++++++++
 drivers/hwmon/Kconfig                              |   1 +
 drivers/hwmon/adt7470.c                            | 146 ++++++++++++++++++++-
 3 files changed, 202 insertions(+), 3 deletions(-)
---
base-commit: 4c2e8c377915496fbe9cc1c9d91a7297aaa01783
change-id: 20260716-adt7470_thermalzone-59a102278d72

Best regards,
--  
Luiz Angelo Daros de Luca <luizluca@gmail.com>

