Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C1E3D34AB
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 12:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860761; cv=none; b=lYMc7A/GWthfNwIytf3tWiDhsVbJTFYh2Bm1qfpzJ9dR7Kc3ePQAsTNAXqCpkn3hnemItNZ0mIZusQ8GGGEYbkdxB65Usz143kp/4AkpnreQksd59Ol8OfpPVJm/aoEGlVhdgylzZntrXr6FjW4bdhXe5tAq2uu71dem3gjFRjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860761; c=relaxed/simple;
	bh=bSgaWb5OdbW1L92xuCZreF74sc/lPPhADT2oO3xOFW0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QTPyLfufRvayf8dnbNg3meH5fykfcmccgMp/A2nuVcvNGdWvZzJJEg2Mms3QWxs2Es3p+RCCHx753WQHCS+Ugl0QrfQk/Wq+2brAhn7s41ciacl5aHHrgsQGxynynO3NaLNQ7v31Jnv5MU+QanUPrONSSuzGHUNHF9e/LkmTdME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=Mv1nDMFS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="Mv1nDMFS"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f431c0ab6so2451772b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 05:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1776860759; x=1777465559; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j09n4K9dKtnS6kt2cbEL0n8jsIRoLd8dUYWhn9YQULU=;
        b=Mv1nDMFSic5AtbyRMkonx2HZ1+2PvLlj1/8mh8eywemTbPZyXxQiKL019Oj+jQS5ff
         x7rvFGPDdRtVeqlNoH/d/Er7GtmyIRsAtAaOv+kQvixAZrb18JLE/QYK6V1SxP1qMJ5A
         lWzI2tUAzvleaW5Gellg+Amw4TpcAJyU5azozLTS8Zglcu6j4oScq45DoSdPSPtqq++2
         NrUo22MyfaRQALuC+hrJazWQ1dX28xEeOVTs3F1uZfNs+Nv8q+mY2STBxw+Xlu2Xa0b9
         /fhS3mq/JGbh8PIRkFWdDh+Xcv/DVN1giRg8Kwr65htO7MWVnA1JpGJzXAh12yNiNTMo
         5y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860759; x=1777465559;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j09n4K9dKtnS6kt2cbEL0n8jsIRoLd8dUYWhn9YQULU=;
        b=VM7grdrfNU7aizCw0icvKe9ozACdV5t6TFHQAMypkJ6lwXhu3O4QlyRdmUGx65f3aW
         zneIfsoK3eB+wOV1AwgRS6WFc1ttW/D7rogbtLoMut/YIasuvnYIVoxIADzHMJ+aeqYK
         nEEllKy70MikwFyj/HfxdkkEEmC1kFLMiPf0gKRh1Zb6ARB2jh+t+iZkwTAnvy2FqlLG
         mMmMOeTDGjvAd8wmCv4bWf4HA5QHIKyfxdEuERMsro7IQ8xIZyYIr3TwzHNs7hjAAvp/
         v3ojsW4otN9o7uVKOpBNJc9RXA5A+c65DFb4M18Z3MgNnNfhsw6CbBK5lrCWisf6Im3+
         GIXA==
X-Forwarded-Encrypted: i=1; AFNElJ9jjM2Jk0szxh9TWEaaDVso4peBbBlYeogjCQ7xo22DHppmVMxLPoamtIwGCccfMDrjFvGZ4EM2cy7MAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJKeo7oMCzFMLXmgTrh8AZC19K3Mr5ouul/SECEehXdR4Z9jSD
	uWcA2NnmOtou9bgGeL6eaY5n1/Gxhg1DsAVpZF7bYQnlCRukzbh4TTgKru0Aql4LYyc=
X-Gm-Gg: AeBDiesiGOC0XaScZlS6XfPmM2Nxjfyp/Itc3+6hrB8UsrZnO0wtK8TvlvC7pTZFRF+
	wL89eEUUqg/m/EmNWGiVkLmsuQrItMxKpAvLz6QyDkOFZNqj57bW47Y4Y9RPRCCY31jFwYh9qWr
	PwMpT+sZ3vB5IAarTSQb7OUaRlBawMIgE6Jelf+qLwwEANf5aU00xUSpxk8bBZAqyd8JojPOxqX
	tDITqBig0ijLWH9+D9tl63MkMqF17+hB3C2rXsbViWnCITkCsBKlBbf8ojDBWb6BsLLEgD5B7OX
	w3jUUTvWZXZPy+hebxE1siDIPDqydh6yTgzQOaCq0xo8zkvrcsXHAfKtz/meR2RvhENbRdgBDb0
	RzuQBQsucbCA5sEigGVfPPGgZ2Dic3wNcTbqNYkRIWkKNGjNiRDdRuUpzcizOvnbDSXE0GaUVMg
	IhIoSl35to79SbtZG7BhXOqY4EuAJH7kv17dt1e75mrLeVkFuv/tSjT6YKVEk6Tt7hXSd1j0va7
	g==
X-Received: by 2002:a05:6a00:10c5:b0:82f:3436:42d7 with SMTP id d2e1a72fcca58-82f8c84db8fmr23899202b3a.2.1776860759080;
        Wed, 22 Apr 2026 05:25:59 -0700 (PDT)
