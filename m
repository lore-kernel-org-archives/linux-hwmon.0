Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4692F30B521
	for <linux-hwmon@vger.kernel.org>; Sun, 24 May 2026 21:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779656765; cv=none; b=Wqx5laDEHSzOI0o8XkNgRagOzQnkjXb9SprVf4WMqafgIGfkvelmOaLpK2Ol1B1q6DZ5a0tAl4T1LoNzGpw3M/CJ5gwIlIzJ0WbBfGpfjHszApXct5Mr1Fo17prv5kdixOgA3Ed8bBdLxpBTtFiEEWUg4KUkiOHU8LM4Royg9wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779656765; c=relaxed/simple;
	bh=8wausxUPOgNLfbiJPcncQ/auFbeylOlT/hS6b0Jagkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=scGbH/ghXkMPmERhSpsTJrOW8DSYlTfrHWu9Uuau9HQvcijUBn5vth6bKj0D2/RXKGL97m9QdXUqLtUMTlfglMFAKFKQMvNhvDf5XYHVqfD6mKARiPf4xhtufZ/TjImpnK1fNI9cR0qXFNymruuiq6HE4Vosm8Wgby20b/5W5lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuRHHHEr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuRHHHEr"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so56509625e9.1
        for <linux-hwmon@vger.kernel.org>; Sun, 24 May 2026 14:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779656763; x=1780261563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M0k7ym6VlytNaWxTXaJuUlFnXBgEzjB0STL4A4y7nWg=;
        b=TuRHHHErJhkfeI4naF+vvpjtJAzeH1dc/0n99drgWSi9KrtS1GdenwTWCx7rxYBXCa
         1gsP9R+BdVGxhyR0/BJYTliTUxOX7/8u53qR4WVvryFVJReVMXJp4LvDDtic8bLSMwnP
         hpzQsrjHr8S1ahZboIQxxgb5ZPsByWSGx2YlYjBbWqJ+HwoQ5VdGX5QufuHM9/f7MuXy
         qKioh1+/6I5g4lS6b25Sptw1Kxemf0JyzJg52odr5mP8vagdmUSAwIMDYbis3TlWuSwx
         Hnsmo9Sk2H1eYWyr25PFpBzOCMMZwcDpdTLBXCLAP9yEvPTe6TmPfF4xXtDe3qbPX0U/
         WbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779656763; x=1780261563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0k7ym6VlytNaWxTXaJuUlFnXBgEzjB0STL4A4y7nWg=;
        b=qldUBlO0SmpPHpr63hQbin5JrO/d1UqxSeHKCIYBL6dmcjGiwu6rYMHM0KKPKEHWsr
         K/TpT5MI3trQ+SVUsDofI4F8mTRZZrysgxDV5fCYo8DBXb2tNMHMnUDe/FpI0Pn0JvGj
         fcCowpvN+DCPmdTmF5THovPTRKu97nszYrOrq8niKwAjD8GxPbQww2ANlw8ngkvwbDRX
         eLMs/Eq8t572v6QStjvqJe1YgJ0mdYQ1DrsM+FxWMUL1aumOiu40Z4jc10E2cuKBCfVH
         j+9R+nzIHVhU7urXxxrk7nsDRt5fT7KWECtZGkbrwgeBKodws9q60ccqjMZsq6fC56G/
         QaLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9WFjdgaFTQv98hM4/FqZZigRaSZriue/gYFrjPDchEG2noROrWqKzzvkeA3KJ0a066u8wn6nUAbe2Ocw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS9VbQB4LvXo0mZlBQKt607doZKWzOmj2gRFEKXmRphi/DR125
	cjD3zHT3xNpu4Obp51kHywzitjWr9hT2WBqpG5oOKulqI+BiB0X242Q7
