Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE413EBF19
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Feb 2026 04:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770353319; cv=none; b=USQ/U4fVHL7BIw2Ct4m8URIuLgWzHc2FeIuT0T3fey0LhuipDIpi2ESG+khGCKWVBDCstMIeYVNHUS342NO8WNcV6xqpq7moGTOLtpXEmWekpWUi+pTkxFOaqjcE1I23+ZGbenS9YRfxU04XPn490UQeGLxzWgyfKExAWKNECNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770353319; c=relaxed/simple;
	bh=Me1RUbn7w+kiDeofgJ0Y0FdxurCiys+xJSEMQtpcvZU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pgo78txx/mU91sMIMVAJQV2Fjxgiuvwl17nLbvrm6k/E5Zf5o9zdx1MLz+hGzkBAzT6MEm/P6Xv6l2NNkmodefNTquUtFw3zdoWRMriWWlHIbCX4O47GfpLhFYH2RflyHbVOz4MmVkcoa/sPPzXtle1V8bZMwPztU3vyJi58N8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Octu+kF4; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Octu+kF4"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-506362ac5f7so2998221cf.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 20:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770353317; x=1770958117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MkuwXGe/3NR1VWVL3G2HV3rx+AextZhCd7p5jLxIlT0=;
        b=Octu+kF4e140wh0pVCfoXHZ2htAc5YZ533a13uLxX+y/if/QSthgAglAnUo8yhbDL2
         4/Rjk1F19AjHMVn/04Rprr7SEcl8Gg9fw+EAwXBCbEOSzWCRJF5ZmzXKvFFTYIeOKN6m
         UdaVH4xh3eO9qDOGZj10ykiDrjqB2yy6023F0s5Cxbx7otkhVRhbAZPX56uWscf12tqW
         D0KlaWN1n33IG0FeVMASs/fU3U5JD2UUiU4UOBPEtnLUKVIn9OeYY0coZ7HHafE4atdZ
         LGt58eAcrpIjoOo30fxSaA+3z2SIcJ6WVh5k4o7UoOc/WY9qX6ZOpMdhT4G8k2M+8emC
         YUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770353317; x=1770958117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkuwXGe/3NR1VWVL3G2HV3rx+AextZhCd7p5jLxIlT0=;
        b=m4ywOx7973yqg46DguOCFHMb12zoWHlwnn5XOvGv5Q5L495pX8FJ4/hmKoMrjan4cK
         Z/pb9Pu5UQyAoILnxFTVh56Aez9vh9wi8dHbQBqYy1fzppECFZ3gozZd2ipUBJxxxNnR
         fu6r4fD0oQa7vAz71Qldzg2FduR+1NuKmwSuGe396+qv8QJebzLQa9oHAKQohz/0QAvf
         xFcNoyyYv0BDFoaDRPdsI6cZl1Xf19qzvWuiQaIvdUJavOZSo60nBjm5YThJezLUzmwZ
         g24Dq4ekTBx9Yd0awpfzWzAphKf+bekMBpCnUbDcm4MbXDlPwi9xt06VSvY87CvpO42r
         lT3w==
X-Gm-Message-State: AOJu0YzxfHN+7rrxLf8FzDbZLwKUqAbDIPpf1Uj34izfMIDtgVHEkX6R
	Ha24OH4wrsdltEfKqUkRVEBdSyTDiS7UwdX/yc5V/Dn0a9nSNKJnqTlbrADWTtsm
X-Gm-Gg: AZuq6aI9fN435HEQc1IMA9klHhXdzPKA2mawxZ7RSs2IiFs8NZnGn2GznhDh1Keg0sy
	7cSDtepAd+ak9vrmLgSbeNulrQnU7uRQcrywio3eL0A/olR7xHdmNj6GwjuKLVkV5J1EXCeof0K
	mySL4mrC5TMVM08txtIYIN8+6PIgXODsHGfcS0Q33Dh3CcsIyg0CvMO+rT4/PScIObEKAJRNp92
	VFrIOWDJFypJ7KeugcyxNoOZbmbxrD6hgy/fPSIvnZOqlI6VTK0u+/TJ7LOSAOMQYVE/SjE5CZ9
	+O5pINlfwNQhMaCUwprPHLWTilnPZ1FcxvfkJ8AfWDTsEOyZy2jvFzSu03M6uIddS/+CUH98BdZ
	PSp1fQkznrrPPoA1oIT8BBh67nG3Db1VveYiXNFMcF9wda3lwm58f8r0Qj20HlL0s2JszNQ3fVJ
	Q1utPn3n2SsnTwRQ/gSRiT/7iJ8R24kvl2H6U=
X-Received: by 2002:a05:7301:3d0d:b0:2b6:ffb9:9633 with SMTP id 5a478bee46e88-2b8564a69a5mr591634eec.15.1770346491075;
        Thu, 05 Feb 2026 18:54:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c3db4asm1018227eec.18.2026.02.05.18.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 18:54:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v6.19-final
Date: Thu,  5 Feb 2026 18:54:49 -0800
Message-ID: <20260206025449.3098124-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v6.19-final from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.19-final

Thanks,
Guenter
------

The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193:

  Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v6.19-final

for you to fetch changes up to 831a2b27914cc880130ffe8fb8d1e65a5324d07f:

  hwmon: (occ) Mark occ_init_attribute() as __printf (2026-02-04 14:40:36 -0800)

----------------------------------------------------------------
hwmon fixes  for v6.19 (final)

- occ: Mark occ_init_attribute() as __printf to avoid build failure

- gpio-fan: Allow to stop fans when CONFIG_PM is disabled, and
  fix set_rpm() return value

- acpi_power_meter: Fix deadlocks related to acpi_power_meter_notify()

- dell-smm: Add Dell G15 5510 to fan control whitelist

----------------------------------------------------------------
Arnd Bergmann (1):
      hwmon: (occ) Mark occ_init_attribute() as __printf

Gabor Juhos (2):
      hwmon: (gpio-fan) Fix set_rpm() return value
      hwmon: (gpio-fan) Allow to stop FANs when CONFIG_PM is disabled

Rafael J. Wysocki (1):
      hwmon: (acpi_power_meter) Fix deadlocks related to acpi_power_meter_notify()

leobannocloutier@gmail.com (1):
      hwmon: (dell-smm) Add Dell G15 5510 to fan control whitelist

 drivers/hwmon/acpi_power_meter.c | 17 ++++++++++++++---
 drivers/hwmon/dell-smm-hwmon.c   |  8 ++++++++
 drivers/hwmon/gpio-fan.c         |  6 +++---
 drivers/hwmon/occ/common.c       |  1 +
 4 files changed, 26 insertions(+), 6 deletions(-)
