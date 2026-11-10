Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304893;
	b=BL3nbYjWVqzmAgAN2L1inK+e0xjwWEtI9woki9aYizXkQu6SJN0Tv+z+vrx97YdL3IFT
	 424hxVHP7flDG8Yuy1Z0zsQVDkYEZoRsHA6j5ClbR33OpyV/Gjs+BajC8bulWsKbPYpEv
	 bseOvwWAlylT3q8JdFi7P0BEk5pphnfbHbtuVfnfNgba6lQ5Zar+qxv6vXUv35v408XeG
	 MAfNLuAPVja0qeEdelX03dRCAwRqNKcOvEZ7SQZx2RtAS/KkQEX9Ri1s6H9RwsmAh84rF
	 FPe6dYGtXvz3AoB8S/LrV35wDCyNRIWF80/dBsjoaMaaaoncVSZONmJvobM3yzCVukQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304893;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:
	 References:In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-ADIRuleOP-NewSCL:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hGcfBs5OGic/tPjNmp5Ado4Cx93S87Op/T645dTKKlE=;
	b=ouBTWYmBzGyBlqUz4DedwefEE/IIq9h8denVVNgpt4P3CrwNCGEtNbaKNBYfDib0O13A
	 w8mq2ADK9n/0lw6t26P2djtjc9y3xlq/Pvw0NaBQG7p+NnkZponRXuNr5Ip1KSVgy/VkG
	 VstlUimJgSWgF8ZdAXeNVGOhVuKogRnZZUoRJq9iKR4lMgPL1JyGbA1ipU3tLrhsXaIWd
	 KNxMILIlb1IspvnLuf9txTvvRkicJQgMPHrdkAHG/Awb1Vtdn8oAAhz5MQRgto24aa2ZB
	 v4j9MvI37X01xPn2QdZICOuil87ARLdGmm/0CgzNk5KgPS1sdwUQ/MzfHsWU2dOUvjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=UpsJXcux;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=vG8wGBwb;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76E1606A330;
	Tue, 10 Nov 2026 10:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E76E1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=UpsJXcux;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=vG8wGBwb
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7kjIl3726233;
	Tue, 10 Nov 2026 05:01:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=hGcfBs5OGic/tPjNmp5Ado4Cx93S87Op/T645dTKKlE=; b=UpsJXcu
	xgShk9BZkXYgw695/oOb0sx5zCx+G26mO8iDsi78/evJP40MjWVZ0CTJiHhV9MmZ
	D/R+Lnu2qcgUsOhZMleiRVeS96eDwt6SzPUhNTtxQ4DBm8lYEkNLwbAv1R0bhuoP
	e1tQ9T5s1O4nNyMCeTrvEY0smqJGrnUkBJMNuorrQz8lkaSeAx0ilQHZbbvZSmuT
	ZwVQG6mwPQ7hMCwPrLr3G4LzZ5X517ocakbehgh9gH/p73pybDSW2jiN3JdSHxHi
	QzbqWtraygTG9GryPm66vUJw8El54pCl+sRdWdn8q6vSCzQbNfpPYdFTWDHjxCpS
	i8gsi3B1R/vD+cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=hGcfB
	s5OGic/tPjNmp5Ado4Cx93S87Op/T645dTKKlE=; b=vG8wGBwbtsEDP4YKRSm7X
	dW1IlmmHpYp2jOlpR2xUf7bflSdWzhcLERrimjyGA64HiSsWHq2SzItIRAINdGh4
	XcG7aG0xvKSSyQG/Xl1X7/9dquqg23t1UF+GUj1eeP0TDmwcsF6z4mM7PvVopLW2
	PxSfZmxgsaw9VcpE2PrL3QNdvHuG0poyK6TFITFFDEVm5FcOfUL3ApjAGGoc0cgT
	++jr658lG4fI0n2G+Aw8BDHZTJnSdU+Lusf8iRzkDdtfH19BU3qPasHybJirsnVc
	f3pzZRNwsZh7lXg08o9BBtS73e3oC2/PzfZe+rQcCnN9WDqtA+WY5Ssq+h2jwOp/
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4huvyq9web-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 05:01:03 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6AAA12Lw021143
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Nov 2026 05:01:02 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 10 Nov 2026 05:01:02 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 10 Nov 2026 05:01:02 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 10 Nov 2026 05:01:02 -0500
Received: from HYB-GHaNx595DZ2.ad.analog.com (HYB-GHaNx595DZ2.ad.analog.com [10.117.116.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6AAA0eub008466;
	Tue, 10 Nov 2026 05:00:55 -0500
From: Christopher de Guzman <christopher.deguzman@analog.com>
Date: Tue, 10 Nov 2026 18:00:40 +0800
Subject: [PATCH v2 1/4] dt-bindings: hwmon: ltc2978: Add support for LT7175
 and LT7176P
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261110-upstream-lt7175-lt7176p-v2-1-dd60d28383bf@analog.com>
References: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
In-Reply-To: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan
	<skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "Christopher de
 Guzman" <christopher.deguzman@analog.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794304841; l=1246;
 i=christopher.deguzman@analog.com; s=20261020; h=from:subject:message-id;
 bh=6qcyRDBnTlQDkHmREHCwOsArWUL//2U5YG/n1AeOEWM=;
 b=NQQOMuS35s8bNzEFfjuw+iO5MoPzZQFkyiy+84c/2K8RQ/IFY+ENMMQwA0cc/tegTmsZD2l/2
 BmdeXAdVT6VD1iSsYql8p5g36X3DZHJTawwKdAdlDlAM77k47zXVyKE
X-Developer-Key: i=christopher.deguzman@analog.com; a=ed25519;
 pk=nSwfp91RWULY/zCnrDkBvXulgnpfKy+5C6/Gh3ecLwo=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX2Orb3mo8Pb1O
 iEJJ13RPln5w7Jq5bEbStiqvzNasv2jy1RXivHEmtg9y99OClRQ1IVmFreZelRUYQy4fpdzzGEj
 0aHb3zBa6OtfO4+dR1Xjjp9ShJnOEcztxDWEqDHtPdI4ZnmezRc0k0dr1stE3pIB1oOshxHdDHX
 YmwFPePhLL2UZ5JHHUxrj2oT4Uj6HppBpcWHRpMbCV1DX6OVRaCSOcW1gIGUmxy0+zXjBJs6SL6
 WtwC2iWbwRdmROYUWSc7I3cQJAC8Io543rR0d0dGUc/kUw+F+lxi88jm+9L/MVn68TyryWtBuxO
 ktGp0MI3m2cjZvxnNn8ue3T4NIt96yM5ZLakp30g1SXwpF/0gU0AAyYcBfVu8ndi7zIKc3nymV5
 e3s/ARkBikgWIP+EXj+c9bz/A5/Yqp+DFXW6t1jBvKvYu2Dg0CVJwvdsVitjuWh123zEVYRxU3V
 qcWZyiFyD0BrZBh2D4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfXxyWGM9Bwnj++
 aS6brdl/6mQ8lcR7kiBVPpcm6a8Tke1psYhV0lhNf0u3qda3N4F7rlxvDh73W+LvWYPfz6Ve7D8
 XKzO/yyzRo9aA7XO6YaMgcO0V/b8a6CGb7nfO9K9FF7IGbNzHNxj
X-Authority-Analysis: v=2.4 cv=MsDHeGae c=1 sm=1 tr=0 ts=6af2eb5f cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8
 a=10QmhNUs_TJshe_7jioA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: AGRmBOv6zg7DgkmrhSxeIfMd8M9yePL2
X-Proofpoint-GUID: AGRmBOv6zg7DgkmrhSxeIfMd8M9yePL2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100039

Document the compatible strings for the LT7175 and LT7176P PMBus buck
regulators supported by the ltc2978 driver.

Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
---
 Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
index ea8b1553a3e9..04c8e68d3b39 100644
--- a/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - lltc,lt7170
       - lltc,lt7171
+      - lltc,lt7175
+      - lltc,lt7176p
       - lltc,ltc2972
       - lltc,ltc2974
       - lltc,ltc2975
@@ -50,7 +52,7 @@ properties:
     description: |
       list of regulators provided by this controller.
       Valid names of regulators depend on number of supplies supported per device:
-      * lt7170, lt7171 : vout0
+      * lt7170, lt7171, lt7175, lt7176p : vout0
       * ltc2972 vout0 - vout1
       * ltc2974, ltc2975 : vout0 - vout3
       * ltc2977, ltc2979, ltc2980, ltm2987 : vout0 - vout7

-- 
2.43.0

