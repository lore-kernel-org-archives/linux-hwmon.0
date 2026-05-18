Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF4B381B0A
	for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779129686; cv=none; b=dQGxc7UtibxsbZlgAcX0vUrg1/02YhSw3checRmcp/E1VyVWEHbHqldn3Gs480QIVO4sQIHFVhylvFPetzx2wKz+OE9jL72bsjTc+3UgBNmctpoeMC1vL/FFzzCafA6tMQLCmONcwEfngvnffqRSynfzYQ24knbRan9/SNIlqso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779129686; c=relaxed/simple;
	bh=OzEYtXnV85GnF+LqOcz5UNsNvTkWQ53yW9dRfFpIzTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ALowmN2c3RPLU0t66KSHP8BaqmYUgJnNAoqNVzZnl5x0XnlYwrAAfTRuGH0F4Vl1khG44w5KWHR1HtZWZAN5ffpi3PxcUgfiMlwRfngA6+kK9M6KBt0TNOj65WwiGfDW2bUSxlNbbHcU/c0YoJRcSXBnIy8/TJzp4bkxpyDJVKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jo+j94yS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jo+j94yS"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44a044cb827so1855088f8f.0
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 11:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779129683; x=1779734483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U7pmfatTAGCFopvwOxekiavKhWvJwuVBKlcaz6/af+I=;
        b=Jo+j94ySkMhMW7OIVytFRNRxxPNESIum42HrGU3sfwOrtDF6tfKSasKcheKgfyruhL
         EkYIriQgzR8e0NrFAe5n3yuUwSqUHN9cRN9foad99O1j4cHnjoWkdhKAVOf5eOoQVdfE
         qQQpZEMKgYfen1tFlHD97dtCeZVF85YZFIALrGGzBC68PGKkZte9DqDcYGmacElXKtex
         8JFT+qINcM/zr2yqJCIyISp8Jm8JE2fsDNQ0OMfjWuRqHPLmFylgHYOyjGW/VL7nwYQS
         uXkoehVWtEn+ZvLKzcSAd+vgJPY4K8QLIzzoeMT/QfovEGFiL58gbGXNWvnmRPlxAchG
         NKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779129683; x=1779734483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7pmfatTAGCFopvwOxekiavKhWvJwuVBKlcaz6/af+I=;
        b=K7gjJ/anVjUvvvHltRHh2XTf+BVJs0anWOJyZzQFZEkAPrTGzSnEygLS3gmHlB7isA
         hRwT6tn4QDf7XqceaG2Kirj8v+dTd55KfIGke2eH1w0LczlTL+Qi4BhmD4MjUmVBoeLI
         kz//Q9uIXfxlbzNHEE7NR7W/A8S9J4Kie4x/YDBxmz5VWC75mxcanoVXwzrcTKw2iv7n
         lGmbSdORUHFneezXnX1KaR3RTqvFnWaUkc/tFYXsfiBhzKvTPZ9RD0YeIC+14A4BlmKV
         /+FVkXGjAYKkytf+m9BIoyFT+1o/fk/8xVhw+RI/vFor7CkSptRtGYTtJjlZ2zKv9h+W
         jWpA==
X-Forwarded-Encrypted: i=1; AFNElJ/EUFXZN8YbMI3RZalwpGAIpnIzGJOts7dHj+VP6wp7NJSU7zPGnLO7XDOaH9rKUD9WVWGmc793njoN0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw28MXLFjt5FeiJQwmuO8fH07Ozl+gIstQZUd5VFalClnGk9cQE
	JNolu5ATe1NUDBFRnl/2DT9T2axy145ZNild7V8A5b0+X91/dDhv3/i/
X-Gm-Gg: Acq92OEbhozFXcK+wPaX7tsG+1sLrW3Xcg1KpOyTzuDIkUEOxQ11Ew9P5is3loLVSsR
	WjY7iucjxce3dp5vEH7LZzXo6NtOLmiJc8JjtCoBlpv/dRplZhSd2JaNeoTAq/9J6S/UhFNfJAO
	0jKEAhfrdNlkZ9TiJWy+1tbWSR1ow2B5lnXUlHiG8WH4zN/LKI2IzgbQ2r5A4zLF8G+yS//JQ1a
	6vVN7wlozDifiR8ST5UtoiXa+GUKftu/kUGQ8wJu28l6sH2I3HVbjgxq64M9aNfyd8ud7qBDGm1
	b6rQvniwYPKe68m2eb6isb6TaV7tS51b1VXQSxKG9AKJSDD0y4pxrBLUV+sat9hx5tZRRiG06PS
	JXavYZyZ0BP2lkIy8kdQPevpP4Inc1XtpV4S3zrfx8YMSIBoMvHfcP6LcFT62wdjiuvpYtOG8M1
	hBntWeM4g=
X-Received: by 2002:a05:6000:2902:b0:45a:e3dd:586b with SMTP id ffacd0b85a97d-45e5c59a269mr26461049f8f.18.1779129683293;
        Mon, 18 May 2026 11:41:23 -0700 (PDT)
Received: from localhost ([2603:c027:c000:3cde::f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768c4fsm39305594f8f.8.2026.05.18.11.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 11:41:22 -0700 (PDT)
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
Subject: [PATCH v2 0/2] scsi: mpt3sas: add hwmon support
Date: Mon, 18 May 2026 20:41:07 +0200
Message-ID: <20260518184109.770185-1-sautier.louis@gmail.com>
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

