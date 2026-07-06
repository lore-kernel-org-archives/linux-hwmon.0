Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2438837C90E;
	Mon,  6 Jul 2026 02:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783303784; cv=none; b=pcZf5BL669oL/0huCE+iX5IJ0ZqdgRpVmwPiWG+aoUXXvbdRNp0vf2o3iOd9XMPNBAbWebngstFy7u12Q4n2bvwbTl8R4lqwuoE3eZBwlTdsi4S2njI36YF1RTIK0ecttCdQthBU1Ywg1ZW5HXqdO2nT9Zvzg/ULlxxhSmxJemU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783303784; c=relaxed/simple;
	bh=zzaA7eX6yq0mn2cLBkYfc4Z+AoeB+iwBI36DaRIuvhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=A60usb0sL0HB8N/ObVK7jTsqQP+ho6SuRtetp1ECCpu1sTKMjx0UCf1ZGpAUyuaZUqr4mXFzFvYmqnuLSWFeZIugII8qBnD+AWOS7iKOs6wjdDhJO2Erp+YTUs9kaRoeMHtEnfp2yHsnapEpMT1C569X6obtuiXQXJ1V/+FWb9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=zV7l0MMl; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="zV7l0MMl"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665M35YO3100708;
	Sun, 5 Jul 2026 22:09:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=TOPU3
	V56jzPdYSm9e+IgvBqzaIZr4DqKF9DB0CIT9bw=; b=zV7l0MMlmMrK30ZNLFYiH
	6SN4QRLPyIt5gwkgVY2GLZotTkHk8kE2KNAljSxihDI26SQdUDgcVcFU6G1WSVMw
	2nBfQggMVlKLO45LQ9pfyG5s132PbOvVxYUJRmYVmbVM4sgA4uEHUPjt38WJ8qA+
	tyxfVqYnb8G7XmpTpGh8XLj8yUkEYDCsrACNBfhMvqO/4PbfIKE1VCS6RdZRiHS5
	7ncbkFghxQd1m0D1TkvtJkfvStIUAYWnoP6SmsEyg0EszJBVuCGv034M8C4528+l
	9Kem1u5wXZX5Yu6Y/eY8lRaR2r13i3Ip3AzLD0NvCrR1041wqtYdi4dGl78XMsiA
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4f7ggbt5n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 05 Jul 2026 22:09:12 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66629Brv045181
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 5 Jul 2026 22:09:11 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Sun, 5 Jul
 2026 22:09:11 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Sun, 5 Jul 2026 22:09:11 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66628o7Q015791;
	Sun, 5 Jul 2026 22:09:03 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Mon, 6 Jul 2026 10:08:41 +0800
Subject: [PATCH v2 1/5] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property and complete examples
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260706-dev-max20830c-v2-1-37761e89bb5f@analog.com>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
In-Reply-To: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783303730; l=1591;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=zzaA7eX6yq0mn2cLBkYfc4Z+AoeB+iwBI36DaRIuvhk=;
 b=1ZiQzPKzNqjivE+rpqny0A7fbIi2CIIy/RBybqS1SpP1oF7ysu2CCXLA9wwgaYGR38+LSReax
 jJIa3PhnjOqBK/U1CpFYTvej1a2iPkM483YrQUvCQTyeZMBbVKt2rDT
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: Tmh885LqCo6WDXzbmghmQ1FS96150ztb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDAxOSBTYWx0ZWRfX1l/PLybVExPg
 6huR13cMFAbvKV+O2sZyZoHNf/iGnobvaYYM/DwTliek5biLLV3y36UT0Gl4KWN4c7EI57jP3P1
 8yTw+Vj99vI7Hhzj3P+J6DTE3UX12ep667FJWj+jEeAZQwIe/DWY
X-Authority-Analysis: v=2.4 cv=TPx1jVla c=1 sm=1 tr=0 ts=6a4b0e48 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=S1Ua5ojpi0nV1Hjqt1YA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Tmh885LqCo6WDXzbmghmQ1FS96150ztb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDAxOSBTYWx0ZWRfX6gyx1grB7zf0
 GrcoqOd/fsuiwi3OFW3thZmc3GsHfUV5UPdPI6NLRz7/CwJPbucyw4KiwROL08VU5Wt0+eKQ6wb
 tT+fBZG4/QUdDSIaNAwKfrhnVimQLyQuqEJG6C05V4KGlKzkqJK+GZgErBA1bPY5QdKnvYKI6xu
 bbs9Aqf8xdNaVasuMPTeDkAzFg6vJkiUe1G1zhTqyzIM+wdULzkV4HKFgJffXnEcnntthrosPNF
 DnKoPmsfCWqIFq7DPH52c1dlwevf+BIOrLELfO5xOWiDBwMn3rmhbfzrgVOZIy8Hh2Tzl9d+GWe
 zVj0Xa2ww5yNJATRstUxk3qBcPLppAtlzi1rcJfukj9eHZxsznOpH/S6RtwBAT+K0rCjtAl+ogA
 Ol6smq+yHlBuf2tuWkXEDnMkbHqht0pEl1EpfRQ7xvfAvplRg6bIoUt84+OARkEv7Ilc5pg/lZd
 MaoQYKYJAFK19DTQMCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060019

Adding an entry for the MAX20830 EN (enable) pin. This pin exist but
was not included before. Also edited examples entry to be more complete.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 .../devicetree/bindings/hwmon/pmbus/adi,max20830.yaml         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
index 1625dd59417f1b3ca689a9c86ca266da913d1217..f3ba6351aa5d657590d92a538910fd6b787e7a3a 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
@@ -39,6 +39,11 @@ properties:
     description:
       Optional 2.5V to 5.5V LDO input supply.
 
+  enable-gpios:
+    description:
+      GPIO connected to the EN (enable) pin.
+    maxItems: 1
+
   pwr-good-gpios:
     description:
       GPIO connected to the power-good status output pin.
@@ -53,6 +58,8 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
+
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -61,6 +68,10 @@ examples:
             compatible = "adi,max20830";
             reg = <0x30>;
             vddh-supply = <&vddh>;
+            avdd-supply = <&avdd>;
+            ldoin-supply = <&ldoin>;
+            enable-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+            pwr-good-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
         };
     };
 ...

-- 
2.34.1

