Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467316;
	b=xS3ifb+tu81X4K9+DM6px2b3xYKLX1JQaw2KFRAwc01ASyPxY7Muv4jg42xhyH50leZz
	 YrM9WD56ZZliJeFU5FTgXyZCKwokNQKKiVLfucvqD3u7vo/+zH0tWVy+M9JPoF+xm4ttV
	 RVJOVXRcFoWgzVl/n9Z3DS3zLrEH8nq/Lz7QlpEXsbGFz0IetqnlKCQ/hBFl4YQkaYLGl
	 Xc4Ok2jUVxcrUzJBff66IW3CajbJFLCGbfXuU+hU6SKhnp0YEt8Bzgl6KOKhw9x5h3qIm
	 SYb6yv4G/oLnHIcj3SSol641LCSLwI/GzJGGF34XATba7Nxp/XHVU1vfdFQRQKMpqcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467316;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hZa6xQX6xlTYdwDzFzhntlqX7xZbBxURFfm+Q4ccyBs=;
	b=BfnuXgtp4jHH1dqNruL0uRLUTBYhChuX5iCBe6GrviGrnFD+JeR4zrs9MhLoYdsEkB99
	 rx8zec6oSQI5MdbpXIpqDkw2ARQaFZ/ZxlfyVlFCn1aoMHyXTiCjQe47Hr/Ol+nX/0zxn
	 1W2xbSGuelash6ioHBU/QLvXdJtGg6pXYViS4HIDdUQ+Cst7+28sHGriVNkbdVhyhmyez
	 E6LUQ75Slt48znH9uDCi2Z+F5CLGoMmEpb2pcXxB8p2sws/99FU6g+649RKp8X72rD7BB
	 BRifN/8my+Nb9X/lKShjgHPK9CKH3qusXClKouShq+SpIZDtCWEfqfCZXLXIFP/gI3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QXiNt9oM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dym+IZCd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA464606A332
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA464606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QXiNt9oM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dym+IZCd
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuUOA720774
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hZa6xQX6xlTYdwDzFzhntlqX7xZbBxURFfm+Q4ccyBs=; b=QXiNt9oMEj0pLkFN
	L0LOpDZDLGuObJIIrJ81O2FypGASQAIhqE81QVk8MT4wMNfn1PxLkL2Ag45cxaww
	tTTA3gNkYE5icDZJELAyeK+pzfjnqVr1E3OoCcv2oj3drHg4vCKGSitTWenLP5qK
	eL+6yUKW5pMwr7kpL5IY7fXPDf8LXw0B2vqnTLi4guQ+XzDncp7kW40xq4lNrm4+
	UwM5Zqji16ndZS7cg1BJqwPZXPHUK64mnz9bpYLaDRGYJBY2mEuCCrCm7fXIW1Ou
	DzH8Qj39TtoWGvEMY1KXz+0BKGKXUtOdybtW+64XoWgVe+etecormu5eYCZoeuVd
	UW9DsA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqgafp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so5564651eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 12:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467313; x=1796072113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZa6xQX6xlTYdwDzFzhntlqX7xZbBxURFfm+Q4ccyBs=;
        b=Dym+IZCdvRhMxRB4sy0ZQgpUSwB9pwernxOfBe0EWBB+8ULxwHlfGoxdorXYYFqlj/
         i06ltXsHBIt5YJBrR+NTVPVbddW9G8SlU9PEK75ZLT+8szbkj8tusAfhqizMdeb4uXjN
         T2a7uT9NjJx42INrQvcLI5WaMlN6Ein/ihPeQNQsijwLrYf7y+onJQClJh4trH5UemwQ
         p9XzCJ5Op6NtKAdTp2vlJsFozE+9Bg2RzTY/QRk3IWjjZe0XsHWZIy6+EpV5M7rBUt0h
         4tFy/uhp7vEuksI5cxl7mKOBmsvsSkw2dVY/DmiC/fGSAb0tXzu9H1JnPclcoLZ5hgjx
         WKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467313; x=1796072113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZa6xQX6xlTYdwDzFzhntlqX7xZbBxURFfm+Q4ccyBs=;
        b=V/lq6RFyT5y2lqLvkcB3eiuXHuVqmfrAMPgzP5Exbu3j3C1yV9P99NZrp3X/oaezwW
         aVdggx2QPm1HXKqYXO6KmMGdXGcfCArj0xiL+WE8Kc0TNSawZACBLsNmy/M2wenUMwM9
         o+6fEjRXBpq++cnl1dTMRiSYMB9ua2t5T/JhPx/W0sKp8NV4JOklRErxparVGcOKMQj4
         +/e2gsiWZv4r0wE1xy681Lvz1G3l4M2D8PKonH9XGqOQGbJzsR+JAZovpyKli9/YA33E
         Q22nDxfnJaskLn0t9JG4Bx28o+gJ3V4IjfdMotWKDer3nqDeoegDqy1orMBqHIHOIshL
         e8Og==
