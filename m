Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A0B1AA1D5
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198153; cv=none; b=BMsVvC1saGS31SvQWNTiTuI1viCa1i/BbjUkLjmF2roPYx/zR+TZO5JP6t4du5x9eLQb6fXe0E+8LmzNBZ9VtUml+doELL8WqJWRfo66poXno6Q6bF0ZU0emRJQSwp9ju3rl5JG4oGpBT5BvLFY56oNBuUFI6+hy8BRJItqW5gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198153; c=relaxed/simple;
	bh=jEZfQ7pBjQS9Q05BRDHcrBjHv3qqJ+ZMsKD81JGtnMM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ee5ATZyE8eBwBQ62eDoso2LLCWpwrPx9fQJidqfzXALBO/8zpwmqtkyv5EN4q8IpRjF4ZQRTjKX5LdXCGXbl8buoPKiMX0C8304Y7NH4TbgsK7EBcD6e6B9BMjaS6cq+cnP/5iVtze9xkwPWi+VBsbjK3LmuuljHr6mhrH4N1kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ockjr02q; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ockjr02q"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81f64e8dfbcso37462337b3.2
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 17:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785198150; x=1785802950; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hKqAp+lXFK1ad3gSFCI8Ii70s2A3O4pmj5AJJWSJRc0=;
        b=Ockjr02qT24ZQurpttdNa6fbagsWnMa5ALiIZuZZtvhL2X7mj55WGf1RWNKZoXdm/A
         EAVVF5u926+blIV6qIrTZhtspWl/h612XSb0rpfU7iYc/RSx8w8WHytgtmTuk/aKJftw
         /bJKDR6pLvIcN4GV/NYsSBvDdhCJnnao8/jtsU3iZAT4nehbz4LkB0xmnL4MnPtu1iV8
         nEmg31Q+DEKP5uFr3sXl2QY7xc1xzuj6YezudtkJAQdHgZfY1J7w/DgDjlhodsr4Br2K
         eXgmuuFjWbVGCbwlZkLfdg6gcfOcKYCShyLCTd2KtipO81u3XsW4M3yeJO57xnzNoMrg
         y7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785198150; x=1785802950;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hKqAp+lXFK1ad3gSFCI8Ii70s2A3O4pmj5AJJWSJRc0=;
        b=FtPq6+doZPdp0fKwb8uBctXpxVficmFoIHiogMhqP2nmK9eumRVh4Bf0qg6fMYpsTX
         EkW4HqfvKmT9S21XPy+fzVioa5/2Hii+vZnF87MnJRxYOgRKHzCeDr/zm2xCM8u4hXd+
         YY8znLv7mjodu5cyHSbbuOtCB5MVk9oyygY/EKx91lUHnPKzxPMar0GpCchOoODHoKJt
         kQrOaETYLfiQ2ceI0qN2E6WvMCwuVkYED5WwRlyuQ5rajs4nm7sS7q7yP8VLDHi2UThm
         ho5ow+AqaRmrN8T5dxlXzwC+rQgjIVBMrZTS+m4kHPY/oISXgPmt6HUIggQVdkYVmCAc
         5jVQ==
X-Gm-Message-State: AOJu0YyQ7U6Ohq8E+vh5NSNyrZOlfbfAy3jqSTjFBYHn6zPMGT9q/AHw
	rvUSgPsSClnL61YC2Hlh1S2CyVS+TjttnHodT4f4hJPO24hSde9Q+E/+GS3/WvRA
