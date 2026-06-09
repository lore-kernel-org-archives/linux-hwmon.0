Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F2538AC8E
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 07:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989779; cv=none; b=sjAM5d0YNFRYd87To1ikJm4439WQn2v487ZdBGiBUzhKSMTaUfh8OAFnGv60FhgW8qVwFIE7a+KbrJDrt2b76fPKVQAmu4hMtMGaDocslmB71fe+cJ5OJuYkkpn0x4uRvVrStpmkZv216mVIqSzbiZYoM4cKUGFrylsRONk6agQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989779; c=relaxed/simple;
	bh=bH36BYhgS8uB0x2zr35yevjQLPcz2wgr1eMlLPwWf1s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=d4nqioL8fmXGfz1QO8vC7wHT//U7/aGQvSD0p/V593d2fJGljK1sDE6gmI+tx01+22ST7fTorwpaJ9JyFlHvvu9VU8bx6SF2llHU7ZMDquS+FOuVjspyow4+dtpD0VUnR2gytc5oi1JdrvikF9wa1zEcrFpI5rhs4xZ0mwbsjvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+p+dHlU; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+p+dHlU"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-842848fd613so4271102b3a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 00:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780989777; x=1781594577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/s0YVM/oDd2r7zbH0W4Z8rnf077Nw3eeODIAgYQWyIA=;
        b=F+p+dHlUCQDaDEtGqBXNNznT06bN5uERqvOkTkrAuoFWaGS0uFVFkblvRUn19uejgs
         rRb0r/0JmzIhk4XUdrB5cqciqF3emrAqaXQbzqlWDGI8HhdGSKnqvcTJzm/14gi22Bt8
         3eBrKv8ddOnprA+IcR4ycVz12QC6zvVfJuWZj/YEB0p9Ka29QrpHmDAcLW5GxpcL2Fgo
         6l/xn1MjdfEofccp5aQWuVMnkRgl6lW+ghC6Mn+u1vqaGk0gLUPT0JlUNzYjqq85qrGm
         bIXMrsJUtORjI8O/N5TzeLAT+fy+03SndhmSx6TwHdyN6ZHkOXw0ISY/7/ouc0lyxotZ
         EmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780989777; x=1781594577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/s0YVM/oDd2r7zbH0W4Z8rnf077Nw3eeODIAgYQWyIA=;
        b=FcLymQEjeAeKYLMTT97HtxGg2VkIzUBqA/MVu1BMgFDr2u3DBlt+Z3shnst2wogprb
         0QlbLPQxp0ptLY0FxD1oCDBIIekGAeENmbkl8WqZhxX3ecx3Vnl02HGmi0N6J16nsvum
         f6rj2lGt+pTUsgr/279v2LOldSZKkHBpJd1ShjOLiiXyKsd5ZbwfzneHKm/RIL1TKMFK
         Ov9r+9BYEYDzEkkAzlwczGvAaeJHX0wAKtNDuSI5vkArq4wLs41J8JKfGgPDLb0RRJPT
         lI+7BCaY33BdKryqphwBsuwcZAUczIrqDMnnUKlsTMDVnB66NiXGiDbDfAiA5ZxUTwEt
         ybnA==
X-Gm-Message-State: AOJu0YwHO29RYgZc+MzmT+rEb0O+giFx6+fHCEiZuCx9tho2oqaU+p/L
	sEGr9puGPi8TEc+CWZ9M4u1S4yEDKSAc6bSlZvq9NrZBXiqQGW7QDMfO
X-Gm-Gg: Acq92OGvtwtcKI8bwQjKlMRZX/IrsoY28CECqt/245TagsOw4r9Odh/5qWYqZ8SFSuv
	xKEgDHh66tQ3MzRKqcqlcJnt2fTpGJOI1ZlLtPlqgfmDJHedKTKxcWV75NzTzotoa/lNp+yYZcB
	VP+92pskQQljVhTL70aTlWnq9ljzPyOWZY7YECO8OSarAl1T4MDJznSjLQsUA+sGvfB0iURi+8R
	DAxHrYiXf7XNGQOZvHCufibCeADcFoU6gpqpktlp71vL7zS50cG/cy8mNYK4W1fUNZKZCpPfG+q
	AioIMfdJTVl+qdImx8O1Br1qLtM04spN81ytJ/rLYXspnPmN+J/efuiI289ZQaSXRedi8RCZ5Nq
	lCi3nE+MzqXMkiu33CIaa00luJyY54lEgTZBKeIJAYgOo2TezWCDLwaeIyI+N+ZzIYoQWjh0OxP
	n65H5cD60LxrX05rbgMUP8tSQ716Qs0afVd/sFei1HHurOlSsqJDn9YkuT
X-Received: by 2002:a05:6a00:12da:b0:842:6e1f:c8fc with SMTP id d2e1a72fcca58-8430a73d65dmr1919672b3a.32.1780989777010;
        Tue, 09 Jun 2026 00:22:57 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:c919:66b5:f0e5:3e9c:92e5:3878])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221671sm21702448b3a.4.2026.06.09.00.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:22:56 -0700 (PDT)
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
Subject: [PATCH v5 0/3] Add support for Infineon eFuse xdp730
Date: Tue,  9 Jun 2026 12:52:28 +0530
Message-Id: <20260609072231.15486-1-Ashish.Yadav@infineon.com>
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

These patches add support for the Infineon XDP730 Digital eFuse Controller
by updating the existing XDP720 driver.

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
Changes in v5:
- Link to v4:
https://lore.kernel.org/all/20260608061544.5613-1-Ashish.Yadav@infineon.com/
- Fix driver:Split patch into two patches;Support for xdp730 and driver fix/clean
https://lore.kernel.org/all/f03b52b2-1193-4127-ae5e-bd4a954f8e3e@roeck-us.net/

Changes in v4:
- Link to v3:
https://lore.kernel.org/all/20260601090925.3781-1-Ashish.Yadav@infineon.com/
- Drop extra I2C Device node and add rename node info in commit.
https://lore.kernel.org/all/20260601-first-attentive-puffin-d7ca66@quoll/
- Revert back patch formatting.
https://lore.kernel.org/all/bf947dcd-2028-4dfd-a007-c4f39d2b7649@roeck-us.net/

Changes in v3:
- Link to v2:
https://lore.kernel.org/all/20260529054218.5184-1-Ashish.Yadav@infineon.com/
- Revert back the DT info file name to infineon,xdp720.yaml and added
  xdp730 info
https://lore.kernel.org/all/20260529-partake-myself-baa76ed4e279@spud/
- Revert back the driver file name to xdp720.c and added xdp730 support
https://lore.kernel.org/all/20260529062937.646091F00893@smtp.kernel.org/

Changes in v2:
- Link to v1:
https://lore.kernel.org/all/20260519075558.91466-1-Ashish.Yadav@infineon.com/
- Integrated XDP720/XDP730 drivers into one driver.
https://lore.kernel.org/all/51133193-57fb-4a22-bf9e-9817f1f52ad5@roeck-us.net/

Ashish Yadav (3):
  dt-bindings: hwmon/pmbus: Add Infineon xdp730
  hwmon:(pmbus/xdp720) Add support for efuse xdp730
  hwmon:(pmbus/xdp720) Fix driver issues xdp720/730

 .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 28 ++++---
 drivers/hwmon/pmbus/Kconfig                   |  2 +-
 drivers/hwmon/pmbus/xdp720.c                  | 82 +++++++++++++------
 3 files changed, 76 insertions(+), 36 deletions(-)

-- 
2.39.5

