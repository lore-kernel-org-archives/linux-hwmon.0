Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBC440DFB4;
	Tue,  5 May 2026 09:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973149; cv=none; b=f8Y5IY3rjwIVCDq8OTw9PTNUBfXcwlAfFS+4nmHHlEF5DJVgn1NY5ddWSEk0HfgeqNhN0fpj19buU9sPpekllI5wjGcTLPkB2ZF5XzlcqgFEWF7zbs2+S1IZ5Py5Hu8XEPSoiNrpfByzx8quU2d0sp7I7r2gmrIOXE+7vBW1R08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973149; c=relaxed/simple;
	bh=YwOxyr91bjaTxnMya4FX4eLzATEVx5qhhUCRFDD8ZVI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=obGrLkQIP+ICnXr50FnjgDw3vJ/9FWsOjvsnXpb6lcxt0oalkQThO785RMnGCBh2d8NfebZi+h9KMsAeQDDwXN/JEpM4ERx+ZfXWVcE+NB0lOWSI7KdpMOMyayDTpUsucdgFc4tTskNc/gQpu7qj0MmyKFcrtgCMFXPoV9T2FEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=HxnLQI4H; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="HxnLQI4H"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6455ADfR2211938;
	Tue, 5 May 2026 05:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=JLxODZ+i/BQ948REmsWJ30LhSSJ
	A9QisO/tghMAl6JY=; b=HxnLQI4HT2hfATCg/VjOdYO/5IdgYhdYsohE9DoqP+d
	H3sPJGDg/TIl4MDw+1Sj54Y2BnO9b6Uwl5K8Rg1rGvRxCwK/KmKHzn5Xa91qfe5C
	mNns7JBiOr63VFr3aTHIFMGobPx1HPQEbxgNZbgySdSjzX8YD02YQ6kTnIZM56UP
	ODLVC3cg3h6Hy++eWFDuy3FEZ9XElGJDaPe01cR54mdvn+lcpz1yezt7jl8Is54h
	Hhsy/ZxcxsL1dGmcSOwCxdP7HUY95FQH1KpoZGvBiHabDfPsiWKjj2fNJODiWNr+
	x3VXt4AI/R+SpGCePoUBv6r3BTa7l67oJsAPhcJvoWA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4dwb43b735-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 05:25:30 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6459PTf1031742
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 May 2026 05:25:29 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 5 May 2026 05:25:29 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 5 May 2026 05:25:29 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 5 May 2026 05:25:29 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6459PELD029445;
	Tue, 5 May 2026 05:25:17 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH v4 0/2] Add support for MAX20830 PMBUS
Date: Tue, 5 May 2026 17:25:04 +0800
Message-ID: <20260505-dev_max20830-v4-0-4343dcbfd7d7@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHC3+WkC/3XM3w6CIByG4VtpHEf78UfQjrqP1hoCKltKg8Zsz
 nsPPTJbh9+3Pe+Eog3ORnQ+TCjY5KLzQx78eEC6U0NrsTN5IwpUACccG5vuvRoplAxwxQXUFdW
 NUApl8gy2ceOau97y7lx8+fBe64ks759QIhgwJWBYU1JdSHJRg3r49qR9j5ZSolstdpouWksjp
 DAaavOj2VbLnWZZg65LUwgQUqkvPc/zB77JjpIlAQAA
