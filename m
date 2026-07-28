Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48FF2F7F0E;
	Tue, 28 Jul 2026 03:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785209621; cv=none; b=NrWw/8enjzGy0IPTQI2saDQXK4BrqoBSvjQNnIERCgx5V1at1AFGuTW61gGwSyieW2HnADbrG0pqt6bml3hAvGPfG+bH34Uvs5il4+8etqp2RWMPfVPT16epLTJUU054sXncu8+YdhEXegEWVDjQNG6hbroc0kDMAtPc/EjyTjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785209621; c=relaxed/simple;
	bh=qtsGPu2e/LzZBfS4hufjNumdTzQ6THXTgoZCb/cFB7Q=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=dNscaq2GF+bYCRWFdIpG7SBKiKINIDToTZwqWtApP1PhXGxmjjgNtfO/pPq/HpEfs0u0qG0aCUot5MNfzSxmjc/JZTyhVmFJXCTSU5/t80WZNdJJF39taIO7aOt/x5iOdS6ZCViigMXnuuNWue/L2i5sEth/WqI1fbvlNs61ULI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=c34+2aNs; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="c34+2aNs"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S0lx5v1942158;
	Mon, 27 Jul 2026 23:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=e1tz+mPQFqCqKXi+XzUQ3ff3bKz
	mPsWY1NUxRbse+lY=; b=c34+2aNsTvmw9OPvcmBp3Jc1kZryrK/pGSc9+Fn2Cdr
	dTxtLtvHlQINFp/mLg8fK+vR+8mQ9vhNAzBXOyf3rDcw9iVG24y2/yw3IGJh/IlW
	ysTFoiSLtYRrU6Nd03mupIpJaVzkqF2CWixYLHUgT+RLBWa11VOmWvTuDmmFymkl
	Wcjawce4vWX15HCwB5NsqiSktWqwwPGgXLpKPPpxeWdIwso9SIWJYRKEUAb0Bs5g
	Ppm14vvEoPU16Q3nBSMy9oSGpSu6RN3TqJBM2oT0BtwjdDSytQvNxSKOlmNXkELT
	m5p7YZaDcg+3VB4oET1CPnO6hxzAfSQDMXdgUNdqDUA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fnefgg87p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 23:33:22 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66S3XLZO057025
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jul 2026 23:33:21 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Mon, 27 Jul
 2026 23:33:21 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 27 Jul 2026 23:33:21 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66S3X41O029413;
	Mon, 27 Jul 2026 23:33:07 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH v4 0/4] Add support for MAX20830C and MAX20840C step-down
 DC-DC switching regulator
Date: Tue, 28 Jul 2026 11:32:54 +0800
Message-ID: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOYiaGoC/3XNTQ6DIBCG4asY1qUZQQG76j2aLtBBJanSQENsj
 HcvuumP6fKb5HlnJsF4awI5ZTPxJtpg3ZhGcchI0+uxM9Ri2oQBEyA4UDSRDnpioDg0tEKuUNW
 gpShJMndvWjttvcs17d6Gh/PPLR/z9fqvFHMKVAOTStRoCglnPeqb646NG8iaiuzNJYhfzhLnU
 orcqKquy3bH+Qdnu+888QpBIJMoUPMvvizLC6AkqAcpAQAA
X-Change-ID: 20260630-dev-max20830c-9d38d8b0a765
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785209584; l=2593;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=qtsGPu2e/LzZBfS4hufjNumdTzQ6THXTgoZCb/cFB7Q=;
 b=DfTDHQJxohQ8C4jvJZsomor1CQGzJqK4Z9Veu/EjfhAQ4bk4nK72GuhI4j1+LdpZvLsmJVhRr
 DzZMxs0TqioB37iCMIaMq2Rw4qGPI9I9wcSs7xX5fNgyYgdcxL+Tkmv
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: UMwCCfIjztQhNSB8TpTfpOrU0Qt1PjD1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDAzMCBTYWx0ZWRfX70qH3RHsvpW+
 pmbEsrmoTh3ZGIHeHu5ZRSP9EKrcO4IkzFstJMNqiJc3/0dN63qfBLLXEF5GqssSaWNJn3IOF+r
 GSIeHUQmAzvtO9mOmbzJjNPn/7+b1ugGgYTrICUgZUsiXi+Xml6w
