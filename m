Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792991014;
	b=vcMtLrDpaRtA+AJYcvW7kGckAwZdJ8tvkOMWMZHKX0e9Uz52iPCsU+SaDkIV1Q/7+M77
	 pUI+X1bD2xE2K0cBukiWi4QznQ0I4FelXxba4X1WkjPqKIFgWiCI1ximucS8GStOIVETJ
	 RCuFsYsi85TYXDs8895gaIUAI5rRSbL2ZQN8SavNBI7KF731P3wqd68Ib68i42puArCwJ
	 g5aD5Nr9Nub2Gh/aFfCS6IV/Tx+6kYysdboadQVojkcF0wVYdYqoXGyLGtDkChhzbVRk1
	 L7BhPHG8wX0gMhBc2nE8kmAsvK7+Ie9GIF+efF5nNcfV9D8cQXup72alemrWBfYL9sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792991014;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-ADIRuleOP-NewSCL:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7fIpcCZXocQMttUqYuyl5iJalGL3TEI8dNQycbbbhnI=;
	b=VvmuA/E3T4GBDuy4WvSlnxyvkuHRHI1rciCK2ZjsUhupltC9AGfqXjswhHdIbTINPgVB
	 gWHacYy3XcYR7zw2yuPDPpt6W7/hJpGnmQ7f0PDo5t8Y2bIOywhRRiM6+cZLPooP6wqNw
	 OGJj2anyPNM4Jxlct77tn1x13XAqQ0bYmXg6tlyoC5QARXpD6oEEzpKkGwS3c2121ZVVX
	 1ehOYLK+TvDJTiLzRedLnFDFI2A8Ka6rzhCvOZi8uEoZZpf6PO30AJIoA5Cy/tVvl6n54
	 +ygzf70HGsod5T2xMD9pTHdOtKoGl/TgbZrBHhhtAF4TkjNoWgBSMryQu01sUOfcALw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=bp5MvjBR;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=oVvQulfC;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F4F606A31A;
	Mon, 26 Oct 2026 05:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47F4F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=bp5MvjBR;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=oVvQulfC
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4om1H781070;
	Mon, 26 Oct 2026 01:03:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=DKIM; bh=7fIpcCZXocQMttUq
	Yuyl5iJalGL3TEI8dNQycbbbhnI=; b=bp5MvjBR36PpE8dYIStcKoXc+rKW9ayP
	CakyVpTfhZdRB85qIxWe4qMttVP9ShES8Dp3uE0Iuxx1mBSS9HPA0lOwCjQ5GAN/
	8lqKD1tOsQTpfsigY8U352u1miINfRnHAuikwb5J8z4nOFyPTlRnDSeVj1tdP3Kp
	UH+XqpsEk7TFNBiBsu8buqf121KvlkIGPxX6tNTXC8QfAd5xl7nzOYfUewtp9H7m
	FQaF1VCX2TM/ur0hISRupxwim7yVbHm3dS4+ScOHBRDYjcksTgzG4sjhjADLjWej
	LmspzT6FQE+Xy0LD5CYkCWpZ9MjPqgK2yA6ROJhIc/OQhhiY/xEepw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=7fIpcCZXocQMttUqYuyl5iJalGL
	3TEI8dNQycbbbhnI=; b=oVvQulfCA8TlJO6LinNQzuj8TXpn3e0uuddOQGtRQUH
	yECrHdgDnkDOD2fhr7em8Pb7Mymc37XGwNQHyVafOT39CIHizRPD4SToT9ohenz6
	DuTvFvHZ8vTKzzRa0CCfWlvDrzcf7orrYfdqnOrfB+lpvi9iVtVtS2RwT6XjZVG3
	P7Pr/luwBILC+hIIgEkq2Jby4zIAOCGsDzcptHqFKhl6aUU88dgT/qZ0HyiUBlWn
	GSB5jODFe13+Xm2py/KUkNyq/YT+QQF5LDG0NQD1oj66Uk1jYzBbJm8MIwDlBWi7
	Ph3yeV+YZiaCJv2g1jg27MHm2CCVPU2kUwSlVVtxJYA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hj06h02wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 01:03:08 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 69Q533Wj000975
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 26 Oct 2026 01:03:03 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Mon, 26 Oct
 2026 01:03:03 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 26 Oct 2026 01:03:03 -0400
