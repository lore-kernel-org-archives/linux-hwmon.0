Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA94737C11F;
	Mon,  6 Jul 2026 02:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303779; cv=none; b=US46CPUAFyKuH4ymyRCNWT7QOJrtHBYIaVLwqqUWBLjpCZUkDbFcbsWg4LKPD/3jipqs0ygKKFyeA0u0nhAg3lmxKpyG9wAQmuj5fFcIRZQ3ll5LpLXSLFlteWaZc3mw7k4ZScdr5WtXCvS0OWKmtG5l6XfnUxGvdrRa+SiIiy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303779; c=relaxed/simple;
	bh=8lCwNHuGp9N1IB1Q9DR8EcybkE079s8b8CpjX5P0JWI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=fYvj7P/9e1fEBLdTgU4wmMJ/qEoKxm1cbCs+7kvuk8KmwRv4nL0EUiPQotntU+I0VrMaO7oa5Ln3FFNZoJmfMcrL2bg4w7btQqOaOLzRuSoZmmbF3V/yOuIbMTmrYbgD39LRmSBjzuPQ9WLbGQ6ukhH/b9hMMIRjNkmPKXpm3yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=QOY/ajI0; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="QOY/ajI0"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665M4Me63211650;
	Sun, 5 Jul 2026 22:09:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=/CKh7qSMR4gVO6mL+WrHamKXbkZ
	e10sAaoJ+zB6z+m8=; b=QOY/ajI0P7lZFvOXnvWjpXLcdXEKUPdPCyiF+Uq1lsO
	4htSh9hPAiQDiOFIvSkJN/m7znOItmEiXIFHq5VX1ogrqiype+DWNf17xdcpy6il
	8+53Se5p0NnlGawr3PFsd8s14zm+isf2Siezq8DEpkFl/Cf197oMIddQiv6/Fvul
	aH1HZHH8qHjbZ+F5nVa/scPz6ygH0I6p43jA9ZlUUGwrsYXaNNZ6Uv58XbeHi1gE
	e/au/NY9GNiNRBuq/tiyMpARkueK6x372ZnPASSLurC4B+rOxREW3YQLd1fnJCv7
	kyOBYNDO43fV2vpLilffCwOPqTHdA1lzO5zWSsgWdbg==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4f7kgf9uvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 05 Jul 2026 22:09:09 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 666298RU045175
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 5 Jul 2026 22:09:08 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 5 Jul 2026 22:09:08 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Sun, 5 Jul 2026 22:09:08 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 5 Jul 2026 22:09:08 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66628o7P015791;
	Sun, 5 Jul 2026 22:08:53 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH v2 0/5] Add support for MAX20830C and MAX20840C step-down
 DC-DC switching regulator
Date: Mon, 6 Jul 2026 10:08:40 +0800
Message-ID: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACgOS2oC/3XMQQ7CIBCF4as0sxYzBQV05T1MFxTGlsSCAUNqG
 u4udu/yf8n7NsiUPGW4dhskKj77GFrwQwd2NmEi5l1r4MglSoHMUWGLWTlqgZZdnNBOj2iUPEP
 7vBI9/Lp796H17PM7ps/Ol/63/pNKz5AZ5ErL0dFJ4c0E84zT0cYFhlrrF9RwdRKrAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783303730; l=1881;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=8lCwNHuGp9N1IB1Q9DR8EcybkE079s8b8CpjX5P0JWI=;
 b=d3FZNalgzpA78GjPI72im7ec0VkYL3xZi+AI9axY2ddTy7jrfaraHmo0U3dPgc25lTkTjNq2j
 ib/179K1ZWVBypI5SowpVdZjx82LvaNtwtqgG3s3IONUmbPEDoL2Lmo
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: X8iRWdQT8y4tGkm6R-l5qNL9TLkeTpRY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDAxOSBTYWx0ZWRfX4VL9S3cXrlrQ
 /bbmaKP46ADi+pHW79NNgJQG/HqIDLFDCKhDILmIxHfi+uKFNf/eesEDdxrH/Datn+o/7GwaV2q
 Y6pG+I6HTvwR+V1vyy1k/LcR+2yXQvI+AGx5S3LwaXtZ1uKIoFDu7FbQ9sFaCGQzlIiOma0NhFu
 BOSjnRArCrL6ynag9fZp/4wh7SihJR05wRYL50sHsu79UWj+9+Gr1KCxbO9DSvW8cXVCIVOXTqA
 zq5LIz5sjWfgSFUCOaPnPBgO4X6S4HuBJrP699aAALcUmi+YY5s6PFnb2iROm990fThlKf3ehsU
 Pq8ajzdWIPuiQGRb6TFWoxQ36d5yIjGKAmksmjOOWRd8J5huQkr5pRb01PkoSyw/+eb+KY2gUSp
 BKTxwjuVmMRjkWh8isZxXf5DHtjpaaMrws5hGNoILixxWaR4jFighSJUwIxePw3AjCmbMVgTka4
 ACsgLy/riKfjbmo54kA==
X-Authority-Analysis: v=2.4 cv=SebHsPRu c=1 sm=1 tr=0 ts=6a4b0e45 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=r-qAA2OrMi8oRDqhcIUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDAxOSBTYWx0ZWRfX2KNflLGV9VlW
 SVTHXecapmZCD0A4dDWbLxwG/o0BjIIuVKWAABj2hpU7hQvLePZHIeRYMbxhkt333NDhosp833r
 ARaplZhf/xcadlwhy+uAufy5T5ENOTU6Ey1SZz0F/bUuQ5Xb5B15
X-Proofpoint-ORIG-GUID: X8iRWdQT8y4tGkm6R-l5qNL9TLkeTpRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1011 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060019

This series adds a few features before adding support to MAX20830C and
MAX20840C.

Patch 1 adds an enable gpio property that should have been included before.

Patches 2 and 3 adds new resistor feedback properties that is needed to
properly scale VOUT

Patches 4 and 5 adds support for devices MAX20830C and MAX20840C.

MAX20830C and MAX20840 are step-down DC-DC switching regulator with PMBus
interface. MAX20830C is a different packaging for MAX20830, and MAX20840C
supports 40A regulation compared to MAX20830 that is only 30A.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
Changes in v2:
- Patch 1/5: completing example
- Dropped patch adding GPIO enable in driver (no use case)
- Patch 3/5: added notes on READ_VOUT and related VOUT commands
- Patch 4/5: removed comment on fallback
- Patch 5/5: simplified device ID check handling
- Link to v1: https://lore.kernel.org/r/20260630-dev-max20830c-v1-0-a02786bde470@analog.com

---
Alexis Czezar Torreno (5):
      dt-bindings: hwmon: (pmbus/max20830): add enable-gpios property and complete examples
      dt-bindings: hwmon: (pmbus/max20830): add VOUT feedback resistor properties
      hwmon: (pmbus/max20830): add VOUT feedback resistor scaling support
      dt-bindings: hwmon: (pmbus/max20830): add max20830c and max20840c support
      hwmon: (pmbus/max20830): add support for max20830c and max20840c

 .../bindings/hwmon/pmbus/adi,max20830.yaml         | 36 +++++++++-
 Documentation/hwmon/max20830.rst                   | 27 ++++++--
 drivers/hwmon/pmbus/max20830.c                     | 81 ++++++++++++++++++----
 3 files changed, 124 insertions(+), 20 deletions(-)
---
base-commit: 1a42625604046790ea8ec61c2a749bbf76b28943
change-id: 20260630-dev-max20830c-9d38d8b0a765

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

