Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D511E9B2E;
	Wed,  8 Jan 2025 08:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736324781; cv=none; b=BGPHYnB3KbeGIGy48XNMzDiWu7B0hrr6pmzpXh4tf/cyk1wyjvzo5am0nyrTi5S+sS7A4k1C0n42/WqA6Zy89rhjla/AnR07/CQDPJ1YCMIkj7jff89545/C7cRM+siI8qF0s66w7i6AHS4bD6W6keWXbRMytsbf5/C8WT8KT5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736324781; c=relaxed/simple;
	bh=a0YPgtylA5E+liBLT4TjoEdEWBwhuBdoUIaX2jDgvlA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A3LKf5GGypi2rWckF4YZAqI1l4fF03VW5BObyfCy60A9x6pAu1KatKL0cprYpdOy9bYeZO38yrMAbCdNIBWlSDSYcsq0B/GHDkAGePTaXj1cD/sKhe+2FpAMWPrglfpSiVR82XAiK/g7QhKFTDus1dzFog6aFkgo04Nf7HErJAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=glCFowiw; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="glCFowiw"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50870mPu027777;
	Wed, 8 Jan 2025 03:26:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=g/7tl
	Lr3+6QuviIsykKK4MGYluAM3YsXVNwTtvuF/3k=; b=glCFowiwkeXC+ryRo8wA+
	oUDofR1477Q3yJluvjbgHYPexYlg9BS47EyAiIjZRWQ48t2QM0viBh8YWA36yuRt
	2Fb95+4YsZXHIL2V7ifSyqp2WGfcNo57t8kM/ViWwbxQ0oGH1cPQGtqcOinQUVfr
	bjNvTEt96PKDSWkLxD47VN7b2eNOaSoZTHhRzUCwu1K2TLlzHzYiZGboYtabJUGv
	pXiaeax2hifnx860qOiP2pEaMzIPLpEWXprPj5jsYCf/oCSUFplQ16MxldlvDvGS
	pdCY3E/EGmVh2wfHJtaJ+MsFcORO1+FjL1xfMEcfFbnG9bRvvYp11fMQzyo6zcdM
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 441fw19gca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 03:26:03 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 5088Q2cK037237
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 03:26:02 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 8 Jan 2025 03:26:02 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Wed, 8 Jan 2025 03:26:02 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 8 Jan 2025 03:26:02 -0500
Received: from JGERONI2-L01.ad.analog.com (JGERONI2-L01.ad.analog.com [10.117.223.6])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5088PfdP026945;
	Wed, 8 Jan 2025 03:25:54 -0500
From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
To: <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 2/3] dt-bindings: hwmon: adi,max31827: add MAX31875
Date: Wed, 8 Jan 2025 16:25:30 +0800
Message-ID: <20250108082531.15467-3-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108082531.15467-1-johnerasmusmari.geronimo@analog.com>
References: <20250108082531.15467-1-johnerasmusmari.geronimo@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 5PJ1x1a4xXl9Y_TmZb3bfX053EZd-3fk
X-Proofpoint-ORIG-GUID: 5PJ1x1a4xXl9Y_TmZb3bfX053EZd-3fk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080067

Add max31875 to dt-bindings of max31827
MAX31875 is low-power I2C temperature sensor similar to MAX31827

Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
---
 .../bindings/hwmon/adi,max31827.yaml           | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml b/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
index f60e06ab7..9363fa371 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,max31827.yaml
@@ -4,16 +4,19 @@
 $id: http://devicetree.org/schemas/hwmon/adi,max31827.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Analog Devices MAX31827, MAX31828, MAX31829 Low-Power Temperature Switch
+title: Analog Devices MAX31827, MAX31828, MAX31829, MAX31875 Low-Power Temperature Switch
 
 maintainers:
-  - Daniel Matyas <daniel.matyas@analog.com>
+  - John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
 
 description: |
   Analog Devices MAX31827, MAX31828, MAX31829 Low-Power Temperature Switch with
   I2C Interface
   https://www.analog.com/media/en/technical-documentation/data-sheets/MAX31827-MAX31829.pdf
 
+  Analog Devices MAX31875 Low-Power I2C Temperature Sensor in WLP Package
+  https://www.analog.com/media/en/technical-documentation/data-sheets/MAX31875.pdf
+
 properties:
   compatible:
     oneOf:
@@ -22,6 +25,7 @@ properties:
           - enum:
               - adi,max31828
               - adi,max31829
+              - adi,max31875
           - const: adi,max31827
 
   reg:
@@ -93,6 +97,16 @@ allOf:
         adi,fault-q:
           default: 4
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: adi,max31875
+
+    then:
+      properties:
+        adi,fault-q:
+          enum: [1, 2, 4, 6]
 
 required:
   - compatible
-- 
2.34.1

