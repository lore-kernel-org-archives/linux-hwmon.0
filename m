Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F83832AAA7
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 22:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782859827; cv=none; b=G6cfMrCq6zME+eEToXTO/xjXqVeCqIRii2rcsDQvHYNb1C1RHdq6sKMKHiLWJJ9MlmrG79aI06v8iFvtbbP9cMQ7fJ2GRiRUVtI+1ptNhPs+gi/Io7LngOMvVxve10thAPJIArnC01LwzEMSkqfIOdsLsFJFIKd53g2eyKK3Wvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782859827; c=relaxed/simple;
	bh=h0nEkFK5iCINNRXs0tKxBk8KKC+Staf8nUhpt5lNdKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i2/p2+Zu3n9XY2BPHCN+562fhnl5lim2Vsb448vPZVtcYs13vtr5c6ZPCeND1HmNuInpcGvIe/Vplfbal4n1CUuOcEGU+0Oc1TV9H2I5k/jhglASGmCK4zU9/WojGsOixZuHWX4ifCABlkiXkM1/L3oEg4Mxv8Mhu/VmrEoif7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/7CJw2f; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/7CJw2f"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4924593f45dso116325e9.1
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 15:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782859824; x=1783464624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1MCTcDd/YFCbUyBVWxYxg2TqJHV+16IIRIXuz+3T4+4=;
        b=L/7CJw2f07dJw6Hzr/oDiupaYSd8Y7hR/FVYulMU6DuuVBMzueLTIaugZjS+vjgWnI
         pBpawlivoQ8V9sLg8qobAPlQEC/xyCfwAfevJv+v4F6ZR3S+VwSuYNUHJMX+m8D+WyNr
         3jrS0koCcrdL691UiL8DlIs4+vXlsIw5NyydzdOEia9bzDOINmBlewVEvllBU6z2dvya
         8R+sVUWywv1DpjSAPBG3bQoNFDnURIPKBJRuJDk3BUKRzboakpvK+HnzHpud+EFgmohq
         Vg1SZQ3FNAeyo7A4q6S2ZBuTCVnyW+AQASr1c/A+D+TFWhFzOCtRvUAi4vH+OB5+Tvv9
         B5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782859824; x=1783464624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MCTcDd/YFCbUyBVWxYxg2TqJHV+16IIRIXuz+3T4+4=;
        b=BtF1cY3q3pQvgQSYxIBjV0sO2vN3pi/3tMJbs3Cx730xEVAvv2wxMzc7lUUjvXT//Q
         KMWbhlTGIQnN8PAPxn6izfPzrN0b4hFuk2sWQw1pp1ipgiBFRNHfKIRC4LJqAT+/6mUL
         rJXI8j3vpdm7H5uQQnktsV3WUu7oekgqdaNJ8IMGQmAgoXLkxHPGsi4FwUmqGV76PU/O
         3ZH26PIt/kq++HkHY6f+L8g8MCMCdSL3ov14lwadFBaoXkIwT6A2K2xyAWR+6uZHpjzz
         kJpErSZcAM0U+a1JoYN6dySRBrYPkmJGQowTk+2Ck4ekF6aLZSjWOeU8/XaePfJ+HPTk
         Mgyw==
X-Forwarded-Encrypted: i=1; AFNElJ/jtsoxyyCZnMrjKj17JzwD/DPbhZLg/eZEYJ3Hip7nLrHg3SBhKOPWKIw+qAzJy8t4WwCDLp0dHDdRLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz2H/PJQGP9z9VsY1sd4M4X9juCW0L5jh0OmpHsPMO4yQEVN8G
	WxP7pwEyrgrvgRsyJy817HiQ1GR8i4tSA6tfwpVCb3ao6XzRzmtq1QJv
X-Gm-Gg: AfdE7cn/bH7lqNIHrHYQw/TRUcd53WN8FinAP2R4lAfUNxaCmd6BU7f7EHOzFwOgn7M
	2FiIVyy3YQYEW1c2D0aerLK2R8G35zVOp0ChcnMxCF6OD6os4RIOUlxWvEl3SL5vORGREosB95T
	7zXi1+QB2nVDnBvZMoFAOdM9A8qFlDvoHGcnSp5vHV7rrquNghFHYDKve120jkQeT5u4GET8gNF
	BWnU0s2LeGr4OEgH4EGqVq7sNwabxeDeiH9EVIdAFJFXjqv+tXDpsYbhdBbZRe7Bi+5V1uCvCHd
	GGXrSoVTjxHl0PkCXhGJ1p5dkKwkVILQNmZF81DvHkIvi1JihhzYVLdBlPGMlgyib5JjZ32py8G
	WFSPzF+Y8UtciESDjSu9zESdFkACuyw+07NHnVlYTAEiFZd6wMARQkPYEUYyOM3UsAiVM7CW6gs
	ErtYvyp4Y=
X-Received: by 2002:a05:600c:4e8f:b0:492:67df:3dfa with SMTP id 5b1f17b1804b1-493bda87dffmr35891265e9.34.1782859823475;
        Tue, 30 Jun 2026 15:50:23 -0700 (PDT)
Received: from localhost ([2603:c027:c000:3cde::f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be81fca5sm31793945e9.14.2026.06.30.15.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 15:50:22 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Damien Le Moal <dlemoal@kernel.org>
Subject: [PATCH v5 0/2] scsi: mpt3sas: add hwmon support
Date: Wed,  1 Jul 2026 00:49:20 +0200
Message-ID: <20260630224922.2543096-1-sautier.louis@gmail.com>
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

v4 -> v5:
  v4: https://lore.kernel.org/r/20260613023833.3163507-1-sautier.louis@gmail.com
  * In mpt3sas_hwmon_register(), read IO Unit Page 7 and test sensor
    presence before allocating, so the no-sensor and error paths no
    longer allocate and free (Damien Le Moal).
  * Added Damien Le Moal's Reviewed-by to patch 2.

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
 drivers/scsi/mpt3sas/mpt3sas_hwmon.c  | 191 ++++++++++++++++++++++++++
 drivers/scsi/mpt3sas/mpt3sas_scsih.c  |   6 +
 5 files changed, 255 insertions(+)
 create mode 100644 drivers/scsi/mpt3sas/mpt3sas_hwmon.c


base-commit: 5d6919055dec134de3c40167a490f33c74c12581
-- 
2.54.0