X-Gm-Gg: Acq92OGrvdwgfCuvTvlikPGG407mUlXAUd53DXul9kihwSbXroiGYvjf7T1+q2dx96v
	MIQaG7IQo8Dnj1AuHjIsA35RV8HmS6TWeiKG9pSrZaFYa1rAsbfyVPXSF0a/ge9feUW95NXNzc2
	iAf5pP7KkSHRzLkgXRoOILR6Xkp3K3s895e+NViPcwWDNkB69cvEZHFzADsUlli7Q+ilYf1KUG3
	YshaHvlKMPbEfYx1pxhEVwUB6+E40Ey0WmXNU8ivPuxdx05tEJ75LZmsPzFLxQyj1W4GX1gLP4m
	U4CRkmp+qD6qelVCvA39cjyCFIpKPAx63N2UabGYUXdeK2e52EYTqSKecBRPEIpatIas3zSeJxR
	upuy7O0SO3SEy2lN6KaTK9wgOCp26OVNlPfuNUjGdV3MOuzDTZK2ybH8JM6i9oc/tCeh9TI+pbE
	YRj7LaWV0=
X-Received: by 2002:a05:600c:4f0b:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-490426c5b05mr191379085e9.21.1779656762434;
        Sun, 24 May 2026 14:06:02 -0700 (PDT)
Received: from localhost ([2603:c027:c000:3cde::f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49059fb42dasm85170925e9.7.2026.05.24.14.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 14:06:01 -0700 (PDT)
From: Louis Sautier <sautier.louis@gmail.com>
To: Sathya Prakash <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	MPT-FusionLinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] scsi: mpt3sas: add hwmon support
Date: Sun, 24 May 2026 23:05:43 +0200
Message-ID: <20260524210545.1333637-1-sautier.louis@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Expose the IOC and board temperature sensors of LSI / Broadcom / Avago
SAS HBAs that bind to mpt3sas through the hwmon interface. The data
lives in MPI IO Unit Page 7.

The same fields are exposed by Broadcom's userspace tooling through
the /dev/mpt[23]ctl ioctl path (typically root-only): IOCTemperature
and BoardTemperature in lsiutil; ROC and Controller in storcli.
With this driver, sensors(1) shows them unprivileged:

  $ sensors mpt3sas-pci-0200
  mpt3sas-pci-0200
  Adapter: PCI adapter
  IOC:          +42.0°C

v2 -> v3:
  v2: https://lore.kernel.org/r/20260518184109.770185-1-sautier.louis@gmail.com
  * Removed stale Documentation/hwmon/mpt3sas.rst reference from
    Kconfig help text.

v1 -> v2:
  v1: https://lore.kernel.org/r/20260512214703.655633-1-sautier.louis@gmail.com
  * Dropped misleading Documentation/hwmon/mpt3sas.rst.
  * Dropped inaccurate concurrency-wait figure from Testing;
    corrected empirical data is in the on-list discussion.

Testing
-------

Validated across three Broadcom SAS chip generations. None of the
cards had a board sensor present, so the testing only covers the
IOC channel:

  * LSI 9500-8i / SAS3816, SAS-3:
    - hwmon device registers as "mpt3sas" with only temp1 (IOC) exposed
    - IOC reading matches `storcli /c0 show temperature` and
      `lsiutil -p1 -a 25,2,0,0`
    - rmmod / modprobe cycle goes through the explicit
      unregister/register paths cleanly

  * LSI 9305-24i / SAS3224, SAS-3: same behaviour.

  * LSI 9211-4i / SAS2004, SAS-2: firmware reports both
    *TemperatureUnits = NOT_PRESENT, no hwmon device registered
    (graceful-skip path).

Not verified (no available hardware):
  * Path with both IOC and board sensors present.
  * Fahrenheit-units conversion.
  * Sub-zero readings (signed-cast path).

Louis Sautier (2):
  scsi: mpt3sas: add IO Unit Page 7 config accessor
  scsi: mpt3sas: add hwmon support

 drivers/scsi/mpt3sas/Kconfig          |   9 ++
 drivers/scsi/mpt3sas/Makefile         |   2 +
 drivers/scsi/mpt3sas/mpt3sas_base.h   |  19 +++
 drivers/scsi/mpt3sas/mpt3sas_config.c |  36 +++++
 drivers/scsi/mpt3sas/mpt3sas_hwmon.c  | 200 ++++++++++++++++++++++++++
 drivers/scsi/mpt3sas/mpt3sas_scsih.c  |   6 +
 6 files changed, 272 insertions(+)
 create mode 100644 drivers/scsi/mpt3sas/mpt3sas_hwmon.c


base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.54.0

