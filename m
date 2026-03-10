Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456503876D5
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Mar 2026 11:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143035; cv=none; b=QuF/XbopQEZZ+F8jakm6lkW1g4GrFynhkg7jXFfPakGxvU8ncEA2vBt+zHQLd2KPczQagE4AkVodNWOhSiGk1ZLzltepP9K5+Ttt3kwXlA343jzP40Jp9s4TMOk4qpOoaEEI0nuU7IxJXFl6tVd2XNgZ+vWQzdeUBLS5459aGaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143035; c=relaxed/simple;
	bh=/ZwpLzPzz6NN7YpRXM7WmSRAUyGlvMPuteoUVodjgjQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mc+BRS1+VvqISUEjTUt/SzjYQYoVV6/M/qReoVzr5ybbQNbIfA2cgcsQIrYGU9Qmlv58P47X5fccxO6fDuBQFjmEHzATgdJYR6f5E3z/HvGpCvgSrYdhksCzptqJnOQLm3mvDTF04eJkw7bkDy6D+w6rq+ybNXMpHK8P3aN6WrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=P8LbS18Z; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="P8LbS18Z"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-485345e1013so18813655e9.1
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Mar 2026 04:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773143032; x=1773747832; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qEk8/U/fcM91kdGi0mP1J9Pt6ztju/e0Qdwqcsxc7do=;
        b=P8LbS18ZAN4lVTm2G2cxbZN5fNSSqrbZ5UkKLNsEoslJIGJlrpItpvokIAxP0BMKE5
         XukziXil/p/H1wm41YhUiQn11p1zIri13vTsKyKQyoBst9Myoy3FApN5/QKRWYlR8O/w
         1jh35Jqr6RCCt2hcyrH83eOO4VozFevIzjT3pMlaVOA7bw7+xfjozgGYCjiLuGK3kcXv
         AYZXKzVoSUpgs74YuhgjPumHcDaLTOHsODWXtWbYltlUZDqKKO9SsDmFwQ1LZWYGdX6v
         EU7SWz1TnjZ8h+uh/H2VVGsivFSeHd9L3ag2wxzSiVpcNiR8GG9/HgBONnpHgidn+txi
         nU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773143032; x=1773747832;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEk8/U/fcM91kdGi0mP1J9Pt6ztju/e0Qdwqcsxc7do=;
        b=LePLEWHmkLrl2QZd/hhPjQM6vPwM8mQm6kjZe5bx0/MvN9EsXDzUzbOm9UqSaPShHp
         8hJUb5E4aFINwvlDkCKcI5HJvPF6jsOPH4/tqYtC7Ky7sxFWLkhs7f5DHeh738sLSbc8
         DQ5raX6A161NOKOpIciGdHgY5pi9KZFIbwBoQ8UihEcPx5Je1mdqDBauAjHuciRHY7MU
         9ZRav+Rz5+VFXtFPPDKFFRO9ktlKG2hJNHTGxU5oMyn8dwKHJGFEIrtd/E5AVqocL2iu
         xS+l7mYpPqaOGAvZp7LmnOVovAmthxULwmlbiwMKadlorlPX7ZodSyLM+B3RZKVZ6kG4
         7IfA==
X-Gm-Message-State: AOJu0YxihQoKZ13tOeNj2p4wDa5o4xP0W1vCziT3Yr4yALqkLOhK+ZAm
	HM8a2qA6aoe5CIE0y99aofaB0hOTex74dT5gVkLOS/WNF9dq0jdUkCAxN+FV1UYkKFs=
X-Gm-Gg: ATEYQzyLMWl19nHGx06jbNI0NYxHWB63jIQUOHHe4co4kTpRuSmSGDwrWtCukbop24W
	2xhqsDL1GeJ60UEOJ0HgC0Qh0BWmjpQNyjKnMXyHZqpc4IwlOkHvIlvnyKXOpnQsmQn0IYGMbFF
	tAJ5f2mbc2zKJOSM+4XNOwgY8Md/kGDFijFskwpZAm4AVXJEvtXPmZon5EiZ32Fx+xENk0hwTnH
	yLlsyRLpmlpj5unq364FL642M66rW8OeWGX7OIq9URYrUJ0+DItF+5sDNdZAqRu+ShHZT2n3ybW
	irtowqQV/PKqUL99rpVo1j+QjYnaGMLNer0A+VKh0Lox8IOxnNZ+1phWxi/bph188GRnWGsdbqI
	7xfn6laDpu7YNLDNop1fP6MV9dl5+9VN99C1zWmEC6NsnjoeZAiVc8dELTV/8EEtd8aXaaBWcq1
	lgYMfUVBFbeM4XwHnrqFTkOZlc7Td+qMmH3/7pbCrDvVZMXhdpbWWA1H+wxuRCFbRMZCOwHcKj6
	V0w4A==
X-Received: by 2002:a05:600c:4509:b0:485:3b4a:f707 with SMTP id 5b1f17b1804b1-485419de2fdmr49362845e9.10.1773143031544;
        Tue, 10 Mar 2026 04:43:51 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a7f182sm96234825e9.5.2026.03.10.04.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:43:51 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v3 0/2] Add support for Texas Instruments INA4230 power
 monitor
Date: Tue, 10 Mar 2026 15:43:45 +0400
Message-Id: <20260310-ina4230-v3-0-06ab3a77c570@flipper.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPEDsGkC/1WMwQrCMBAFf6XkbCTZJNX05H+Ih9Rs7YKkJSlBK
 f130yIWj/N4MzNLGAkTa6qZRcyUaAgF1KFi996FB3LyhRkIqAVIyyk4DUrwk3YCtLDSKM/Ke4z
 Y0WsrXW+Fe0rTEN9bOMt1/TbA/BpZcsEttNKjPUuv60v3pHHEeAw4sbWSYTeVgN2EYhrTauul9
 eDaf3NZlg90j7wi2gAAAA==
X-Change-ID: 20260219-ina4230-74a02409153d
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4023; i=alchark@flipper.net;
 h=from:subject:message-id; bh=/ZwpLzPzz6NN7YpRXM7WmSRAUyGlvMPuteoUVodjgjQ=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRuYP4RVvN37pVHtXOMFhm9i/V28eV135edKOe53Cdu0
 9egS+tfdkxkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hoY6xjpGDFycAjDVpjcZGTpdymsvvzv6c97Eq4mhB6s+HZb+Vv057L0vf4xW81XW078YGb4X17w
 qXeifZGqwdP5P2TrO+R8mzLzCcXvzkzCOmOvZ3FwA
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
 drivers/hwmon/ina4230.c                            | 1066 ++++++++++++++++++++
 5 files changed, 1219 insertions(+)
---
base-commit: 343f51842f4ed7143872f3aa116a214a5619a4b9
change-id: 20260219-ina4230-74a02409153d

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>