X-Gm-Message-State: APuU4Z8CmaMw6LvufzUHSAnWbRka4OFyJOfN5yGFyCaYToV+2kOrh1a3
	SkkSYNyeV+SoDpUN3xP/ukcjjuGoEgi2PfKPT5tUtS5t9ZXuTTBx+p/6pxgE4gUWaWUYg4czcQd
	25rcmdZNihST9VosQ1x8cth6aY1J9LxZgk8/kHLItFTRgC2sQ9EB5XMa7IfD7SmI1iw==
X-Gm-Gg: AZFdTZe3NCLRMRhJrX9TjDcAmawPZKHinLit/51/HiS4lx3YWWx895bCXbIX8Sx8s+Q
	jFqu71nT5ypG2MA3DxKFHtEvvEZqSQUpN1RmDiu8BrbxO7yt3wAhIpzoA9t04uJ06ItAQDAVYzl
	rKwStWqmeHdFDlQuFhByBILivCLT3yAV6vjMpji1gujT2zCd/4qwlSK0IvyzZ0rwrVzzOriCFAA
	nd7gJ1WDW9ZTIRDpMhSUiPDtDSwRbDC7CNmjRcD07vp9PUcXkHnzunVPt13HGAxpoTe/X73TVXo
	T40uANs63Mtd4jgLpgyzjWARQAgwOV8Dg421iwte2A0lfAZ7z9tM955TuwbSjcW2UjoHJ0/l76v
	l6qyGrJ2xP7QBneD5gKo1zRqUZA76Nr4J1pwaLR/w7nv7urmzl1OawIZfWj8S0NkAUh79OgJDsW
	O1dkM68+ae
X-Received: by 2002:a05:7301:7107:b0:386:b494:8642 with SMTP id 5a478bee46e88-386b494879amr3280340eec.13.1795467312442;
        Mon, 23 Nov 2026 12:55:12 -0800 (PST)
X-Received: by 2002:a05:7301:7107:b0:386:b494:8642 with SMTP id 5a478bee46e88-386b494879amr3280297eec.13.1795467311875;
        Mon, 23 Nov 2026 12:55:11 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:11 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:41 +0530
Subject: [PATCH v5 01/12] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-1-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=4396;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=Gu1GpC+38HITi2Er9kUG2koMItBv0WwtKRBZ8DxvpQ4=;
 b=Spbejpz/DzxBNIumdqXhcY1cns0HOwt8l9EmATBgk7HpDuClz1ZxfP6Z0Wp2ogKQtV1Mpm8qu
 bWYnfeY2/GYANhoiYy9eR9GYJ4/X6rJA8hCPhbhF11cKueaKOJapzMA
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b04a831 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fehuZy28kGTF_x16HkYA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX/5ircaC/cqC7
 Vvhi0JJrOoTgoEcAP+JHTvpGlKy36DZlwuwE5ZghfDcr7nuh9Xj3zRDZOdUMn+yNEU07RVxCxh8
 aFZcnKMfVLSGdZ92zPkAJMRruZgRvaYQPzeZxa9G8LWGJcXqVy3egHGJRT1kjeZlD7Nb0mb5ZC7
 xUXwbN4wav4t/eTQpcVfqCo0qj833roA3onYCNI10h6hnKCimkofLDmNPXr8L8km9c8KXXCBkUk
 8Jv3q7khp5xMzSwstNnWuZqH9UjA5b2xc7ncQ5BRaZ+TmELmrdhkjr6+aw+y8PHp+OIacGHWUF5
 axk0HeQMnAS04NIidygiLNycofa5zHo6Vcsg/Rv+NCmX43Zzjp0tbTBSmd8PNc3kjCt9JALVqAE
 nHcfK1Esw/5+jaDS9sCt+b+muCvrrZE6trFnxhIrSBoVlK6et/PyOeg1+69IXzMHD3Ofw/gz3R3
 zjmvQxdQOjwCIyYNjQg==
