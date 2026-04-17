Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B063C3A9625;
	Fri, 17 Apr 2026 08:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776414495; cv=none; b=n4FRld4gtr8+ogppM6aeA5FLX3HOBREhuGjiddvASeMQlJI/2lpJZ87FIKGNLgvJyfxoqteTZyjGbwxirZbBR/Rw0JU7b+gnq10pq3+QSH648KJbET+3vuurXCxFDpy2b/CLR3mLcjSfsC6Up/Vfjx16+3FqX+9E1AzTCge6WZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776414495; c=relaxed/simple;
	bh=ARRiuAm3euM3jPyM10A/k7Z8LraeT/Fam/a7tZM+LgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GNhKhq+cPDH0nqX7Z066vZxXrqrpr3HF+84jgYJTtOpv3ILPChrkL87Eadbapnwn9vFMVAvx1jNQ87/z/nJk+k9EmRAE2QzNaCRnSAQOHoWDxNPnGdgIeIjPoJPOGVpgS81V1Z6Q8BbU0ao++VZbV7tvjfkcopF+vAtMvoirQC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Xosr7A0P; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Xosr7A0P"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H7bHQN203845;
	Fri, 17 Apr 2026 04:27:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=dyC3f
	upVH/1PpZ1No+sAqEC+auj9zkyoh6aWpIQV5UU=; b=Xosr7A0PncOmxzNzM/hBD
	LektY6dYMwEmbw9eDo2bm3vTc1HmZFIc3Mhzpw9JZyAC3kwjWLRQo7hywN5kf8yl
	9ZJFn3VL6EcAw58WXJsb/VGzpdtXlLwbY80vGZVWgdW7EdxK35OtMoFT2l25O2ne
	F92AGW5PYDCuktWIU+Y5Mzp8w92JxT1BKXLU6rTinfpbyNk7UKgzvmnHwQpZZxSx
	jDMbmixbCpd2kDHK37yLkNLDshwvvipWEyN5hDPoN9AX86loj3CE3YHEPsyEB7NI
	BpG8WTFn6N6hm6eghDQAVshDxhiDDjQJL7ipz36xg3UftoyPjG+9NNCpQHyRJv6Z
	w==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4djv9acyre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 04:27:57 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 63H8RuLe010663
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Apr 2026 04:27:56 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Fri, 17 Apr
 2026 04:27:56 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 17 Apr 2026 04:27:56 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 63H8RZ9k029843;
	Fri, 17 Apr 2026 04:27:46 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Fri, 17 Apr 2026 16:27:13 +0800
Subject: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: add max20830
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260417-dev_max20830-v3-1-0cb8d56067aa@analog.com>
References: <20260417-dev_max20830-v3-0-0cb8d56067aa@analog.com>
In-Reply-To: <20260417-dev_max20830-v3-0-0cb8d56067aa@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Alexis Czezar
 Torreno <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776414456; l=3152;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=ARRiuAm3euM3jPyM10A/k7Z8LraeT/Fam/a7tZM+LgE=;
 b=IKDS8FW4ETpzypnsOdB4M9EJJ0FAWWLJy9khuCUaHoAEgZTI7a3J0rADm8q093e4vgXclmOVN
 7C4Rjm4xDC7CCnI7bli21MAyUX/W+6tSjTm6OVbfCx0jLeKBIEELCEC
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: cHp7cxNnVXME7HJI6ArHihhH2Z6vnwDO
X-Authority-Analysis: v=2.4 cv=KIZqylFo c=1 sm=1 tr=0 ts=69e1ef0d cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gEfo2CItAAAA:8
 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=otUEmpEx_C0DwgoW3ccA:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA4NCBTYWx0ZWRfX+kv9gUdRGcJW
 XTaUy4QvC3EJxznt6EC0CwYaGTCCgmfyuRk7oSVkL8xA8tAHq1qM8sR629Ml9n+Uz+hsmf98gxp
 mQywphZWIvJeabmHHV3jUVB1cr4faI/U1m9nytdcERowkEmcWvW+AUXFmy2XIiUYgDY4J5yqCCz
 X/Qx8wPWHvADKEnnViwAhvTEblfFop/3+QaRKcYebt1mR68BngXNEX4Y+kUKxkIPIL9qEXEI+jQ
 D7dPn0ECwA6my0VYO4JPz5RtCBelVg6PTK+d/CEbGTUJbkxS9ivwUVBJlLBTA8uz/eDfY9DUtD6
 DCFqsXy8tH41ErwP++4/2YMKSnl3O/tH0DeE4n2JtrIb/2l4p9vlx1VyXvd9+smPxT9hyURsWRg
 qUaKl+h4y3cAvxxQAQPzA7ee/jDhjGkpuwheSxb8aAvXYkrsBXTXxfflpRg7Oi1NBGvvac24Kty
 DI2O5srC1kJVxvp0f6Q==
X-Proofpoint-ORIG-GUID: cHp7cxNnVXME7HJI6ArHihhH2Z6vnwDO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170084

Add device tree documentation for MAX20830 step-down DC-DC switching
regulator with PMBus interface.

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

