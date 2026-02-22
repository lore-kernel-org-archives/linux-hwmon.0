Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39061E573
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 10:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771757977; cv=none; b=UeFjs2/p1krunPi+pyQZ/wmxeiUXpulYVNL14YyGMFWzDqoI+oRThX6P/BLqUa9NPBNZ1x1hGpFEIB/V0IKGfKRi9MQEImkxC/7pf/kT3lzSXSV/qhXi1b7lJHciUmwxKXonWvyWzPdDxIUueRZpvw39RkBF2AberzmxxpZfQnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771757977; c=relaxed/simple;
	bh=cKB8GdjBiTI1IH3d5kRntsZzu1jt3bsi1XrHNbXVwYo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qeGX2OKY2IfA/wCunAZwaygdZ/GzOC+bdYOe5z6J26XGoXo2IdyiScPJ9wch4djx/KJAjS6oD6juDoB29vpLT20vLyN5nkdc5reYrMoPVO4xtiw+ptR5X+nwlYiq9/CfDfWP4pmlrjrOcXGF6tdFuPYaW7DiWrHhQoeCR3X5HIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9fRwPiz; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9fRwPiz"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2aae146b604so24303805ad.3
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Feb 2026 02:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771757975; x=1772362775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2pXf2JxN266dHpR5OZsunhHp7ZZzd2jqbxxjf9ZQK8=;
        b=N9fRwPizSoTwfLpdpp8+eUZoDN25RB1h6eEvrXgmp01VXAsUCyPjvQJARQe9rAaJXL
         e7nNSsIhpnGW9s8JR2AMVW2SmCEjQKeaj+2bzLs6R1G7SlUB1nspo25LJAxaWGNL6y0U
         W0tNIbCx+Pr0B7f4fn7s0iun7SobDk+hlnLw1yoTNoZUwEQ0AltIb917tJMcK4+R9QBX
         PIaf8Ljy8RQqNT6gp5K+oRQYPJKmKeO7piivsBuQTjre/qr+4ELncPgHg3OyvmqNSIY0
         Sw8uoebp9+I1JlJg+9hbKT/PBYbAe4rdqJrrYC0Eksevb8Jd2xKdIbhUFQEjoZZIwRk9
         eghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771757975; x=1772362775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k2pXf2JxN266dHpR5OZsunhHp7ZZzd2jqbxxjf9ZQK8=;
        b=hphkWzsult14YzR1Fip8ot3QQOYZCQiEVvxeeTtjoy3Hir42owDRu64i241nSPVm5U
         XdMVmNO7MUHlcWwi2euiIqKF9yZvCuf8OGoQaUwkyfr6NOcOAYSvs34KKXLM2itL5xwM
         CiOtluGJyqFCmw23jjbDfD7tsUjGYTxlNNfeDkgSun34+mvAePNW5hoSsoMhBTpKesEE
         3KaTg2mLtfILb5DMkOxPMkCQoupxV80yPGAMzzOH9sK3cTGV84beq574hlFtjj2o7VMY
         EIM+8fVj3ZnA3vEuHOERSu6G3PKxr57FAIrl8ZUO00b5RgQo16J16dmZV8wIDeDGKFMG
         jCsw==
X-Forwarded-Encrypted: i=1; AJvYcCXYF0COoTzFY56213fhJqPQEtKJZnn7UejUbmVg5pvMaa8Kih8XhZiQI5LApen/BX1tLZRx8cZ8TM7sYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPYA0vFmBmVK7k1Y73hL+MrkLuX+T9WssnYUK4lwFtinyNx8mk
	eVYwJ9tVrltOYdFu0oUh/IwO+G0L2KlksKg6zuUhv8o3vh8q11x6PN7y
X-Gm-Gg: AZuq6aKuzPqgTyXkTDKFIJoywT/jXE+5KeXWYDRGM28/mbrrjvwDCo8HsqHpqwWtB10
	LU10QcTyJBvj/Rd/dpxB7BWcWTfcvqYGn5QVa3TrfR0olnGWMXsHZlVqR1+ykkzOvbRnn6Wz333
	zsRdWpoQkaFC+2G3xsplzsRIJc6GQIzOkQn2gWWXAuL/k5Ldh64Qnp3YF8D71y0uDi3ff99HT3X
	JP02TwXRqrK1XypvAJztFcwPsKMVwx4S+8HDBIwd1+wYqf1bhhpiv2b/SgF8nP7Ey6v9pHyTcB6
	r1J5ZYhnvWVhiJ4wVdajki3hMiSIVkkO5Lj/kpWNycnhxnmU1qHCUNqjEhgSAlSKSLYVg9etnka
	AmNG6gN0wU9I3REHXcCUJlN7JufDCuXfah4IYi+/IbQ/nQfubc09/rhCzr77NLiH58vQs9GiVxb
	9hoouS7BbLfhOAGIVi
X-Received: by 2002:a17:902:dac5:b0:2aa:dcc0:36d with SMTP id d9443c01a7336-2ad744d7624mr62163275ad.29.1771757974632;
        Sun, 22 Feb 2026 02:59:34 -0800 (PST)
Received: from yu.. ([120.242.225.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358a1b1f84fsm3705278a91.2.2026.02.22.02.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 02:59:34 -0800 (PST)
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
Subject: [PATCH 1/2] dt-bindings: hwmon: add aosong,aht10 family
Date: Sun, 22 Feb 2026 18:58:30 +0800
Message-Id: <20260222105831.7360-2-haoyufine@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260222105831.7360-1-haoyufine@gmail.com>
References: <20260222105831.7360-1-haoyufine@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Aosong AHT10, AHT20, and DHT20 humidity and temperature sensors.

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