Received: from CJONES7-T01.ad.analog.com (CJONES7-T01.ad.analog.com [10.117.222.42])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 69Q52g3n018821;
	Mon, 26 Oct 2026 01:02:45 -0400
From: Carlos Jones Jr <carlosjr.jones@analog.com>
To: Guenter Roeck <linux@roeck-us.net>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] hwmon: (pmbus/max20830) add MAX20810/15 and LTM4739/40
Date: Mon, 26 Oct 2026 13:02:39 +0800
Message-ID: <20261026050241.100428-1-carlosjr.jones@analog.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: DxRvgEDNs9ipoJMYT_S1-gi28YsuN-6C
X-Proofpoint-GUID: DxRvgEDNs9ipoJMYT_S1-gi28YsuN-6C
X-Authority-Analysis: v=2.4 cv=GIWdgeNK c=1 sm=1 tr=0 ts=6adedf0c cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=GWNPTgfDF31ebz1laCQA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAxOCBTYWx0ZWRfXwYzuPJ0ipnTY
 eiEVKhkADMTtME0UJ9V3yWf8QLq0pBhPdjCEQZ/v/UqKk2HAX9PyenVt6byd/6UVitv5NZHIcr3
 cbZp3HfZC1YcOgaWdVi66T6RsgfBwhQHunagBCkH1YDK9e+pewVk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAxOCBTYWx0ZWRfX0TA3/6NZ9rDE
 7QKZ+urx8xIoQHQf91lIsKp6gNFny8WO12OLg5Dgkq5pO7VGAAjjaVFooV0oxc5yFCQeR3hP5/h
 vnf+W6q8Wg2WAqEnmFgFxfxvYpS+wU0SEoD2qN5pKCBNg51ROkDNuA8cyvnu8vzju+XcQrjGe9V
 ShORUYirZ2w7UxfV/y+b5vWYYY4eHEtMt7dvwy/1/B5QrNBxlzIgI+l+hoGlCq/hLuSdb/feybH
 eMNS4G1YHgswzrCjXGYCCWy0jvRznzIgF+GYdHH1anVpoae9hLEicKXuqG1kx7eAMUcIhSQEQB+
 0lM+B2DNWcH/RSETc1sFx1sFHrKTeIaGwtLhbL/yAIcqzjRof6UOL2dPu1A8Yv1LAnfgsMM2Pfq
 yo2hWb4cPLUXX9RwlbAIbzfPWZIeM+/feJR4x8JLG6E+6wmRetK+yKrxuFn5RZ0BpceU0BEvheC
 0YTOta+ltxcQ/9GKYiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260018

This series adds support for four additional members of the MAX20830
PMBus regulator family to the existing max20830 driver:

  - MAX20810 (10A) and MAX20815 (15A)
  - LTM4739 and LTM4740, the LTM-series module equivalents of the
    MAX20810 and MAX20815 respectively

All four share the MAX20830 PMBus command set and telemetry, so support
amounts to accepting their IC_DEVICE_ID and documenting the parts; no new
register handling is required. The LTM4739/LTM4740 modules are built
around the MAX20810/MAX20815 dies and report the die's IC_DEVICE_ID by
design ("MAX20810B" / "MAX20815B"), which the driver matches at probe.
Device-tree matching uses the existing adi,max20830 fallback compatible,
so no new of_match entries are needed.

Patch 1 adds the device-tree binding compatibles; patch 2 adds the
driver support and documentation.

Carlos Jones Jr (2):
  dt-bindings: hwmon: max20830: Add MAX20810, MAX20815, LTM4739, LTM4740
  hwmon: (pmbus/max20830) Add support for MAX20810, MAX20815, LTM4739,
    LTM4740

 .../bindings/hwmon/pmbus/adi,max20830.yaml    |  4 ++
 Documentation/hwmon/max20830.rst              | 51 ++++++++++++++++---
 drivers/hwmon/pmbus/max20830.c                |  4 +-
 3 files changed, 52 insertions(+), 7 deletions(-)


base-commit: e1b3c2630d5b8bc755fe4ba86d20d08c734eb504
-- 
2.43.0

