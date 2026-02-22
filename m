Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83F335B137
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771779823; cv=none; b=npoHik01Gcqt6W94jORkZBTknolVQXerdFbap0pJAPwYzXVz5JZ+eZKnjgoli1A9KWfsl4hED/w8f1+s3M/NebpmPtZ/Uu3Md4JTEx8lCAG4To8tGQWO87TWAs2loYaWMx23UaIxP3huQ4c14WbHkoPhh6rj+k1zSvUYhS61EEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771779823; c=relaxed/simple;
	bh=QNQ96HGA1Jlb2HSFik7zjV20cCZdyppLBAw2ZG+2yoM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SWmRy/z+feO2W2frVX3Tga5f5vjN09vGEh0EcoyNjTyVfTmIy7OVEqOz7hz4cdXVywcPmpBFcJ4Vgok3rHtZzeGkFT+Vj0nfLBOJrArBm+LLXLnCFig7Fcu4JYFD7YeFN3Ji2cjCmKfOTZUNxbE+rmML+7eDjs7PH36S6wfg2+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iy44WVq+; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iy44WVq+"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so1889364a91.0
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 09:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771779822; x=1772384622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38KBnvM7PCRrBqcA9t57q6k9J3NtXhDDyDB2bhfoX+4=;
        b=iy44WVq+Nw5YGxDZqLLIKzvyGEVCufNHuffrNVxW0pL1N8L6y8BcxwsLR8qd24i29J
         ApYeOJzEjwiMUStRd3vgw+amwwA4Qnz3pVU0ok3XaGJo8XeGZWVeGiQkCFiEpgPKmsfQ
         ibivqSEW75rWLiVfigCvdq99hIn0m+1sTVpZPvy/J3ywDfXJ66EnvlQ3WRKyQ5JnaJtK
         SjBE1FO2b7vf6w6wwsbi0O+6dP8F1YhZVWhjZSWxosXMrYYSwTTUN3YTyu3jZx/LZyKZ
         lGesRxW2tD/TQ//LGzpJuSk4bej4Ds19RrC6objR0Hm/Krwp56R8SNDrdKRHa5OcfcEn
         Kx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771779822; x=1772384622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=38KBnvM7PCRrBqcA9t57q6k9J3NtXhDDyDB2bhfoX+4=;
        b=MgPMBmbdnr/7BXgao+n8ZJdglDSeayBtmH7Bmw5Yl+VFSilfSPIdpv1pN8Jf8USOY5
         +ae44b159N1AZ43AeqxvAkjorFFWMhM7XHugPG/97HGB2PnhhEWHB37K3/+s/YGsILhi
         vcxZEszc86PkSQ4WT0oNcIWvY3cOM/OUUgwB3i89fB+rCBYaqj5s9GAZf1k5frSFC7t9
         X9YusaLw9qOem/HDoJiPjivp6phC6LxoK3ZCjfCMes4y2NRwsoFtzw4ip4sXNp5YFbyd
         XJBouydnfOQdRD6thImmH121HQu/tmbmENiIGIqhONvs+oPVLiUXwahL4Ts9IBOlMDod
         bsQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFGek/rvEyeTs5WXHk0ul1Q/MVAbDhpjbqvztF2wTXfFgVMiCBu3fC+CGGHT/NBUMePknfk6knVjWPXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7TqiBu7Idw24ytYO+j6MG8UdT/QzEdh3URWnngREm1f+cCUIP
	uWHxBfACO/WlLNBvYFh9A+qmzG+7ciUPOMJsEQsIo77sTYHRUN1PGXX9
X-Gm-Gg: AZuq6aJIPkyZssR8fOd85n82TC8x6mka0xZSoqdOV3kObWzb/DpW1ujMBb8XlTyqAjl
	puPqzCjXJno/K1PmAjY/yqPWHrmV+CTK9VZoEPryC2iTXLtG9Nd8GA/D+TBwwb4D3BiHlp8mlF4
	yOuQ2zeslotSB2C4zSoM23spLCCbDrvYnEavsXZRoliyIPcy4VzTjPg7eq2wu98NlScUSPAdw+Z
	R6jFz3l5R7efDSdTxmqcE7mo1m+12t0CHb3TE59LgT+/oE3JjCzMBmy/pEy6QUwPsbttO+UFbMH
	NkjQ1b4nQA07gsjNv2pPLyHxo+LhfhA+etNJVIDaVvNDeKNFL+aWTD6cqN+wzfqDRgUhATk4NoE
	A0N/EHgSJAuTiAG1A2qkHkSbQFcNcnTyANcxXpkPe8LvdcARIhj9023tjXHZxW75+V9YdA6usTA
	kJvNBD+9hSHCE0xTlf
X-Received: by 2002:a17:90b:39cf:b0:341:2150:4856 with SMTP id 98e67ed59e1d1-358ae8a42d3mr6286329a91.17.1771779821916;
        Sun, 22 Feb 2026 09:03:41 -0800 (PST)
Received: from yu.. ([120.242.225.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358bf39ba25sm1555688a91.2.2026.02.22.09.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 09:03:41 -0800 (PST)
From: Hao Yu <haoyufine@gmail.com>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jcdra1@gmail.com,
	akhilesh@ee.iitb.ac.in,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hao Yu <haoyufine@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: hwmon: add aosong,aht10 family
Date: Mon, 23 Feb 2026 01:03:30 +0800
Message-Id: <20260222170332.1616-2-haoyufine@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260222170332.1616-1-haoyufine@gmail.com>
References: <20260222170332.1616-1-haoyufine@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for Aosong AHT10, AHT20 and DHT20 sensors.

Signed-off-by: Hao Yu <haoyufine@gmail.com>
---
 .../bindings/hwmon/aosong,aht10.yaml          | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aosong,aht10.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/aosong,aht10.yaml b/Documentation/devicetree/bindings/hwmon/aosong,aht10.yaml
new file mode 100644
index 000000000000..6eb3944ae3da
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/aosong,aht10.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/aosong,aht10.yaml#
+$schema: http://devicetree.org/meta-schema.yaml#
+
+title: Aosong AHT10/AHT20/DHT20 Temperature and Humidity Sensor
+
+maintainers:
+  - Hao Yu <haoyufine@gmail.com>
+
+description: |
+  The Aosong AHT10, AHT20, and DHT20 are I2C humidity and temperature sensors.
+
+properties:
+  compatible:
+    enum:
+      - aosong,aht10
+      - aosong,aht20
+      - aosong,dht20
+
+  reg:
+    maxItems: 1
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
+        sensor@38 {
+            compatible = "aosong,aht20";
+            reg = <0x38>;
+        };
+    };
-- 
2.34.1

