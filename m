Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794185839;
	b=1HEuW9A2qFrudLbkhYUZmLYnhrSIDxwdyvDw+imEn4z2C6JVJOubjUXZ/Jd7cUaBy7+7
	 cci/sev7fv5NfH+GFzP7NZwyJ/Zy8kGVPZrAHYcAdgWKMH2++uU92Xiqyf51hhDbyKmcU
	 BmUyQd/w8mlmqkvV+d/dIWyxf9L+C5TESX7/GgKu8hEKJTEnQkzEfJL16WlMkX90FRQ4b
	 4RPN0FGYcXzhzW+kGgj/A0MZaEF0y73RjS1SwllbKf2LJCX1qPwHXjp3VsZDGxEVBdX0J
	 H3vKEc0BU1vTNuz5zYFjZh5BDxaMSxpfpZoG2RicP5hwCLkYZO2oyiHjG6SA4SxeqOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794185839;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ADIRuleOP-NewSCL:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RmcDxsTaGmQX7g/6fvKt60HTDejRP2Hb5LhjXbHkJQE=;
	b=2xG4nU76omLMGKPJnWvfJhy+fNxxxF9+fR5+vh/c6/cvsJ2II7RE5RBLMB9O7ArHmF43
	 jKmcjlj6DjiACpiAZcJ+uliNJRtYijlmHoLcAzAB2NXE2pVo94RHxLt0k8PovTS5SrHJr
	 TF2jqueu+NsKXMtSMzRD3dNSbUlcrNSojaD/7VLufHNwOD3VTKuM6djiH+O7s+/cA9Do9
	 y2/wy7paeUAKLCgff5K+DI1HFgRlWdTUB8/supQz5AtHOLNy3HLkiNA2XttDFtlTVNivt
	 Pr08xDmZMc/f1mGoIA9JwFNCAFK4Q5BDWi5l0eLpsqX5alFvIqisEnSensfyIAuIpSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=n1p5iJL9;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=urkGcv4k;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF136606A321;
	Mon,  9 Nov 2026 00:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF136606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=n1p5iJL9;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=urkGcv4k
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90GXjQ3370631;
	Sun, 8 Nov 2026 19:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=DKIM; bh=RmcDxsTaGmQX7g/6
	fvKt60HTDejRP2Hb5LhjXbHkJQE=; b=n1p5iJL9Uvt4cnljU3OFSoxQDvVYxSL2
	gkBm7hkGEWe2paJbo6mV9lNPt4v27oTtwjj83DPGiZwHdv3sP2xudPUtpIxUBeov
	EmYWqlSShFUhCqgSzmvMLMhmARcmU/GzHxhXH+q93dPS/TLjaHXh+B5nUS6i5S4g
	gxuz94cYmUE4ukND1g6NCT8RXKPOF+BHSzNNwhOAU/AavdNPkXsjBAHbn5h3fHqw
	Yzk6C2IdqkYhibKusLAGKM2Hiai3cQEJQ2GQwH5m056++FsKywbaaiXO2orUcvcZ
	ar/aALjlsvHWS1Mup3n38ttm2rjPfMqsjJSqfOXKw5e2vHxcm0bYOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=RmcDxsTaGmQX7g/6fvKt60HTDej
	RP2Hb5LhjXbHkJQE=; b=urkGcv4kVl1UUlEs10R9ggJm86fWUnzi5ZKzU0HvlOv
	XZ+IYOlaz7OEpqz4VQ5JMv/9b8iMZfPBBjPAg0RvvyakDtvFH+NihMKMvOU7KU9+
	qLcJsuwK2h+zlbBRjFiYjFyiKEVZyVDG0RmameCx5bS32IlzfAbpCnLb64vC1HDv
	v97d4Mmb7NjMOdkP+nMatNRVqjbiiGqN6IlttoU4hBHYXhv6Oh92d+1wZ/TY3JW7
	bAX3FFv6POgVKc6HMsRV+RI1t2Ix7QlrRjV2ngQCFfery8qeFSgsNozLldzVrIa8
	q4UItvE2AEHHwR21MMBfqyk/Scxv3WLR95XlO6l4zhg==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4htp6kkhky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Nov 2026 19:56:44 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6A90uhSx004196
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 8 Nov 2026 19:56:43 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Sun, 8 Nov
 2026 19:56:42 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 8 Nov 2026 19:56:42 -0500
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6A90uNDm028853;
	Sun, 8 Nov 2026 19:56:26 -0500
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH v2 0/3] Supporting LTC4284 which is a negative voltage
 hotswap controller
