Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40E92F3621;
	Thu, 30 Jul 2026 01:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785373470; cv=none; b=fvGUGMTXkzybuu3LA5VDrwDYQ/4EopTbtlKve5zlM0HF3Eu6NVZXDwLVHfptJYVw/nBsgrSVkoTYBWcrQRvceF0ZgfkR2mGQuqZoQAPImFjEZbj+d18NgotaAzH84oOQZlR36FzDJG4mz/d6iW9YpZT2qwTr2eSbKsLJOAS5Jmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785373470; c=relaxed/simple;
	bh=r/KxTvtSQfvSV/4ovGGJBQ798Xa4r9/+JrZ6KE76kuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=i84kDP8xrjP39zN1qv+mPWmby7sOoBTJY4RsPO/OLRclnlXqKU0Algnuojzega7kBirCbggsfg2finTvrEigPzGZyguHG4oNcf7b85WN4g/xpCs4mb7jJnBLw9rQngkPZ/5MAOMLjZ4CbbhiGCw5+6d3jfWZHVT/umiXtGGFRe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=103j+qYz; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="103j+qYz"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U0m1SB3369311;
	Wed, 29 Jul 2026 21:04:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=LLuP8
	luHsV+t0Po5OZktBUoJcPubC2dWd06Q2D3t8Cg=; b=103j+qYznknydXZC+O9YC
	5jL/SiNE734LD6sGOuGrIMPGAv8Mdj5yIpGYSMqhGxvbPVez4qpIDx/1mF7DBlwM
	CJ1O4xt5iQtlWa1EeMtM/zDxP50LM8YY6GJ6gS85oSL9chJPUSKKVNAhfgrc3cza
	EQrSSqkCxi4cNa2oOjOqQfnF4XbBNjnjudOcWMonKbiGmeG9FBJLDrDGvJ2fzf3U
	bQ9CcmV9XL5zfamp+iRCTzSm6rn2v0fd4VgaPcmeO0VfFYHWDgDfDOlki0YT/eSK
	I/UvM2Znj98EarPBGnQzvnyF451G+o9rKJmo8ijNgMYXCEQhhvFnqnMo7wQ5CM2j
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4fqag4ck3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 21:04:13 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66U14Cd4036890
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 29 Jul 2026 21:04:12 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Wed, 29 Jul
 2026 21:04:12 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Wed, 29 Jul 2026 21:04:12 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.193])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66U13i46020304;
	Wed, 29 Jul 2026 21:04:06 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Thu, 30 Jul 2026 09:03:35 +0800
Subject: [PATCH v5 3/4] dt-bindings: hwmon: (pmbus/max20830): add max20830c
 and max20840c support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260730-dev-max20830c-v5-3-a7553f84ee74@analog.com>
References: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
In-Reply-To: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785373424; l=1157;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=r/KxTvtSQfvSV/4ovGGJBQ798Xa4r9/+JrZ6KE76kuE=;
 b=MvJOxuMbCrKNvRCMjYEYmwDrjBfLi9VDbfgO2eR3LsL7dhSMxRveiYJvW6HY3v97zTdcrXOgg
 HjFb+5mkjb8BGyuCZxE1/btNlR8Gsf+5oNCj4rYkMCMc/QmLzTPXodH
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=V/tNF+ni c=1 sm=1 tr=0 ts=6a6aa30d cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=EUspDBNiAAAA:8
 a=gAnH3GRIAAAA:8 a=wmL6Cgq2dR32m5AAhy0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: P7dcpEZnk1djqwlrraoVP_gGgWvsLGLQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAwNCBTYWx0ZWRfX+03zlj8rdKes
 Xgq7Kh/UUIz8DSQGYzoIDv5TtJWZb3kjKJRS8U+LHxIrzsmF0TdI84MJNl/i811w9ADmjNwcvz8
 gs36SrczDyZTuoX8JkoD5+Zg7/dO3aHgtXERnJmyG6lpdGVSgyVPsz0jUkHI+xTvQ2q9k+G1e8c
 htzyjkzsgEsxuHGUY6DWp3EY6aSnyno9zwIWH+ThyvfMpiq11MHTF1gJc7sBLDfcdWinURKQPGY
 Wem2+UdNdSMHN8yoofJa8/9AmSAaVLbpM0rLAqgfJqh1MjDLJdOATs7h4gCkly3nuQLFIxkngTw
 cLrXsj2bJzX2QVEnjds1UWJd7oaKC0mKzgRgjY9kN9CPzVmG0QDUbW465yL9pu3s8un/+kvowLK
 T7N/F8bdbsri3Mz+w0U0X6rOOXkZX6hXOnYOZYntDix12svLj6p/tO5S0WKJuUJS43oPOKMh14M
 9+mGJgEIZDlEFdBS7Tw==
X-Proofpoint-ORIG-GUID: P7dcpEZnk1djqwlrraoVP_gGgWvsLGLQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAwNCBTYWx0ZWRfX0u9nekAsR99k
 1S+gmkwVbrf68dK2J7ybEn3gByOV4A0k22fFkysVeD5Zrv9SNmuYeyU7q1wOEzS00XAtaXE88yb
 cNZrzi2WDKO24E3Yw6FvaoY2QitYPZiSzWwkFYdqpQn2VS1z84lF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300004

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

