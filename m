Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904079;
	b=DalNdmA+EIrZqpYMnkPfick7Gp2BIa1rdYcLo7WKX5UwJyredzVIaXM2A27bpnW0JtOb
	 fTezEj5xKA79xdZ8B0WQ7VO/36cGKkWjMJjR5nRTKhZUWCkrygcSj+OULTReMR9/YW1iL
	 VHHa305xjGLc1/c1LrcJdTAKsC2XbHqiOmXn0k3ZrLpMzhdrHIEyIJ0lOF7GBs1cSRCsR
	 9QrEVtg4ITJ0gkJ/Jpme0LuhKryxkxXqcnuOwrCrdcd9VvtinL538u/T6Ha8ISSqDsvjG
	 T0137jQZcidJFISgWavPZELhLkYNgQ7uT1pizFBDsGvKlPEdHZjsy8AkuGTGJIdAhiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904079;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ADIRuleOP-NewSCL:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AIAWql2O/LOnOmaJBWYQ6uxIoFpOU07a1wwpmk4Q3qw=;
	b=5qF4MGNN0Q4MErLbo/eNMOyjf4RA+T5B6BA3B3C2eygQ0W+gZz6IX3uCvRYHXJOYJAqN
	 4WlE4jab2g5/7fGZK3zVO6l13YOCb/u2Gbl4DooIoMuFrcSTq3N6Sc0rCr//n3ppUqYrB
	 3fJW5xtflz/31ikl3uZOKIV0Ep7TriufkSrXRKLTsjdaoFA70gt0XZ4aJGru92rtuGTZi
	 DqBLYXoqOqcHvFtS9pCC8TUSTRQgrv2FCaJDkd54Y/zafxSsDjeEe+JFbzxd/s0S9fg4s
	 Yjj2IPdCYWBR2rl0vc/tMJFHinHG/JuRWNTTi4uIWAChQaRR3imwuftrnfDR4yyMq2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=d1waNe58;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=D9Atnl1h;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEDB606A339;
	Tue, 17 Nov 2026 08:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDEDB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=d1waNe58;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=D9Atnl1h
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH7JXKX3553753;
	Tue, 17 Nov 2026 03:27:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=DKIM; bh=AIAWql2O/LOnOmaJ
	BWYQ6uxIoFpOU07a1wwpmk4Q3qw=; b=d1waNe58RlSELaVLCRgByIKsF7x50ati
	uYhN8neB/ISrqhbF3e+hqxHGYx0BVrkrq9mec3botzikv1v9NEOrNMJ7A1Pzpl9L
	l+zI213BERPDuYmaN2dgUXF49+AB+d0WnWZCgl+P7YV90YnkPNt6MHyW2kWFqpY8
	CJkvZ1Matl97Nv3Vr/UI28AYplqMG1yruEzZP0iQhiHRlGdUsdnmIAogN3qzRSd3
	Vnjy4rataL45HRMsreHiqfs/POQTC6oR3E+s07NyMng6ikqtImDHOi6IMcHsLgF1
	CcT7xLFYB2TGKjjqii02Lufjg6FfNGlcx9FlqJdyvxr89Z6kiTqoeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=AIAWql2O/LOnOmaJBWYQ6uxIoFp
	OU07a1wwpmk4Q3qw=; b=D9Atnl1hZyw6eECeOiQExxuNN++Lr/o8UTkrhV8uMJu
	ykdO0RQgVQmz1J/2VjbHXEe6Yv/KJwS9F+0q9YxsD5rBpqoPsmvGb/aaOoWAq1nb
	LoAvHdD6sMzAJGQBJQS3ARic4eemHcA6GxLslJXrQ2Rk+Sp8NRpNgltX9EZDkUpU
	i9AZVv0S/i0+AsFG7GSLmxwYqCGEZC9VlE9eB1yCwJ3tOzjPbOoqF7NwfxMeK4zD
	HhhdqGA291YwIKF6/cY1b3iAT5/S81A2xfNEciF/NNOIvrhRz9tKSHrZkbEAn/0I
	itehOEU6N1YtSTgrzRP2/LbkSGxP6y8/JZwH1nY3A5A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j0jegrcg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 03:27:35 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6AH8RYOY046858
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 03:27:34 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 17 Nov
 2026 03:27:34 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 17 Nov 2026 03:27:33 -0500
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6AH8RFck007690;
	Tue, 17 Nov 2026 03:27:20 -0500
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH v3 0/3] Supporting LTC4284 which is a negative voltage
 hotswap controller
Date: Tue, 17 Nov 2026 16:26:47 +0800
Message-ID: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMcP/GoC/3WNQQ7CIBBFr9LMWgzghFZX3sN0QemUTlLBQNNoG
 u4udu/yveS/v0OmxJTh1uyQaOPMMVS4nBpwsw2eBI+VQUttlJIo8mo9By+W1aHuUNhx0DiQatE
 aqKtXoonfR/HRV545rzF9joNN/ez/1qaEFHidHJmWBofd3Qa7RH928Ql9KeULpE8EKa8AAAA=
