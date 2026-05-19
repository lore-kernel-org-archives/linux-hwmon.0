Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F5819CD0A
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 00:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151952; cv=none; b=s7iv+K+VREzfbJT8C78aVmJx3aMV0/2bW1pM8FjPGSlSqbTAMY+QuieQxjOchfncuoHo3HnPijXl7RugtuMeRzrEMH/5GXAgVaY7EbUq6drHnIPb+15gEKlFKVtUW235UFklXzyAxsqCrmpt0giciSMr7gCGkRAN6/ANlbSw7Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151952; c=relaxed/simple;
	bh=HCjHp8nP5/G+l7XiIPOg/SVpg2LMy/NGPeNRRYONzyg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Rlmuz1kX3h95JiTb48hdF6Welx4qw55UqxO+xdewnxkcKS7uNwCp/SxtzpDKSsCIsaCr5qd/jfP/KhdabLv1Ew/Z2xFOKKaQ4yYfiWSBqWK6ucIgMvgJ0Ivrazjz2s+62cOlIYvx9GEh+s8U8HAZc6x6qmsQWbDVDSUhQlU6q6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=OKAgfa9S; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="OKAgfa9S"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-132830d8281so11558961c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 17:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1779151950; x=1779756750; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dfc+M41KKN16LBJ6L/v+CbBrNGU8HwF6qMt3gD+ECtI=;
        b=OKAgfa9SE/A1F+ER87gKnDbZ2nX4gCmMairayKIMfNZxIWr/fE+Z4/zuvRYxuZH73X
         t0pGecZdabA6xD+hVlRuPXaaIn/St7Kr2C1SBmKLUxxkgk5h/tYnlASPPd3iWn8f8KBN
         91xYeXhUICsnQ6s7NQdElwJHPIy7mL0YJtlse6odxgLp/hLi4q3Db0znxL1LUmjXNJv4
         8E5Q3Lg9SbQIgDtGBcmcSQIkU7C7XZSPu3TVihO3vIcGLs5MKBS9J20GSH2mxxd41COW
         2rNtCvRQx1HQ3FxZsBQhda5jc7lTQD9QKE1lppPqkYAGb2WEta8TCHaiAFc6O+MFHShc
         mS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151950; x=1779756750;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dfc+M41KKN16LBJ6L/v+CbBrNGU8HwF6qMt3gD+ECtI=;
        b=oPGktsQVRa9l4VGCaXoCinprOg0Ka7yO5I5p3+51P3llUYCOCxmQZUsC/3hpbBC+o5
         rhddj+VIWkxdYHb7Ocmkqc11Sy/bmFecNps9AecoZbabV6PGtCoxCt21SPBBYcmNW3I/
         5WPxFTuenIkjgOKAFayBNA6/s2B+5JIOXzwFs4WzLWfqi5PVfKBFktZTt/RFCq1jknMh
         ZXq8I6DLip2V9CuluG5QwydIzq6QQkqimiKMKBUS9IqMYT9smrJ1xaRgZCHutKfxdxBv
         ubvNGBoZSo8I2lOjPsIIylPW6s0C60k/UUBPvdgS1FjSLSACLN3p1DoWt2yaDP9zmtCV
         pfeg==
X-Gm-Message-State: AOJu0YxbxKd6zbUVcxkMtTJ+lk3s39N7cnkhwuXkVavEXU0oQcBSaHDT
	6+O3LJJcI1M4VU2FLWujPrLP7ri1Y4etBeb/hj+nE8a0bdnual8Hm9aoeNUDg/pjkJM=
X-Gm-Gg: Acq92OG468n2R2D8AZy7MmZYOJ25cZ9K7T9zaREnK3jNYHkKZ3tkkJsYc1JGXeX1UEL
	kEWd17wm9LoysO0EipGjCknK1xCQnDioo0KI449ea7MBrkaeJ84aSM+eMEHFYIvDuk32lFuSVlm
	QiqHnoLxmkxk/vvqSrlHGpTyFwyWx6qo36Mk7+ENEdRMBvP7RwinstCg3jIX+VYMFaZGqat9F0E
	m3TbfEor4pFDZqSBoVK7w8StWAIgqHq2GBxvJ7bLkUnF6XkiZiqYL6HTaZguIUVW/QcuGfRSB50
	otJnsTr+2So5EZyqDt2r4C/fE0i5gmDZzqNmxwX4hUzy1Iiw+lef3meoDZp8lXk9VqQp4yyqILa
	ALNGHFNxVJyBHEHlJknNNd55vl8Io3AKOx/lGehJLGpoKacFX2Qv0iqutY02XIcffRFTlUttsRK
	KuarIf/0AdbmsD7exc5vKZLowBMvdt09LCUyHJ
