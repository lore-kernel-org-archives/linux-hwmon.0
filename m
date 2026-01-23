Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE81C242D88
	for <linux-hwmon@vger.kernel.org>; Fri, 23 Jan 2026 18:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192535; cv=none; b=tntR7cPREhDS9UbGDJtGVEDCDady/gdm26DrMbaRxntpUvLaQwlHWSb70wi34tMiS1h8SevVXhljJoYbzrPBNavAMptPoHAu+zyarGYyWUWzuNuDVJcfgPzJ9wl99ZBdhmtbhYbxCQ6arMVwMu7GbCeM7p0nx1xNvN4PcTPXycg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192535; c=relaxed/simple;
	bh=X+vzha3uDsnPnM+IM+PTr3EVnBo+QCUEiYzUQt4XCrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t8sUzaNrROpZ7+S+sgr7AuLQ23EVBQqVVfUZpq6jltXUSnLygELs7NBVL4Eufvvc+eZrB8rvtSv24FRaApa7XreBS5k6Tu0LxBzYnI6eMRjuU+WLwq5wDbBjtk3XBRj+7HFJoYrABUHN3RhOaWtcyDw5mUsEJ4ESG4zhK4iuxWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYrhmwqz; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYrhmwqz"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-81e93c5961cso2267994b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Jan 2026 10:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769192533; x=1769797333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pvSsAXU8r7zmE5dE+V63iueefcjWX6018262qDf8VSY=;
        b=aYrhmwqz6W6u3TGXYebS6fKpJnKR3WRiXRN8fcxS6m3pRt+WrF/FIgqsm8vJj30f1t
         UJtbLoDjMZwMqTD/01mh3rM4GUVpR/BkP1Bp/kfaAt0Cp1LrHbt+gm6MHklpiGPYevFM
         G5dIoE1PxUlECOLDfBR5Qb+kdWtxpstTe1xtbNe1t24KQnZuFSnoXAVAJIGRsNU8Yo6T
         P93Fr6/63SysJuB7Qdb2Kf1wwK0oTWizqtpuD811nlswPsQYOt9KKCynFkrAPgCFO27n
         rPbhVBMXGJBY2aJj0rG3gQKoMlj4eRlLb4YkzfLT1hh10Z0bTPEpZi7TQMrxgYUA7Rrx
         atqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769192533; x=1769797333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvSsAXU8r7zmE5dE+V63iueefcjWX6018262qDf8VSY=;
        b=g5xi7Dgb0Zl8vns0ISV8cuJmG9nL4XqLYWprHyxrjlao3bGYQdyc7kS1zvbTNEui9E
         bt5HlYOtL0CTLnH7kU7T/dJ/yffhu1Cnc9/C9xgu9CD54sC6VIpCKRlu+YP8ONNAd/Jt
         sUE/0R4qV1iN4v4AMLZDz7j8NorwYRnWFO2sR5xfUmOWisHE82TCkif9q+b8m+uFaa4A
         riW1AYK8fXJYmw2q8eRlCGLzRqxoYcICRlofRLvrhqqnr218imBNiRyMig3bnAWcNADb
         kI41OI6oKq2Y+nFTMx1fIVwnlggFGEfdHjDnuN0HZTPafWpBVpuVj7xMiUToOGNFb93b
         WKUA==
X-Gm-Message-State: AOJu0YyOACUE7OMO17+jAuDF4sYVCePicqHb5qmsgO6Vwi+379dvVgFs
	qbo47pYVZEUg6pcuTi9R+TWpHvojcjcxvHl43rzDWX9+JKM+EfyLXenxnT/IeC73
X-Gm-Gg: AZuq6aLtq86gb6tDBU2K5zcjp+p9evbnyCuQWRrgxPTzOz1UldCP36ZWY+SLF+6tixJ
	pKDZlay9TcC0qxzT1jkFw3PqcTAh6ZMkU0Q8dFusN5AIAlXAYHKex1kbReNtDu9t06iNl9h4bRy
	i/fRsf/ISCr6i0QL/y2NblxkgQpnB8+iwO/KyKmYS3epgzoGR2BIdYvR0o+50+6+vfoG3smXd6T
	K5m6egmrF4JA0HlqxNkcJXn+A36Qqisvz/eILqE4cxfN8K2WywnRMW6yARLgQXn+6+6j1Ia4QJ9
	SDT4NKkiNKEEjWpOcflvx3Behi68Y5wFBnISLfDqA3JhVBFxECjH4ybnI5hr+8aIajNHgdZBPY8
	T8vvVcwD8C/n3MAQs/O+Tz3qTiizjeHjpaImF5uFOCRF4U7KNIxc66ZsUxYVlLqPN00/ZSkS8b9
	Tr7cj1xLO+CF91UKctmgXtIR7/
X-Received: by 2002:a05:6a21:1505:b0:389:8e40:a13a with SMTP id adf61e73a8af0-38e6f7bfaf3mr3839713637.52.1769192532855;
        Fri, 23 Jan 2026 10:22:12 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a43c795sm2688079a12.34.2026.01.23.10.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 10:22:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	lihuisong <lihuisong@huawei.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH RFT 0/5] hwmon: Introduce hwmon_update_groups()
Date: Fri, 23 Jan 2026 10:22:03 -0800
Message-ID: <20260123182208.2229670-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce and use hwmon_update_groups() to support changing sysfs
attribute visibility dynamically without having to re-register
affected hardware monitoring devices.

Use the new function in the ACPI power meter driver.

RFT: The new function was tested extensively with a dummy driver
which changes attribute visibility every few seconds. However,
it was not tested in the 'real world'.

----------------------------------------------------------------
Guenter Roeck (5):
      hwmon: Handle attribute visibility evaluation in device core
      hwmon: Provide helper function to find thermal zones
      hwmon: Add support for updating thermal zones
      hwmon: Implement hwmon_update_groups()
      hwmon: (acpi_power_meter) Use hwmon_update_groups() to update sensor visibility

 Documentation/hwmon/hwmon-kernel-api.rst |   8 +++
 drivers/hwmon/acpi_power_meter.c         |  37 ++++-------
 drivers/hwmon/hwmon.c                    | 108 ++++++++++++++++++++++++-------
 include/linux/hwmon.h                    |   2 +
 4 files changed, 109 insertions(+), 46 deletions(-)
