Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D0E2877DE;
	Mon, 20 Jul 2026 03:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517331; cv=none; b=reT7Ukob6eayOMZ2AosAy9vh6KLjJ6cxPNRQRiligA1CORdDkg8pCR6XPJUB2opLzJVxzw7Lv6HVHEDNr3dQ2vz88kVjRp8uuWoE/nWnxTxLlat4E6yolJ7EGFE9O5K5n4Kt9wglae4Ae+DY6NbKzob23lKim0wetIiVJg9kM+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517331; c=relaxed/simple;
	bh=EzdOsYLxgXlRcMBiDurBSRzAI9dCcmltFOo57zAtVqo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=K36sQGgjuQIBdBFytZbf1ysXc8wcEWX5zL2j5aD3KaewK6gq4ShfjZ8iYm5CYLV1sRmBJLD+VONm4yVO3n2YiXSFrdJcjIZMM0pHISe00X82fgy4HbX3DVW57qQzHm3BvzuRi+3WPwHBQxGVNB9zN9mFHtloKokCtKm8Q1GMbfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Cjx1zq9b; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Cjx1zq9b"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNvuMM346527;
	Sun, 19 Jul 2026 23:15:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=7KIEsZz0n+O9qoac+edjcxDqJ7/
	RFx5I0+BjNasbPjU=; b=Cjx1zq9bFm/ft5I88bXtOyzwHmmCWWpi0wMUayEfu5o
	geQlvQNHicOzaLWAvvMqzbE5iZO/NKWMyZfXIEZwScS7QccXz0ttmWCiQ9piv03c
	OrbE2ShIh2F/PYxQNX0+e4a1mPgKov3J+mgzvMfLCiXvxCUnRj5lvrdWIvz97w55
	MFqaqgRoreoOgY+wC6FkffnWjwtsx3y4a25TRgwVgA5oVWnumJQUBqAmoBKZofoh
	MhMUzDFcO1Mo7Lb6HDq64NIYiCny6XLYWmv4bdXNpU5ZfUDHEWpbEW4LNG721pWQ
	ZQ+zvmlhx++xP5GQsNNVcnCXREStcHWvNF2OI2C8l4A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fg6d1cp09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jul 2026 23:15:06 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66K3F5Bk054345
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 19 Jul 2026 23:15:05 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 19 Jul 2026 23:15:05 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 19 Jul 2026 23:15:05 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 19 Jul 2026 23:15:05 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66K3EoFS021622;
	Sun, 19 Jul 2026 23:14:53 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH v3 0/4] Add support for MAX20830C and MAX20840C step-down
 DC-DC switching regulator
Date: Mon, 20 Jul 2026 11:14:41 +0800
Message-ID: <20260720-dev-max20830c-v3-0-9d06d27d6da3@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKGSXWoC/3XMSwrCMBSF4a2UjI3cJjZJHbkPcZDHbRuwjSQSK
 qV7N+1EFByeA9+/kITRYyLnaiERs08+TGXwQ0XsoKceqXdlEwZMgOBAHWY66pmB4mBp67hyyoC
 WoiHFPCJ2ft5711vZg0/PEF97Ptfb+6+UawpUA5NKGIcnCRc96XvojzaMZEtl9uESxC9nhXMpR
 Y2qNabpvvi6rm/9jtrZ6gAAAA==
X-Change-ID: 20260630-dev-max20830c-9d38d8b0a765
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "Alexis Czezar
 Torreno" <alexisczezar.torreno@analog.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784517290; l=2264;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=EzdOsYLxgXlRcMBiDurBSRzAI9dCcmltFOo57zAtVqo=;
 b=0NKzD0NV+KW+onlvilbCw/wizRwwie7lS0tisUtRKFzd3ueKoyf3SYnFYCYSPfAgtzKqdK8Gt
 CCKK9DGO+ABDXsPCq39T5hzwOIJnKQGwsGMV7+Znwv8OGNUneLvJfLF
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=ds/rzVg4 c=1 sm=1 tr=0 ts=6a5d92ba cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=aBXZGasqtuxsuxeSzLgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzMyBTYWx0ZWRfX6PSF6gZA4A03
 PMXr+MFM9bXkJlzFiPJiLHbaZPTh2dco/PI04ki+P1n+3W7H5ijRkWxDSLs5ENCElJzBKxY53Na
 WlbtRed9yYPcJxOdhTZQHTLqZ8ZQ6Zk3SpOoBd4FZ1rPiAT06HWf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzMyBTYWx0ZWRfXwec3vckAhdNT
 jljAviueUJM2EWZs7WTO1YvYszFiCe/sq0Wr9ZoSMU1jrsrMnd1L8fDQKpQ5Fg12f3EMnK7szbP
 QhZNPz27etx6JNsTYZPGHInVe786lBOxaqYh9gGcGYXWT9Ph/Ecn1++UeOfzzFEacj7t5BWFV6O
 FVnZYXlQo5SydMTrNTCt0DaJqSfIIzOIXaqbLi0OnSg7Emp8IXHbV2x+Q/g1zvKmjOsfrRxKhYA
 6Vurumn3vGj9FQfCk9oMusXFLUFMO7uAKidfayKF/A5ryp+WkEH27aQ5umvMa1jIwHTl5LdArXr
 mbpWfB9KO4WU+xZpYy6HKk7rMhTjfk+3pvAeJJJWzADfAEzdRvJdPGqTi/ScKJsr3q/RDNUFN8X
 lSWGe/TBg/eLeDIMcpyUOHDG4yv70OKxroGYV3z/gCSgwJoCWb75zlz9qq/s56kouxW3+/uTwSc
 u6G0JRLsFk9c8THSD5g==
X-Proofpoint-GUID: YbTQAz_nFEqDOc4YkjHrNlgGuVqkvZpb
X-Proofpoint-ORIG-GUID: YbTQAz_nFEqDOc4YkjHrNlgGuVqkvZpb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200033

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

 .../bindings/hwmon/pmbus/adi,max20830.yaml         | 28 ++++++-
 Documentation/hwmon/max20830.rst                   | 27 +++++--
 drivers/hwmon/pmbus/max20830.c                     | 86 ++++++++++++++++++----
 3 files changed, 121 insertions(+), 20 deletions(-)
---
base-commit: 1a42625604046790ea8ec61c2a749bbf76b28943
change-id: 20260630-dev-max20830c-9d38d8b0a765

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

