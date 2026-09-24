Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AE032D0EE;
	Thu, 24 Sep 2026 08:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239334; cv=none; b=hT67jEaVmRMbdfcVEJKII//1SH2Y5vjyieegvgQSEanHkg8zJsCtmiC7EtWYzzQp7uQx/tft2T9EwOKmf9gn735H767jBD8+sJTVtlNbOjBbffOn+7Hk1eUT03/EYXsjTAUyL+0sWF3wXCqJTHvoPOH03yJXp842PvwEgVt7uq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239334; c=relaxed/simple;
	bh=NM1WdLmsHsD6dsD2wHxs/bcrG5+MByru8jiHoQ2dbqs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hXnpmTqnTQOT9FoWpL/+SOXYCQaAZbx4vGU7XEJ4NdQvXQMXBGF5j9TZOpsLQEx6TRMSA3YXRDjskfEK6+JHRnRS0JUzlQk1L6i9lsAMLnHbGubka+L0pfDVILxzEO/Zb0OmTcFOL+Qb9Lhehq0DAA6pbY4RbZYhiU93cGquqSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=0JF1CvGK; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="0JF1CvGK"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e3Au3875377;
	Thu, 24 Sep 2026 04:41:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ZoC86
	GJFXHBzzuQ/7+tW90kw/hyLexlEs3UkF5+giTo=; b=0JF1CvGK1/HuyLjVIi+Bi
	A3GoFEdMWLc9hx4yhs4BFw1iPDHo7NCP1odvYV2Obi0qZ85NsbGp3s9v1sE/afpY
	lyYUOzMDLavSD46fU67c4a8hBMxQmARHmPSq2ON0KVrbVatNwXKDdYHlxiLiqIzX
	rSICN7i2DYySQIY0GElGIhbtjBP7rBbpU7KEwQ9STuj/c1oUpJ2ZzR2z5riXnJ/R
	haHZM4CXBszOvgfS2vIHp1FrHkPwlfYJK7pSyl9JNCTLj6shGK+/v7TiX8ayBTqT
	8QnBJz8+TBPuGYqod8T4ZaY6XJeuKI7MlFP0BUg2uCygBvyWkdGAzNVR2qPd9+tJ
	Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gvmpk3tjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 04:41:56 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 68O8ft2P016358
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Sep 2026 04:41:55 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 24 Sep 2026 04:41:55 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Thu, 24 Sep 2026 04:41:55 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 24 Sep 2026 04:41:55 -0400
Received: from JGERONI2-L01.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 68O8fTpM015604;
	Thu, 24 Sep 2026 04:41:48 -0400
From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        "Shuah
 Khan" <skhan@linuxfoundation.org>,
        Jean Delvare <jdelvare@suse.com>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
Subject: [PATCH v2 2/3] hwmon: (lm75) add MAX31875 documentation
Date: Thu, 24 Sep 2026 16:41:20 +0800
Message-ID: <20260924084121.82-3-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.44.0.windows.1
In-Reply-To: <20260924084121.82-1-johnerasmusmari.geronimo@analog.com>
References: <20260924084121.82-1-johnerasmusmari.geronimo@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNiBTYWx0ZWRfX6P8m+7kZjbIX
 qIspasPYN0j91lgEWwBN2g9kmjR2sVf+tcB6er9OXqhHY5gt+D+cXJogEeN0CP5aTwY6dpGDmnJ
 tUXsRanAM4lIQhOb3Mba8b5hpN5eBwNKFGgR+crhgLuAtRJvQnL+
X-Authority-Analysis: v=2.4 cv=HIlWhYtv c=1 sm=1 tr=0 ts=6ab4e254 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=Z0pTeXoby7EwIRygza74:22 a=XYAwZIGsAAAA:8 a=gAnH3GRIAAAA:8
 a=sACn_r3pBwMRQ58zdiQA:9 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: qMo0kiCOr9mmhNHtxTOIsymexlaQf9SK
X-Proofpoint-GUID: qMo0kiCOr9mmhNHtxTOIsymexlaQf9SK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNiBTYWx0ZWRfX60NV5rJS1Iok
 yH0ZNbDAgqi0yqVQi15lEhZVSVqoI/xa4loNXOQpLO4O8VR/54shgO0kqiGAutlYWVJkO062e4L
 tquMGfViYbK5puEbTHk26KqKobfeftb4t8SBN7furO5rAxeVKYyzrtp1vJgBDzgB4hwwznUGlwf
 Oj4Z2t/tBHMKrmr9NfClwIhhAkuGZCLLrrtu9NmtA8uYdCduXHWPv8efFCXSMlUnzwG3btSW1/F
 pr0OLNb3ifdFQqLUYbOfEdJpVkS3nyc7xLI+GChsHPqzJJNkJN+8lpecew1nw1zBuIisvmOM62Z
 x6tJgOTwxfG9cB+X44HT4SPa5wdndZDpuEZrOiCX4Tqs0sqoNDNTogyAwp5gOK6ZUQ0VFl97XsD
 01fiPknWFzsLnglFmd4uu0H0QjNxjjaxhNp0TLFzMpj/fSCyYtEJy+RsmYz5guBUT1efj2WX7TL
 gYxo66uzIwguBfbF5sA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240036

Document the Maxim MAX31875 I2C temperature sensor as a supported
chip in the lm75 driver documentation.

Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
---
 Documentation/hwmon/lm75.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
index ca46754e028b3..54a6a75e8a71b 100644
--- a/Documentation/hwmon/lm75.rst
+++ b/Documentation/hwmon/lm75.rst
@@ -66,9 +66,9 @@ Supported chips:
 
 	       http://www.microchip.com/
 
-  * Analog Devices ADT75
+  * Analog Devices ADT75, MAX31875
 
-    Prefix: 'adt75'
+    Prefix: 'adt75', 'max31875'
 
     Addresses scanned: none
 
@@ -76,6 +76,8 @@ Supported chips:
 
 	       https://www.analog.com/adt75
 
+	       https://www.analog.com/max31875
+
   * ST Microelectronics STDS75
 
     Prefix: 'stds75'
-- 
2.34.1

