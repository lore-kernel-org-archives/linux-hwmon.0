Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7643E1D04;
	Thu, 16 Jul 2026 08:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190435; cv=none; b=gkHnu/x6ac8qjirr50yukqYPLf8q1T1CWJ5Tu7uUAtw2U4K+KxVmz1ljerx19h2MFakNsPjHCDgCxksm3Soh2hyhwaC0JiA9n0rrfEQtBkJdGZazylaf19hCfIz/6PR6sfIiaF2cMTMAouv8pF/Qe+Y57fHiUhINDOgwpV2tJk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190435; c=relaxed/simple;
	bh=y/qvqjK03GUSm9j/UmeJsnNj4sfX6+icnJOo+YfcLiU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=lXfY/TfqApXTRe9yCzQcEkOkKP1+tA/UOeNNKP6dqtCcQsiJIVaTBcrw3vfGJRsZuDOB7aTcI/BPw5dcI9+W5Gakp4u+7NvgAyjro7oxEMkM4D7yXZcrvpwF5cJSaiOGZ6zTkKLeC5mC9fdDXEEM9QxTX1ejlbpcNoYElu0EFTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=X3l07pdN; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="X3l07pdN"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7INTt3064266;
	Thu, 16 Jul 2026 04:27:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=hpqjHSOywpd1CfzQn3VDfvopVcn
	QMBc+azeUKYsG3AY=; b=X3l07pdNdhUk5Pf6TyZPj+PX8LHBe1EGZBhbJdbkGtq
	oa6B+Sw0BoAqK5Q7KfO9qcatl9VIAAtBYHUlWIzCtXln8qTsSdD8IYkYLZXJFWEq
	DHBPoU/ITBoG1YkCsBdAN8w5PEU4qZ2xpWX75m2LAw6eR6XhUavy0UzPPMA9ekNY
	fZ5mkQEdY1qnYq3gG2OG5QmDiKSGmGnVs5VOcreMruJmAVVfUoaIvnmesqDM3BlV
	wWRjexbo8FfrJIOkbb5/KhI7qUY8QwFSF+V0cajfuPTT62TIkGh+4cQBM3Zs1cAU
	A5lnPJAwR42r+UC2K7idR9R4w6P6n+DKS2Ii3rNcZCA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fe85wva2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 04:26:59 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66G8Qww5061324
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jul 2026 04:26:58 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 16 Jul 2026 04:26:58 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 16 Jul 2026 04:26:58 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 16 Jul 2026 04:26:58 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.190])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66G8PdUR014492;
	Thu, 16 Jul 2026 04:25:42 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH 0/3] hwmon: (pmbus/max34440): Bug fixes and supporting new
 device
Date: Thu, 16 Jul 2026 16:25:10 +0800
Message-ID: <20260716-max34451_fixes-v1-0-a941b27eaecb@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGaVWGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Mz3dzECmMTE1PD+LTMitRiXXMLi9SUJDMjY0NDMyWgpoKiVLAEUE9
 0bG0tANsmpNpgAAAA
X-Change-ID: 20260716-max34451_fixes-788edb623116
To: Guenter Roeck <linux@roeck-us.net>, Kun Yi <kunyi@google.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>,
        Carlos Jones Jr
	<carlosjr.jones@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784190339; l=1377;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=y/qvqjK03GUSm9j/UmeJsnNj4sfX6+icnJOo+YfcLiU=;
 b=aEQHhdhzOT2TtjXcGnmr1Zf6+ZSuLXe1l7Eq1mhQ86l4p/1Kh6CtLIS/zASSbxa7DxC+7H2hY
 2IpqyUQhXKxD4khPgbizgmrwcJ0JVM+xaj/GmjDD6uEcwxY78kKN3PG
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=aLnAb79m c=1 sm=1 tr=0 ts=6a5895d3 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=pX8K7AMcFWmkIJv9s54A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA4NiBTYWx0ZWRfXzhRQ/gmV1bt8
 YSF9DaDY+mZfPQc+yCifGZJr6bRam1WriFDTRaHEnrQhYOKXw/m+26KlOHC/gPdRy3Uyv01hME6
 8VI3Q9JHd5ph/sb04HSRjdaj0Dhs3gwnUImAUQB+g1pMXQGi4hqcW/dZvUGS0uAi/tNkFmmj3Jt
 VVTNxwHLR2DFCnuvaq8Jf93n6euMbMyBucsTXURd14AZixmjDLjWASB7JUgorMDEMq3KX+baGGK
 7j8uqIdab9leBDRvtyhhj6Jc7YFJkVsMJZimIyMhBLNOtELOd3k0oOR0YeGQddLuZS5C5ePbUBP
 PAeVpsM1wnkWogeQEajTBWYqFs6U3YrqUId9S8bLi6FQ3klD/XqdN2OBFKZco9y421XQLiXITTC
 bINBIS3P3TGw+qaX+iZrTNTGVArwrLR60FEdMhkay4lBv/HfBxsGlK/Ax77GwpLkvOF1sjz5WVW
 B37rkwpTBEh9tYm5l+w==
X-Proofpoint-GUID: uPkU1oaGG-DpaQ3jSKfwvPyZYhBvGToV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA4NiBTYWx0ZWRfX6IAYlBdGHQLY
 JyWZ+6t+ZIPfPMC1FrAxcLcS9V7ihVIlKYO3QRHlR1ItHfG1zztiDH+MHmExSQ8quVf+yWPYnCn
 MO8qilULXBdOuM3rcYJCr5TF3mq3d+6AZvkqoeu17VIfrI9eIz7Y
X-Proofpoint-ORIG-GUID: uPkU1oaGG-DpaQ3jSKfwvPyZYhBvGToV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160086

This series fixes register access issues in MAX34451/ADPM devices and adds
support for newer MAX34451 variants and the MAX34452 device.

The first patch addresses an issue where the driver attempts to access
unsupported registers on MAX34451 and ADPM devices, causing CML errors and
triggering ALERT.

The second patch adds support for the newer MAX34451ETNA8+ silicon revision
which uses different direct format coefficients for voltage and current
measurements.

The third patch introduces support for the MAX34452, a 16-channel voltage/
current monitor that shares a similar architecture with MAX34451.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
Alexis Czezar Torreno (2):
      hwmon: (pmbus/max34440): block unsupported VIN and IIN limit registers
      hwmon: (pmbus/max34440): add support for newer version of max34451

Carlos Jones Jr (1):
      hwmon: (pmbus/max34440): Add support for MAX34452

 Documentation/hwmon/max34440.rst |  26 ++++---
 drivers/hwmon/pmbus/Kconfig      |   5 +-
 drivers/hwmon/pmbus/max34440.c   | 150 ++++++++++++++++++++++++++++++++++++---
 3 files changed, 162 insertions(+), 19 deletions(-)
---
base-commit: ca078d004cf58137bcf8cb24a8b271397431ba58
change-id: 20260716-max34451_fixes-788edb623116

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