X-Proofpoint-ORIG-GUID: UMwCCfIjztQhNSB8TpTfpOrU0Qt1PjD1
X-Authority-Analysis: v=2.4 cv=Q8fiJY2a c=1 sm=1 tr=0 ts=6a682302 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=2qLcT7M3tytojYbHFIcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDAzMCBTYWx0ZWRfX5WZRaS3ByBBU
 Ndzk6kLrdsc/nwvK7UWdd1l553iFd6PiPryM1/tzKZMC4+Ln3fh9h0ZWJyUO1PtjcFuC34RQKHM
 gyijHefv8rAACrZWxy6xISQa0WEwS0xgnwOGn+aCiBtUP7KNGFQzWLtW15ssMSSbeZ4qzT/T2ME
 OJiTK/xbGjjklWGdNKwiAlPR3fI+ke4RpfE5MdV12J8/ShdA9OUhBFtP3Vifqfv5G6lei64Hapn
 7BsB5bNfMXDEc08szFwQA4q8ss0fTCdUmmilboXzdYw8cu/gPkjYQAeKLhtsEDJLtNpl+yfteCj
 X5wySFR3IVE9GSCU7ieyhpEqOhWE0R8BEoQItRVGRsT73bhq162c6zKn9VblgfEm/LlowfYEC4N
 wHoM6LttCd3kgIog1TLaBeaCX+1Q6bT3qmd3k6yoM34/Z9F/gBwUv7Oiic7EJGD24+p3U28ECn/
 OcqtMWorLZA+RLbBPhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_07,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280030

This series adds a few features before adding support to MAX20830C and
MAX20840C.

Patches 1 and 2 adds new resistor feedback properties that is needed to
properly scale VOUT

Patches 3 and 4 adds support for devices MAX20830C and MAX20840C.

MAX20830C and MAX20840 are step-down DC-DC switching regulator with PMBus
interface. MAX20830C is a different packaging for MAX20830, and MAX20840C
supports 40A regulation compared to MAX20830 that is only 30A.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
Changes in v4:
- Patch 1/4:
    - Added missing #include for gpio
    - Removed review tag, patch edited to complete examples
- Patch 2/4:
    - casted feedback resistors to u64 to avoid possible overflow
      during scaling
- Link to v3: https://lore.kernel.org/r/20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com

Changes in v3:
- Dropped patch that add EN-GPIO property in DTS
    - discussed to be skippable until an actual use-case arise
- Patch 1/4: 
    - Carried over the completed examples from previously dropped patch
    - Kept the review tag as the carried info from the dropped patched
      was also reviewed.
- Patch 2/4: 
    - added clamping to read_vout during scaling
    - improved comments regarding future regulator support 
- Link to v2: https://lore.kernel.org/r/20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com

Changes in v2:
- Patch 1/5: completing example
- Dropped patch adding GPIO enable in driver (no use case)
- Patch 3/5: added notes on READ_VOUT and related VOUT commands
- Patch 4/5: removed comment on fallback
- Patch 5/5: simplified device ID check handling
- Link to v1: https://lore.kernel.org/r/20260630-dev-max20830c-v1-0-a02786bde470@analog.com

---
Alexis Czezar Torreno (4):
      dt-bindings: hwmon: (pmbus/max20830): add VOUT feedback resistor properties and complete examples
      hwmon: (pmbus/max20830): add VOUT feedback resistor scaling support
      dt-bindings: hwmon: (pmbus/max20830): add max20830c and max20840c support
      hwmon: (pmbus/max20830): add support for max20830c and max20840c

 .../bindings/hwmon/pmbus/adi,max20830.yaml         | 30 +++++++-
 Documentation/hwmon/max20830.rst                   | 27 +++++--
 drivers/hwmon/pmbus/max20830.c                     | 87 ++++++++++++++++++----
 3 files changed, 124 insertions(+), 20 deletions(-)
---
base-commit: 1a42625604046790ea8ec61c2a749bbf76b28943
change-id: 20260630-dev-max20830c-9d38d8b0a765

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

