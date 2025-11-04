Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11621F4168
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Nov 2025 00:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762216407; cv=none; b=gW2PyrkGhXNHVs8ooQhj/bKM/VhKWfEBujAvwed91ThBS5zovYAkm9Wmx2//0Rb332m7gnWTnBaZv8xi6QzMRtd6Zpzd85YfYnLcos+f9dHXRQv4JXLjHX5FiiayhO7yh4LV4GYvB7FHxlO0tp5zv67O2Xlba22RCm+VWOkTgDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762216407; c=relaxed/simple;
	bh=jmST4cbclzkiAEDiwG2BErRGZct5eZ5VJ+6Q/QlBDqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XFWPeFlzaMhHl2Ca7ktJgWVJtX6YHh6bDLVeqwdmdOCNb24nrJvGFM4qplByHyst6wXujyyRr/BrSY3MkUIpBCVVWrfMtAbNzPZAvh+zJM7AG7LKiv1nRvLJBCqSyJs1/M0FcV5q5PHIc23aUFbmjSPjcviEjPUq7HU35KQfWQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=obyEU/IY; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="obyEU/IY"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7a9c64dfa6eso1682471b3a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Nov 2025 16:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1762216405; x=1762821205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kowxeIsoBsM6IJaG5YMYXb1ynonjUIpE7aGx2hbnyfI=;
        b=obyEU/IY+FKe4TUfKRMQLRnLkRFx+e4EgyNgU1O+n62ZVTyR76BhrWuWMQu8ngU5ro
         JiyO35kcJW5nq3DdvIu381gfjbCbigzaDcjkeGQu6Cf6W7Mw/t1BULGVZgoA0nCNT8p+
         oWnO837uTI7UqfIGHEC5FgmEUTw2UmQVFloZ64o26VvlDBY4ob8mWcEplbl1OfvKeCtI
         EC3MLZ+CNvZtnWF6uA7E5yt91WS7nEKUCS6nuOvmvdnrUQvha+9Qv0A6jcmL5wWOSzKO
         IgJAq10u1KJG1mVWGe2djXy6tiUPQ9SvMnAXA2mPt+O8/HToEtZ41v7S0qZ+uaACulcI
         7g7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762216405; x=1762821205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kowxeIsoBsM6IJaG5YMYXb1ynonjUIpE7aGx2hbnyfI=;
        b=j1jKmKYlJIFQqZnfwb32VaoQmfB8ShjiaUIW6plQcDUuqa3GTV9M24tacJDdeNdIrw
         MZ5hhVtF/N+j82fzFV3nCkvsCwrIqdghtLva05muT5ggkWMzIQpHU4qogPQpxb3sFx0D
         nWJu4TSIldZ/bK/uIcBtfX7cdNHi8vI7wh+KkhvJI+ZTKingQ38C1Azmo/FWD7OrKsW/
         jT46pSS322r9Pp18erp1uIQsuNAhmeqFukwVSbV4V4rfBIQuGUjAGqinnOaKih6Miz8k
         2q5Udg5yS43U+rmt1m1FTuTZhO2sYpYz+FwSkZ2YjdevVGwhAavi3pCE91XbuGbXOiH+
         B4MA==
X-Forwarded-Encrypted: i=1; AJvYcCV1kg2n3KDBfz+BtS6kNqLgaMBLGjGRvXZgO4JkhSBguSf+kUVKeZm8xwDbZKR4BUFFaCQxjTvnlxwxHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ejrm0HIPWH899jSzdZZTra9704x/2jjBZRsCamk5NuM6uGPx
	nhi3LWrDhPDvvWXI8/jatIzUnx3Qdllv60K0s4Z1MBBIhOHd2qZDQy/6IAO2dxH0iUw=
X-Gm-Gg: ASbGncvxVCAQ18uWIca5sSNZGZoHyHcrzbPdc7Bn3/RWoWewxuD7/OqLjWB8NkxtkkE
	ZG+r0rui8AeyltAEG3KpPcfEtd6vdhqxZ4wDONSj3Lsw4qkesRDCbMniImu1GCRQJSZ/9lfn+UT
	XQOafynQ24SC6PDbAUiMJD1DnEzfml/q2aG2+FLu3PwM8iFsSXrQU8SOuD+uZjXHW8/KDEz7B6p
	+Bk+8meWIt6FNf6j0AJK5NJYBBzXaPr5yHUDlWGnBhH8q6Tv02onrBqmQXK/7QTP/1E3amBuYR5
	EK2ShaJjqeKaJ2AIm0GV3clbnaKPglFtE7ZYoht90F9TT83OFhyQgcYCL8Ev6zMe91XG390ZDVc
	/k9hpb/06IqlH/LOG+pQeOqBtxCjygP2vYS30kOC1uR5NkXoJlLwmL4oLi16detNMQCHRVR2TE/
	9O00+EA5wC11yI6KnI1g==
X-Google-Smtp-Source: AGHT+IHVIWBSA0y1P83cw1L08AqwpYVRKzgFYZZwfU98ZbJAsIFB6Q3vOEOtHFbXZCtKTvVXIwNvag==
X-Received: by 2002:a05:6a21:3394:b0:334:8f40:d6bf with SMTP id adf61e73a8af0-348cc2d2b76mr19149622637.42.1762216405308;
        Mon, 03 Nov 2025 16:33:25 -0800 (PST)
Received: from z440.. ([2601:1c0:4502:2d00:6127:c8ee:79ad:a4c2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f9615c9dsm360123a12.36.2025.11.03.16.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 16:33:25 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v3 1/2] dt-bindings: hwmon: ST TSC1641 power monitor
Date: Mon,  3 Nov 2025 16:33:19 -0800
Message-ID: <20251104003320.1120514-2-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104003320.1120514-1-igor@reznichenko.net>
References: <20251104003320.1120514-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the TSC1641 I2C power monitor.

Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
---
 .../devicetree/bindings/hwmon/st,tsc1641.yaml | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml b/Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
new file mode 100644
index 000000000000..cb4e41f0f99e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/st,tsc1641.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST Microelectronics TSC1641 I2C power monitor
+
+maintainers:
+  - Igor Reznichenko <igor@reznichenko.net>
+
+description: |
+  TSC1641 is a 60 V, 16-bit high-precision power monitor with I2C and
+  MIPI I3C interface
+
+  Datasheets:
+    https://www.st.com/resource/en/datasheet/tsc1641.pdf
+
+properties:
+  compatible:
+    const: st,tsc1641
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: Optional alert interrupt.
+    maxItems: 1
+
+  shunt-resistor-micro-ohms:
+    description: Shunt resistor value in micro-ohms. Since device has internal
+      16-bit RSHUNT register with 10 uOhm LSB, the maximum value is capped at
+      655.35 mOhm.
+    minimum: 100
+    default: 1000
+    maximum: 655350
+
+  st,alert-polarity-active-high:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Default value is 0 which configures the normal polarity of the
+      ALERT pin, being active low open-drain. Setting this to 1 configures the
+      polarity of the ALERT pin to be inverted and active high open-drain.
+      Specify this property to set the alert polarity to active-high.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        power-sensor@40 {
+            compatible = "st,tsc1641";
+            reg = <0x40>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <1 IRQ_TYPE_LEVEL_LOW>; /* Polarity board dependent */
+            shunt-resistor-micro-ohms = <1000>;
+            st,alert-polarity-active-high;
+        };
+    };
-- 
2.43.0

