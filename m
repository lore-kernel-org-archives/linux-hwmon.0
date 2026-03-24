Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C177D3F7A94
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 12:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354900; cv=none; b=GAGzEcl2/Mog9VREQAp5eoNBoeJuSX3ULufeBlSYwbS+z9U4D0MZGKQEMT4zQHMDDk45M5+eOYcsIs+8sWw9ckN174JES2juSlyo56ZUvAj+QA42S7hfgYbNa8128GMbRmAqA+j+EgSYnBiQaIVbLF3t4JfTCtZ2i5nF3YGXnz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354900; c=relaxed/simple;
	bh=GTFqB9vlpM1haE7yFKw2gkxIIFosboWK7AHcKs1bUx8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Ol2hAR9dZOOCKQHzIsXuMWd+CjJcYIwugWPTTJTvw5hp6X1fg4S34gJqgR9l6k+y9X3RfzcRiBqMlYlPMoQQSWQQTNX2e05V0H7Uw//S2RKStPHlkh/XF9EZq6XuLEt8S0xxYVpSKWoHKRlxdvsVrEhdB53hDHHXq9mbGq7GALQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TS4ttkUW; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TS4ttkUW"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-824c9da9928so5766236b3a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 05:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774354899; x=1774959699; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a+ZeiMfLn+fSOvi+U6OBmLVKVry66tNJDCkBc+/8Fvc=;
        b=TS4ttkUWytfAq4mJFczL8XiHXR9CLr5zFhQjoKZGi0wLiPmiyraZULIV9Z0iRQ7sfc
         iA2L4eRrsMTk0a0qVObhvLA5RUuuoPhQD+sOXU4VJDuk1aRTQI+1WwhYupEjDqm3zwTi
         p9s6RXCVXiBWbqy9c6HZAC8iPS97m+bcpnBMLhMscDOKwKU+/uz0XnoC/3DhXV9Ma51I
         WrRTA2sD8MD5E4bI6w6SoE8luGfOhpKY5YKLjvgUNqJDGCxG7jpoDqWeSv0XL+QQpP2f
         2eGUmKCafDb0eKjPsy/prYVcZjHha6QxtSxE7Fuil6RqOEesy8wLVwwIbIK3pBEFjujh
         3DxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354899; x=1774959699;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+ZeiMfLn+fSOvi+U6OBmLVKVry66tNJDCkBc+/8Fvc=;
        b=HAVVV5DxyBix33tAOFqkGewNrtcpv/s4nF0a0q5vRM6AEaYgAjVKnz6ofyPJ7Fy8M8
         JVwSyJ/KsmV8uh80AWmbDkdhG5EkseuQ2hnhf5B8kuwzLFJTKjRROHND/LP2N0xPVTVF
         f29TJWnOgxon9nr9Vr88IUO/7oMJONU929m48FQJfe39HEkxjOeQlT891/rX0dHPVZwN
         fITUnoDH79DzU2DW2OCInzm1aA02STihyEJqtLQjETAyKMh/XGHvGM7lA9QNv8m8Nbhm
         7A3NmG6zlelogRLUGtcNpUA1iybMXBK0KG58KETolDzuM9uJJ0GKIdMt5d4XfOGeSA9Z
         i2NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBz6SwYUPC6ln3Po1VB4DLMG0ZikIvnEowukhyKFE6yGYxHU0jYxL4MAIz1reqwOlagzmmoq/v20DhpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMyWNxwTRDXsIsPyxUJlMkDcZlMNzdSQ4QWRlSl3oEAanBLbWJ
	RGRWIraejyobCnE+Ji/4I1YQDgTfgn0IObmHf1I0cHFxmRxe0Me2tL9P
X-Gm-Gg: ATEYQzwxQcCtJmGoi9dHV9YSZr4omzwZuDGMr0TdXpQt/vC1U+Km6mbjQAIbCgqJvP2
	9rHDJcWYRNmRscr+LHmJcbHfaIJI6T3+oJHMSBhfNZq3jugfEpJ+1CBy1c1qTs2uFz5H4YYa0Vh
	ABpE/iMSJxwcE9WE5THTh2GDCFDexCdeE2/pzuxm+P56zQgaHllYakBrmdv3V7mx/p/fY6sW/pO
	si5ULoii7Kc8ZRWi5i/5LMrDn9ZsGNTvV7vhketvHDFZEct7EL5zFaJv8QUTd+MuCwgXdWWfXVJ
	h1XZLchf6kuSpBEICD9zF9xPa6/IVGuACMQ5u3UWSmqGGPzwQjtRjug+wtS/lz9r1bw7SbL4Tfm
	TXBzR1neLxjFoVO1mPU9G7digu6zpjE1F/8Ba9P77nCjdjzvgK9DYaMdc6CJM02oBJJ/rGqcGVF
	Kejct6lsDGKlV2NQ8LTdCpBlotHZluohtz3HSF136lbK5c+nCgyp27ucTh0PmqpTg=
X-Received: by 2002:a05:6a21:99a6:b0:39b:81bf:15e6 with SMTP id adf61e73a8af0-39bcebd94fbmr14067182637.54.1774354899215;
        Tue, 24 Mar 2026 05:21:39 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74443ccbe4sm9904920a12.22.2026.03.24.05.21.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:21:38 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v3 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Date: Tue, 24 Mar 2026 20:21:07 +0800
Message-Id: <1774354869-119736-3-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add YAML devicetree binding schema for Sensirion SHT30 series and
GXCAS GXHT30 sensors. Wildcards are replaced with specific model
names as per maintainer feedback.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202603212044.BRPaiz86-lkp@intel.com/
Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 .../bindings/hwmon/sensirion,sht30.yaml       | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
new file mode 100644
index 000000000000..1b5ce822b37b
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/sensirion,sht30.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/sensirion,sht30.yaml#
+$schema: http://devicetree.org/meta-schema.yaml#
+
+title: Sensirion SHT30 Humidity and Temperature Sensor
+
+maintainers:
+  - Zaixiang Xu <zaixiang.xu.dev@gmail.com>
+
+description: |
+  The SHT30 series is a family of humidity and temperature sensors by Sensirion.
+  Compatible sensors like the GXCAS GXHT30 are also supported.
+
+properties:
+  compatible:
+    enum:
+      - gxcas,gxht30
+      - sensirion,sht30
+      - sensirion,sht31
+      - sensirion,sht35
+      - sensirion,sht85
+      - sensirion,sts30
+      - sensirion,sts31
+      - sensirion,sts32
+      - sensirion,sts35
+
+  reg:
+    maxItems: 1
+    description: I2C address (usually 0x44 or 0x45)
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
+        sensor@44 {
+            compatible = "gxcas,gxht30";
+            reg = <0x44>;
+        };
+    };
+
-- 
2.34.1

