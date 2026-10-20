Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496798;
	b=qjfCZySSvbdAAjQ6WrZt+rlUWrIrVplgFOxVF1ChKQ++SUpP/Jm0fMCYlsMMtu18zoOT
	 NJXrvbmYd/q09Qanp+cedGB4ThBZHBlxMfPsdyjTYV7XQb28naUSo6TgkrPChxyEJQxTc
	 iShFsFv8TKkxJgvSmOxwFttPErVrhQeTcJP6fZs/7sxi1TfMXMaSaoRq2qJEx8xqIrhUl
	 BR5y3+Nw87y2zWb14E4k41XM5GF8/9PBWdPvM7LRAHI+NczKfE7Lp4Ec62HmZ7jhLwafp
	 HN+EVfJ106DZG7QTiCnmj3jZf9T4w9ElJC9LOX+FGMsW0qOR9ZF5Z3qKPVejrrk20bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496798;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ADIRuleOP-NewSCL:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7xhAAxs7gtA6hwrxXwsRzcIdplN1KaZA0sPPDBphH8c=;
	b=n4QZYjd3vj3dcr0q9B7UQbV03zN9rWZE0E69DDmC4K7WTAFXeTJJen5ACX32j5cY9Cyv
	 t4J/latWCeFfZPSeQmKUJGMgQW+pW6lEihCCV7JWCVD6hjJJlWewDgGEd0a70k57zY0Gu
	 6+sou+k5w+RGfQbU2gkl5KOTlWWmsu5+PjlDzE/o9zKYeJ7mQkjmK2mXCnI5kcIz70Rq6
	 /4lF5L+i+Av8kiiUQQR+JnTcoP3nSw6MkAQrzqIZrn+SBBckp4ieVrh+mxb0Uc5UQ5Obs
	 UsOGLiXTLtN7GzOjhzg4/gC4dQpxW/S9prl9P41TqloU6jvaMvG6nv5zsbKkd7uNsWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=Eim5sZhv;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=WR8RB5qU;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7029D606A32A;
	Tue, 20 Oct 2026 11:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7029D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=Eim5sZhv;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=WR8RB5qU
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAKgOn2993671;
	Tue, 20 Oct 2026 07:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=7xhAAxs7gtA6hwrxXwsRzcIdplN1KaZA0sPPDBphH8c=; b=Eim5sZh
	vKXPGsDHReQRWgupy/T1zAbxE76LK1PkQvugV7zNAdSxguZDGj+nl4FFDWcC0t0V
	ructzm0FnvCWBv5vovWXkL7BtRB+Bjmch2kK/oo1lZK7kwj22Ov1Xux0Lrn52l5b
	df1K1SyK89Wpyvx5m2Wxros9Q18OI/mVJDM/9xXMYcEEiTJGmqkBwMAfSNDlIFm/
	vYmzjkZQrJdR/Gp2lJfMK1wrr7EFXEGrVlEAdeUa6SQ0HxYG3idz/vDJ3lDBit2+
	wWtwlmANli6Aq4y046kxyNo6aWnAr+juK6Ar2nGMubBx0Im528ZURsrz3OgHJvfC
	moGBWBvY7nPYu5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=7xhAA
	xs7gtA6hwrxXwsRzcIdplN1KaZA0sPPDBphH8c=; b=WR8RB5qUEF8tD3KxQHt7S
	tgOCPT9JWiIhp3rOHDQbfc3D4Mbe9SirMqQgs3HvdGPphL2LYum6XMoUj/RE1XMX
	MShD2+7w7QVVq/4IsA5Ebdkw6u+6V/8jgXCPGL0T/4yNGKI/LmmXJSaA4cz7pN2k
	X6Y/HDPK3Tdr7hAv8MGrzFqjFpjTGUa54YO0OT9PM+7jWRGGiz1Zi0GuUpcCvZFz
	bs/HS3v223Vo6dWCtNvhRQdElBw/f7eAtOV0pcgeRo9hTwOPeLu/wNqAfd6Q7Y99
	A1mqfMnKMUkMpORV6PcAklhsTbsKpZLYw/6w90W1F9qHbZJn/WAvKbQ1yrxL6nKs
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hdw69u80j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 07:46:10 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 69KBk9Wj027461
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Oct 2026 07:46:09 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 20 Oct
 2026 07:46:09 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 20 Oct 2026 07:46:09 -0400
Received: from HYB-GHaNx595DZ2.ad.analog.com (HYB-GHaNx595DZ2.ad.analog.com [10.117.116.216])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 69KBjZVl012172;
	Tue, 20 Oct 2026 07:46:02 -0400
From: Christopher de Guzman <christopher.deguzman@analog.com>
Date: Tue, 20 Oct 2026 19:45:34 +0800
Subject: [PATCH 3/3] hwmon: ltc2978: Document LT7175 and LT7176P support
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
Message-ID: <20261020-upstream-lt7175-lt7176p-v1-3-86b9b728b95d@analog.com>
References: <20261020-upstream-lt7175-lt7176p-v1-0-86b9b728b95d@analog.com>
In-Reply-To: <20261020-upstream-lt7175-lt7176p-v1-0-86b9b728b95d@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan
	<skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Christopher de
 Guzman <christopher.deguzman@analog.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792496735; l=2963;
 i=christopher.deguzman@analog.com; s=20261020; h=from:subject:message-id;
 bh=78/+xN+4G5Ob6oJmealug7k7ifQZHtvtFxuPFiHDytc=;
 b=B+dVnXXXOki88sMLXwImRJ0gilSsz/O2KJEfNJoJUiDip/OESDywArrNavSOfaPoC7OCWGDET
 hO3k85Vta5iASeTMU1E8HwCnVjVxnrVbsuDn8kIMQemt2AMI5UxyzyW
