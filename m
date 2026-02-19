Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587BD22B8AB
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Feb 2026 10:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771498701; cv=none; b=UuQIU6QfhRZDynS1tZFmtz6RvU/y712aGYyH3LYqlgKxZLxml/TETurHwaOVU6H8iAtUq0VtlCdVO2R/CuLpctLZ1ZAkvrCQe7EhV6daHNmX3vgztE0jMot3bsGRJ8UoI5MxvWZchh0uwrqEYCvueJSnA3obt9oTi9wi6CBbK3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771498701; c=relaxed/simple;
	bh=ebTF1mxRuRbEMfCXsEhC+1kuXZq8lsTGyec/Gn1f1nM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=DVz8BYmgNIHuw3XBPP1/hq1vPoTmeTfZ+RLyaR+d0ZQF/jV8UkdwyDAadIZ+5iWaKvWxhC0QQQKq9gGi69v92BUbk2R1PumBnS3xXTp8Romghw398OOXd6xEkRSHUxX9mwMto43iNAS75pxqX4hYB+tEky1fap4rxqytc+knDL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0bzfLvW; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0bzfLvW"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8230f8f27cfso394951b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Feb 2026 02:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771498700; x=1772103500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G/7O24tyd9TUIJH/y4lCMB+20ztHqv0kDPFofLytYGc=;
        b=k0bzfLvW3xRw7c/uz0xev6KTjnlKXTVvxtoZRaj/AQqDuB0d70Lv+UEiQeb8trp0bf
         Hy4BqpgWDkoXFwma03WI7YjTO+F9WgMIanqexrhd2y6GKEBvtEyMgq0sHUD9N117m7zr
         GURPjoueH8RQXc05H1wN3AZpqQ3hKY43a5s5s30LnEgfrH/zy50oQF+sGmVQK2NrZ7GH
         DwJdHfl4wbzsZquMt6nufkPn1UwnS+4RBMDe2JQ6qey6iCcUQw9BFhz68G3ljBo+pKoL
         QNQ/I4Knv0xiQiir5li2yjycMDBw1VnsFoiz1hQ5dfH6Dmxx/r3fB9GCB4gXIC8VmR6U
         iLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771498700; x=1772103500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/7O24tyd9TUIJH/y4lCMB+20ztHqv0kDPFofLytYGc=;
        b=nZwEbEQ2W6tGTpuK5XX6ioRtwbxrulSOxjWWVAsA0ctbXygcXwB5wa+AfOUnNkbRuG
         CneSARCAN/pkvWKQ+ml0hjxE7zQJDgKjHCgeYezU+bWTybUJtP11eU9f4iAT3BitETLq
         8vJEln5R0pPmZnECc8C4QqqRdZOCI8bFzhgDVeIOOYHzdm8SlXPNF5je+ZjUcs0cO9H9
         P52DqZ/Eh5v08+P2ZCbB3Vr9x1Doz0i1Qia1n69eS3tgFhwVMZPipxCKzdwr6sheSgaw
         URx2NrlNOLmWRG+KSArZYyIVMl+5QF7Rj4VsBjpc6FBB/dIjIyu6C/egQMl44Mk2VS6N
         99Kw==
X-Gm-Message-State: AOJu0Yxhctye96uKK51Q4V1LrdCNn+BE2qtoFYP8YSTc/Z37PMpOApCW
	qhcmP9eMgnjYZ3FWISrxlB1ncKREOPrg5Ciz0kxgeUejiMZ9sODw07IJ
X-Gm-Gg: AZuq6aL31jQJftBb2LisFbIao1aHYnAL75tvDUIf9vRGmdRgAANth7KBKylbQpn4Zns
	nM/k90qXS0E5b8PE8Fp0/Lz0etqHNXga8xlAA8UGrQOsLmiDlqxDI8pDMLKcQrPD8bhCMBoeXbA
	i2NkXmoE3B6lBtqWH1vWPBa/UHF64gMZ51Jwa3uW2dLHW1Ld6pjs3m5P6rIkNEGXzYssozGwlge
	5a5OMAdBXnb4SMMzux0wIITvxrG0ptIpe4dsaysvsv8zwJ8xytNGqfWVL+d93VAV+nfENIQCbhW
	nrECohGEw/I5DDgP/Re4gIcS6312lQUcffNJu7V3pSw6qWKRtv0Uyj+FBiGxxLhUFWYM2crZ2vw
	ECjrWYH6HKtAsE+KdlF0C0B7JhTf8peDUdBTAy1AZtlXi0b0NJZ8yJixReQ1I6/ZZKw+TzeBs2w
	YOvEPVDq99h2UUi2IP5Vv4r6rJFKxyF7aCFZ2YmCVV+7R7HQ==
X-Received: by 2002:a05:6a20:43a8:b0:38e:9405:bf03 with SMTP id adf61e73a8af0-3946c85b2edmr21512508637.35.1771498699529;
        Thu, 19 Feb 2026 02:58:19 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:939b:3231:1953:3f2f:aba4:9c8a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aadd9e8sm164339745ad.74.2026.02.19.02.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 02:58:19 -0800 (PST)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH v2 0/3] Add support for Infineon Digital Multi-phase Controllers XDPE1A2G5B/7B
Date: Thu, 19 Feb 2026 16:26:27 +0530
Message-Id: <20260219105630.11929-1-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Hi ,

These patches add support for Infineon Digital Multi-phase Controllers 
XDPE1A2G5B and XDPE1A2G7B.
Both controller supports Linear and VID Data format for VOUT using 
VOUT_MODE command.
The configuring both loops/pages of the device independently is not 
supported for VOUT_MODE.

In case of vid mode, NVIDIA PWM VID vrm_version is supported:
Vout = 5mV * (VID-1) + 195mV

With Best Regards
   Ashish Yadav
---
Changes in v2:
- Link to v1: 
   https://lore.kernel.org/all/20260202080355.53061-1-Ashish.Yadav@infineon.com/
- Address review comments for driver documentation, pages with different
  VOUT_MODE, Indentation.  
- Created separate patch for core changes.
---

Ashish Yadav (3):
  dt-bindings: trivial-devices: Add support for XDPE1A2G5B/7B
  hwmon: (pmbus/core) Add support for NVIDIA nvidia195mv mode
  hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g5b/7b controllers

 .../devicetree/bindings/trivial-devices.yaml  |   3 +
 drivers/hwmon/pmbus/Kconfig                   |   9 ++
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/pmbus.h                   |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c              |   4 +
 drivers/hwmon/pmbus/xdpe1a2g7b.c              | 120 ++++++++++++++++++
 6 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwmon/pmbus/xdpe1a2g7b.c

-- 
2.39.5

