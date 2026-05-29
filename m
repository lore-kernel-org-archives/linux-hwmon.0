Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7918717745
	for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 05:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780033361; cv=none; b=S4gSy2eO6Wo/brz9BCtLbWn4KTCpZnRvbrGvCozwV8D3yXc6kYHDC4Gom+QWeCKT7E5rkQbCYlgdK4fHRAuMLFL6g0g/qEG3jaTnarVXVpYYPyFmYowHoXG6KjK6glgYFkHK1q/88oelcGIhv9NshgPMsKeFM7tza048Q5NoeUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780033361; c=relaxed/simple;
	bh=3EV+WO27yKodp/q+ZJBZ72/L+OXYX+2lYnG1dPC55uc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nRbwBf77XYqWq/2P3ubWxhXYeW6SmOYOIooY/LjF04XIvWQmyRNMjhSSapu5zaH+hXVDNSSA0DPLS7kWEtiM4GIrMPj6uoxlVWYdkYcIO3rLZ7t8xkS/0WsWRDOy2eDmE8xYY0FNmdtOQ+DcpA/rjDbrGVwOGv8SCWwZg3eaUFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUgwJoi9; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUgwJoi9"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36b9033d230so706150a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 28 May 2026 22:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780033360; x=1780638160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6gSL83Vtjwy5lvzYsgavMavGzYk+JMak7y4sEcq8NsM=;
        b=PUgwJoi9lTJ0rx/n7B6dYM8UPiS90bBxKu8wEJA6Eoiv9rfVbqTCJkjWULkTifBOH/
         XgELrX9iDWYUFyUdTVvXiNRNlnCieAG9qFRbFP9OJeDdZ2cAdnHTz7D1q12rxK7gCNKb
         92EjXbp2WBN2FnN1q7W4XdWFEt5X3G7yLPpICDjfiDvqRUod83T9xsQsLF7GGGo5P0xx
         36hAnc2OZKqPuvIV0s+zJX1BKtZbEtmHD6eg/8NFiSvRoHAZvjXomn9k6cT/IFemZinM
         T9sz+9EO1mqRjHJLbOVw4n8R4bx8NWvpAoeypvQD9kqz7FRX7BxfjHEb3s1F/CG/MwIN
         y8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780033360; x=1780638160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gSL83Vtjwy5lvzYsgavMavGzYk+JMak7y4sEcq8NsM=;
        b=YyZhkVza1sbkG6xKSbrUI8MX1/6UAMUFY5fz5jV+TEfJ0ixPcaMNlKRABdwPpbpPxo
         Co/UH09H9iCJGU4dXato/5DYEKyyRaGnZb0fKNPu3OCLQyrG3amJiaIFPO9DWFEw36od
         Z3rBwe/U9qHTBfF6F3BXJqztP+uy1XxVOkM1XniNhtpA2Sd8hwCKdcaQF02Lnq4mcqnh
         /eiHFFygN+uux7X0/izDyMyFhVQ09sUH2VFDYcFZCClbzMxqyS74H3U+xUdJxAvvFG75
         DNshpxmQMQRqyOUIfWM1741KcPAe+FSmb0fOzL7mcMGtcA9jHtWBGv5O/VJ9rhNCTcTw
         HOGg==
X-Gm-Message-State: AOJu0YyOpzSuuMMpbcNTQm3wDHB1TVRv2ijisvRUNXRSwvUjPSFdFacJ
	x9GJCZEO4PqCYQovWuu2F315okGLPsg82/pvrBAUu0GaKR6rfuJY+M+4
X-Gm-Gg: Acq92OHaS2kKgUFk/PDDLTiq+ZaD0tv8IoMiDuW8/LGsIQsEiMhIfO88t6TUsReNeP9
	ZBAO/VYtDvY3BXL4Xhl9qxrCmZsokEQUE9DLvEjswOZY4MzJJzdNui+Xg2apuJqxcn41pGmrT1W
	p6FIs5P13tWl+/h5VTCvhkU10T04HIBVafykEAw3LRrUKAVRLTUNt80caHHReNgwmsW8KnMdHnk
	e2Z206ZpexC5+XmbXH0xbfmVeNv+l5amRCbxPzjLgyhArkQkM8dgKso8fXeuBZ9hGVYDs4SpZz7
	qbgArH8FggoMLDMQxOScs5utDbKPxnDPVjaJi6JpnIN11ZG+0zqVfOSmEwH2miK5TC5+aiGCA+D
	C/hAW0bYFywID1cpyu8RVDw6iIzM0uHRC28M5Gx6rA1TD2I3cbKZ9Ue3xLfVMPTYxftd3M5U3nV
	GNjycRUnRXkSETzmLbLz+kay5nsjh2WkTpAVuMbaMz+yPeySJprYp4IIuC
X-Received: by 2002:a17:90b:1ccb:b0:35b:9e53:e2df with SMTP id 98e67ed59e1d1-36bbdf7c769mr1485059a91.2.1780033359732;
        Thu, 28 May 2026 22:42:39 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:93ae:ce9d:fecf:bae0:f194:40fa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc6bc0b2fsm578157a91.17.2026.05.28.22.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 22:42:39 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add support for Infineon eFuse XDP720/XDP730
Date: Fri, 29 May 2026 11:12:16 +0530
Message-Id: <20260529054218.5184-1-Ashish.Yadav@infineon.com>
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

Hi,

These patches add support for Infineon XDP720/XDP730 Digital eFuse
Controllers.
The XDP720 and XDP730 are PMBus-compliant digital eFuse controllers
with an integrated current sensor.They provide accurate system
telemetry (V, I, P, T) and report analog current at the IMON pin for
post-processing.

Both parts share the same PMBus register map and direct-format
coefficients; they differ in the GIMON gain step exposed via the
TELEMETRY_AVG register (bit 10) and in the VDD_VIN pin number
(XDP720: pin 9, XDP730: pin 20).

The Current and Power measurement depends on the RIMON and GIMON values.
The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS Register.
The value of RIMON (kohm) can be provided by the user through device tree using
infineon,rimon-micro-ohms  property.

Datasheets:
 - XDP720: https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
 - XDP730: https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp730-001-datasheet-en.pdf

With Best Regards,
 Ashish Yadav
---
Changes in v2:
- Link to v1:
https://lore.kernel.org/all/20260519075558.91466-1-Ashish.Yadav@infineon.com/
- Integrated XDP720/XDP730 drivers into one driver.
https://lore.kernel.org/all/51133193-57fb-4a22-bf9e-9817f1f52ad5@roeck-us.net/

Ashish Yadav (2):
  dt-bindings: hwmon/pmbus: Add Infineon XDP720/XDP730
  hwmon:(pmbus/xdp730) Add support for efuse xdp720/xdp730

 .../bindings/hwmon/pmbus/infineon,xdp720.yaml |  59 -------
 .../bindings/hwmon/pmbus/infineon,xdp730.yaml |  80 +++++++++
 drivers/hwmon/pmbus/Kconfig                   |   8 +-
 drivers/hwmon/pmbus/Makefile                  |   2 +-
 drivers/hwmon/pmbus/xdp720.c                  | 128 --------------
 drivers/hwmon/pmbus/xdp730.c                  | 159 ++++++++++++++++++
 6 files changed, 244 insertions(+), 192 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp730.yaml
 delete mode 100644 drivers/hwmon/pmbus/xdp720.c
 create mode 100644 drivers/hwmon/pmbus/xdp730.c

-- 
2.39.5