X-Developer-Key: i=christopher.deguzman@analog.com; a=ed25519;
 pk=nSwfp91RWULY/zCnrDkBvXulgnpfKy+5C6/Gh3ecLwo=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: tthgRRWPKft2NhIvs44xzzBfzZmxscZK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfX4er6qz1pKS42
 OoJX/ZmlhTjaWm5DzU2fyrj4N4QWyuopcijS7HfwxwapwibOWf97tTeoNgxbmcc4DW8GvjvBkTz
 ZRAkayop/xFB7Sw6d5N7TiiZ4MtV87+3gQ9Zxn7Ytd+MKujnLCSF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfX17CdZlm0A+9y
 FJwidbr6uXbtzRxGPpvM+2MISNG2abijxkaACsD3e7hh9qMdramrUjrFSbjIDqvSt+U/pHJS4gW
 Arqm7ZrRsf0EACrkJQ+3BArKVi7IGRAF1ZulW2gYqJPqeLgkyQD1lqPNIHXiPjhUV6MjAKPSUjF
 IFehQTzFNfn/xJX9Qj8yXHJ8swZxrPPnlZW+8qodX2mjkQxcOCH0GoQmGpIHYgCtIktlT6uMPZp
 g+wzEfGMxDYXsLV5tXxzZH16U0hMm1saRIz82qsG2BwrUnhynqdTKXWmkBzv2Gl2eZul50vQ7iU
 aPJiu6ddm5ETHuY/wfW9pjFWuaLDTPLVoZ/4xd/rK1vWPEpftvwaA3OyCkg/35BuGeeRIBLE4F2
 UQFOV8jjwVuo/gEam26qjn6/BjW7H00oL2z2uMwz9uPGyZMYZ7wY6wi8tU5pt+FBRlDgNhA2b1E
 WFiu/HW/0DUGVVEsRsw==
X-Authority-Analysis: v=2.4 cv=cdpHPXDM c=1 sm=1 tr=0 ts=6ad75482 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=20_gXcPXWtmr8_vpjwoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: tthgRRWPKft2NhIvs44xzzBfzZmxscZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200046

Document support for the LT7175/LT7175-1 and LT7176P/LT7176P-1 PMBus
buck regulators added in the previous commit.

Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
---
 Documentation/hwmon/ltc2978.rst | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/Documentation/hwmon/ltc2978.rst b/Documentation/hwmon/ltc2978.rst
index 0b72d566cac7..3d30ce5cac95 100644
--- a/Documentation/hwmon/ltc2978.rst
+++ b/Documentation/hwmon/ltc2978.rst
@@ -21,6 +21,22 @@ Supported chips:
 
     Datasheet: https://www.analog.com/en/products/lt7171.html
 
+  * Analog Devices LT7175, LT7175-1
+
+    Prefix: 'lt7175'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/en/products/lt7175
+
+  * Analog Devices LT7176P, LT7176P-1
+
+    Prefix: 'lt7176p'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/en/products/lt7176p
+
   * Linear Technology LTC2972
 
     Prefix: 'ltc2972'
@@ -241,6 +257,8 @@ Description
 
 - LT7170 and LT7171 are 20 A, 16 V, single- or dual-phase Silent Switcher
 - step-down regulators with Digital Power System Management.
+- LT7175 and LT7176P are 24 A, 4 V, single-phase Silent Switcher step-down
+- regulators with Digital Power System Management.
 - LTC2974 and LTC2975 are quad digital power supply managers.
 - LTC2978 is an octal power supply monitor.
 - LTC2977 is a pin compatible replacement for LTC2978.
@@ -318,7 +336,7 @@ in1_reset_history	Reset input voltage history.
 
 in[N]_label		"vout[1-8]".
 
-			- LT7170, LT7171: N=2
+			- LT7170, LT7171, LT7175, LT7176P: N=2
 			- LTC2972: N=2-3
 			- LTC2974, LTC2975: N=2-5
 			- LTC2977, LTC2979, LTC2980, LTM2987: N=2-9
@@ -357,8 +375,8 @@ in[N]_reset_history	Reset output voltage history.
 
 temp[N]_input		Measured temperature.
 
-			- On LT7170 and LT7171, temp1 reports the chip
-			  temperature.
+			- On LT7170, LT7171, LT7175, and LT7176P, temp1 reports
+			  the chip temperature.
 			- On LTC2972, temp[1-2] report external temperatures,
 			  and temp 3 reports the chip temperature.
 			- On LTC2974 and LTC2975, temp[1-4] report external
@@ -432,9 +450,9 @@ power[N]_input		Measured output power.
 
 curr1_label		"iin".
 
-			LT7170, LT7171, LTC3880, LTC3883, LTC3884, LTC3886,
-			LTC3887, LTC3889, LTM4644, LTM4675, LTM4676, LTM4677,
-			LTM4678, LTM4680, and LTM4700 only.
+			LT7170, LT7171, LT7175, LT7176P, LTC3880, LTC3883,
+			LTC3884, LTC3886, LTC3887, LTC3889, LTM4644, LTM4675,
+			LTM4676, LTM4677, LTM4678, LTM4680, and LTM4700 only.
 
 curr1_input		Measured input current.
 
@@ -452,7 +470,7 @@ curr1_reset_history	Reset input current history.
 
 curr[N]_label		"iout[1-4]".
 
-			- LT7170, LT7171: N=1
+			- LT7170, LT7171, LT7175, LT7176P: N=1
 			- LTC2972: N-1-2
 			- LTC2974, LTC2975: N=1-4
 			- LTC2977, LTC2979, LTC2980, LTM2987: not supported

-- 
2.43.0

