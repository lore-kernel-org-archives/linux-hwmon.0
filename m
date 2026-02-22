Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669F51A0712
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 10:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771757920; cv=none; b=hWcWMIWpAbzb/Iu5immmhtQJsmiqNzvXg52YXUkPKKOg45l74R2FrfhfugtYeJTD5RR1rMWC4s09Rzmhpck4ppzi7cVHFQe/Xtuz+SpT8XrNhhRPggtmZPsAaUq/55p2dgGdcLVaatb2LOAVbI6yjEvw2BUDDQhrFRRQkrciCC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771757920; c=relaxed/simple;
	bh=uTMkYFhwyE1ALSaflzDC2ufn65NZPtaGatykjQGIBVM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jDTQLwRiZchvzNsYY6TMbbtLqGp/Hot3UCJuv8sy3mCoK6dt66rj+/owb7nULr6n0D3HX1/hKZW/CJGkbkjqIEV/vOGLrpKhnZETKwwmedUPcwRnZluUCUHceMhsnK6kxKXJ6Z+Fb64xwO5ZQAtSrahaJOyJgiVapMHtpy2/oU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heKO1plz; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heKO1plz"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-bde0f62464cso1283752a12.2
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 02:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771757919; x=1772362719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O3pv6D7MmjyGD1198CT8GdwgpvkQh5N7RgCK4lMDm3E=;
        b=heKO1plzwpNTRQq8kkt6eXwqL0wq0JUC41VjeKomlLUAGfwaYEAgInu2rmVjeXxUu0
         YtrlQPw+eYTAXjS+mueh5hr2/KjgU3Fqnuvdtt/0mqRvDW84BCD31un/CKyv63HusA3Y
         DchJ/kj5V8o3J/NebTKkDy6Nnf37IXdO8HR4upLFkX0j5bvwTU82djilU1JLyHvhyk1F
         l6D8C6RyOZdfFm9RUnNB0Hy9ykD/SmXKHqSAg7TKag4ml26hR5jvZgcHtfEBjDd/w2B0
         6tuw2fG1F6wUwSkMWMjF9Qrw2R2kcIzNGe0isQUHHfvNvhukr34yHrZzgDOntGZWi8Vc
         79Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771757919; x=1772362719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O3pv6D7MmjyGD1198CT8GdwgpvkQh5N7RgCK4lMDm3E=;
        b=eGzww8cSs/csgTOXSiyahvw14jq011a9L0BIrbLHsYjymAdndrdUU/Wo/Vnmy1bnQt
         iKwmPoC95qH0tTmSTY9vNMWu6iAnptVSmEAvyEMIITZof3z7UCsdG5CiXOqpVgTa0Pf7
         gV/imRDMh010a9HYWYHt9QmILFLH6enDgHAMYexsgliAroiYSpFrAXhNjNsrEDa14izh
         dl/GVmaKxcikFsPEgXhyDlVFY8EVN5ZjSqgXpPt3qFCEaVoLP2ldJ5LNHT0gmqJXnFFJ
         OEDi8NBMsDt79m8EAeBtWWgj7GYSICc3trIrk9/pxUwM5117cZoLkTyPGtERg+NgBXDh
         Ya3A==
X-Forwarded-Encrypted: i=1; AJvYcCX5v3C41bM0nxhRoh21xBdhqaAQi+q618pvjISqusQJPHM4KoAUyLAWemanaHuXS/QJ1bMIX5tmbSRzpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDBzIGEutfDwh1QZd/LLr0xGqBaAS+kz1CjXhZv9nK9OT1NWpl
	0zUDQgSDty2cVTI3cHBop0+NZAWi58BY9g49vxBpBHsCUUGW9o+Isd0C
X-Gm-Gg: AZuq6aIyR27+FKInSoTe/idFMo5CjTynTD7McEaW1V9fx1pNqwLWjtsGbztZqy0hMIB
	F1W1xTRgRELAefsth4IGcPwyQvPhOpmWRI2y0o5O61rtNjnSzPBJ9AYVmLn0weeb7bUDTm7KRXA
	CJ98qmzDysQz8VgN9ccVHlnGSnwDAfnrKO3T6sLNsFeI4U0m2LAN5pjO43W46/OMidTesz1YZPV
	X/WD1uWmPBomSbqopdnh/bJXYBHbWGZRGPh6T3PuTGAKnqp72n46WMTTqNGs3qJPjeqDYA+UdAs
	cO9GVcpjO5OFKAIl4p9PpVwqRy7iep15yNa5b/aMa0S+AAf+Dwp3KqxgI1iUhteY5ZpFzdeOGUL
	xrDdZyvx77ox2ovMDZot6RpSkKU6TAXdSRMXPb5io+ENJ77MUKRzn0mFr33EAUO2akM8X7mGGSx
	q0zNlvlRXFq5uksXHr
X-Received: by 2002:a17:90b:4a4c:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-358ae7bc723mr4727667a91.3.1771757918761;
        Sun, 22 Feb 2026 02:58:38 -0800 (PST)
Received: from yu.. ([120.242.225.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358a1b1f84fsm3705278a91.2.2026.02.22.02.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 02:58:38 -0800 (PST)
From: Hao Yu <haoyufine@gmail.com>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jcdra1@gmail.com,
	akhilesh@ee.iitb.ac.in,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hao Yu <haoyufine@gmail.com>
Subject: [PATCH 0/2] Add AHT20 sensor bindings and fix driver initialization
Date: Sun, 22 Feb 2026 18:58:29 +0800
Message-Id: <20260222105831.7360-1-haoyufine@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds device tree binding documentation for the
Aosong AHT10/AHT20 series sensors and fixes
initialization issues in the driver.

The AHT20 sensor was tested on rk3566_lckfb board with I2C-2 port.
Temperature and humidity readings are now accurate after fixing
the initialization command sequence with aht20.

Patch 1/2: Add device tree binding documentation for AHT10 series
Patch 2/2: Fix driver initialization commands and add DT support


Hao Yu (2):
  dt-bindings: hwmon: add aosong,aht10 family
  hwmon: (aht10) Fix initialization commands and add DT support

 .../bindings/hwmon/aosong,aht10.yaml          | 41 +++++++++++++++++++
 drivers/hwmon/aht10.c                         | 16 +++++++-
 2 files changed, 55 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aosong,aht10.yaml

-- 
2.34.1