X-Change-ID: 20261104-staging-ltc4284-adb24be174a6
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz
 Golaszewski <brgl@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794904036; l=2329;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=DCsfl7Y4Q8qAMtA1pPymGDqGoS+DBQP5Diz6GCROnxU=;
 b=ho05svMGdRDMn+7SL1XxyVUpDI4UGVa1Ua06We+5BNqlwaKzIh5ZJ3SSuz7n9LRt2IzUvhKyA
 51p74AKVLyDApv6gEhhYBwdUsJYFl3jcXa05ZYHARrPSsuEQGQ5vuwT
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: YLy0EsP-md_vCeTeS_H6WnBgv1aAQD-f
X-Proofpoint-GUID: YLy0EsP-md_vCeTeS_H6WnBgv1aAQD-f
X-Authority-Analysis: v=2.4 cv=TL/Q2Fla c=1 sm=1 tr=0 ts=6afc0ff7 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=aBXZGasqtuxsuxeSzLgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfX9zL7CCulkp5c
 nfMUKxdcbkxfUZSedOAEHpvnGiq2qIESEBrs5uLs5nviI2icwXigYk1ziymG74BnHobUj9YIbXT
 dMEJrbtNLsB1Cgvbhmc4uyd1DgixwaV88HfY4I88l6ay3XTOg1/nGipq21YOYZnoLi7EguLV1eH
 nfIwuyQS3cq2U7A9aq9PruetN+wO2jQADAgckrvGdjWzGA/uOadPiijUEnckE5FIoOCNMK6W8A4
 lewZItBXiFBSoz19H8uQmo5eOHtWM1HCglm2Dlo6xiC0qgrRpRZbKB1fZIHPM8Do+C8r4V6oBnL
 TbQVzRI6yxYbcZF0tNNUR42V7rmjVQNQaIHoxFly/unF5/+dd4wL0lfiOYE7UqOH98+IhHXmrDs
 VmCqS1CWH3mPgGGvJ24+GujWIB3pgs11iFhJPbqbj0nQdiH4hb54KuWu/OeAGp4xXJ6CQWEeZA6
 8mkD7ZVwyK0wN4OcNsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfXxtj0i4YyOx2O
 sKdD4uun09RkkYGy9EWXZjHUL1TwBJwwcNqusP8PJJsVh/7wCWhwwIIv5oJjC3YPAQFV+sOpVwO
 ya23m9flpgAyTOuEVAIdx6ZJRmB7qvqiURBCCmFI/nZrRn8rmOhA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170033

LTC4284 is a negative voltage hot swap controller that drives an external
N-channel MOSFET to allow a board to be safely inserted and removed from a
live backplane.

LTC4284 is very similar to LTC4283 but for higher power. The device features
programmable current limit with foldback and independently adjustable inrush
current to optimize the MOSFET safe operating area (SOA). The SOA timer
limits MOSFET temperature rise for reliable protection against overstresses.
LTC4284 also has up to 8 pins that can be configured as GPIOs.

Uses an I2C interface and onboard ADC allow monitoring of board current,
voltage, power, energy, and fault status.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
Changes in v3:
- fix gpio patch commit subject line
- ltc4283.c:
  - adds default value of radc 
  - removes optional parameter from ltc4283_read_resistor()
- Link to v2: https://lore.kernel.org/r/20261109-staging-ltc4284-v2-0-14a270a38f7b@analog.com

Changes in v2:
- dt: made rsense2 optional, and made sample values valid.
- Updated the gpio patch commit message.
- ltc4283.c:
  - Use named initializers in i2c_device_id
  - Merge ltc4284_info[] into ltc4283_info[]; uses is_visible for channel difference
  - Removed 8 helper functions, added them in chip_info struct
  - Add ltc4283_read_resistor() helper to lessen similar code pattern
  - Made rsense2 optional in driver
- Link to v1: https://lore.kernel.org/r/20261104-staging-ltc4284-v1-0-49fce67ebc48@analog.com

---
Alexis Czezar Torreno (3):
      dt-bindings: hwmon: ltc4283: add ltc4284
      hwmon: ltc4283: Add support for the LTC4284 swap controller
      gpio: gpio-ltc4283: update Kconfig description to include LTC4284

 .../devicetree/bindings/hwmon/adi,ltc4283.yaml     |  56 +++-
 Documentation/hwmon/ltc4283.rst                    |  54 +++-
 drivers/gpio/Kconfig                               |   4 +-
 drivers/hwmon/Kconfig                              |   6 +-
 drivers/hwmon/ltc4283.c                            | 285 ++++++++++++++++-----
 5 files changed, 323 insertions(+), 82 deletions(-)
---
base-commit: 4b8a299cc032d3cbcc68403724740fa14ed7a592
change-id: 20261104-staging-ltc4284-adb24be174a6

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