Received: from [127.0.1.1] (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9819fesm17218079b3a.4.2026.04.22.05.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:25:58 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Subject: [PATCH v5 0/2] Add support for q50sn12072 and q54sn120a1
Date: Wed, 22 Apr 2026 12:25:48 +0000
Message-Id: <20260422-add-support-for-q50sn12072-and-q54sn120a1-v5-0-b8fb87262868@inventec.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEy+6GkC/53Ny04EIRCF4VeZsBYDBc3Fle9hXHCpdlgILbREM
 +l3l+nEaMxs2uVfqXznQhrWhI08nC6kYk8tlTxiujuRcHb5BWmKowkwmJhmnLoYaXtfllJXOpd
 K3ybWMgemgbocR8o93fi0AaxFFQ2PZHhLxTl97FtPz6PPqa2lfu7TnV+v/1npnDIahNHezRZM8
 I8pd8wrhvtQXsl1qMM3rpgAdQSHgWvtg9aIMWh1Axc/uGRwBBcDV9pN3Ei0wpsbuPyFc3kElwP
 3hqNDJ22c+R9827YvalKah/wBAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Brian Chiang <chiang.brian@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776860756; l=3114;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=bSgaWb5OdbW1L92xuCZreF74sc/lPPhADT2oO3xOFW0=;
 b=jJr5FCiM/WK3CAyxyPWLkZBZ46KIw2inpEIEMWPVyb/0hlLXQdJTSFM6wVAWa+ipAj+4mIHZz
 rSpMyKnPTRuA3GyXF6wPIjy5qcykpeRQkbdvRLk6rTZg6mG2Xjwe+R5
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

The Q50SN12072 and Q54SN120A1 are high-efficiency, high-density DC-DC power
module from Delta Power Modules.

The Q50SN12072, quarter brick, single output 12V. This product provides up
to 1200 watts of output power at 38~60V. The Q50SN12072 offers peak
efficiency up to 98.3%@54Vin.

The Q54SN120A1, quarter brick, single output 12V. This product provides up
to 1300 watts of output power at 40~60V. The Q54SN120A1 offers peak
efficiency up to 98.1%@54Vin.

Add support for them to q54sj108a2 driver.

Signed-off-by: Jack Cheng <Cheng.JackHY@inventec.com>
Co-developed-by: Brian Chiang <chiang.brian@inventec.com>
Signed-off-by: Brian Chiang <chiang.brian@inventec.com>

Changes in v5:
- Rebase from 6.19 to 7.0-rc7 for review
- Link to v4: https://lore.kernel.org/r/20260414-add-support-for-q50sn12072-and-q54sn120a1-v4-0-b81eaea49df1@inventec.com

Changes in v4:
- Add null terminator to prevent comparison of uninitialized data which
takes place when ret is shorter than strlen(mid->name)
- Link to v3: https://lore.kernel.org/r/20260402-add-support-for-q50sn12072-and-q54sn120a1-v3-0-67a5184e93b8@inventec.com

Changes in v3:
- Fix MFR_MODEL detection by using strncasecmp prefix match, without the strict length equality
- Move blackbox_read_offset debugfs entry inside the q54sj108a2-only guard block
- Sort the debugfs entries by the order of PMBus register addresses 
- Link to v2: https://lore.kernel.org/r/20260326-add-support-for-q50sn12072-and-q54sn120a1-v2-0-77bc77eedc76@inventec.com

Changes in v2:
- Drop Q50SN12072_DEBUGFS_VOUT_COMMAND debugfs entry
- Add .format[PSC_VOLTAGE_OUT] = linear explicitly to all three chip
  entries for consistency
- Replace hardcoded MFR_MODEL check (ret != 14 || strncmp("Q54SJ108A2"))
  with a loop over q54sj108a2_id[] using strncasecmp to support all
  three chip variants dynamically
- Remove of_device_get_match_data()/i2c_match_id() early chip_id path;
  derive chip_id exclusively from MFR_MODEL hardware read
- Remove unused .data fields from of_device_id entries
- Guard store_default, blackbox_erase, blackbox_set_offset, blackbox_read,
  and flash_key debugfs entries under psu->chip == q54sj108a2 check
- Add dev_notice() when configured device name differs from detected model
- Update MODULE_DESCRIPTION to "PMBus driver for Delta Q54SJ108A2 and
  compatibles"
- Fix commit message typo: "Q54SN12072" -> "Q50SN12072"
- Link to v1: https://lore.kernel.org/r/20250701-add-support-for-q50sn12072-and-q54sn120a1-v1-0-c387baf928cb@inventec.com

---
Jack Cheng (2):
      dt-bindings: trivial: Add q50sn12072 and q54sn120a1 support
      hwmon: (pmbus/q54sj108a2) Add support for q50sn12072 and q54sn120a1

 .../devicetree/bindings/trivial-devices.yaml       |   4 +
 drivers/hwmon/pmbus/q54sj108a2.c                   | 105 ++++++++++++++-------
 2 files changed, 76 insertions(+), 33 deletions(-)
---
base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
change-id: 20250701-add-support-for-q50sn12072-and-q54sn120a1-a9c299e6d81d

Best regards,
-- 
Brian Chiang <chiang.brian@inventec.com>

