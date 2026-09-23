Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8209447F770;
	Wed, 23 Sep 2026 10:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158475; cv=none; b=I2ViEwUFFDFUvAitnyGtZCsv/6caEtNp6V4GAdr7/AcJTCGo7Dz14r0bpJekQPsMNn1TrsuMN+3PtZjldQSkMJJ0mbIg/R65DraiEOd8wRW5Xv7UnnQVZCqTwd3voMauHwWuIOwR4zPRY85HwQGiCalayQr8sP4ofSW8RV/r1Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158475; c=relaxed/simple;
	bh=/+Y0zscRScVGHGgCFfeLdVCzp54cLykI6O4Q82zd0eg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nunFHWhyl8JxcdagW01fCd4j/QJfCvehB7868Kx5FrEKr98lSl8ejAXWIiBi1YqidGbGld9kZtocG9Ju5DVKkiV3ixrw4TOgg/QlzNtGqsGllYA9Ti0Q2YjDcCuVTZEu7hx0bW8GmmUmhbD0LGwcTnccpNCS/+H/6/oBmLFUZZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8tDa/wW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8tDa/wW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCD41F000FF;
	Wed, 23 Sep 2026 10:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790158462;
	bh=3gdSF/O138dnRSPNJCUqjM6K/O1uaucAa5FbPqgbSok=;
	h=From:Subject:Date:To:Cc;
	b=I8tDa/wWsCw5jIoiFWwux98tiDjO2/ZDHHO11aflFvsZ32ygo8gekVfdulrgkI31j
	 B1E7bfYoWfHmZZYag0ugylccGp6zDxqCC7Mzw7GJwm9Oju7F/gSFCfxmkEwUvoN5SO
	 WyCm6lcd8oz6EN6TSi8MY1miWe06jxzP0OqMrsRBucP69r73+onfaZJ7Hn+gkPZd77
	 tbhXRrR4yjvBP92IkNciqKVoqX2XK1jo4Hp2W3pT5wm+vpd9fYpE/iRimHTfr+Q0RV
	 wF6guOWyjxy1p2hg0ttZDNv9oqWoaRy0HSKy+urRIstkO6MiWE07UAuBS7/oKQ0slt
	 SVEPQzIGtHO0A==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v3 0/3] Asus Zenbook A16/A14 (UX3607OA/UX3407NA) EC driver
Date: Wed, 23 Sep 2026 12:14:12 +0200
Message-Id: <20260923-topic-asus_ec-v3-0-2bf3bb9da879@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ6CMBAF4KuYri3pD1Bw5T2MMaUdpUYodoBoC
 He34MYY3UzykjffmwhCcIBkt5lIgNGh820McrshptbtBaizMRPBRM5KrmjvO2eoxgFPYCjLM5W
 npSpAKRJ/ugBn91i9w/GdcaiuYPoFWRq1w96H5zo48qX3zx45ZVQqmfHcylRp2HvE5D7om/FNk
 8RDlolRfCBCfCMiIqyypZCWV0UmfyDzPL8AwSTz1ggBAAA=
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790158456; l=2735;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=/+Y0zscRScVGHGgCFfeLdVCzp54cLykI6O4Q82zd0eg=;
 b=ZLg98IBBdt7/M9E28I+7TraB7uHsQ/TH/dcDr91U4uMS0dM9U6yJZQHbGszYu3O9oLecSAcLp
 QOAd6NeLOQiAn50QZbEkbcwmYH50RVC6t/kLqJzycvTtzehkU1575yK
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
Changes in v3:
- Cover Ilpo's feedback: includes, braces, dev_info->dev_dbg, line
  wrapping, reuse the timeout logic
- Pick up tags
- Reabse on next-20260922 (NOP)
- Link to v2: https://patch.msgid.link/20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com

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
 drivers/platform/arm64/asus-glymur-ec.c            | 600 +++++++++++++++++++++
 5 files changed, 694 insertions(+), 2 deletions(-)
---
base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
change-id: 20260917-topic-asus_ec-065764978e77

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

