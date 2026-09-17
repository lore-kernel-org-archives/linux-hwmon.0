Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109434CA795;
	Thu, 17 Sep 2026 10:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642526; cv=none; b=Q4PP310laj2I3BatiD9XLsgH9awrFFw22gv9PYLvCYqicuwigOAtu8IlIF95zpOgCH33kafQwq77g2eBEqudgkrPn53M/WryZd38T4n+7fwp1hSdz3DApcS3Tc6wT3iv/pF/J6uvCqrB5mVhjIiEQKaQBzODi0ABHqXv6Vp2X38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642526; c=relaxed/simple;
	bh=75RsurQYI91g6hZC1//QG/T2wlUF1TEiwBSqlILT2BQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g02UsPpA4ySQgHU7zpRHJ5L6xM43HkKqKRq30PIEKNg9C8V1rsbGsbiu4ucpifEPf4z4CfjV0nM9p7ujGNbS9L0idYCqI4YFOAh8ZBJA+djEUt8AQU0Ta4YpZuaWXnycZrO6wBzasTNWjXtuIN6KM9bGdp38zB/yTRRYdiVpV3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AA6kNZrE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AA6kNZrE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93EE71F00893;
	Thu, 17 Sep 2026 10:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789642511;
	bh=HrPXLLqXr+zHbEe01HZ8JSqlxyzqsYTUSsfdx5SCbsw=;
	h=From:Subject:Date:To:Cc;
	b=AA6kNZrEpc/ScSZuGfkPzvtqaskwu4QGo/l2+ItVYSCnGUO8O0RmU7hk/qYNjgyP9
	 eRHFNqSKgCtPqMCujRhR9cTsw1g9AVLOYTVXZ/UZ7EyEaT+szQPL/RHuV1mjxdGtt5
	 aLb8/CxIS3FfKL5kiWuCA2utsmlNIBYfxysMu5tp81URxWi1ktUloD20cv+wsfUbjS
	 h822HVbiFAtagJkdoh7csUsoWygeoK04bNX+rvzdLQ54pKlqe4r1BfJTjjxTISVqiK
	 PCDmHvhpZFQx+q89BPaBfmAB/llABgHjUEv2S0hLJ3xWWXZzELp0TtpXMZ/PCVfk5i
	 O88y2RlleZ0nA==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/3] Asus Zenbook A16/A14 (UX3607OA/UX3407NA) EC driver
Date: Thu, 17 Sep 2026 12:54:55 +0200
Message-Id: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDUpoYOriAg1GAukg0jE3RXLt
 /j/AiHHJFAEFzg6WHiZPaIwADs280CKO2+IdWx0HqHalpWtamSXmqzSJkWT5JgRIvhmddTz+f3
 K6rfs7UR2eydw3w8XQ5uIcQAAAA==
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789642507; l=1372;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=75RsurQYI91g6hZC1//QG/T2wlUF1TEiwBSqlILT2BQ=;
 b=EE48ZzLPqwQhVcI19/BVPRRSN5Ksu7kp0HGVhAKFZIA7dOAiM5P503gOToNGhg3qt+CYOSpkd
 MdsWw0cwKVnCBHYNl4zlxwZFYzFWeaO2jUWfkwOpO6EaupG//vrn+yo
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

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: embedded-controller: Add ASUS Zenbook A16 EC
      platform: arm64: Add a driver for the EC found on ASUS Glymur machines
      arm64: dts: qcom: glymur-zenbook-a16: Add Embedded Controller

 .../asus,zenbook-a16-ux3607oa-ec.yaml              |  65 +++
 .../dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts  |  15 +-
 drivers/platform/arm64/Kconfig                     |  16 +
 drivers/platform/arm64/Makefile                    |   1 +
 drivers/platform/arm64/asus-glymur-ec.c            | 592 +++++++++++++++++++++
 5 files changed, 687 insertions(+), 2 deletions(-)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-topic-asus_ec-065764978e77

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