Date: Mon, 9 Nov 2026 08:56:16 +0800
Message-ID: <20261109-staging-ltc4284-v2-0-14a270a38f7b@analog.com>
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
X-B4-Tracking: v=1; b=H4sIADAa8WoC/3WNQQqDMBBFryKzbkoSBrVd9R7iIsYxDtikJCG0i
 Hdv6r7L9+C/v0OiyJTg3uwQqXDi4CvoSwN2Nd6R4LkyaKlbpSSKlI1j78SWLeoehZknjROpDk0
 LdfWKtPD7LA5j5ZVTDvFzHhT1s/9bRQkp8LZYajuaLPYP480W3NWGJ4zHcXwBq2/MsK8AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794185784; l=2068;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=d4bHpKhDzCfon5hBFz6tf/agmzey93qGusSAJ3FN4n8=;
 b=Lf6+vvTVAXfQ29olRcASXUBn3XZz8sinFf1S2TmjHjrZ1ai5sqEZpNI1nHQNPByevk1WCK3c2
 BXzloRkdmcvBtpM3VCBCpAVNBSsxriqIq0Ib+0/+BvToaHk9/YMaV12
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwMyBTYWx0ZWRfX+XEjV9smpmYZ
 sXye1WTHOaxVIjD9OExt8Bjna5UscFO9ALK4fTEGyJp0gMf5MiG7FTpHGx6/Awlji5DdeVJ+ot8
 mZfI5l8YJ0OxQHIpnkYiFuahx/Aul00K50+3uR2FW5vOhgmGRc9y
X-Authority-Analysis: v=2.4 cv=C9l8WgP+ c=1 sm=1 tr=0 ts=6af11a4c cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=lAPpY2re-nV465j7mocA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: nSP4mhZbrW1igxxf0skqlIwpjOG3XZ5P
X-Proofpoint-GUID: nSP4mhZbrW1igxxf0skqlIwpjOG3XZ5P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwMyBTYWx0ZWRfX+fsMu0xf92kx
 Xa9LVzQFyPdRvFIVD/XLmGCUtbR2fMiSqzLCvHHXD12zomihu8Q1uscwph31Ssey/lYqbshvs91
 GfPiAQlJFCdZiUOSZdK8U+50cc9F7IGiDBQrjjSYG6YWyZ/hOKUP1CLA2LHeXgDyn+7WkYKeTKZ
 6yH+iM6K6njkB+p+Va5t2Z4tIGeOxhQ/607NqI0qWCt/PFQl7lxDchX5QLFk0cQOZIgMDCwBOzA
 yhO8L7roxRDJJoQEsijMcaRwlDZ+5JTcBH6Fj30xzpsStJI1HV1+8RQ9YWvsbd7+tZesVXbbz6Y
 VZ9LNlWtrHSLDLiD/1yqlw9wkXjOklmW6SV9P6JixZ9NET/1cBB82E/4pGDYda1B/fXwGmlr6Ba
 hgE/eW9pThXS5m2kq/ZLKnn1onXHk07T+0EMd9IWjyCyhluoQVJirPjKwicHZSZf36CHTlNhRcx
 jp1sRUd7NbqpeXyAlmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090003

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
      gpio: gpio-ltc4283: Add support for the LTC4284 Swap Controller

 .../devicetree/bindings/hwmon/adi,ltc4283.yaml     |  56 +++-
 Documentation/hwmon/ltc4283.rst                    |  54 +++-
 drivers/gpio/Kconfig                               |   4 +-
 drivers/hwmon/Kconfig                              |   6 +-
 drivers/hwmon/ltc4283.c                            | 288 ++++++++++++++++-----
 5 files changed, 326 insertions(+), 82 deletions(-)
---
base-commit: 4b8a299cc032d3cbcc68403724740fa14ed7a592
change-id: 20261104-staging-ltc4284-adb24be174a6

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

