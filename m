Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937524BEE5B;
	Tue, 22 Sep 2026 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069629; cv=none; b=Wvnq2MC1y+KtKkbm3rudF4VRmsJaPqx4N+66IATlUXYehPIAl6/5TAXp6MRSh1YSRncvZdxzo1GuBPCfWWP2a3oTHgzzPvOGNMbHrWzOzaU1SG3eGg/4f6Z4Cx+kHSGeOGJBCvHLv7NygG4aHwi+G34+55Cma62Q+rA6w1hEIHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069629; c=relaxed/simple;
	bh=B5qmeP+U3TGcbS4OYplDY7f5eEn7U7QMSMncNP35JIg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H+3Ufjx6WlUY9T4TKM/yRYQzoXBHkR8GSmVnhEbzfT6dZLa2r66B4R4LJJrUV3GfOCGEP8cTivbpdrdtq+NRDEExH5uMxKDHPIoJ6ufK8Z9Lp2y7t1PJgso1QzBlxcwWcccb7HBptRdWWq2MFofMjhMCIb5dzxSPwdo/eoK36zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCbMHFia; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCbMHFia"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF1B1F00893;
	Tue, 22 Sep 2026 09:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790069628;
	bh=hz0JPUl50XjnWDVFQWn9i3t3aUC8zK4gbV+yYoPc7yQ=;
	h=From:Subject:Date:To:Cc;
	b=fCbMHFiaFDMM9lLMsICFTIYX6vkTjgZgorIfCDhH+SIS2SDJwRAJl00IZ2ZdL+WHD
	 HYnnXpwifc/YFR/ZhNS2KwnqJqxSshrwHsK3JOYL4jl1gxsZgiERVIHd0TXK4mC25a
	 fUPqVGOsuLqeLrQn97Y4Kj4FYwbfkKeDWonbuonO8TVa0crwG6qXOALjVa4WGOOl6z
	 QGD0wICAK8NSbwt2a4FjPqKAY1pcqVxvgI8MfQS6oe5SeyDI+KnEmMRFEQBvvSj7S0
	 c0wMOHx/zqE50wNa05I3pCuKSxGgytm6kwy1629uev1mN1pH+MizL2cJhgiWn9iV7J
	 0rUlKDe36fnIw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/3] Asus Zenbook A16/A14 (UX3607OA/UX3407NA) EC driver
Date: Tue, 22 Sep 2026 11:33:35 +0200
Message-Id: <20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNzQ6CMBCEX8Xs2ZKWn1Y8+R6GmFpWWSMUu0A0h
 He34NnLJF8y880MjIGQ4bibIeBETL6LkO534Brb3VFQHRlSmWpZKiMG35MTlke+oBNSF0bnpTm
 gMRA3fcAbvTffufoxj9cHumGVrI2GePDhsx1Oau39c09KSJGZrFC6znJj8eSZk9don863bRIDq
 mVZvmNy2xvDAAAA
X-Change-ID: 20260917-topic-asus_ec-065764978e77
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790069623; l=2465;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=B5qmeP+U3TGcbS4OYplDY7f5eEn7U7QMSMncNP35JIg=;
 b=1bKLUyyL/qxedFt52zZt3OcLv8r714SY5rTmE1Qslb4HXbAXcwhcfmCX4KnedmpGdle5UtCz5
 1D/0JJu8xg3Ab4ZbtKVeHx0slLp7OdBJy+PzBsyr2IsKQw4vRubG+Ou
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The Snapdragon X2 series-based Zenbooks come with a bespoke embedded
controller firmware, bearing some resemblence to the reference Qualcomm
implementation (qcom-hamoa-ec.c), albeit with too many changes made to
consider them anywhere near "compatible".

This series introduces a new driver to let the user retrieve current
RPM of the two fans, the temperature readouts from 2 temperature
sensors and get/let keyboard brightness levels. The driver also
notifies the EC of system suspend entry/exit.

Two separate compatibles are maintained since the two laptops' ECs seem
to be generally alike, however assuming full compatibility with the
limited available information does not spark confidence.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Add rationale for separate compatibles
- Drop `wakeup-source` from `required` in dt-bindings
- Fix bindings example indentation
- Rebase on next-20260921 (NOP)
- Link to v1: https://patch.msgid.link/20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Hans de Goede <hansg@kernel.org>
To: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Guenter Roeck <linux@roeck-us.net>
To: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Konrad Dybcio (3):
      dt-bindings: embedded-controller: Add ASUS Zenbook A16 EC
      platform: arm64: Add a driver for the EC found on ASUS Glymur machines
      arm64: dts: qcom: glymur-zenbook-a16: Add Embedded Controller

 .../asus,zenbook-a16-ux3607oa-ec.yaml              |  64 +++
 .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  |  15 +-
 drivers/platform/arm64/Kconfig                     |  16 +
 drivers/platform/arm64/Makefile                    |   1 +
 drivers/platform/arm64/asus-glymur-ec.c            | 592 +++++++++++++++++++++
 5 files changed, 686 insertions(+), 2 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260917-topic-asus_ec-065764978e77

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

