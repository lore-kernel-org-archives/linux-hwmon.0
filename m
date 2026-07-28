Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776DD3321A7;
	Tue, 28 Jul 2026 03:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785209634; cv=none; b=U5zYi28bWwrJThJVH5u/6L3rMA50Nl+4piobr9Xo6yVj8EyUPJTBNdbK/I2BIK+MNjqDs2okRj7/+aj4+mwfLufVMl/QqefHLJ5BQIMDLDhNMMXbZjRXOGAvFGj3msCqqRwITwhaytztGJDvOH2yHjH7PScPWJQ0JKh5/90Q/Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785209634; c=relaxed/simple;
	bh=r/KxTvtSQfvSV/4ovGGJBQ798Xa4r9/+JrZ6KE76kuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CobhkTbco3kFTfAuCesNbUGNbGAky2Ot1bSbEjjSMlpWepvO/rLbgWRR7YPB2yYvmYU9jzttJEqzrx8xWruPaQmBOwHSwUwlDFLNA/BABV6FuZGfV2UFN8f7h9+2IvEyiNUeg/SUvrxR6/pNGCmky4O+rvem61vuZ4bugczLZwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=LBrzsqm/; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="LBrzsqm/"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S0m5R91774397;
	Mon, 27 Jul 2026 23:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=LLuP8
	luHsV+t0Po5OZktBUoJcPubC2dWd06Q2D3t8Cg=; b=LBrzsqm/lMm2klv6pgw0c
	a7C5lCeUGrLy6md5hGEV9XB+slGwc40YDnh1VY0szk9w0lakgBhin6r+tuFC4GQR
	A0zvenaN2kZnIO6IXnux/YnOxw1SEOlly/yhtjcs7TW5CLT/nFeuB75VLJBoAcxN
	I2zaUz29wOLH+Ts2GAr6ynSkywuFPp/+EPnmyn2LlWr/rn0zotNvM8fAQouijVQG
	Z8qPbPnx3Ujop53B5njBi04KUDGttigH82Utwmlzlu5eZoGxhJXB+i08rKh0jLLF
	SmcJGPFQfHsaVCLURsrF3RqRvOfqy9BV+bQzSVdgWdwx9JH6ceNj9qpqcnimdlOW
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fmt21tmtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 23:33:36 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66S3XZbO057049
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jul 2026 23:33:35 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 27 Jul 2026 23:33:35 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Mon, 27 Jul 2026 23:33:35 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 27 Jul 2026 23:33:35 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66S3X41R029413;
	Mon, 27 Jul 2026 23:33:29 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Tue, 28 Jul 2026 11:32:57 +0800
Subject: [PATCH v4 3/4] dt-bindings: hwmon: (pmbus/max20830): add max20830c
 and max20840c support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260728-dev-max20830c-v4-3-cec034298535@analog.com>
References: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
In-Reply-To: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785209584; l=1157;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=r/KxTvtSQfvSV/4ovGGJBQ798Xa4r9/+JrZ6KE76kuE=;
 b=+sprKM9FqkEC81dp6861ODYkjOtP8gXLCLCVg1ezpOpoWvxrfgAqNRh0KzaJVeyAJry0fauK+
 lVBz8j2yunbAoSUWLUOCSGG932zCFVJP8xgVDCgPY7G3m9W29P3uXGX
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a682311 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=EUspDBNiAAAA:8
 a=gAnH3GRIAAAA:8 a=wmL6Cgq2dR32m5AAhy0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 1oYNlkXnSYBc2hrd6hPwUcBUBl4CujwA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDAzMCBTYWx0ZWRfX61hVJkucO5Ix
 5Kfsj7hoE6zQ9cxjti9KBIsbhRuO8lek28OrBio9eKKxgC+xGBCyS3pdl93LJj2RXFR3o5HatMz
 YjtG/7kIdnmsPoSkH3laW3atGpcl8ORY5uijtGbhPL+wrAGcYDRq
X-Proofpoint-ORIG-GUID: 1oYNlkXnSYBc2hrd6hPwUcBUBl4CujwA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDAzMCBTYWx0ZWRfX9beuqjAqleur
 I5GYAGcbRUNkK5BZXoq61HrAwQBjpSMg4/xkhCaSBcfihg5iMaiZ8AecTBFRI0gRca0Gx/Zziaf
 PKWSJLxsA/40YvGIJ/fnNX2XzqvE34Reba15IAw/gW1m5D+CFjVt8BpHoSfwnI/ygwiPGyYMRxW
 JNiitsgDfktybmnbFcj9BoFPPlBVE6cjFD2j5aI/bgUTqQQdDvaDDwYjVViWW098NnT2xCCBzQc
 Eb75AzPwzLfNgt2PGwKbAnf7krS9T+lTwHBXBBC6DRxnSOAPIhBl9Pmqhg7hsK43nDAOl3X/AA/
 84a5TyTD8sFJwcLy+xFPXJDy+eVfTAAS18bS7t6iNPriJr5ZRr1sAgk6JbWZ1mBPT2dJktHQIIz
 J6NY9LE/i28JH6SRuJpEO4rAt/DLd/3jMQQxHr0iDUwY4h3Z4VRC0wBko5Xi0R631Wz0ZZcpl+v
 OpHWqCY8KIWO1w8fV9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_07,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280030

Add compatible strings for variants of MAX20830 which are MAX20830C
and MAX20840C. These devices have the same register functionality with
MAX20830 but with a longer IC_DEVICE_ID.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
index 01b7275f5b3419cf1b791ed8f9b7ae56cd2961b5..cc50a4ee44a27bd5b14d6b56afe87f807adcb9e2 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
@@ -22,7 +22,13 @@ allOf:
 
 properties:
   compatible:
-    const: adi,max20830
+    oneOf:
+      - const: adi,max20830
+      - items:
+          - enum:
+              - adi,max20830c
+              - adi,max20840c
+          - const: adi,max20830
 
   reg:
     maxItems: 1

-- 
2.34.1