X-Gm-Gg: AR+sD127EGNYbupra5U6jFFv6VP6w6rUIXRdByKDJyMXbfdTET2FmWit71GySifZY3T
	ZrKk+9XbCdjCN36+t+nM+HI5x58M/pSWyxO2qrzmHQP+1PvRPSA1+N3132ij6rJy3Wxa1THCio5
	FaCgaol3C0zQ2dRGZSpqbzL60r8z9eZfUHYwKiATwBZH5+RY4zm5URwjbgIKJudeN9gMwgyNJJX
	UoLTVEe2Gn7HH9nNQrnU/rMKaWBimLlkdsVIUdmwEa/3dcoGX0F78Ld+HKNdBwPe/6EUYVlck69
	orgE/Nkqp/UMfWEWmv7uXGglWePvxQIDLi3GKufeIXoYQ+iEcTbDSQ6wf9P3hd18HmiSS7KFyrD
	IlfTmQ3wQCLIwAvZsVPkhXwxWqI+hPfdF1zl98rbvXS1ZdpR7MCmBF0VKv0vMp7lVzcBWs0y+Le
	RFmjAqSet9cgWRuqoChg==
X-Received: by 2002:a05:690c:4b01:b0:80d:c24f:b790 with SMTP id 00721157ae682-81f991fab62mr562557b3.5.1785198150431;
        Mon, 27 Jul 2026 17:22:30 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.65.210.13])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f655acc7csm39583707b3.0.2026.07.27.17.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:22:25 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Subject: [hwmon PATCH v2 0/8] hwmon: (adt7470): Multiple fixes
Date: Mon, 27 Jul 2026 21:22:16 -0300
Message-Id: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADj2Z2oC/12NSw6CMBCGr0JmbU07AlVX3sMQU9sRxlgwLaKGc
 HcL7Fz+z2+ESIEpwjEbIdDAkbs2CdxkYBvT1iTYJQ0osZRalcK4XudaXm78oSiKg1ESUe+dRki
 bZ6AlSJMzNG+fzqrVjq/rnWw/f83FhmPfhe/CHdRSXxGo/xCDElKgyjF3RSHtzp1qb/ixtZ2Ha
 pqmH14LolrDAAAA
X-Change-ID: 20260716-adt7470_fixes-59a102278d72
To: Guenter Roeck <linux@roeck-us.net>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, sashiko-bot@kernel.org
X-Mailer: b4 0.15.2

This series fixes several issues in the adt7470 driver:

- Restore PWM configuration after I2C failures.
- Avoid cache corruption after failed writes.
- Prevent busy looping when auto_update_interval is zero.
- Fix incorrect temperature alarm reporting.
- Cache the PWM frequency and fix error propagation.
- Correct unused PWM auto-mode mask definitions.
- Fix TOCTOU issue when reading fan data.
- Fix PWM auto temp state array corruption and missing bounds check in
  sysfs read.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
Changes in v2:
- Added new patch to fix TOCTOU divide-by-zero crash in fan speed read.
- "Fix temperature alarm logic...": Added TEMP_ALARM_BIT and
  FAN_ALARM_BIT macros for clarity.
- "Use cached PWM frequency value": Fixed incorrect array indexing by
  caching the closest frequency early.
- Added patch to fix PWM auto temp state array corruption and missing bounds check.
- Link to v1: https://patch.msgid.link/20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com

To: Guenter Roeck <linux@roeck-us.net>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: Andrew Morton <akpm@linux-foundation.org>
To: "Darrick J. Wong" <djwong@us.ibm.com>
To: "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Luiz Angelo Daros de Luca (8):
      hwmon: (adt7470) Fix fans stuck in manual mode on I2C errors
      hwmon: (adt7470) Fix cache updated before hardware write on I2C error
      hwmon: (adt7470) Fix busy-loop and I2C flooding in update thread
      hwmon: (adt7470) Fix swapped PWM3 and PWM4 auto mode masks
      hwmon: (adt7470) Fix temperature alarm logic in hwmon_temp_read()
      hwmon: (adt7470) Use cached PWM frequency value
      hwmon: (adt7470) Fix divide-by-zero TOCTOU crash in fan speed read
      hwmon: (adt7470) Fix PWM auto temp state array and bounds check

 drivers/hwmon/adt7470.c | 129 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 92 insertions(+), 37 deletions(-)
---
base-commit: 7e12ea5aae19ee07d466e9613ccba753349c9c1d
change-id: 20260716-adt7470_fixes-59a102278d72

Best regards,
--  
Luiz Angelo Daros de Luca <luizluca@gmail.com>

