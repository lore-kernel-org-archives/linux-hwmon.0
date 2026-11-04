Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763065;
	b=vqY+dTowO2k7S/OBT0u20sG/mWGsF+8z0g1WgI9ErIkh59lkjL82UR2qN/YvaRVDt+de
	 XZB8hXeS4awzxkJaW89GaMDGxHuHn2jkc2O+1Ic0OCGW8o+bbHb4CCPvgK81HbaAmyiHe
	 hs5Jz5T3EDVhqCDx1OvnSjoPjnlT+pi+Wqj+NQN0/4UZH6MzA8l1euxjo+qJgWpwSxxaW
	 xIMtmuwlWYTZ6EWDvvGUeykcIaVqU57yw2eEZ3ETEh6KxSkPnt8f0cQM4oS4tV+JbBVdJ
	 3uNLz+SVUwSZDEgFXpvPzgsXKnXYHjUrCqrX1dITjlKn06lAJbxyYm/JViRIXgnanhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763065;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ADIRuleOP-NewSCL:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gYmfumV77hgTcrnkAYA73Eynhf0dC8zy2SHDeEzL2rc=;
	b=SvgOZviXdkxPqW2p4cqQw2SXei1IULcyaCYR+0KB7CuEAuUzOzNLXlgJzK7Y0VKV5W7p
	 kYtuJtXzacMx7QGHGKusMbNkncxAdqIKPXYjI3eCIdQ6W861txjWeAucMnV5Jp9m4kWPK
	 iQwxA6nAjvDJuXncOImDGzE4KdLe0i6CqwYrsbN4CDb1npY7/6XpHc6XuQrpoWOVNfvU9
	 by7lPu0PUuDycQj7EeeFIKwjEZ7KasKBQdJPAjsgwKpkWd8qzEhIf5omvgPoEuSNEOyTb
	 BeCvmu3dkCQ5Thv4AWAwJITg+PoHO879yJgEpmRebiGMUL9nQfdCZJFMVR98OtgqCHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=jNOY79xH;
	dkim=temperror header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=xEYgEfII;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48711606A32F;
	Wed,  4 Nov 2026 03:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48711606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=jNOY79xH;
	dkim=temperror header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=xEYgEfII
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A42vx0l581426;
	Tue, 3 Nov 2026 22:30:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=gYmfumV77hgTcrnkAYA73Eynhf0dC8zy2SHDeEzL2rc=; b=jNOY79x
	HtJqySNgy5GqZzopjYPb7pRcjqlTHnuMq14b/vQ6rQ16ZtiOMXhjuFVoZ/J5ijRg
	829AReRml5Ce6Fn0GmXHxxRZWhnM5/YD88H/K/B0rnGfOzJ2FElINlVjNl5KbCq4
	aTmt61MLsFl4+u3w2xiuhFakeAD7WaBQIsc2Bv5SKoFRvL3EmkFZTXi0DP6HtuA8
	BSBBiSzrwyS+s8v89JNP8XNayTbSE6mjNcKxHMxynr+YhY7GlrxsYhV+lqbn3Ti8
	tpDcmvYyeYjaWpTlhrUNRbIb3EZDH/ClACKZXhgfxuT6WpomaxfcuhQa00BmLqCf
	PDLNCP1GJEo00+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=gYmfu
	mV77hgTcrnkAYA73Eynhf0dC8zy2SHDeEzL2rc=; b=xEYgEfII3HIXf/fe/OoG8
	AZwEexdVw2rpwtTpbtS/Ah+uNabnqHCQwKkVCLEeoy+PW8EbYTqDBA6QWmYUvv4F
	aTP/Q2vBL938Z+ZHFZlYxNQE1QbDJDrlFcUmMZ+zBoOR67z9GET0wil0sX+vzKV1
	soBEOn6Akeu9L0V9JZJ+oUJsXw7p2b+/e7XAU+KGjYiv9y8k/C03Saf7//PFMSlZ
	irqHePRYI04tH9pvfReI2N+j3f69zkgihBqXEmK9OI3zlL5cMoZ89v6n5JGP+JQd
	qQHXLlEPNiM8IDgi2nPZj8cgurxuO546P9cfFwNSC98Di3oRGOu7NkwB8zNWwL9d
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hqk2pu4sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 22:30:31 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6A43UUU0039061
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Nov 2026 22:30:30 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 3 Nov
 2026 22:30:30 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 3 Nov 2026 22:30:30 -0500
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6A43U7Ha022108;
	Tue, 3 Nov 2026 22:30:21 -0500
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Date: Wed, 4 Nov 2026 11:30:00 +0800
Subject: [PATCH 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
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
Content-Transfer-Encoding: 8bit
Message-ID: <20261104-staging-ltc4284-v1-1-49fce67ebc48@analog.com>
References: <20261104-staging-ltc4284-v1-0-49fce67ebc48@analog.com>
In-Reply-To: <20261104-staging-ltc4284-v1-0-49fce67ebc48@analog.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz
 Golaszewski <brgl@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793763007; l=3536;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=ACu8B+VQwMlj+xO1RLKzl0xgoDpW97SlVRbOYHQd84I=;
 b=w20T5jdj2UqSG/Irhp6w8q5f707t399cv7mbq0iSh49SFSYoOgCctTEjTDqMc/Xvj1wR2f8il
 NhWgxxHnw1yBYm+W7dWSa6u04Pwf/7Tx+x3VOZ2w/XScm2yrvhJAFq0
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: Sx-IsEG8UAdakJt6DgX7PNASqu7bvnZF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxMyBTYWx0ZWRfX85edNpGHFIyt
 Z4qFC/5RoeoY1XlQwRpOP1rqo3haKGb/aWy746/XHb0sROLIT8rhMcCbzEuLV+9Bt1jNABxzeKA
 msu72ocGbGH5AWLxKn1HbTmQ7p9pI4dXlsm1/wicY+2PoD+Zv5X6
X-Authority-Analysis: v=2.4 cv=NPlAaE6g c=1 sm=1 tr=0 ts=6aeaa6d7 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22 a=gAnH3GRIAAAA:8
 a=YjxJmSmyZUQDncK08pIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Sx-IsEG8UAdakJt6DgX7PNASqu7bvnZF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxMyBTYWx0ZWRfX4k7sKCix1qud
 AIEZ+E2BzGu4/ZK6IXHe4fFKkRsl1aeDLh8cidwFR6enYIYkBJ9f1nQRlA/J5zlkfAHNoYGAA3t
 IhsDy3eXBrZZjHwnpPPt0Jbroqwb/WXxlAbdT9qgCAR+vTOhAd3P1OI6+CxI7PjflufR0c7Qt0g
 yDGslHHNZn7SJQtoKG8F814r8iH+50JJspjFZP6WTfbDlV68/EwAZsc8CwTBoeMSTW81IJP/TTX
 qgaZvP4quDHckrLP3NJ8MJo+npP1bVydw0QhncdjS/10/DQoGOQ2bYClwG2iqlnpm6YRyvQvTKk
 p/WD6vX91REHFSc0bvOAZ3csZQGqojPHzQwuWc4ka/rgUEy+P1Ydr9aFihLnCMTNSVkqpFm1RTb
 KBaD+IKSo5aEPa94Is3rRbSGR6ITDE9WT9PCuc0VmP+rNnwmRX0NQ23N4zWSjtNUrAFbNr/bZiq
 Y4F3VnTJkmK0y1S44YA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040013

The LTC4284 is a negative voltage hot swap controller that drives an
external N-channel MOSFET to allow a board to be safely inserted and
removed from a live backplane.

Note that this device has a MODE pin that is determined by differing
voltage levels (VEE, VIN, INTVCC, or left open) and cannot be
controlled via software or GPIO.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
 .../devicetree/bindings/hwmon/adi,ltc4283.yaml     | 57 ++++++++++++++++++++--
 1 file changed, 53 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml b/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
index 05e2132ad4d8621ab76ee89aa166c131fed08e85..c850390ddc4a33ed3fd877bf4620f7f009366ff5 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
@@ -10,22 +10,42 @@ maintainers:
   - Nuno Sá <nuno.sa@analog.com>
 
 description: |
-  The LTC4283 negative voltage hot swap controller drives an external N-channel
-  MOSFET to allow a board to be safely inserted and removed from a live
-  backplane.
+  The LTC4283 and LTC4284 are negative voltage hot swap controllers that drive
+  external N-channel MOSFETs to allow a board to be safely inserted and removed
+  from a live backplane.
+
+  The LTC4284 features dual-gate drivers with four operating modes (single
+  driver, parallel, high stress staged start, and low stress staged start)
+  configured via the hardware MODE pin. The MODE pin must be connected to the
+  appropriate voltage level (VEE, VIN, INTVCC, or left open) and cannot be
+  controlled via software or GPIO.
 
   https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4283.pdf
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4284.pdf
 
 properties:
   compatible:
     enum:
       - adi,ltc4283
+      - adi,ltc4284
 
   reg:
     maxItems: 1
 
   adi,rsense-nano-ohms:
-    description: Value of the sense resistor.
+    description:
+      Value of the sense resistor. For LTC4283, this is the resistor connected
+      between SENSE+/SENSE- pins. For LTC4284, this is the resistor connected
+      between SENSE1+/SENSE1- pins.
+
+  adi,rsense2-nano-ohms:
+    description:
+      Value of the SENSE2 current sense resistor. This resistor is connected
+      between SENSE2+ and SENSE2- pins.
+
+  adi,radc-nano-ohms:
+    description:
+      Value of the effective resistance seen by the ADC+/ADC- pins.
 
   adi,current-limit-sense-microvolt:
     description:
@@ -195,6 +215,20 @@ required:
   - adi,rsense-nano-ohms
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: adi,ltc4284
+    then:
+      required:
+        - adi,rsense2-nano-ohms
+        - adi,radc-nano-ohms
+    else:
+      properties:
+        adi,rsense2-nano-ohms: false
+        adi,radc-nano-ohms: false
+
   - if:
       properties:
         adi,pgio1-func:
@@ -269,4 +303,19 @@ examples:
             #gpio-cells = <2>;
         };
     };
+
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        swap-controller@20 {
+            compatible = "adi,ltc4284";
+            reg = <0x20>;
+
+            adi,rsense-nano-ohms = <1000>;
+            adi,rsense2-nano-ohms = <1000>;
+            adi,radc-nano-ohms = <500>;
+        };
+    };
 ...

-- 
2.34.1

