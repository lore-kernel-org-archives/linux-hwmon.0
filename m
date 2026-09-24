Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB55041A922;
	Thu, 24 Sep 2026 08:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239324; cv=none; b=l3JszSv2/K6FSG1pjekglyFHTdcFbssBwbSAVECf9ZZGEmWToKvx4j/4Vt4UDevNg9v1TrKLcztlD5v1yb+/2yK4oWekKUTf7kMBKaYrfM2WNGsvrMz5DARWqpKcUPI01VhP0QN7JBmMFPpoV7l+C05z6CHLIQKTdfZ+vTuogPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239324; c=relaxed/simple;
	bh=oSAlGN/fOLl0k9QhmywFYbOnlTWfRUPevGrfUVzEOqI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tpgDEbQorOkw+o1g16h25kNjTNME9XlfAwxPE76RYSuvcuuuOcS8oHFjsiM7U7/eUTOzRzHe+3+ICVkm6RZVMSv5Mj1y+CGGapgVXzejZLjrvlas3tVMDNeeMpczijYp5WKfHLN/ymx9mHEcSTELeuKB+ZAOjeJ5ym/MhtHczGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=qWdTLlVo; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="qWdTLlVo"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5cMQq151887;
	Thu, 24 Sep 2026 04:41:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=7zQOVib9l6Rs70GQeWpWTMTQxI9
	OaEIVqcGS9UaI7dA=; b=qWdTLlVoj1hdzUQLQgZiGRtQ48Sa4HrwF8cvLEveBoh
	YBuwHhTQ8oCxifCG05IQCC4fgXWs4D5fN7f9ean3u6aT65lZzrjBABssRzmaMtht
	vT8bgpnGNF6iJVR4N2Np6JShru0OZlL0gcnIsddi3NsB3QnNTSUYMT6/Tsd/Ugob
	+5Pt+oSj7RhLBOPHO3Y0UR4nQw5MtWCCxMB5+nv6CUu8TmMZMELRw36FyHU1zR/Q
	6ykx8sz/qpUd/Hftqs54QZACdTz1+SD0+EDdJcY+MYzloM10A1Nm7sTARskKyQe1
	N3MLt8Ikn4V2ppGTJ094ABiWA6zx+fGbSPfQVSKbO7w==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gv5cx8q2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 04:41:46 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 68O8fjVC016349
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Sep 2026 04:41:45 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 24 Sep 2026 04:41:45 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 24 Sep 2026 04:41:45 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 24 Sep 2026 04:41:45 -0400
Received: from JGERONI2-L01.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 68O8fTpK015604;
	Thu, 24 Sep 2026 04:41:32 -0400
From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        "Shuah
 Khan" <skhan@linuxfoundation.org>,
        Jean Delvare <jdelvare@suse.com>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
Subject: [PATCH v2 0/3] hwmon: (lm75) add MAX31875 support
Date: Thu, 24 Sep 2026 16:41:18 +0800
Message-ID: <20260924084121.82-1-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.44.0.windows.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: WwSd4NVUnEMg9obAms4EEMdBpyfkURox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNiBTYWx0ZWRfXyLLuFiN1UzRh
 MGRPtrvpDqKwcrz+XfmBbJYnDREnwhqQmLG4BhG20U2f5QQSvQCuj+l3eJUW+QYLyJiBhVSHQ7r
 jlA1HcY+sznOipZos4FoAbdcVDwsZ8ILVgCJ3qBNtZdthCKFDnunJqkIDDQgfArfKDNTWoXKObV
 lAu9Z37ol2K093LeeJ0qsDxGI0r9++rxJhsPlZC35S/X4vVedLP93d/mq4LHoBmSE5eDc8flGIz
 Lg61n9EHxJ9UKVdWmphumC4RSflpb59Rbhat7dCjptq0Ofd3iC/PT8HEcEa8nLgKgYv+XNwv4Zp
 zmrZ6ni2TnPqEupYBoRk4XD2lNu5+jSpscX5YbrPOPSMdn8auPHsRfkASHk9w5p74IsfciWsBLW
 uiPl5SSllDgYZHSUnuLQlok96MUpRR59oprPJjpABAmyW2cHAOQ6wR8xj7BXoNl9bh4E6tkuLlH
 jVK6zA+t9epwhOY/Alw==
X-Proofpoint-GUID: WwSd4NVUnEMg9obAms4EEMdBpyfkURox
X-Authority-Analysis: v=2.4 cv=I8rw19gg c=1 sm=1 tr=0 ts=6ab4e24a cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=lmotxbxmNOxI8_FDkaQA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNiBTYWx0ZWRfXxDWhtJlfHscr
 STeuUrmqOgsHQmi3z5SqIX1vVL2ijxWclaK718EegxMezNmB62dVcDFQsZNMy052DiboLb9/rtA
 Ku8d9iExn/U0s4YAGt6GpNvlXCBAkBlC2/4NbmX4z9lG0sOP4BHL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240036

Add support for the Analog Devices MAX31875 I2C temperature sensor by
extending the existing lm75 driver.

The MAX31875 provides a 16-bit configuration register, selectable
resolution of 8, 9, 10, or 12 bits, conversion rates of 125 ms, 250 ms,
1 s, or 4 s, and an alarm output.

As suggested by Guenter Roeck, this version reworks the implementation
to extend the existing lm75 driver instead of max31827, since the
MAX31875 is another LM75 variant (similar to max31725/max31726) rather
than a max31827-family part.

Changes since v1:
- Rework the implementation to use the existing lm75 driver instead of
  the previously selected max31827 base driver.
- Add the MAX31875 Device Tree binding, documentation, and driver
  configuration for resolution, conversion rate, and alarm reporting.

John Erasmus Mari Geronimo (3):
  dt-bindings: hwmon: lm75: add MAX31875
  hwmon: (lm75) add MAX31875 documentation
  hwmon: (lm75) add MAX31875 support

 .../devicetree/bindings/hwmon/lm75.yaml       |  1 +
 Documentation/hwmon/lm75.rst                  |  6 +++--
 drivers/hwmon/Kconfig                         |  2 +-
 drivers/hwmon/lm75.c                          | 25 +++++++++++++++++++
 4 files changed, 31 insertions(+), 3 deletions(-)


base-commit: 9955c92abe72564a49c293b1c15cd3b4f02ea6a0
-- 
2.34.1

