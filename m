Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538915;
	b=gbyXPduMrNqx+LCCyrYfZPobwxTY4G4CYOZ3D8S4rftPCoy0D4OuKBAAPm9gXJ6eS1cf
	 lH3lGL01LD2FH+FXda6ikJLTr/0YkcRLL6DCTtSn7VerI3Y1BBaLkLtriy4O2hzubKP94
	 srH1qOU5GwgeWhigwKna06TC2Z12lhqVeRNGAXoJBr2oS1Bpxcjbt7NIyhMNfxGfmmoXb
	 Hb92HO9XvtKxeLdEsjUftODm4kYbO7+nVPPUfRvIkl8UrmpVc6z1teXUBzEodhL89sw6b
	 MJyG04Q7ReR+NRMaLRabd6BqYdMMkRILKNZJJICCYceQWo8yPlgXZ2SoR9WOlecRNtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538915;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ADIRuleOP-NewSCL:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=31scI2UXN9dA364olgznljg3cicBz9ZVK+hUva4a3c8=;
	b=bCvP3bLbXi7tFHqasHEazoJoBNrZSUIhxTF9hmOlsqplM1WYsbZAqNYFDjBoaJfZ2H9R
	 GNCllf4OB/Zyi4PGoNNOhdcAt36E0sg2Q4hWIBXiK5NFmdWY3I8YOeBLaChcjpWoeHqX3
	 flzlzBbxyLEssau7NopZN2rcm4NqXmDNkVCS0oOG4fTdzj6pxWVVVdQyoH9AmafqLke8B
	 ykRoQiEFYcq85GieLxW1SNkX6cB0lztb5bwPlgVczH/jDILfeq+RrPD3JG4fYAMhrfhyh
	 HzyTfOFaiNMBYhEp4ucbnjIwT3LyaLuWnCz0uyZLw9MLmLy86SfV5JNxhvXVCCMTPSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=L3V0xgZb;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=Rndc8AEm;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D432606A6A4;
	Tue, 24 Nov 2026 16:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D432606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=L3V0xgZb;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=Rndc8AEm
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFXmIi3728100;
	Tue, 24 Nov 2026 11:48:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=31scI2UXN9dA364olgznljg3cicBz9ZVK+hUva4a3c8=; b=L3V0xgZ
	be39ZmppEKTQ8og2RpPgmg5kJmCWlMjv0NC282IaS3PkvSFsy/wXnSmZe1GGYsp+
	b6E823CoY7BtRp9g/fDETQofA9skGCWfxV6EQJwbS0DS9wfDQw8A+vinujqZwHWP
	aE1PLlSxrQyH3cYPDPGzXlhyKMKSvTufL/8IxhdzGP0MRftXHvXDqqbKS3IwMuwW
	YdpZxlZDUZx7t19mXFYMnZeJQd1yTHR1IDztYmlIFHWP+QvsAmU8l0WPP3B2lVK3
	UAw4Gex2YjL5XD4xxqE8x6FAnSaYuRN0ipQSwp5occx0jzwgNTeP3AMMJLll+VpS
	bxdCM1iZE4c8UBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=31scI
	2UXN9dA364olgznljg3cicBz9ZVK+hUva4a3c8=; b=Rndc8AEml9kJh1mImMQVq
	4sKQ/+eIm9cmmkurKQIi8s9fIVupp2hX9okNuv95ohRy7w/M59lLh0VIvAcepwmc
	PxQOIiW5EwqUaHp0Ada3PUOBmm/90JTc4CO9V5Ry1kgs1VJGYbnVQJ5htfw3WaYN
	dLIF2KOqy+vyYuP59Eqf1ATOBZYIyCqJcm0Z1vfORTiBDuBUmHHSubATqThlYdde
	ncApTo5lQPnpTXw9JbkMQMYgtBU0i+xYal1iLUDhCX2tgE7vZYTrRC2VqQOM2EwG
	3Q0/VLhJSY2FFyjITIQZM0CJqUIWGUvgk5zZFY/ftsmgV0P28ZCYmyN46rcfCSKl
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j5db68fwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 11:48:07 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6AOGm6JB035740
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 11:48:06 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 11:48:06 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 24 Nov 2026 11:48:06 -0500
Received: from HYB-GHaNx595DZ2.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6AOGlfXe028468;
	Tue, 24 Nov 2026 11:47:56 -0500
From: Christopher de Guzman <christopher.deguzman@analog.com>
Date: Wed, 25 Nov 2026 00:47:35 +0800
Subject: [PATCH 1/3] dt-bindings: hwmon: ltc2978: Add LT7170L and LT7171L
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
Message-ID: <20261125-ltc2978-lt7170l-lt7171l-v1-1-7b8d0d5f4266@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795538862; l=3144;
 i=christopher.deguzman@analog.com; s=20261020; h=from:subject:message-id;
 bh=/ARhBj2K9NM5u+BJRSY3HI8gxsW/d3ahRgbW3E+TGUI=;
 b=iqKc6Uy9dXzS5A7hiIvFH38yFCVh9vvmtVXInwzi739TczLg1om6Uc6kFA2gZRXpCC62kWYFM
 Xuy3YKYs44zCBOcqY98nznPhHKVytV2hHX4ULg7QuRmlh4HW1tpYpJs
