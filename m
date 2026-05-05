Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329CF325491;
	Tue,  5 May 2026 09:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973153; cv=none; b=LXW37AB1tro0SZ9dhd5YinkCntgFKcdkoqYWuv9MGPpot5IX1fSNPUka+k0MKv467ILZYtjBitGlUnJ0QkhbcXZqJqT19YjYVlooa+vR7YOTUGP80eFT1Z7GAjBWrmFeDOIlsCGLu+Ceu6djnQEb4ppWp5NWq6CUm/JwoifJvck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973153; c=relaxed/simple;
	bh=ptLtSqGYdplM1zHr7+/IaahgshvCv+HRPEAGROuuhS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XFHg9dJCTZAxyKr5T60JeXOEmhj4pYlcqXtzV/HmBI4HIxKuEuDp07356bJuzpI1vpXzdE2hvkQvNXcVy7uFmk/SdCLJASC01Ok1xA7FyfAsg00CVnhSx6XtlzixnZpMkKRVNmrLK4sBpvs3rwnX1lLX1CmZ0dSRd37hxgD2G5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=bRzmeoYe; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="bRzmeoYe"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457notV2211240;
	Tue, 5 May 2026 05:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=bbCbN
	1cn40Y+v9yAsSWbb622Iw2vNNfcnADK8w7McG0=; b=bRzmeoYevL8XyupJqcsKH
	w228lwIOkFReRITcWqUrfTYIQZkAvTdUC403crPz45dD307iDLf9JdiJadToL/vP
	JwpnZCAloYNjkygG6Ocs/6/IPhNYaCVFcxOan1K+v+3C5IK0q7v34/mbPseTV3Gp
	TadDKaz+M07zgjVuG9O+SzFW5k7NXhWeivQ1kP8WYhorCMh2MDrlmAC5XzftIXgl
	gANtzTl46JAOuA7CqIoq4EaZuBuufqTEufXKLqZ7rCx9NgWcIKuASt7iwDlW/Cr8
	LXetk/nMcM82FJoRNb1Nw+D6Ux5KvKjzS88Vyjg0cJULaAc8v9LsiwtUkmExLMnG
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4dwb43b739-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 05:25:34 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6459PXT7031769
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 May 2026 05:25:33 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 5 May
 2026 05:25:33 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 5 May 2026 05:25:33 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6459PELE029445;
	Tue, 5 May 2026 05:25:27 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Tue, 5 May 2026 17:25:05 +0800
Subject: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: add max20830
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260505-dev_max20830-v4-1-4343dcbfd7d7@analog.com>
References: <20260505-dev_max20830-v4-0-4343dcbfd7d7@analog.com>
In-Reply-To: <20260505-dev_max20830-v4-0-4343dcbfd7d7@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>,
        Conor Dooley
	<conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777973114; l=3205;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=ptLtSqGYdplM1zHr7+/IaahgshvCv+HRPEAGROuuhS4=;
 b=gc8bQfRhx12Ga7xNEKZ3aO1uPXTEm66u/3us79DqlQ22ojXXZvgnZl2Mi2uDSEPeYCX3VEtF0
 +uFkQfEMSkOColj/pIzJwvQ5qTAwbEqSPys6QL2//z+YXngaesVXNOs
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4NyBTYWx0ZWRfX3OfE5vz5KbxG
 klXzVfjJR8vK47eCjSpW1eFA5PQEnQxsRqS+hGM457PO/ewZzrvH+0S0Rs/c4zwaBbUp9oQAQpb
 3w3v/N+ZcmVMLH7kRyJhm8TSs/d8D41Y6wnWqTo8dn2Sp/BjLyeoqmO7zQvEp8G3cxYbpZcKJDY
 MaIusfwmXhc5FtqGSXlNy5hJVVJRypiAloenHmwW4QAOwVuQlq3Kn4n2NnJLXj9hZIo98fReTkZ
 G+Zn2NK5r0WUJCN32s4oLxHpH1//vWxElE6UsK7tdSSiX8uvPItHQ3uawYlpe3HhQdKH+vB6+Ns
 AmzEme6WGxFXlLKP1UH82AlzxOVcSJmbmSBUnF0AhcOyCeo7GYjby4kb67TnhmBqXPyQGuuQ3Mp
 eol7xpfnLNhdYCRim8Wu3QAJXG2e1hVjJgwl8OrYhtxOzwRyVqaGygUhLAOi0H8YmyYHrSAwU86
 Ca1Fy1l+WTwTU6XBFfA==
X-Proofpoint-ORIG-GUID: ceHjI5nB3sbUuwU-ZpCLiVFW1UazsDFw
X-Authority-Analysis: v=2.4 cv=AeeB2XXG c=1 sm=1 tr=0 ts=69f9b78e cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gEfo2CItAAAA:8
 a=gAnH3GRIAAAA:8 a=XYAwZIGsAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=otUEmpEx_C0DwgoW3ccA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: ceHjI5nB3sbUuwU-ZpCLiVFW1UazsDFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050087

Add device tree documentation for MAX20830 step-down DC-DC switching
regulator with PMBus interface.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 .../bindings/hwmon/pmbus/adi,max20830.yaml         | 66 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1625dd59417f1b3ca689a9c86ca266da913d1217
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/adi,max20830.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX20830 Step-Down Switching Regulator with PMBus
+
+maintainers:
+  - Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
+
+description: |
+  The MAX20830 is a fully integrated step-down DC-DC switching regulator with
+  PMBus interface. It provides 2.7V to 16V input, 0.4V to 5.8V adjustable
+  output, and up to 30A output current. It allows monitoring of input/output
+  voltage, output current and temperature through the PMBus serial interface.
+  Datasheet:
+    https://www.analog.com/en/products/max20830.html
+
+allOf:
+  - $ref: /schemas/regulator/regulator.yaml#
+
+properties:
+  compatible:
+    const: adi,max20830
+
+  reg:
+    maxItems: 1
+
+  vddh-supply:
+    description:
+      Phandle to the regulator that provides the VDDH power supply.
+
+  avdd-supply:
+    description:
+      Phandle to the regulator that provides the AVDD power supply.
+
+  ldoin-supply:
+    description:
+      Optional 2.5V to 5.5V LDO input supply.
+
+  pwr-good-gpios:
+    description:
+      GPIO connected to the power-good status output pin.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - vddh-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        regulator@30 {
+            compatible = "adi,max20830";
+            reg = <0x30>;
+            vddh-supply = <&vddh>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 0a3991c10ade20dd79cc7d1bf2a1d307ba6bd19d..031c743e979521a92ed9ac67915c178ce31727bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15579,6 +15579,13 @@ F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max17616.yaml
 F:	Documentation/hwmon/max17616.rst
 F:	drivers/hwmon/pmbus/max17616.c
 
+MAX20830 HARDWARE MONITOR DRIVER
+M:	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
+
 MAX2175 SDR TUNER DRIVER
 M:	Ramesh Shanmugasundaram <rashanmu@gmail.com>
 L:	linux-media@vger.kernel.org

-- 
2.34.1

