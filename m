Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF922EBBB7;
	Thu, 30 Jul 2026 01:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785373471; cv=none; b=JhHbNyNAxwWjeN7eLOiZhpEwya8idWs4SO/mDYOP+mOKiAF6s1H/lIYQoVpPD/F88332mIykDqtcwnVGUc+CjYbHsDE9Hj0cKX4kxtVblGAMAIMWHuuSRIs8Xk5JHRKiCLmJuME4ERZNWdyXtjC3GjV0CRz5srvAkt254h8Xo2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785373471; c=relaxed/simple;
	bh=J9uX2KQEzpcg99BlCxe4l4aEk/BvC1QNAZMjrXqTMdo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=U4fDOoVheuilmEzsX6BXz8T0iZv2XVfMTprwXBYsTR5/M1G70WTA/b/wS27lYHWorASKNcxIl45ejMad9zPIYina7UAFk3QLWUlBEStFuy6tfqySgEHndhQ6vBAMY/wjjdLJ87H8R3eNucSdhhZ22XNJ5AfdZXX2JmhFrLnxoVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=fe8sb5sH; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="fe8sb5sH"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U0m0Jw3369156;
	Wed, 29 Jul 2026 21:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=iFQd0+CpEK+bAKFteqwj4xweR6q
	ue/+3OIB9aso6Ib8=; b=fe8sb5sHze8YVkGTBHzVfcEQhbFkYbGbCasPCXEmlJu
	/wKPgc9EEniomcVdOZ30/3kXO546ikdx9ajnbHh7xbXWKSgHsx327ksegqFYCjpl
	Fy/yDRZy1SX1kUBKtdy0tRRKUsbXfOKeHDo/drmy48p9JpRVmomyUmjEkrmFe2b9
	ja9O8r1nV2060ynntEinPPXQi/8JsxOat1IitHsp0M4gjuaV0CBQ+zTU5qln2gIm
	CfOEQ0eZO4RDrZg0F0QhGRxaFt43Peuc84iwbSi5bU9K/7oEzPV31Ks/EUvWswhb
	UxrOXAYnOHVGjX0NP2M8rEwy0DdEVkukUgUMRdscbXA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fqag4ck25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 21:04:01 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66U140RI036783
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 Jul 2026 21:04:00 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Wed, 29 Jul
 2026 21:04:00 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 29 Jul 2026 21:04:00 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66U13i43020304;
	Wed, 29 Jul 2026 21:03:47 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH v5 0/4] Add support for MAX20830C and MAX20840C step-down
 DC-DC switching regulator
Date: Thu, 30 Jul 2026 09:03:32 +0800
Message-ID: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOSiamoC/3XNTY7CMAyG4augrMnItZufsuIeIxZpbCAStKhFU
 UeodyewGaBi+Vl6Xt/UKEOSUW1WNzVITmPquzLMeqXiMXQH0YnLVghowRJolqzPYULwBFE3TJ5
 9C8FZo4q5DLJP07P3uyv7mMZrP/w987l6XL+VcqVBB0DnbctSO9iGLpz6w0/sz+qRyvjPHdhPj
 oWTc7YS37St2S84vXBcfKfCGwbL6NhyoAWvX7n/5HXhUSJQjY03ZN74PM93ddt2U2gBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785373424; l=3005;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=J9uX2KQEzpcg99BlCxe4l4aEk/BvC1QNAZMjrXqTMdo=;
 b=J3biWRmdNzy4jTprW8AYsdPDfgotj0y0DGy5vlyQVI00UNGV2q5+/anQfJRnwnGwuHYvkXbWL
 6EZnJp3BPqRBNgrvkIGxzveHul1TodmHkZX1EVHii2G9NC5dQlCQWVp
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=V/tNF+ni c=1 sm=1 tr=0 ts=6a6aa301 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=H0MElV2ufFurq6DkGqYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: i85VG6o3qA_JC5gvq3rGhlA2SxC-phSx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAwNCBTYWx0ZWRfX8R/QuZer330+
 PnkuJcJ6BFxkTHly4ShJfwX9YJYP89nzf/QgXsmr+nE78Ycsse21/EsKJrnPU9oy7TxQd+phzD4
 2rO+lMMd0x+7RCBhWU0HUZT47zDk5e0nJad6h/RpmPDlGHCCVBp+hCl5wBPCc0FXZD4fq6lZu/1
 p7i7nJE4DCJLMjKo3QdKQMgN2Ix1HlDTYihSnFS3KHU1T3vwxr5ej+0tys4oDSVp9K5xXh8dEls
 ModldWT/SbeIXVPm+I9FPMggriwqM4SiKczcvhqBsBx4M5i+dgY95yTjDrnRsAHhA8e2Td8aG5y
 T9czD1WcGu+Djm4ybn2deb70WslEHvE7csTQn4tBKIczWqNZJYyV3v5SgKDcnahqi2Q43GNhDKZ
 i4CPD0MlwRiAzsZzh/OA/cZ4EDxPwmLqJIhtVYpp575/uShCqw93TnvV518dflQNmW1cfKvXHi7
 8E7iLAGmb5fctHB1n1A==
X-Proofpoint-ORIG-GUID: i85VG6o3qA_JC5gvq3rGhlA2SxC-phSx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAwNCBTYWx0ZWRfX1LFc/M7wO8rQ
 N2xnmAjHQSx8vmKgX+qiMImEKLcYZwexI3Ou4hLs+0rpZrOGHqQSTxdYVbXyS5jxwty96nM4M7G
 JIicdKCkyDdZt+f/N2rH6o66iPEcgQq9nDIbcs9SKkO+dgGActTl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300004

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
Changes in v5:
- Patch 2/4: added comment about not supporting limit registers
- Patch 4/4:
    - removed max20830c/40c entries in i2c_device_id
    - created an array to help scale adding of new variants
    - edited Kconfig to note new compatibles
- Link to v4: https://lore.kernel.org/r/20260728-dev-max20830c-v4-0-cec034298535@analog.com

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

 .../bindings/hwmon/pmbus/adi,max20830.yaml         |  30 +++++-
 Documentation/hwmon/max20830.rst                   |  27 +++++-
 drivers/hwmon/pmbus/Kconfig                        |   4 +-
 drivers/hwmon/pmbus/max20830.c                     | 101 ++++++++++++++++++---
 4 files changed, 140 insertions(+), 22 deletions(-)
---
base-commit: 1a42625604046790ea8ec61c2a749bbf76b28943
change-id: 20260630-dev-max20830c-9d38d8b0a765

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

