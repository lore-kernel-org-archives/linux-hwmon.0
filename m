Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9FD42122E;
	Thu, 15 Oct 2026 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054537; cv=none; b=oO7kBwUmFesPaLJn2iF8dLDpSavLqg6kCjL3j5GJPoZcLjvbL3Ts1TuKdoDXSjJbdzNH1qmxHXKmjRjTp+7xjul+SwosqzNgUbp0C1+sMUuM5YJfqMgFOHGCfLoSeS220+5g7gbiuFkVF4hbqICFJiYj9Q78HYW+c1olr0UgetE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054537; c=relaxed/simple;
	bh=q3qwp/3nGHbNi/ZEe4638O9kGdfZ5wDFUcKgMj5QcMU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TomMavn3Z94zYkUkduS5TXKn9FVqZYj1ia+4Gn45ShyLG+2dILdfy46qbuBPfzBJCLc0isOt18EgitdO4nnz27G2cV+IPfinoaTvhyYloFUztXHRarqekpu7k6RO1rqUeB1qHY/lCKU60/yRTRbITSpC3XTshdk7Af8BN0dD+Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzE1WB5z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzE1WB5z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926ED1F000C4;
	Thu, 15 Oct 2026 08:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792054536;
	bh=uWo19j8cwsOhQtXiqCSM4JgozwqvY64VrYOK+olurSc=;
	h=From:Subject:Date:To:Cc;
	b=BzE1WB5z4nhQ/jViW84GQVSj/y2h1c85mDpPg4jVyrVQqofku8tUpxwb4Y1Bwt+6o
	 YVLHYToaHW/u7c891y6uBX6VwhkHToLUxi4Rkwh+JfVZ6y+4fGKr+wcF5ANu8iaqkm
	 daSAmrR8ayUgDx7bhOa1nUZjyHcXCEhaYSSUYA9RWFaVhH8OP7Y36oCKbUr1xr+y45
	 SWazQWLo/kpZDNZzLOzwkBIhI7zFInyOAUmTwJDF7GLzDuLjs5nm2cyS98MrepbSs1
	 10qpkSy1+XisKMPgDBLBuhE6MQ+CuJtyfVPulesfUvGI/HDrR/3VcFSQkfm8fNop6z
	 mblx/WrNM7g4g==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v4 0/4] Asus Zenbook A16/A14 (UX3607OA/UX3407NA) EC driver
Date: Thu, 15 Oct 2026 10:55:28 +0200
Message-Id: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQrCMBAF4KtI1kaSTNs0rryHiORn1Ig12mmLI
 r27qW5EdDPw4M33HoywjUhsOXuwFodIMZ1zKOYz5g/2vEceQ85MCVUJIzXv0iV6bqmnLXouqlJ
 XhdE1as3yz6XFXby9vPXmnal3R/TdhEyNQ6QutffX4CCn3j97kFxw0FDKKkChLa4S0eLa25NPT
 bPIh00Tg/pAlPpGVEaEC0ZBkK4u4Q8Cnwh8I5AR5XbgnAm21uYHMo7jE98u+kdNAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792054531; l=3119;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=q3qwp/3nGHbNi/ZEe4638O9kGdfZ5wDFUcKgMj5QcMU=;
 b=VqBuX5cvkHIKlKat+8LViuev/YAJ8BYxrZRWXC6sgBHDH6pfLyptEiNnfQnmK2GFVQW73RWYe
 jyybddDheY9Bdtg7jr57twDsEH5FtUD9qBUfamStpeHvJ13dLhwFHCC
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
Changes in v4:
- Make the byte order clearer for reads/writes. Sparse is happy.
- Tweak the if-else near ASUS_EC_EVT_AC_STATE
- Add the A14 DTS patch
- Link to v3: https://patch.msgid.link/20260923-topic-asus_ec-v3-0-2bf3bb9da879@oss.qualcomm.com

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
Konrad Dybcio (4):
      dt-bindings: embedded-controller: Add ASUS Zenbook A16 EC
      platform: arm64: Add a driver for the EC found on ASUS Glymur machines
      arm64: dts: qcom: glymur-zenbook-a16: Add Embedded Controller
      arm64: dts: qcom: glymur-zenbook-a14: Add Embedded Controller

 .../asus,zenbook-a16-ux3607oa-ec.yaml              |  64 +++
 .../dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts  |  26 +
 .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  |  15 +-
 drivers/platform/arm64/Kconfig                     |  16 +
 drivers/platform/arm64/Makefile                    |   1 +
 drivers/platform/arm64/asus-glymur-ec.c            | 616 +++++++++++++++++++++
 6 files changed, 736 insertions(+), 2 deletions(-)
---
base-commit: 1fffefb00cc0b0da1f2ae24e3d33364530ea6515
change-id: 20260917-topic-asus_ec-065764978e77

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