X-Change-ID: 20260414-dev_max20830-9460b92cf6aa
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "Alexis Czezar
 Torreno" <alexisczezar.torreno@analog.com>,
        Conor Dooley
	<conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777973114; l=2624;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=YwOxyr91bjaTxnMya4FX4eLzATEVx5qhhUCRFDD8ZVI=;
 b=iChA+dFxI9DOp4dPbc/E4mSx75qrZSotLqfpLiSXYOSmkvTf2OaTXJiC1o8aMVZ89cYjWCiwa
 IhsyJ42KYbJCbsWs20U+6VVES5WiEsGz1o6l5hvm0OCfsHVXxbTQeTM
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4NyBTYWx0ZWRfX0KHkP98ORQsk
 GRdrcBmciCWerfnazhBzERSdFZrwUJxDU14TxZWDEriBKy5rhQzlO1Qq2vKB1bYVtv49fFSsR5W
 aYeHnCzJbQM8eZwZCkT8odG/KwOCDgfzWUrRgbENgOebF/wUdeOejBubASTthKAcbUB7xYpJyKb
 EdJeDSuvc6FvOZOnz8ceyd9c0dgkDuK0IBWMO/I09RP0spml3s2pAFKuSNPoqEUDfdP/sERYf9Q
 JToLDQHpUetjzwyk53hYi82QrWXbqnGr8Df5kIxplNe7iz0fTReQWyv7uMXz7vG32Xga2Xl39tY
 2lbnCOXzpk2XeV5K6ld7sziB/MiiSM4TacsmulMTWcYdTEF4dbZJa14G6XRwCYOWSMAEozNAtDt
 zN+avEgaTO3tGw2xmkrA3UxoDmNgYIh3pykUJIOvzNSOFP5kHvMvRE6jo2pDaCwxrAu7O7CS2BS
 JL62bUFfmzuE9YQqAtw==
X-Proofpoint-ORIG-GUID: LsvfyNOypqj4DDdE0QtANintqh71CyFM
X-Authority-Analysis: v=2.4 cv=AeeB2XXG c=1 sm=1 tr=0 ts=69f9b78a cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=2qLcT7M3tytojYbHFIcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: LsvfyNOypqj4DDdE0QtANintqh71CyFM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050087

This series adds support for the Analog Devices MAX20830 step-down
switching regulator with PMBus interface.

The MAX20830 provides 2.7V to 16V input, 0.4V to 5.8V output, and up
to 30A output current. It supports monitoring of input/output voltage,
output current, and temperature via PMBus.

Datasheet: https://www.analog.com/en/products/max20830.html

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
Changes in v4:
- driver:
  - added i2c functionality check for i2c_smbus_read_block_data() then
    in case of no device support, falls back to i2c_smbus_read_i2c_block_data()
  - minor code edit to support the difference of the 2 functions
- Link to v3: https://lore.kernel.org/r/20260417-dev_max20830-v3-0-0cb8d56067aa@analog.com

Changes in v3:
- bindings:
  - Added pwr-good-gpios property
- driver:
  - Zero initialized IC_DEVICE_ID buffer
  - added ret < len for validation of actual read bytes
  - added comments clarifying block length format and null terminator placement
- Link to v2: https://lore.kernel.org/r/20260416-dev_max20830-v2-0-2c7d676dc0bd@analog.com

Changes in v2:
- bindings:
  - did not add interrupt, smbalert pin does not exist in device.
  - added allof with ref to regulator.yaml
  - changed additionalprop to unevaluatedprop
  - device node name in example changed to regulator
- driver: 
  - max20830.rst: Added missing in2_alarm
  - max20830.c: 
    - added missing quotes in MODULE_IMPORT_NS
    - added comment on why i2c_smbus_read_i2c_block_data is used
    - first byte of buffer used as length instead of the return value
    - "unsupported device" log now does not print first byte of buffer
- Link to v1: https://lore.kernel.org/r/20260414-dev_max20830-v1-0-210d3f82c571@analog.com

---
Alexis Czezar Torreno (2):
      dt-bindings: hwmon: pmbus: add max20830
      hwmon: (pmbus/max20830) add driver for max20830

 .../bindings/hwmon/pmbus/adi,max20830.yaml         |  66 +++++++++++++
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/max20830.rst                   |  49 +++++++++
 MAINTAINERS                                        |   9 ++
 drivers/hwmon/pmbus/Kconfig                        |   9 ++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/max20830.c                     | 110 +++++++++++++++++++++
 7 files changed, 245 insertions(+)
---
base-commit: fb447217c59a13b2fff22d94de2498c185cd9032
change-id: 20260414-dev_max20830-9460b92cf6aa

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

