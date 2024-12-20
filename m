Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB1E1DFF8;
	Fri, 20 Dec 2024 01:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734657654; cv=none; b=rR4UlhRfvxuZt9OQpcccXpr5Y552/lzr0NzYEwSxj4ZYVEuGJo5Wu0XXIPHf4UihfGZBRRObF05dMDLAMfzI/r4wW9N/3WKJtKSzlnkNycMRcIiOPIFzvRM6KC+0gMs1G872gUzfZDfTvBOEtzOA1Y9F7pu+qTDUWrzH4joo5xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734657654; c=relaxed/simple;
	bh=0AGM9rP6TOQbyiEpdPRLIesc18xatCm+1LxT9eRPHFQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ETqXhpZShx9iAH1BtHMgH7eUPFGDd0iPW1miMROzprB6hbZa+7pGAOBEkoY/+tbnaor3m/e9FDjv8xySVjymQcLfhj/bzfrak766HTF1EuT2tOph5C6+xDaHgQCFV0JQOSsJXREZz7fOeChAdQsXoCqSC+YKejAn4qCrz1uv6Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=xjvkqK6b; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="xjvkqK6b"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK1FLRe022078;
	Thu, 19 Dec 2024 20:20:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=wYzSE
	2Fc2GQLtpdCduWkZqJ5NTYjUEm+DAGReiS21kk=; b=xjvkqK6bYLVAMytuUcSou
	uWDvmO/+PgxfseD9rIxj/hqdg/+Wjmh5gKNQWneJlZ/YU1POtT1v6/lGZvwNeMhJ
	uZB9et7V59n7OAtN/M22OU/0z42LSLzxz1Wl0KQghz22VYHXnqc9uiBpTNZZxh6C
	u1CCq8dQP7ZCVJOjPjGVBiENgR3eRzcf3VMwO+v2P/XyggRQqMbIC25mdPF9oKiO
	mvexPscTqTU/ev2V+HXg3oZKD4YWnmsr6pK4cj2U8Q128nXCIGvK3TSq1LeqOFvf
	S12OXj901ilLJGb+ufU5HkE2oe5lqzxJT0o+4srUXtdt3vMCFqruMpappw4qMXqz
	w==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 43mxrr00mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 20:20:31 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 4BK1KTuk006267
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 20:20:30 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Thu, 19 Dec
 2024 20:20:29 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 19 Dec 2024 20:20:29 -0500
Received: from KLIBETAR-L03.ad.analog.com (KLIBETAR-L03.ad.analog.com [10.116.44.206])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 4BK1KE7c019479;
	Thu, 19 Dec 2024 20:20:24 -0500
From: Kent Libetario <Kent.Libetario@analog.com>
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: hwmon: add adi,max42500.yaml
Date: Fri, 20 Dec 2024 09:20:02 +0800
Message-ID: <20241220012003.9568-2-Kent.Libetario@analog.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241220012003.9568-1-Kent.Libetario@analog.com>
References: <20241220012003.9568-1-Kent.Libetario@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: lmuXZhkqjc9B9YPF6brC8GBpNaACfQne
X-Proofpoint-ORIG-GUID: lmuXZhkqjc9B9YPF6brC8GBpNaACfQne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011
 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200009

Add documentation for devicetree bindings for MAX42500

Signed-off-by: Kent Libetario <Kent.Libetario@analog.com>
---
 .../bindings/hwmon/adi,max42500.yaml          | 42 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adi,max42500.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/adi,max42500.yaml b/Documentation/devicetree/bindings/hwmon/adi,max42500.yaml
new file mode 100644
index 000000000000..19446f571d9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,max42500.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/adi,max42500.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX42500 Industrial Power System Monitor
+
+maintainers:
+  - Kent Libetario <Kent.Libetario@analog.com>
+
+description: |
+  Analog Devices MAX42500 Industrial Power System Monitor Family
+  https://www.analog.com/media/en/technical-documentation/data-sheets/max42500.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,max42500
+
+  reg:
+    description: I2C address of slave device.
+    minimum: 0x28
+    maximum: 0x2B
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hwmon@28 {
+            reg = <0x28>;
+            compatible = "adi,max42500";
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 379289369505..d1703b4834c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14046,6 +14046,12 @@ W:	https://ez.analog.com/linux-software-drivers
 F:	Documentation/devicetree/bindings/rtc/adi,max31335.yaml
 F:	drivers/rtc/rtc-max31335.c
 
+MAX42500 POWER-SYSTEM MONITOR DRIVER
+M:	Kent Libetario <kent.libetario@analog.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwmon/adi,max42500.yaml
+
 MAX6650 HARDWARE MONITOR AND FAN CONTROLLER DRIVER
 L:	linux-hwmon@vger.kernel.org
 S:	Orphan
-- 
2.25.1