X-Received: by 2002:a05:7022:2512:b0:135:3025:be5c with SMTP id a92af1059eb24-1353025bfefmr6695724c88.27.1779151949944;
        Mon, 18 May 2026 17:52:29 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm22546633c88.3.2026.05.18.17.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:52:29 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v3 0/8] hwmon: (pmbus/adm1266) GPIO, NVMEM, and debugfs
 accessor fixes
Date: Mon, 18 May 2026 17:52:24 -0700
Message-Id: <20260518-adm1266-gpio-fixes-v3-0-e425e4f88139@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEi0C2oC/4WNyw6CMBREf4V0bU0f0lBX/odx0ccFrolAWmwwh
 H+3xZUbXZ7MzJmVRAgIkZyrlQRIGHEcMshDRVxvhg4o+sxEMKFYzRU1/sGFUrSbcKQtLhCpt95
 qx5k5OUHycAqwB3l3vX04Pu0d3FxMpdFjnMfw2l8TL72fB4lTRmXjtfdSW83qywDL3I/T0SApD
 0n8d4jsaBhvufRgnRVfjm3b3uwFi6ULAQAA
X-Change-ID: 20260516-adm1266-gpio-fixes-dbdb9c10a4c2
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779151949; l=7307;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=HCjHp8nP5/G+l7XiIPOg/SVpg2LMy/NGPeNRRYONzyg=;
 b=xL5cweSHgy9VVIOKc2WNr5wxam+TduR14wsYh/uqoJm8FxP3uSaHOATobntB2rrWKD2RHZjLB
 WLsfb8A7R1YDMv3BUss/w+VPcoQgKxMnS4lFDSYkHz+SASjdoQ7et2J
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Eight pre-existing bugs in the adm1266 driver's userspace-facing
accessors and probe ordering.  Each is reachable any time userspace
touches an ADM1266 GPIO/PDIO line via the gpiolib char-dev or sysfs
interfaces, opens the nvmem device, or reads the sequencer_state
debugfs entry.  Five landed when GPIO support was added (commit
d98dfad35c38), one when blackbox/NVMEM was added (commit
15609d189302), and one when the sequencer_state debugfs entry was
added (commit ed1ff457e187).

Patch 1 caps the PDIO scan loop in adm1266_gpio_get_multiple() at
ADM1266_PDIO_NR (16) instead of ADM1266_PDIO_STATUS (0xE9 = 233, a
PMBus command code that ended up in the bound by mistake).  As
written, the scan walks find_next_bit() up to bit 242 across a
25-bit caller mask, reading out of bounds and -- if any of that
incidental memory contains a set bit -- driving a corresponding
out-of-bounds write to the caller's bits array.

Patch 2 drops a redundant "*bits = 0" reset that sits between the
GPIO and PDIO halves of adm1266_gpio_get_multiple().  As written,
the GPIO bits the first loop populates are immediately discarded
before the PDIO loop runs, so any caller asking for a mix of GPIO
and PDIO lines sees the GPIO half always reported as 0.

Patch 3 adds the missing "ret < 2" length check after the three
i2c_smbus_read_block_data() calls in adm1266_gpio_get() and
adm1266_gpio_get_multiple().  A device returning a 0- or 1-byte
response would otherwise compose pin status from uninitialised
stack memory and leak it to userspace via gpiolib.

Patch 4 moves adm1266_config_gpio() past pmbus_do_probe() in
adm1266_probe() so the gpio_chip isn't registered (and reachable
from userspace) until the PMBus state the GPIO accessors depend
on is initialised.  This is a prerequisite for patch 6.

Patch 5 does the same for adm1266_config_nvmem(): the nvmem
device is now also registered after pmbus_do_probe(), so the
nvmem callback (adm1266_nvmem_read) cannot race
pmbus_do_probe()'s own device accesses.

Patch 6 takes pmbus_lock at the top of adm1266_gpio_get(),
adm1266_gpio_get_multiple(), and adm1266_gpio_dbg_show() so the
GPIO PMBus reads can't land between a PAGE write and the paged
read pmbus_core does in another thread.

Patch 7 takes pmbus_lock in adm1266_nvmem_read() so its memset /
blackbox refill / memcpy run as a single critical section.  The
NVMEM core does not serialise concurrent reg_read invocations, so
without this two readers racing at offset 0 can interleave the
memset on data->dev_mem with another reader's memcpy to userspace
and return torn data.  The same lock also serialises the refill's
PMBus traffic against pmbus_core's own PAGE+register sequences.

