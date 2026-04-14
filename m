Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29B4239E7F;
	Tue, 14 Apr 2026 04:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776140984; cv=none; b=dW9f5j5pGIxyGqHAyuSjJDx3K6oQyPpqZNKIcXOYsPO0bwjbPlhIfy0ZZRAEBa7EG8P/90IquDio+QSXNQ2OqApQesQzXTHgOcIhqIGLP5YvdDJ+INIa7tR1fe14L3pvN4pt8IpwSk2grymDUvvcb2zrcJsvbQ/sDCH9nNrLMDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776140984; c=relaxed/simple;
	bh=3xcQT3+a9MIe9pCiakaUnB59iMwSLjwM8eNvmQio8dI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=dUxiaQXGTqdY3ySRdwdMh30I7bpknyKnt9E3vM4QF02pSIT9cHgYTVtZXsLow3TxcbdKXxU2JP4XCLM44l+5Z3Gbkug1Yan0hFyTUCRtAJ9nGsHRZ70FEuFTGPdOJGfM9gK82/ZrKcvohBD9CBPbGbQ1A+AHfZOqvujHXuLNPOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Rf2fbn6C; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Rf2fbn6C"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E1j9QT3139121;
	Tue, 14 Apr 2026 00:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=fXERfDlSYUI2ZGeSdS1ncd7sLK7
	26KwEeq4oU1Gb7OY=; b=Rf2fbn6CXx7DP/VOKiKTphNfzs0u9b4r8MCVgV9s3gT
	oRdQeO6EmEGmK8jKdLFWTn2AnmsznKIUvhihSD8xPuuUqf++HX4m4TTwnta3KPIa
	9eldAN+J11SBPLVTcyzyp4j2wm4rUsV31pRF0c7Pttu/9wFNtkDoehBtAYxh9OAP
	meBPlxrOZGTfgMtN3d+BcCWTcyHH+Spq7MAh/Mm5AkktFJ1HMurBwg+tY5UhX3Sr
	Ox8m7CBdMoFPFIAKTNaH7/EhUxrToAZt3MsFfglhFGoGJo29lXgpaH/RmaqSDPfT
	Y3IjaNwFkvSl7I50mwOwETzayleHJVh+DSRJG08qgvw==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4dh8591ffa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Apr 2026 00:29:13 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 63E4TCsP022949
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Apr 2026 00:29:12 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 14 Apr
 2026 00:29:12 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 14 Apr 2026 00:29:12 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.190])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 63E4St4U011556;
	Tue, 14 Apr 2026 00:28:58 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH 0/2] Add support for MAX20830 PMBUS
Date: Tue, 14 Apr 2026 12:28:48 +0800
Message-ID: <20260414-dev_max20830-v1-0-210d3f82c571@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIHC3WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0MT3ZTUsvjcxAojAwtjA11LEzODJEuj5DSzxEQloJaCotS0zAqwcdG
 xtbUAGJewSV4AAAA=
X-Change-ID: 20260414-dev_max20830-9460b92cf6aa
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776140935; l=1270;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=3xcQT3+a9MIe9pCiakaUnB59iMwSLjwM8eNvmQio8dI=;
 b=3FnlnOh3CwoB9XnJ2Kachyi0djFakM1U/NRWZHAijPj/+crlsKNhUl71gQf+9RsiUXVuQ/+pY
 OgRy87ra4PGAWt5A1RusvzoH5yonOzOxOfwt1V+dBGagS/Rha6qd8Ia
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: DHlv-TUpHiD0GBXcck3Cf8BxtsGdjn6O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzOSBTYWx0ZWRfX0X2e2Xqji9TW
 gFplb3g0XPi3NMmNx0Yit6G+5zR+4fUxqMnINdcHDDj4Pf2A5Z6meeItm5zQAuFCrEUCElHjJVd
 Uf7ZKnoz7xxLE9PEWF6YLtDbSNQS0ezjuw/ltsF2NbaI5RZhq+nzo3du2+o1rEZNvdQEK+84Zsu
 JqSFlEeA7wEV+TpNrTzSg2RJCwxNCYJhD1rczOt6eWPZ8c7uO89eigqvYtX1O8qHhu8gk9A5TQF
 NYewILAHtMgrpp22jWPr84NMVQKx7UdN60gW/0q8dSJCm9so0o+a8Ant9g1FjLPEDsvyQ+NWU/u
 /0t9ATYuNVqLkU6F37d5jwEGEMXylsOow/JYC9HwLqqe+URU9MABgpDaSe64SCeOtI8PBxT24x+
 cVC0dYYPWu1bNgnEA9HzsPlTC6j90LafRgnq0ju2S4Qi+juktM0XamwGxhmE5PURH2QGIiQO7jk
 XznEF8CzAL9hjE2zKyg==
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=69ddc29a cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=pX8K7AMcFWmkIJv9s54A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: DHlv-TUpHiD0GBXcck3Cf8BxtsGdjn6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140039

This series adds support for the Analog Devices MAX20830 step-down
switching regulator with PMBus interface.

The MAX20830 provides 2.7V to 16V input, 0.4V to 5.8V output, and up
to 30A output current. It supports monitoring of input/output voltage,
output current, and temperature via PMBus.

Datasheet: https://www.analog.com/en/products/max20830.html

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
Alexis Czezar Torreno (2):
      dt-bindings: hwmon: pmbus: add max20830
      hwmon: (pmbus/max20830) add driver for max20830

 .../bindings/hwmon/pmbus/adi,max20830.yaml         | 58 +++++++++++++++++
 Documentation/hwmon/index.rst                      |  1 +
 Documentation/hwmon/max20830.rst                   | 48 ++++++++++++++
 MAINTAINERS                                        |  9 +++
 drivers/hwmon/pmbus/Kconfig                        |  9 +++
 drivers/hwmon/pmbus/Makefile                       |  1 +
 drivers/hwmon/pmbus/max20830.c                     | 74 ++++++++++++++++++++++
 7 files changed, 200 insertions(+)
---
base-commit: fb447217c59a13b2fff22d94de2498c185cd9032
change-id: 20260414-dev_max20830-9460b92cf6aa

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

