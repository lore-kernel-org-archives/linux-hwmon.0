Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538934;
	b=B1/HIL0HWJLwZyW6ed3cJgvrpHQ454xuzlhl3hzwn9D7A+C8oJJ+qEXiznIC3P0+P5ut
	 KhQQJgoLmc8KsqINelC/VgvoYIUK8z9cRKo344ruKwX/qh7q5/CQ6cd7BujDDEQSU2tMA
	 wy8CVp+t1bXPOZLWhcpDryRRbl8MRFzV/cz54H/Dw1G/RokRUp7ptrrxRWpsAxGlHKp6d
	 ATArcAm/ecsquo6QEseDmzsBpjlCYiGchtR5DX3n2I2M3/7K6CMHigvdYQbdd3liNgCgF
	 ams95RJ9c3KK6NRHfl/qnjkxfpKztetQJdQnSn42BFwGzOZ3AvFEvScvBePtZaSu1Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538934;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:
	 References:In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-ADIRuleOP-NewSCL:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/sL6+UQaGuaJNJDa0jvc8ynNpsLCfQLQGLq8+K1ulFg=;
	b=4L4zMAMPO3VZorUGlVAPCZNdgdHAaHFLVQs+V8dtLurYjGMAO8xH47Ysd6K1VHA6Kxhi
	 tBkrHOyGDiVTZCnGr+XwgJxqPbQ9yn6SqZ4RECr17NwFTqlGU0iC3bHDB7N38MPfpMmea
	 2FHQwUsZoZgir12G/eJNhTPx1GJX5o07xlEwN2NCQojfCH1UmoSp2fX5tC0vGdS410o72
	 twELOW1B4YYNdwJW/vLuU5cwI3XddQa0LsQ+hvSSUDm19JDh/iE8g3v59XNLBagBbpvqC
	 yU5pBUfHfDUy+c/OZcH8BTmNeX1nAEHMHCNkxW9SnkacvrTOwFdSjmVuam97gyKPypg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=JznNnfBG;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=YnHQFInQ;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25944606A6A9;
	Tue, 24 Nov 2026 16:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25944606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=JznNnfBG;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=YnHQFInQ
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFKkmR1885027;
	Tue, 24 Nov 2026 11:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=/sL6+UQaGuaJNJDa0jvc8ynNpsLCfQLQGLq8+K1ulFg=; b=JznNnfB
	GRrZapivOgZ3HknA764UZg3uHKyH+xdf4sQgG3MewI5hHN7bH1EcASp/lHb6j1Cy
	emDCGhxikiJp+KL0sQTBd4XZ4+R/wVwMGiUtRmC+HRAF3defJbNbo3d9JFYEO58Y
	sSwJYDf63K6muVSKIiDB3gTM7h/nO3M7r2gOxd2AXjD0+shwVd636Lh0zAQ4S8NF
	seyNwnxZCl+m1+LBmI5Y5OxNHe+WBkE051E1WebBWRU14QaNExIO4N7IRyieVN0E
	U3AtGKa9/VXrbC1iRLKgT9SgFI2C7Qt7tBIc/Pu7CgqvM9z2Yf9i450MGY53zWvV
	4x4eH47NRQZ7g+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=/sL6+
	UQaGuaJNJDa0jvc8ynNpsLCfQLQGLq8+K1ulFg=; b=YnHQFInQWDCZEUBmn0xmG
	m7/50OFMfQyZL7sycVYvhJKc8Q0dX6ud79au+pNaPDe69qxU6QIzdqacPgaKEtv9
	uTm7/Z4TdyzV+J81gGOKYM50bxFkFjnCOLngszgWSBVdybPZ8Sqnw+SvrxJjnglW
	hEhpRTrmWiaMcRKawdZye3Iv90XtAp6kq9k8DiWgkDcfkrjEht2lFdWABUCIShG4
	TPQJyld12B/tAFWk4vU3bPB5wO0+/reVCAJoSHvk8W2jkZUEMO/HtCJaBKg8IxoT
	sclz5ir4epP2x6TOFVJARelifz5XETfxGEd3F6tMpzwRDUluTZotwybslT1jqOkQ
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j56d6jubf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 11:48:20 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6AOGmDxb035749
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 11:48:13 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 11:48:13 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 24 Nov 2026 11:48:13 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 24 Nov 2026 11:48:13 -0500
Received: from HYB-GHaNx595DZ2.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6AOGlfXg028468;
	Tue, 24 Nov 2026 11:48:05 -0500
From: Christopher de Guzman <christopher.deguzman@analog.com>
Date: Wed, 25 Nov 2026 00:47:37 +0800
Subject: [PATCH 3/3] hwmon: ltc2978: Document LT7170L and LT7171L support
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
Message-ID: <20261125-ltc2978-lt7170l-lt7171l-v1-3-7b8d0d5f4266@analog.com>
References: <20261125-ltc2978-lt7170l-lt7171l-v1-0-7b8d0d5f4266@analog.com>
In-Reply-To: <20261125-ltc2978-lt7170l-lt7171l-v1-0-7b8d0d5f4266@analog.com>
To: Guenter Roeck <linux@sinkhole.paloaltonetworks.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
	<rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Christopher de Guzman
	<christopher.deguzman@analog.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795538862; l=2822;
 i=christopher.deguzman@analog.com; s=20261020; h=from:subject:message-id;
 bh=YLMpmtowStS5oeAfSmvDbzQF9zc88hvdLQgOMSjE8UI=;
 b=BjBYfjUrnlxMzsX20qNRBy39zjV3y4ciDG5qVjycnfiKYDno15s9aobmNmYlrMnHydJjN0NNl
 lWkH+vCJ+u7AxPUI79HXvhokdRV2kBHKpiiUL+B2CbNZ3bD5a9x7bnS
