Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304902;
	b=SllUp7Cux+/OP2+yY7kMlit6WMrFiKnDsR971GJkOJAIs3IuRx85sCAO/1WMBr/tKEti
	 mTPcQYgAHA19inHSrlb1VtCm1oOk/jPVisqSI/mXyxFbgs/ujeJsC43aYWC74O/QF053x
	 o0b5Uf0cA7lhLvKSl0RURey83eTfeX7S4KahtSPP0piB0YwBMO+1LA6gAfNAPjvJYv+E6
	 hyW2WQQkI4Qkmr7S1UXLqHyx8cwEEe+Mv8d69YOXaA5aX+fZkbQYOKrzUMvpnpGYGGn5f
	 37thLIzp/FAMG5c3UPZAnisXiGIMxVw7o8TD36kSUuESmA4FmxYeA8TBILksH4nf8Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304902;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:
	 References:In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-ADIRuleOP-NewSCL:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I1Gmperf1ljyAHqFnubhYJElRj4d4EarnDeYnPIkznA=;
	b=xHej2wmU5O05a1G/cryS/GEgoIhuAduxGDQOoaLOrjFZik4Eno2IixbzSIfi7xtIMCyp
	 YJjILlceSworkRMpV0z+0GalEd8s8/bbAWsdW3XwlVP+zPy5CRIBoqmLRszrAHUKnlx4x
	 LS76E/9LuhKORvqWx7pMssjQ6jjhuAr3P61HRTp4t1hXODZUZswRjQomc9w8FjG0qxomC
	 B0wRHddiEEhSrEIm2ONjVFJ4XaCWs21LOOC7cARlCl9JEMB8X2KSFB0x1g2ZOWkUmhCrU
	 uTDsVpmSpVwGyNNpY2Rj2Vqjb3FpSCahFSN+pjUEMt21I0Ud/z4UEJLtu8A2t69INCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=RwTf4xsl;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=xf7bf0c2;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098A560A6F79;
	Tue, 10 Nov 2026 10:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 098A560A6F79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=RwTf4xsl;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=xf7bf0c2
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7kehe3726156;
	Tue, 10 Nov 2026 05:01:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=I1Gmperf1ljyAHqFnubhYJElRj4d4EarnDeYnPIkznA=; b=RwTf4xs
	llCPzqKS8huIIgx4bwd8gp7X8TZUYJW15ZRxBFXm2ETxGrvM9MUvGD06r9IOKR6S
	MmFnb+2rRzdrEmMLJXf9dVeFKGrbi/Qy9jgC1asY4H0+0B4RBfZGaAJS321jp5rv
	4NVhaDbMnR0blENOqTZoglX0ClJZ4yxkwqioxltNc3S0b6agWVm5xTA4N9f0v/yy
	9Q9cZUJSp0RWTmcVS7oysnOx+47QS3uXecOk7sKW8g5Sd7WSmR8bQ/YBXDVs8dvu
	D0H6rbA50aSkxGqDlkAQ4hH74oIMc+tCPQAGxE/dC+d9WpWFrIh57jW5RJhqRPId
	Bs9cEx2RLn6QfuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=I1Gmp
	erf1ljyAHqFnubhYJElRj4d4EarnDeYnPIkznA=; b=xf7bf0c2YSi+CXtcUpDJC
	H7AM83weP1bhlsESZogVs4mCMVDR7ibWDmAEcpEg/jcgflVrVqKsVaNJZ2Rq8uhv
	AQR3hyjk6v/30XkI9A4CljSHJfeey/9Ux0zAwZdyMc9W8b/4MJ0A+ExreGHZ5To3
	UC8u5F/plSqINCST/fgqP99wMnwf8w9nTGWAUfL8ErBXfiP4460YB9f6fQBBvg0+
	2uRedZsPg9mK+RefUjk2DrxngBacm6S3ERR/U5KXYJeKDu6jCO1pJ1EeUcNEw8DR
	V721hmihYqees0VQgVYTyl+qahA7lVqSZb7rFre+ZKPMxKWT7QXGLko4xeGqsDuo
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4huvyq9wf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 05:01:11 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6AAA1AQH021175
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Nov 2026 05:01:10 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 10 Nov 2026 05:01:10 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 10 Nov 2026 05:01:10 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 10 Nov 2026 05:01:10 -0500
Received: from HYB-GHaNx595DZ2.ad.analog.com (HYB-GHaNx595DZ2.ad.analog.com [10.117.116.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6AAA0eud008466;
	Tue, 10 Nov 2026 05:01:04 -0500
From: Christopher de Guzman <christopher.deguzman@analog.com>
Date: Tue, 10 Nov 2026 18:00:42 +0800
Subject: [PATCH v2 3/4] hwmon: ltc2978: Document LT7175 and LT7176P support
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
Message-ID: <20261110-upstream-lt7175-lt7176p-v2-3-dd60d28383bf@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794304841; l=2433;
 i=christopher.deguzman@analog.com; s=20261020; h=from:subject:message-id;
 bh=1Vey/zayL74BVEZU3BBRY5xJkLbMhIShrkjtB3H3sdc=;
 b=VV6gqWHwlJC1ylXgTWz31V8G8Fgi57QL5pRypOaRqTfJTLJDkk7vjRLOgmwYicUJw6YAPTtFk
 Qa5V1D14OskAORpJDV/b1ODCQIj28OJ+VHDMFEHo9TRvn9/DPqjDf51
X-Developer-Key: i=christopher.deguzman@analog.com; a=ed25519;
 pk=nSwfp91RWULY/zCnrDkBvXulgnpfKy+5C6/Gh3ecLwo=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX2peX0/M6OSP/
 T52frKFY82jxw0hmekSrBnOcU7Xc7aYFc9KH5nOc9C3LJ8l1M59cqK8FwWgtiW2+GW5uk2uSg06
 R1guwwhGT4P6oX7camgnyQdKvVn5H2dPnBzlTYZXD9HkIpQrCgecljvOHb79/0rTM199WL1nJut
 pNrR3Ls8GhTxvQYSVSeIoFCWu3S5zyCevkeXTCrOBqY/5YcJymmNM3tTOZrV2LK95KZHrWS8Sp+
 M4NoADLFyzEGl+I1aBJZ8lN8IDOt5nflVItatODLtqvYX4CjRyck1w8zYrXfYlU7PsKFSu0xkCc
 drqn09OmPWn5Q0EFauK9NsbPASDJID7K4nr99UL2Atl1Z1Y+ov8YLkAwu3GMOEbQu2dvv3NOhmy
 nORv0aTnw9GQMmb///szI8rZpCyzEKeZKEwjHwTivNZFvuiYP7S8WlSrVn6cPmlAM6eaDqQ6NKR
 8fQIL3urff7MUl7qz2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfXy78erFg3zUl5
 PFQFf47ItvDx0aX13rhSJWGHLFqtsr0eDSQpOtIpcmUe+2J73+QPwK+L9FboRc2utywrzWsPnIR
 h5T5rQskcsydMTgPR/KcN89UY3Rum4STA4WLU/JWzXbZ4wCMAhmR
X-Authority-Analysis: v=2.4 cv=MsDHeGae c=1 sm=1 tr=0 ts=6af2eb67 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8
 a=8iOWES1zCOF-S3XoCzEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: z9KTuffH-0CTawDwXALOY3hguLO7Tnza
X-Proofpoint-GUID: z9KTuffH-0CTawDwXALOY3hguLO7Tnza
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100039

Document support for the LT7175 and LT7176P PMBus buck regulators.

Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
---
 Documentation/hwmon/ltc2978.rst | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/ltc2978.rst b/Documentation/hwmon/ltc2978.rst
index 0b72d566cac7..9e8448a9c1ed 100644
--- a/Documentation/hwmon/ltc2978.rst
+++ b/Documentation/hwmon/ltc2978.rst
@@ -21,6 +21,22 @@ Supported chips:
 
     Datasheet: https://www.analog.com/en/products/lt7171.html
 
+  * Analog Devices LT7175
+
+    Prefix: 'lt7175'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/en/products/lt7175.html
+
+  * Analog Devices LT7176P
+
+    Prefix: 'lt7176p'
+
+    Addresses scanned: -
+
+    Datasheet: https://www.analog.com/en/products/lt7176p.html
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
@@ -452,7 +470,7 @@ curr1_reset_history	Reset input current history.
 
 curr[N]_label		"iout[1-4]".
 
-			- LT7170, LT7171: N=1
+			- LT7170, LT7171, LT7175, LT7176P: N=1
 			- LTC2972: N-1-2
 			- LTC2974, LTC2975: N=1-4
 			- LTC2977, LTC2979, LTC2980, LTM2987: not supported

-- 
2.43.0