X-Developer-Key: i=christopher.deguzman@analog.com; a=ed25519;
 pk=nSwfp91RWULY/zCnrDkBvXulgnpfKy+5C6/Gh3ecLwo=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 2cs9wGoOFaoydaeuHbdohhEJ0G4b7SKv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXxO87vkNEuqqY
 X8tGzW20GEwmrkZt9Vpqfg98IlyJcuYrQeRWoFato/WF1dZb30mQKftMq5lU6z0wjmTYSld7+bd
 1r/s6jRcfGNasvgaZ3vfUhwGp8mqNQe+4PfBmnO2s5OKg2EHHH0kbPXWtpfTxhjaOAKHcB6uyV/
 FzLFeazA1g6T4E7Wm+E4d8UW6wk81bq0Z0jBtgeHFnle6goge/2Nm5yo/dFPDgbEKeatznslN3a
 TlvVcgdkbhHk64kc6Ay3uqNEfHt9is1KwNUPTuhR7Va7YA2fUuStQ1Jdn60zQ9mMcqaN5EwJSSf
 So/RblQPCATRIy6A6dWs19EOItZWUfV+hAS02o3AQoPA7sKGauPbywAkk7sgjzITIR8XsNdN12b
 titZgukrj7uw6jH54Oo/eHl0cpANpZWnBwwpOaga/DNgyta0bTxI8kUFEd8vrZ6Efz2CkkVJvNC
 hbNpPXclkciY4a3gncQ==
X-Proofpoint-ORIG-GUID: 2cs9wGoOFaoydaeuHbdohhEJ0G4b7SKv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXyyXbM7J53Uhm
 voGUmv3QJqrsM7Rh69UHN4+eOS2xM5uZV/t0ERUy9nFRAuQkqUsj6p6YhwbuMeixqSwS/4WfrfI
 7RQAtQtX8M79KLgycvbmgV7JsTGheVkoGamYvDJGcAE8jjxGLKcF
X-Authority-Analysis: v=2.4 cv=H99OUOYi c=1 sm=1 tr=0 ts=6b05bfc7 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8
 a=cAUoNkOm9U-_oC2w0XcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

LT7170L and LT7171L are pin compatible with LT7170 and LT7171 and add
a pulse-skipping mode for improved light-load efficiency. They report
the same MFR_SPECIAL_ID and IC_DEVICE_ID as LT7170 and LT7171 and have
an identical telemetry register set, so document them with a fallback
to the compatible base part.

Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
---
 .../devicetree/bindings/hwmon/lltc,ltc2978.yaml    | 73 ++++++++++++----------
 1 file changed, 40 insertions(+), 33 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml b/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
index 04c8e68d3b39..31c7a1db2d69 100644
--- a/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc2978.yaml
@@ -11,38 +11,45 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - lltc,lt7170
-      - lltc,lt7171
-      - lltc,lt7175
-      - lltc,lt7176p
-      - lltc,ltc2972
-      - lltc,ltc2974
-      - lltc,ltc2975
-      - lltc,ltc2977
-      - lltc,ltc2978
-      - lltc,ltc2979
-      - lltc,ltc2980
-      - lltc,ltc3880
-      - lltc,ltc3882
-      - lltc,ltc3883
-      - lltc,ltc3884
-      - lltc,ltc3886
-      - lltc,ltc3887
-      - lltc,ltc3889
-      - lltc,ltc7132
-      - lltc,ltc7841
-      - lltc,ltc7880
-      - lltc,ltm2987
-      - lltc,ltm4664
-      - lltc,ltm4673
-      - lltc,ltm4675
-      - lltc,ltm4676
-      - lltc,ltm4677
-      - lltc,ltm4678
-      - lltc,ltm4680
-      - lltc,ltm4686
-      - lltc,ltm4700
+    oneOf:
+      - enum:
+          - lltc,lt7170
+          - lltc,lt7171
+          - lltc,lt7175
+          - lltc,lt7176p
+          - lltc,ltc2972
+          - lltc,ltc2974
+          - lltc,ltc2975
+          - lltc,ltc2977
+          - lltc,ltc2978
+          - lltc,ltc2979
+          - lltc,ltc2980
+          - lltc,ltc3880
+          - lltc,ltc3882
+          - lltc,ltc3883
+          - lltc,ltc3884
+          - lltc,ltc3886
+          - lltc,ltc3887
+          - lltc,ltc3889
+          - lltc,ltc7132
+          - lltc,ltc7841
+          - lltc,ltc7880
+          - lltc,ltm2987
+          - lltc,ltm4664
+          - lltc,ltm4673
+          - lltc,ltm4675
+          - lltc,ltm4676
+          - lltc,ltm4677
+          - lltc,ltm4678
+          - lltc,ltm4680
+          - lltc,ltm4686
+          - lltc,ltm4700
+      - items:
+          - const: lltc,lt7170l
+          - const: lltc,lt7170
+      - items:
+          - const: lltc,lt7171l
+          - const: lltc,lt7171
 
   reg:
     maxItems: 1
@@ -52,7 +59,7 @@ properties:
     description: |
       list of regulators provided by this controller.
       Valid names of regulators depend on number of supplies supported per device:
-      * lt7170, lt7171, lt7175, lt7176p : vout0
+      * lt7170, lt7170l, lt7171, lt7171l, lt7175, lt7176p : vout0
       * ltc2972 vout0 - vout1
       * ltc2974, ltc2975 : vout0 - vout3
       * ltc2977, ltc2979, ltc2980, ltm2987 : vout0 - vout7

-- 
2.43.0

