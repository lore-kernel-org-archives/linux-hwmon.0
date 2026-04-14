Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979592D5412;
	Tue, 14 Apr 2026 04:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776140985; cv=none; b=L6RVIC4ctK3lTCYwmaoBQgejqfOgPI4R4iTMMw0A2bxRZ2G2k/F9EEyWtMHHIMnuKyyQDMTdOQ6qczQIINqt2y7zsLLK8q1sSBS1aZBdHdvFOR7KrNQws25TRK+1QExJNfDmtgNidrPRQf7B20bPExtaGD0GeMKcMwol2HaIvck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776140985; c=relaxed/simple;
	bh=eLr4t5JcrzPSVDaSGq5t6M2d8Z3QFiPsYNMhI4rAEwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XTbUBElZmjEzDr+OaGndxvoTf3KmI6nrWVosri8ID3tXk1EfoGfsxFuvVZ3/05Ld2MOvvXlIUEK0gVE8DQecMEyERe20YXa2CAoM7pRLJzpK9Y5u9YDTcnr0hd+5zkLUYoKN18SEhITTZgOdXHtDRisBiAFlkSfE+AD3iSdJM1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Fx7tZl5s; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Fx7tZl5s"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E1j9QU3139121;
	Tue, 14 Apr 2026 00:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=N6C8D
	YemoXbcSzZvg4nkjx76Xd09nhPBTaReWfXCUaU=; b=Fx7tZl5sZss583eYqY1Xo
	RDbn4YeMsbdBwIKmdSmdSNmu/j4ZXx5yU2GtAYyZ08+iShyevLtCVeQDrTOvTH/S
	d9iNOH5sCAOyx15tByOOK7o+njHS+VyhXtkEG1m5sGUGWha5n0CwUREfnRegvuvz
	iHoJNNyEfY3HQcE6sDK3vh2wBX/x3D+5sO/+zdiQLbGAqxrBJ7wF5r5OSKqorHic
	7flBpYN8gvtJateLn+W1xpS0Uv6KdIS+G/YXkDFIN+mHIqFEGBcNFglGglVVPOe7
	nE7QYBaKVBifsrjDEh/8gfI4MQQJgQ70d1ubTTP/VcpKK05V/XZmq1LDatV6HDPf
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4dh8591ffc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Apr 2026 00:29:15 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 63E4TEun022952
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Apr 2026 00:29:14 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 14 Apr 2026 00:29:14 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 14 Apr 2026 00:29:14 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 14 Apr 2026 00:29:14 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.190])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 63E4St4V011556;
	Tue, 14 Apr 2026 00:29:06 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Tue, 14 Apr 2026 12:28:49 +0800
Subject: [PATCH 1/2] dt-bindings: hwmon: pmbus: add max20830
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260414-dev_max20830-v1-1-210d3f82c571@analog.com>
References: <20260414-dev_max20830-v1-0-210d3f82c571@analog.com>
In-Reply-To: <20260414-dev_max20830-v1-0-210d3f82c571@analog.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "Alexis Czezar
 Torreno" <alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776140935; l=2968;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=eLr4t5JcrzPSVDaSGq5t6M2d8Z3QFiPsYNMhI4rAEwc=;
 b=rIuDdMp58SAgRlOWc+XW9soqS1Sws+mGLdhPvKVE7xe/1BesFzBToknNu0EjYjDBUV0sugSlm
 mDU9BMNIX4kAwwxe2XHzKgP8Yfw4hQXKtzbpGc5NTTFvNfrU4bV9rga
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: HxstEN4xb8opGKInd2tzOXkknQKlFiiO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAzOSBTYWx0ZWRfX/ZBOntVWz4n0
 crWAcWOvhbjo5x2mJRs1NZtzBQehbCh5ENarduFktdF9a5NpZlFLTsYVmBD/zqmqmNXCXYGb2p6
 TNBAtfKTQKc/wrMeA1e6/2+WyGRS0+28b+aeJGwSh6VCzEnHnyoQ9yu/Hi4eKa4yYsHgGxNgSiM
 wn0zKoKUgQ+KSUy3gDpcA5p93/Sb8oO26BMOHbqDdqRYHpaa1jYWEKHeO/g9O3aYUhoWIOErP5c
 xtE/rhHsOYhpTiSr658F+iEHL4YHoBPqDYToG6sbaJAybBhCH2xFkgZszJes2TjJVwCqw2AV06+
 DfgE9zcQyjme00WvICGp2MzXS5O00ZnMFTkqOAJZ4nO0zixv6xDFWNWfnBGG3nkF3chdkpxC1K1
 +DKvoqSs0aQOU1BZMOykX1e6EuDsfou3A/ynAmw4zRlZ8GgHOKwaN43t8T1BKbHGu9IEqMGtp9+
 5VckNOfRGgMdfPElI+w==
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=69ddc29b cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gEfo2CItAAAA:8
 a=gAnH3GRIAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=rWBwxEM6VC-iK73SjNoA:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: HxstEN4xb8opGKInd2tzOXkknQKlFiiO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140039

Add device tree documentation for MAX20830 step-down DC-DC switching
regulator with PMBus interface.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 .../bindings/hwmon/pmbus/adi,max20830.yaml         | 58 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 +++
 2 files changed, 65 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b20f3be176615895e70e74bfb2a534d82d124a15
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,max20830.yaml
@@ -0,0 +1,58 @@
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
+required:
+  - compatible
+  - reg
+  - vddh-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hwmon@30 {
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

