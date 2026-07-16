Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D1B320A37
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 21:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784236912; cv=none; b=XOdfb6tQSV1hNFXiVwHYlu2y9SLIILGPQitVZQRVKRCR2Zm2Dh+t9YmYiaRQbgpso2ycFYRbzH/mMnr9Tn5ShaatAapmzFnSThIsSWCb/V0buSWZdHhWURMlvkJzyun/Gn/dTa7HRQFyJlD1E3dcRe3NjWiWwAIjad3Ftr1/Q+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784236912; c=relaxed/simple;
	bh=whLSJ0SXgzimztpsKVgsGzpL60EQPO24JOkuA65lomM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RpmTnvLU04UtU8kbHWzrozLgGeYvI1rcFGkaeXnmv5CByEYTLnXPbcOI+ggLwLPyo484EbV2S3pvrOm0L0a18OWOX5kkt6qJCQZ3eyxshSLJnmg30+k+52j1j13Sfr9WFWfkjDRf8/2jmYiiJ+GOTa6gr+hmHUA832tDIoOqfi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7QB04ph; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7QB04ph"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81e851aebeeso81926347b3.0
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 14:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784236910; x=1784841710; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HW/7zZX9KkXVW8FPnb8sMDZrgAlTfKu+h2QMjwPAaqQ=;
        b=S7QB04phfG3I90XNLqnVIBhZnUjaYFnUCB/YUjAFNrw1DWIDXB3SJXsHsSoZgh44Dn
         X+e0Vj/UzRJEpKo1S0WBurlid7sdGUObYkrhGVVhaOqdMOZoJmSgaRaDfK/F+WGv/viQ
         YYYDusCnIzkF6tRN+WVfQVLGJOAi4LsXuDv/8ltxXx3M4u/pXC5ytkDUaagbozmgU6RX
         As3GTwxFLKt7Ah5DtiuMT2Pi5T+wdjvKviEt6iaHZXGe8gmmHJaXkZZ5Z7gWV+qAMWkU
         FGDhjn7865ksDJJvDNrcW1BhNx1KrmgkYA4+bh+pSoCZxKihBeodMLEasOFxi1nLoH18
         naZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784236910; x=1784841710;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HW/7zZX9KkXVW8FPnb8sMDZrgAlTfKu+h2QMjwPAaqQ=;
        b=fxayqz27cNVOC5/ucbM3eQnqcs0fL78mUpjMtW86pavC0Cvu2syz2E7v40xnNbhOK5
         F/lTkD07W4E12seSYlt5rlLoJ3Um9rVIs+0a0FX2pxfu3lp1OeY6D9BZUd6lccHfdbsT
         Pl7IHMT4ozrIjsMj1yj2D2F/uAHRv7hRCLrNOxQzi5BY9xuP/Gd9zjInmiVfYZBhBiVB
         h0GgiXTRoHIPrYcEdyVgA3z8AWp34x8FnEKkdYYkz0jzVa6swPYJkmab6Ys0GOfupQid
         K39HgHU/w5Pg3aR50C3Nhei9k8NOYtlG7FRdJnVJ+nYTM6izN9o3VHqQNQcPY1eZj2X/
         qxEg==
X-Gm-Message-State: AOJu0YxdwyXW9cITfL8UsCm/AGU2Fg0/Ei4Kdp1QOQNur+oTyK6C+302
	CTPDihBwj27wuELrMbhEylPsiw8RPTCnuoRvRdmMB2cyRWnnBdB/geGt
X-Gm-Gg: AfdE7cmD6RJtoxrSHr4QFfx1do8MosPhZhV4qShbPFFzCnvGdsyWUGghPIk9wNDRUTS
	DbqLPEk6VLt6NMQPvF0jsH7q8MoJaSscT3jdv2lo1n0JaAFJYMgKjd/jAedPAkbV+vtKbe0emt2
	DwKYCgVsBieorHySCPbZwLskUTtijFTzHIWV4BC5xfIrl0gMpErAm12vv42bEZzYk2vDRT/rZsD
	G0C5jEQC8lMfFLks1i897oG+mUhoWOeprdlJ0Q0JfWEJy18YiSOUmSc6YlQtB76u9NnRhK2QC+y
	/S1uQ5BywE9Z957Z1dTOCXRMvMDXCm0E0d3aF5UtXHlrqDVcgp6k71NjWaB4KAwH0TBbyQXPAfB
	wIUZUKL15RuGwB2pDzbFNBq+pTjxQGzSRZbfNq13uhvgPxj4Q68ypvtF2a1ZSNZMZWzTcA9EZmE
	rdr8eb139lBAh9G6DV
X-Received: by 2002:a05:690c:6203:b0:7fd:add6:f271 with SMTP id 00721157ae682-81ebb2890f9mr105015797b3.49.1784236909541;
        Thu, 16 Jul 2026 14:21:49 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.94.103.218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81eee7fde39sm5026477b3.36.2026.07.16.14.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:21:48 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Subject: [PATCH 0/4] hwmon: (adt7470) Add thermal framework support
Date: Thu, 16 Jul 2026 18:21:37 -0300
Message-Id: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGFLWWoC/yXMQQ6CMBBA0auQWduknSijXsUQU+kAY7SQthBjw
 92tsHyL/zNEDsIRrlWGwItEGX2BOVTQDtb3rMQVA2qsNZlaWZfoSPqeBg5v+/qOntXpYo1GpLM
 jhFJOgTv5bNdbszvOjye36b+Cdf0BBI1ppHcAAAA=
X-Change-ID: 20260716-adt7470_thermalzone-59a102278d72
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, de Luca <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The ADT7470 is a temperature monitor and PWM fan controller capable of
monitoring up to 10 external temperature sensors and controlling up to 4
PWM outputs.

Currently, the driver exposes these sensors and PWM controls solely via
the standard hwmon sysfs interface. This patch series integrates the
ADT7470 driver with the kernel's thermal subsystem, allowing its
temperature sensors to be referenced by Device Tree thermal zones.

To avoid saturating the I2C bus during frequent polling by the thermal
core, the thermal callbacks are designed to read from the driver's
internal cache.

Patch 1 adds the YAML device tree binding documentation, defining
the necessary #cooling-cells and #thermal-sensor-cells properties.
Patch 2 performs a minor refactoring to introduce the ADT7470_PWM_MAX
macro, replacing hardcoded values.
Patch 3 registers the 4 PWM channels as optional thermal cooling
devices.
Patch 4 registers the external temperature sensors as optional thermal
zones.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

---
Luiz Angelo Daros de Luca (4):
      dt-bindings: hwmon: add binding for adi,adt7470
      hwmon: (adt7470) Add ADT7470_PWM_MAX macro
      hwmon: (adt7470) Add thermal cooling device support
      hwmon: (adt7470) Add thermal zone sensor support

 .../devicetree/bindings/hwmon/adi,adt7470.yaml     |  53 ++++++
 drivers/hwmon/adt7470.c                            | 180 ++++++++++++++++++++-
 2 files changed, 230 insertions(+), 3 deletions(-)
---
base-commit: ca078d004cf58137bcf8cb24a8b271397431ba58
change-id: 20260716-adt7470_thermalzone-59a102278d72

Best regards,
--  
Luiz Angelo Daros de Luca <luizluca@gmail.com>

