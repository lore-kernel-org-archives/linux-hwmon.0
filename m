Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9246D3368B7
	for <linux-hwmon@vger.kernel.org>; Sat, 13 Jun 2026 02:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781318335; cv=none; b=KJeLLEFdn+sLocsL2i+GKC+gHf0UO9h95AsBdrGQQIQ9TuFIRfzP1eWho6k4VnqF6J1dy2acloxKTfaa+X4PuD1BHZmEvBTPqy9DiSdfb+Vrb6UHZg7526ywjtz0+Jo/mkL7/qa7piStpUvg1CvCcflGf/wUiWkmanSQsOzDFm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781318335; c=relaxed/simple;
	bh=sS2pag8ityal4Ke4JpwX5ngMd9Aj2Tc4avCoToagAG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IhMAOMkf4dWFObJMPRA9qv4REspMv15FLVgFEXiSpp0A8FSAtgD/MxyHSZsJUN5VFR4skVniAE0hifFghBErHcRoRbGpJD01igd7gxhdM4q/6HIXimSheJhSb8y+rcw931WLDmMg8Sg03rOlEhESKbVMIx9OnyC9XJHv+qSjb9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZRE1Ypb; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZRE1Ypb"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef29c5561so753592f8f.0
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Jun 2026 19:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781318332; x=1781923132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jQ+NrGH9TGLSeTAEwxLMPtDtSoGteAFo2K5vU8feXq8=;
        b=QZRE1Ypb2TqO1oYlslk7RB4bVR85S13iuP5klm/hQg/ecNerRSE5SN0pcmwvAsxBVI
         jWewQhvidCoT6AzANHA7nch90PifSQDE/laDtyl7XxQpezrLl4KFJ/CFLT4ugC8gOhRT
         44vX4cfoow/6mNNIPq6SUCkm8jrg7ZDEzZ+//YlTAzB9PdSd5Fv9N6pevGF1rXFLYIP0
         SIrB0wlmb9dA+rYVWU4RH7yGqNcOVYE/0RTG8ReDT0bIRnnMzvE9jJm4WTK2Vi/Ma6Y6
         614VetJ20X22nd3l+cDDXBP2XzaOPFAIn2ToANRRW/7e+pLH89mxzxAVjyp71Xo50gDN
         jYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781318332; x=1781923132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQ+NrGH9TGLSeTAEwxLMPtDtSoGteAFo2K5vU8feXq8=;
        b=NbG/i7qsKoU1tew96j2Qk8V0rLm94hLzPUhMNBWpq3G7PvjAPJTp0JSMJkZSDLPwxE
         ykbSqppt+4yr17vpDF9ZJp2tXQNkBve1vmzv9epdB5k9UQC78AOxKlk+0Kz0JjNyh2zr
         69Qes190S2BVMxyuFBMxSmcDD517DLpvyHO2U59O8t/dhoupIxLV0U+MsAzOAt9Sbqyx
         xU2RnHTCMuait/GCcjQFc+6zCSB6/vLREsPxvCRUxkHzzAgeb1etK4ylR4uTgq16lDD8
         peG6v35EGOvbt/vYy0b2ooU5kk1BZCUrKnSfSs/jlksGg47PhZbCBHEbJZ39nD5Do1DB
         spaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8gOQXAaGQjyZWZmXp5XVaYckzT81DFMInM8dRyMsYO7C3vHGVjUwyvEDqKgHlyAjL7kD9AKZ8zCSU2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOHhTTmRxgwFyMmy7u8vKCvM1+LZlxLtuQL8lD3SFtKxkNSJiq
	dCINeAbggHDhlQgokyTG61+rEfO6AkZkzfn73raGdjwSApRnONdQeH3l
X-Gm-Gg: Acq92OGe9PZ3KCOdyaVXa1V0y4r9N3dWvk42A3i2PhO58jisbuRw8/rOazt4MpAge9W
	P5ukL357bH3G4r9DmeSIva4mF396Bar5AxTqm4RU0j0u9OHrdalimQ2nIbmYfvUVtUWuBeLBQgl
	mQCpxAA00RnyfG3ebYcTsBABCcCFpEzdLx9qbn6XvkX5Vl6koKtDbW6XYE3uiyHa02l4HtOzpgb
	uDNwQfW0yWe74YWJC3p/cTy6RjqHRpXCFSV7dwevfdbg2JufPQ/H8gYmwNHEiWJWM+OxjMnBDx7
	DliqjLNnSRs5dPJQYKwnkKsqAFXhv6wiifhBt/ts1W+tq0qf2/tSDMASgk6baQ9vLvGeH7IoEq9
	BwS2/WD5HDIcn4JZBSeu7p3/TupYG7xDvmaxUCyLL90Ww0TQP++/KlDbuCE2uh/KFpaRIV083oO
	AuEwNv6rk=
X-Received: by 2002:a5d:6f13:0:b0:460:1301:ded1 with SMTP id ffacd0b85a97d-46074a800dcmr1840439f8f.6.1781318331679;
        Fri, 12 Jun 2026 19:38:51 -0700 (PDT)
Received: from localhost ([2603:c027:c000:3cde::f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c473bsm11468595f8f.28.2026.06.12.19.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 19:38:51 -0700 (PDT)
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
Subject: [PATCH v4 0/2] scsi: mpt3sas: add hwmon support
Date: Sat, 13 Jun 2026 04:38:31 +0200
Message-ID: <20260613023833.3163507-1-sautier.louis@gmail.com>
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

v3 -> v4:
  v3: https://lore.kernel.org/r/20260524210545.1333637-1-sautier.louis@gmail.com
  v3 (resend): https://lore.kernel.org/r/20260609164423.2829699-1-sautier.louis@gmail.com
  * Dropped the SCSI_MPT3SAS_HWMON Kconfig option as suggested by
    Damien Le Moal; the hwmon code is now built whenever CONFIG_HWMON
    is enabled. Used IS_REACHABLE() rather than IS_ENABLED() so
    SCSI_MPT3SAS=y with HWMON=m still builds, same pattern as i915/xe.
  * No line breaks after function return types; aligned multi-line
    call arguments to the opening parenthesis (Damien Le Moal).
  * Dropped unused #include <linux/kernel.h> from mpt3sas_hwmon.c.
  * Added Damien Le Moal's Reviewed-by to patch 1.

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

Build-tested all four SCSI_MPT3SAS x HWMON combinations (=y and =m
each), including the SCSI_MPT3SAS=y with HWMON=m case that requires
IS_REACHABLE().

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

 drivers/scsi/mpt3sas/Makefile         |   2 +
 drivers/scsi/mpt3sas/mpt3sas_base.h   |  20 +++
 drivers/scsi/mpt3sas/mpt3sas_config.c |  36 +++++
 drivers/scsi/mpt3sas/mpt3sas_hwmon.c  | 195 ++++++++++++++++++++++++++
 drivers/scsi/mpt3sas/mpt3sas_scsih.c  |   6 +
 5 files changed, 259 insertions(+)
 create mode 100644 drivers/scsi/mpt3sas/mpt3sas_hwmon.c


base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.54.0