Patch 8 takes pmbus_lock in adm1266_state_read() (the
sequencer_state debugfs handler) for the same defensive-locking
reason: any direct device access from outside pmbus_core should
be ordered with respect to pmbus_core's own.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Changes in v3:

- New patch 5: register the nvmem device after pmbus_do_probe()
  in adm1266_probe().  Same probe-ordering hazard the v2 patch 4
  fixed for the gpio_chip, just for nvmem; flagged by Sashiko on
  v2 and seconded by Guenter on-list.

- Patches 1 and 2: pick up Linus Walleij's Reviewed-by from his
  reply to v1 [1].

- All previously-reviewed patches (1-4 of v2, now 1-4 of v3, plus
  6 which is the v2 patch 5 renumbered): pick up Bartosz
  Golaszewski's Reviewed-by from his reply to v2 [2].

- Patch 1: tighten the commit-message wording about how far the
  unbounded scan reads past the end of the caller mask.  v2 said
  "up to 27 extra unsigned-long words", but the actual extent is
  217 bits past gc.ngpio = 25, which works out to a handful of
  long-word reads (four on 64-bit, seven on 32-bit) -- Sashiko
  caught the arithmetic on v2.  No code change.

- New patch 7: take pmbus_lock in adm1266_nvmem_read() so the
  memset / blackbox refill / memcpy on data->dev_mem run as a
  single critical section, and so the refill's PMBus traffic
  serialises against pmbus_core's PAGE+register sequences.
  Depends on the new patch 5 for the probe-ordering invariant:
  without it, an early NVMEM read could fire before pmbus_do_probe()
  has wired up the pmbus_core data, and the lock acquisition would
  deref a NULL i2c_get_clientdata().  Flagged by Sashiko on v2.

- New patch 8: take pmbus_lock in adm1266_state_read() (the
  sequencer_state debugfs handler) for the same defensive-locking
  reason that motivates patch 6.  adm1266_init_debugfs() already
  runs after pmbus_do_probe() so no extra probe-ordering work is
  needed.  Flagged by Sashiko on v2.

[1] https://lore.kernel.org/r/CAD++jL=rasuYTot3M8u75PXRgrhbCzpue=pY2Yxx7ymVwhgGGQ@mail.gmail.com
[2] https://lore.kernel.org/r/CAMRc=Md_kjwH5v1JkQz5DxnzhK9yk1t+kjNcHG7P75bdg_16xA@mail.gmail.com
- Link to v2: https://patch.msgid.link/20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai

Changes in v2:
- New patch 3: reject short block-read responses in adm1266_gpio_get()
  and adm1266_gpio_get_multiple(), so a 0- or 1-byte response from
  the device cannot leak uninitialised stack memory to userspace
  through the gpiolib interfaces (Sashiko review of v1).
- New patch 4: move adm1266_config_gpio() down past pmbus_do_probe()
  in adm1266_probe() so the gpio_chip isn't reachable from userspace
  before the PMBus state the GPIO accessors depend on is initialised.
  Prerequisite for the new patch 5; without it the lock acquired by
  the GPIO accessors would race adm1266_config_gpio() / pmbus_do_probe()
  setup.
- New patch 5: take pmbus_lock in adm1266_gpio_get(),
  adm1266_gpio_get_multiple(), and adm1266_gpio_dbg_show() so the
  GPIO PMBus reads serialise against pmbus_core's PAGE+register
  sequences (Sashiko review of v1).
- Patches 1 and 2 are unchanged from v1.
- Link to v1: https://patch.msgid.link/20260516-adm1266-gpio-fixes-v1-0-38d9dd39b905@nexthop.ai

To: Guenter Roeck <linux@roeck-us.net>
To: Linus Walleij <linusw@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org

---
Abdurrahman Hussain (8):
      hwmon: (pmbus/adm1266) cap PDIO scan in get_multiple at ADM1266_PDIO_NR
      hwmon: (pmbus/adm1266) don't clobber GPIO bits before PDIO read in get_multiple
      hwmon: (pmbus/adm1266) reject short block-read responses in the GPIO accessors
      hwmon: (pmbus/adm1266) register the gpio_chip after pmbus_do_probe()
      hwmon: (pmbus/adm1266) register the nvmem device after pmbus_do_probe()
      hwmon: (pmbus/adm1266) serialize GPIO PMBus accesses with pmbus_lock
      hwmon: (pmbus/adm1266) serialize NVMEM blackbox read with pmbus_lock
      hwmon: (pmbus/adm1266) serialize sequencer_state debugfs read with pmbus_lock

 drivers/hwmon/pmbus/adm1266.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)
---
base-commit: 70eda68668d1476b459b64e69b8f36659fa9dfa8
change-id: 20260516-adm1266-gpio-fixes-dbdb9c10a4c2

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

