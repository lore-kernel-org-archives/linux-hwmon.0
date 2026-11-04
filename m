Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763055;
	b=vPGoYRRA0IyRbmHbmB22n0BMeJBJ02QvAOS9n4Xcl1ZZ4dZ9NA0YPCnRPRnc3o/+Qrgl
	 +CFXUB0cZfXhXkw3x4b8jhSKE9QZm4z6EL3SbPTZyLyoXaqjP1/Yyc1YRyI/yJwmyAWe2
	 4gP3XHSWjDr5D0nYOJB3/1hF6hoUM7w2Mt60shVyXS0kHVKrSS6dkrTV7ET8X+ikhqj0o
	 pmM3ubA11akt6zIeBdogUYQ4C+q+aanyyz/b+PwfJoeo+pLYVikjf7vmKyfA7eyLpZ0N7
	 oBf7hXxX+OKAKtVmFE+4s5pZHhvKcXNuOMElvVhlBmRiDVRw4kcpMcR+MKSUDtARm5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763055;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ADIRuleOP-NewSCL:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+XyXkjGVHp8a1VzrAUcQ1Bg/izQ/RfU5wssNLB35ef0=;
	b=b4BG7wBabW15IM3e+pPnROfO9g1vCDBPvImqgYREyCRdT9I0C5CBTNkxh/f5J66k/BOj
	 ER1iJ81jNGwlG5wlTjWdrbKAYA6iBEHnvUfYnjL2YcljXKOHTbEXPFWrGTRkveRI3hu7C
	 736zAhZRzV66SGpWGbh0g6ozeIrKmTVf1o/QdXGWfJN1C+3dtD9WzPx5PvzyqZ3vi4fZ0
	 3RITQqEj79QqaUlOrMAHkt+vZMer4ppQPMr+f3NBPVb+D1o8Jdc/5IRwstHslHjvPTsTV
	 sMSif4BGO8x8lNvElUnWyAtGORfY/kw4PFR1FWEwoK8dIkPbbKPJ6XjZJ4KPnD9oTFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=UChhHIws;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=hNHuP8ud;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58482606A31B;
	Wed,  4 Nov 2026 03:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58482606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=UChhHIws;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=hNHuP8ud
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A43Li0U4058928;
	Tue, 3 Nov 2026 22:30:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=DKIM; bh=+XyXkjGVHp8a1Vzr
	AUcQ1Bg/izQ/RfU5wssNLB35ef0=; b=UChhHIwsi/Fw145yenSZB3fjaT9g6hjm
	CNc9X7LcDLA2ipyXUsg4E1ifhhxOt6ZeQ/B95uKXaDqq3OUDKv8QSa9gypg03C9Q
	jAMS9PmhFTbu/Y2z0vt1aamktSKbNZrH4cMWBZuX5t6VmKAg8K6haeLgk22kxbQI
	ornOU09EWzuWYve4y+ZiDa+FLjIR7KpSN5gZdMoaVUjpsUQg9cpt9gKWdyeuNjLk
	vOCX6djw+QbpBMDCOWjl3KOuZCPObEGcND3O0XKOvkR+tZ0mzdUOg1Qo5uZmMOg9
	JAxV4pmqlj5dKdD0+wqJp9VW/7mUnIJhiHPECie+FVgRidi/Wk0qhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=+XyXkjGVHp8a1VzrAUcQ1Bg/izQ
	/RfU5wssNLB35ef0=; b=hNHuP8udZE/Ov+y23jaiZAaqGsRrnSMXNx9Vwsqm3mV
	cv6pl2PCFvmUsJqgmEXAGYI3oe7B/ydbjiAy3+nDBmsLT29eNVNMzDpmee1dJUEC
	Nee2NtBIQONf6i/08dVicY30RfOn4g0ZEAAnXp4jIz14tz9Xqx70VmzuR+HhDBU/
	CxCw3VmOOSDxQ4ZwfAoQrJaXKXeGPtzqiEAF54zXOXEa6K3a/nu6VQPHExRAxavA
	d0VQJBb559ZMy2aJENaTBWoFBMjQM/FFnFQQPmtdD/2V82y18u36VIbAsRkZB7AI
	q2triZ4k2LZWkomhcbSEHvRo85PFmQdrL+XouCQmViA==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hqnfhjac3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 22:30:27 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 6A43UPoI059091
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Nov 2026 22:30:25 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 3 Nov
 2026 22:30:25 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 3 Nov 2026 22:30:25 -0500
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6A43U7HZ022108;
	Tue, 3 Nov 2026 22:30:10 -0500
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH 0/3] Supporting LTC4284 which is a negative voltage hotswap
 controller