X-Proofpoint-GUID: 2x42S-oObv2ifDUlkPcZzUMs1gMDesUF
X-Proofpoint-ORIG-GUID: 2x42S-oObv2ifDUlkPcZzUMs1gMDesUF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX9R9ZUfCcggW6
 oUtKymgjB2P2qztBMKUxwWsoHAq/NsoCqCYvaj4EdBHj+s5hddJDbHMMEO9jPEqeza3bBYQv6lR
 /aJ7DVbBBCLduAHRWq2ZqGXuN8cOnDE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Qualcomm SPMI PMIC BCL (Battery Current Limiting) is a safety feature
that monitors battery or system voltage and current to alert system
for overcurrent or undervoltage conditions.

It provides:
- Real-time voltage and current monitoring
- Configurable thresholds per channel
- Hardware interrupts when thresholds are violated

Add a devicetree binding to describe the BCL on Qualcomm's PMICs.

Add sensor type to SPMI device list for BCL device.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../bindings/hwmon/qcom,pm7250b-bcl.yaml           | 72 ++++++++++++++++++++++
 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  4 ++
 MAINTAINERS                                        |  7 +++
 3 files changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
new file mode 100644
index 000000000000..2bbeb35f207a
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/qcom,pm7250b-bcl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SPMI PMIC Battery Current Limiting (BCL) Hardware Monitor
+
+maintainers:
+  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+
+description:
+  SPMI PMIC Battery Current Limiting (BCL) hardware provides monitoring and
+  alarm functionality for battery overcurrent and battery or system under
+  voltage conditions. It monitors battery voltage and current, and
+  can trigger interrupts when configurable thresholds are exceeded.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - qcom,pm7250b-bcl
+          - qcom,pm7550ba-bcl
+          - qcom,pm8350c-bcl
+          - qcom,pm8550-bcl
+          - qcom,pmh0101-bcl
+          - qcom,pmih0108-bcl
+          - qcom,smb2360-bcl
+          - qcom,smb2370-bcl
+      - items:
+          - const: qcom,pm7550-bcl
+          - const: qcom,pm8550-bcl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: max-min
+      - const: critical
+      - const: emergency
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@1d00 {
+            compatible = "qcom,pm7250b-bcl";
+            reg = <0x1d00>;
+            interrupts = <0x2 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x1d 0x1 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x1d 0x2 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "max-min",
+                              "critical",
+                              "emergency";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 7a889d888383..2c3b60437982 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -197,6 +197,10 @@ patternProperties:
     type: object
     $ref: /schemas/rtc/qcom-pm8xxx-rtc.yaml#
 
+  "^sensor@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/hwmon/qcom,pm7250b-bcl.yaml#
+
   "^temp-alarm@[0-9a-f]+$":
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
diff --git a/MAINTAINERS b/MAINTAINERS
index 9cd098f0d91f..36a470c859a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23080,6 +23080,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
 F:	drivers/net/wwan/qcom_bam_dmux.c
 
+QUALCOMM BCL HARDWARE MONITOR DRIVER
+M:	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+L:	linux-hwmon@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
+
 QUALCOMM BLUETOOTH DRIVER
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org

-- 
2.43.0

