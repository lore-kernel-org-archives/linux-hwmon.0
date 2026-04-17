Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D6C39FCA9;
	Fri, 17 Apr 2026 08:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776414491; cv=none; b=X+YB3ocmTnGRxO12wP/nLPzB8x02aVS8Nq9uzMGHZ/VTbkqP/PnBsKKwbqW2DZb6h3pVx529lohUxhI8+AS2i6FyAgg03jnc996isIEkgzlLYnvl9dXaFXgSBS2RW1QEOC00kh2DuufaSvJlo5HHOo0bu+5xyl5i6ai3pwiFrOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776414491; c=relaxed/simple;
	bh=dWHqlsTJDTHC/SPkXEqrSGDMTyYGvvUrViYGileVwY0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=MZCUleoHogYyRVB5f+7j0o5qVLfXKWkNlvQLHOJT3S6CoHYGopGXOl5UDrXJu9YpAoW/B3Mn5lRaQ4VnSqRI6o0aiyx+dkERPov9s9zAOCQz//UqXxNfVLiT7vpD6dSufqySsu+4qjaX8QnH6HDvACw13Y/6iNGpDup0p+Kwe+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=r5E7G6YH; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="r5E7G6YH"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H7SX4h482896;
	Fri, 17 Apr 2026 04:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=BLTwTpfO3PQdt/F+hakt2p8oroN
	N0Bl1VsfudbPRAbY=; b=r5E7G6YHAK88VUoFXQmcAMnrm0buFvLLO/9rMnRhuBm
	K13XatqfW/QHEmh3bPjQ5R23lTvgpXnlsUbhDBagA1O8zj/j/cIRapOnjGDQTrJc
	eWy/2oI9Dtt3r1oCtlUugEQZ332Kbmf47WzYHcwr7ZllmFjSvC+9l98RUkygAunC
	Kd0RVp8e/JHrnYakmZs3qYSplR+Q3jtxakMHdtJn4PEIXro57pbJk3AajFi/afKl
	JXA8vlQJs2JIUyWuve8sIyDdL5XtJZ4ox6ws56COQrFaqhLCQAENQ3YhRvLoeyOo
	09qb0XYJ8yryFJI2dD3G7UT4NSeP5zpgTlmb3zyoPNQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4djv6s5070-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 04:27:53 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 63H8RqS1010654
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Apr 2026 04:27:52 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 17 Apr 2026 04:27:52 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 17 Apr 2026 04:27:52 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 17 Apr 2026 04:27:52 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 63H8RZ9j029843;
	Fri, 17 Apr 2026 04:27:38 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH v3 0/2] Add support for MAX20830 PMBUS
Date: Fri, 17 Apr 2026 16:27:12 +0800
Message-ID: <20260417-dev_max20830-v3-0-0cb8d56067aa@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAODu4WkC/3XMSwrCMBSF4a2UOzZyc1vTx8h9iEiapG3ANpJIq
 JTu3bQjFRyeA9+/QDDemgBNtoA30QbrpjTyQwZqkFNvmNVpAyEJLHjBtIm3Uc6EVY6sLgS2Nal
 OSAmJPLzp7LznLte0Bxuezr/2euTb+ycUOUNGHHXeVaROJT/LSd5df1RuhK0U6VOLH02bVqUWp
 dAKW/2l13V9A01Ir8DnAAAA
X-Change-ID: 20260414-dev_max20830-9460b92cf6aa
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "Alexis Czezar
 Torreno" <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776414456; l=2286;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=dWHqlsTJDTHC/SPkXEqrSGDMTyYGvvUrViYGileVwY0=;
 b=qq+uy1h4mEgGncqkXshOodb7xF0FKhDpKtRH1JVUoM/P6RlzkSOvAv6LHgLHG3WBrDks4RmiT
 bSwOMHUR2tjDXh1eLgFmifz6CWydC+jqCXnVPJ1T2rfVT9ba2rT6VM0
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: WbW9DabkSEpYbQX6jXjdl1kVx2rDkxkD
X-Authority-Analysis: v=2.4 cv=VvQTxe2n c=1 sm=1 tr=0 ts=69e1ef09 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=VwQbUJbxAAAA:8 a=aBXZGasqtuxsuxeSzLgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA4NCBTYWx0ZWRfX1uRbAhmuN/Sd
 NDcLqBSQJe+Fv3LVA9v36kJvQ5IvE7C018E/WhYBy60WQt2ROuYiDUKOSupYVkzH2ArTmSlSTJM
 hS6QXxRMgoZdedN+tuzDFQAArucnhn260L6noLIZETtx3vj1JuZAJGWoCkdq4RnIDyKx0hPZrRM
 EG8C6hSKdB8SsC1VtArR58v9J3MbpmzzCvZIf0aXU/W+8UbYWp+G1IgJzUZzOJiyTSoo1co/BqF
 jHh8OLcVAZmzHqAdLTp6UqaqNJ5oIzIByxp0xg7MJKg1XMb5q/6PuVq6JCxgpOLdqKoAFgk5na2
 /JwGHLDbaXtfTc+IXg34HCV2WBOkOWd23gi4/AgX0Yzcb7jv3H+wfhcz0ZOUpRS4wG7LoIA6T4S
 ZhRz3+2LfCgR3Y7LqsDnCQ82G0lC3NXPIwWphbuIYNvvR2yIs+Y/uaLcOOOVnDmSrVJR3znCiln
 F9NWwu/IIqHNktF7r4g==
X-Proofpoint-GUID: WbW9DabkSEpYbQX6jXjdl1kVx2rDkxkD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170084

This series adds support for the Analog Devices MAX20830 step-down
switching regulator with PMBus interface.

The MAX20830 provides 2.7V to 16V input, 0.4V to 5.8V output, and up
to 30A output current. It supports monitoring of input/output voltage,
output current, and temperature via PMBus.

Datasheet: https://www.analog.com/en/products/max20830.html

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
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

 .../bindings/hwmon/pmbus/adi,max20830.yaml         | 66 ++++++++++++++++
 Documentation/hwmon/index.rst                      |  1 +
 Documentation/hwmon/max20830.rst                   | 49 ++++++++++++
 MAINTAINERS                                        |  9 +++
 drivers/hwmon/pmbus/Kconfig                        |  9 +++
 drivers/hwmon/pmbus/Makefile                       |  1 +
 drivers/hwmon/pmbus/max20830.c                     | 88 ++++++++++++++++++++++
 7 files changed, 223 insertions(+)
---
base-commit: fb447217c59a13b2fff22d94de2498c185cd9032
change-id: 20260414-dev_max20830-9460b92cf6aa

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