X-Developer-Key: i=christopher.deguzman@analog.com; a=ed25519;
 pk=nSwfp91RWULY/zCnrDkBvXulgnpfKy+5C6/Gh3ecLwo=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXxH7L9Z9ZOVaQ
 EYl65qkCSkkgOj9NbdUVn6BpdcmZCa9/qVrBNUMIylVeklns+iyE0gYBBukYtwUSFS/m47k7p9N
 9qg1CX9oL/R0iAGLvMPFOoUgpFWfMO4++JZs/18iZvO4UVMImpFRY8aQUSUYBgllkNuw9Q/Nqtv
 zbenhQ27SnsZ8M5I6dXIR9B5RPqahAjwYii7TaixBqPD/yTrm5cY84c8JfsrCMHJ0b92oEE6InX
 lqjgfd0C142RIcNfxrcOcljj5YlOPUEAISo9cRPGgjUwrovtEEX/hKw5Bu+cTL+z6Ck6vTnCmyM
 EgnFzmUET81SBG3rXa5W3d6oRTJHhN8pY2/J54vtQLHT+Nh8gKaZjuUu4AFm3lXFIC1sxNxKeEp
 6q7T9Mt6L7prwW7guPl/eNaX13FBYJFZGu3Z0uB7IJElkZ8PLEZPhjZVNV6YNjEVs7qZTZkj4UR
 r3v1o+DtjymoMrstBGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX0c4ITVT+ki9F
 xnFa/g7UQ+u8u/W9OzN+pTbwAMfqToh5a7f12i3MBBkbkWDrIOV09RMMXQ2DPhfcfH4AJOYuRHL
 0Z/ke4FPrvu80XFJhtSx+w3ye2FgybP63WNvCyXLJCjtiVHUEsNU
X-Authority-Analysis: v=2.4 cv=bv3Zl0ai c=1 sm=1 tr=0 ts=6b05bfd4 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=klpap4exeiisM78QiGAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: xraXmEf71HjRW7EHAsRnua__tCd-dxVL
X-Proofpoint-GUID: xraXmEf71HjRW7EHAsRnua__tCd-dxVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

Document support for the LT7170L and LT7171L PMBus buck regulators.

Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
---
 Documentation/hwmon/ltc2978.rst | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/ltc2978.rst b/Documentation/hwmon/ltc2978.rst
index 7a95aefda301..ca083c062354 100644
--- a/Documentation/hwmon/ltc2978.rst
+++ b/Documentation/hwmon/ltc2978.rst
@@ -13,6 +13,14 @@ Supported chips:
 
     Datasheet: https://www.analog.com/en/products/lt7170.html
 
+  * Analog Devices LT7170L
+
+    Prefix: 'lt7170l'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/en/products/lt7170l.html
+
   * Analog Devices LT7171
 
     Prefix: 'lt7171'
@@ -21,6 +29,14 @@ Supported chips:
 
     Datasheet: https://www.analog.com/en/products/lt7171.html
 
+  * Analog Devices LT7171L
+
+    Prefix: 'lt7171l'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/en/products/lt7171l.html
+
   * Analog Devices LT7175
 
     Prefix: 'lt7175'
@@ -257,6 +273,9 @@ Description
 
 - LT7170 and LT7171 are 20 A, 16 V, single- or dual-phase Silent Switcher
 - step-down regulators with Digital Power System Management.
+- LT7170L and LT7171L are pin compatible with LT7170 and LT7171 and add a
+- pulse-skipping mode for improved light-load efficiency. They report the
+- same chip IDs and are detected as LT7170 and LT7171.
 - LT7175 and LT7176P are 24 A, 4 V, single-phase Silent Switcher step-down
 - regulators with Digital Power System Management.
 - LTC2974 and LTC2975 are quad digital power supply managers.
@@ -336,7 +355,8 @@ in1_reset_history	Reset input voltage history.
 
 in[N]_label		"vout[1-8]".
 
-			- LT7170, LT7171, LT7175, LT7176P: N=2
+			- LT7170, LT7170L, LT7171, LT7171L, LT7175, LT7176P:
+			  N=2
 			- LTC2972: N=2-3
 			- LTC2974, LTC2975: N=2-5
 			- LTC2977, LTC2979, LTC2980, LTM2987: N=2-9
@@ -375,8 +395,8 @@ in[N]_reset_history	Reset output voltage history.
 
 temp[N]_input		Measured temperature.
 
-			- On LT7170, LT7171, LT7175, and LT7176P, temp1 reports
-			  the chip temperature.
+			- On LT7170, LT7170L, LT7171, LT7171L, LT7175, and
+			  LT7176P, temp1 reports the chip temperature.
 			- On LTC2972, temp[1-2] report external temperatures,
 			  and temp 3 reports the chip temperature.
 			- On LTC2974 and LTC2975, temp[1-4] report external
@@ -470,7 +490,8 @@ curr1_reset_history	Reset input current history.
 
 curr[N]_label		"iout[1-4]".
 
-			- LT7170, LT7171, LT7175, LT7176P: N=1
+			- LT7170, LT7170L, LT7171, LT7171L, LT7175, LT7176P:
+			  N=1
 			- LTC2972: N-1-2
 			- LTC2974, LTC2975: N=1-4
 			- LTC2977, LTC2979, LTC2980, LTM2987: not supported

-- 
2.43.0