Date: Wed, 4 Nov 2026 11:29:59 +0800
Message-ID: <20261104-staging-ltc4284-v1-0-49fce67ebc48@analog.com>
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
X-B4-Tracking: v=1; b=H4sIALem6moC/x3MQQqAIBBA0avErBMcGSq6SrRQm2wgLDQikO6et
 HyL/wtkTsIZxqZA4luyHLEC2wb8ZmNgJUs1GG06RE0qXzZIDGq/PJmBlF2cIcfYk+2gVmfiVZ7
 /OM3v+wG08BEWYQAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793763007; l=1529;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=d9cxZFkFsz5JQFyeIlJ6lEDoKq2Cecm2E4qBrPgn0gs=;
 b=U0eZ3woav7Bmkz1dmzCNr971d1eTSIejylIhM3ru8dkmYE5o6yZ2zf+eLw6ES84FAqRUjXgiL
 j45aivlSDAND/CNJjwYp2uD4oHhH4OBbKA0jX1JE52yct2Smt6OC9kQ
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=I6Pw19gg c=1 sm=1 tr=0 ts=6aeaa6d3 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=pX8K7AMcFWmkIJv9s54A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: c_hDB8f-3JiSDtnyvZQTFw32Wog-MnNY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxMyBTYWx0ZWRfX4edgSSfr+DaO
 GiHPjqCdG9yE1YdC2WOZrX9KovIom6U+Wf6cVyV4yhDsKVpVKXloN/0IOAiCp/PRSkfRVGzElws
 hqHh5krtnELM3AtAjWQyTGO+LBFUmMKlrG2tSncbphb+z6fsWK7Ho5X+rkFLI9Eyj/rC6Iu6J02
 ak0uxRGbi0mh0rd4AUjgJ7p2Aqh5rb03CPtmkhvPkX9dJtWkSw2e0zUOSYo86IINcraCPDKDf2n
 7eZXTGbzgXZ+DQkEGkfZQWv+Kk6ZEuF5Chm5oeDsKFXW44N3cNYjihYcsekGTZqppsykRCtDny8
 hIa60KV/6CLT3X3JkT6BTjFiJrC9bK+4cqU4dWHBK0CpLOkxfXffsfemPMvYiXM654ldegUZlyt
 xSYsEqWl8TWg6xkjvKFKnROn/4tKI6EmQ4hFuLdD82ODvhcziqBxjQL3ThceS7rujeXuefKmG1A
 +ZZh7r98lduErzEAuHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxMyBTYWx0ZWRfXwNPy2KHYRD37
 oIPuhItRf7Nb9VYMaZptwf5LazBYf+gKgLbQJVePDncuLt2Y4+2Pp8ASp0SmSPsbur2fba24wGd
 1tF30s1gkJWao3KqWJBtMMqn4/7/qofoLlliwSb/yzbw6xlFUKgy
X-Proofpoint-ORIG-GUID: c_hDB8f-3JiSDtnyvZQTFw32Wog-MnNY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040013

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
Alexis Czezar Torreno (3):
      dt-bindings: hwmon: ltc4283: add ltc4284
      hwmon: ltc4283: Add support for the LTC4284 swap controller
      gpio: gpio-ltc4283: Add support for the LTC4284 Swap Controller

 .../devicetree/bindings/hwmon/adi,ltc4283.yaml     |  57 ++-
 Documentation/hwmon/ltc4283.rst                    |  54 ++-
 drivers/gpio/Kconfig                               |   4 +-
 drivers/hwmon/Kconfig                              |   6 +-
 drivers/hwmon/ltc4283.c                            | 421 ++++++++++++++++++---
 5 files changed, 472 insertions(+), 70 deletions(-)
---
base-commit: 4b8a299cc032d3cbcc68403724740fa14ed7a592
change-id: 20261104-staging-ltc4284-adb24be174a6

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

