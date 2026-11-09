Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221388;
	b=38s8knkjmq5zshHpZupdqRls0ELa+PNMvGAIPS2JJ9CX/A24JUF89g+V1lXqZIAHgWrC
	 MQ30AtOEAKhdKfFyGtKYu1F9p2fjMPsygRIuiOt/1MCiYFVOYFomrmTdduo3fUSsmvoQx
	 gS6glzajRsztEHw7M9jEe2g9tloVmYwf0wcoIlk5KMBx1s1TOhaL5uT43hAXwzbUatAZF
	 8LwtXs7zCJ1SEHAyt580G0tM5o3f0xdfEgi4UimTPQHTrh+hn0cJHkyOIn1VvtROEaBiH
	 nlRPVQ3NPXkJxTPxlxu2cCtp6LEhPWCOMzWx6xKNeN+Syi53IYtBHXOdfVXg8QGf0Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zNKMNT5jDjx45/qe7hJ3H8U6Y1OTdrZmQFqKaBSTnKk=;
	b=1HdR377K5ezj/9zHMao1fYDcWmVu0UyFdiVH3dEWWZluDjRSCt8H6oEZ0cA8a9p37SSm
	 TrShUxOqPyhAyNuE3f7aD/0S5CmPJ0r0XGNjaKFZY6F8S2Yg+z2dzbTHOt9e9fUCR4Ahl
	 VPlzyyoJcy1v9ZyMzxZHD7qrZkFKGndTnLsDlUiIXoK1WE98XQFW0QvUh8hIWfSIfxLHo
	 pjJbWTchazuTgTbExYFDOrAEn0rgXyn1vdOOmOnB776uW0c1+xc/ODtvFeOvPPIOCBZb7
	 /QiTvTxj8OeaIX23gmmbajZnMSmnsSwRxB6gsS20a1WaNTnRQZKKO9Mm59rX0i6YhNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d3TITIqY;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CE8606A332
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 10:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7CE8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d3TITIqY
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9ae391a05so3714825ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Nov 2026 02:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794221387; x=1794826187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNKMNT5jDjx45/qe7hJ3H8U6Y1OTdrZmQFqKaBSTnKk=;
        b=d3TITIqYEQy2nVPw2nwc3LQqZM4/kzPbuGM44hHPAGvIZFeNP1PUYtBhrYtiGZk2aD
         KAvRce1tF3JXHWqC9dHn7JRr6A4nfBgVAcIEZmrrEtB8JwfNzjNWCETv+AGtA2kJnlS+
         BV+1CPLQwcBl8vg7XDgD3/3aFJlaX892W9xWCtK8oDnivRGcOhOW8yvROkjqjdMITkgH
         BKqq5rDsiEuMwhq8/1EzAjSco3LUB2Nbf+dPtpxSTojqXN2BDmSQRyD8KXML4eOo62lM
         rHGW5+ZO5c3XG37HoOIIHZVD4kpUO8Bfjl9x8UEHpP+lXnTyKnggpXRmmshuqoa/54Cp
         rGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221387; x=1794826187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNKMNT5jDjx45/qe7hJ3H8U6Y1OTdrZmQFqKaBSTnKk=;
        b=P8QKC2qvjYnDkYFW3GZj3wpRuwLCrBusUD9it5MEfdr8iK3vm4jXW49PnoMY2zx1cJ
         hMzDvEYraMiIuZYcYGljPVOAtpGPrzWahPvgwIj2zPhD4vrSeuDQWWXKEiXOEJ/QOvoJ
         9h8ChGwUjm728J0wfcbJx9SYyfwPS6Z3pOnD6WsPpCu2ZYSrsjd0yWc2zPfqEdZ8ZECQ
         fdllajOSaTh9ZIIopTKsh9YGaixPjaCbaJl+/1RFxauFpq8julMNWcWqmf1iXTWcrg/o
         RO/2HWwak9Ra+ClVoChpITYUK5d1mAqk5ESiy4gaNKpCra57kkDhWSn4laoEF/W2tD41
         Kn1Q==
X-Forwarded-Encrypted: i=1; AL+hErFytbhcIHyUujgCzkdvKEXYfe5i1QAVHnyw7RhgTRMUdUb+54LVkZSRBQvsZ0K+jmtng0M6LTTI3UJ4cQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/1av3+zS/R4UWpwkmebsafuK2U4pKwQYEjPt3h9ZLXgZeh1vJx
	EH51EzXLf0u2je/ir5/Svj/IyrENv2yvp4/Tm3RaVpodyOE/rCGFUTO8
X-Gm-Gg: AYBFou2R4J9aSl0xEnco2JPuIrvMCNpXFCu9Va6cS6zEIV6td3MBRHXd5YrdhuOfVac
	P4Ztam5A+uTfkmz35iCqp/EwAY8ELxVVywmD37FJXiHYdMb6QsSkQ9qMMcahYRcXyy81JGeualq
	CF2Yw55j5NxUBMCD2OIFt7Vw/rSK9bYDPKHwmS2f/zSMV0k/q3lgEB1RCf6cHFtIT/QPE39oHG2
	BkW0VGmIg+QDdBrBElAEP/rtC7eEkVkZX/gMygXzqr27b94l3OGAPXV7UaZyMBNDECTvEsKpEwQ
	vDd8rAt2M+jZqSCvNGkG3idiOkA6kgrgqSSD7HcrA3bj9PPKJFe/ppwZG3N7Ns+LD42BI+z+Tu0
	Vl6bhmhUOWjsQpp9WMv/zLdiHC1MSCtQ2QkUE1iuSi0EDSyZJzWKlRTyPyaY71St3qLG6FZeC4H
	gpLhX8DL3JdHNDSs7FiFkiCANBL3gtaOz5mQj3NQjYX/iiBdcA8MMWrmcP+1biETDZEjELG3M/T
	Yc82xoCdG+vRuJEMwCEiYX3I980Ib3jrRhLmNlkODPuTTk3U+WWKHfLKXUdyxVlkze5C7qhquea
	1fEQfpNJ9C/Q4q6HK6VfSAGjkEcEEAXuK7CS3ng+nMFcdNz1Vi7/yOhS8akKqWS9Ws4Fa+MzxhB
	3edxUpRLmTDCS7lZbFCSaXSAGlJQ+a5Tr3STLgvcofoc9/nrAitNUF6ddswGCwa1377Y=
X-Received: by 2002:a17:903:2304:b0:2e4:cc75:2728 with SMTP id d9443c01a7336-2ed837a7559mr29304325ad.36.1794221386941;
        Mon, 09 Nov 2026 02:49:46 -0800 (PST)
Received: from rahuls-x2elite ([152.57.87.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81739d6dsm8602685ad.66.2026.11.09.02.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:49:46 -0800 (PST)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: embedded-controller: Add HP OmniBook 5 16 EC
Date: Mon,  9 Nov 2026 16:19:13 +0530
Message-ID: <20261109104914.1534-2-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261109104914.1534-1-theflyingrahul@gmail.com>
References: <20261109104914.1534-1-theflyingrahul@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OmniBook 5 16 (Snapdragon X2) has an embedded controller on I2C
at address 0x76. It runs the fan and the keyboard backlight and reports
the fan speed and its thermistor temperatures.

Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>
---
 .../hp,omnibook-5-16-bf1xxx-ec.yaml           | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml
new file mode 100644
index 0000000000..be4c845067
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HP OmniBook 5 16 Embedded Controller
+
+maintainers:
+  - Rahul Pon <theflyingrahul@gmail.com>
+
+description:
+  The embedded controller of the HP OmniBook 5 16 (Snapdragon X2), on an
+  I2C bus. It runs the fan and the keyboard backlight and reports the fan
+  speed and its thermistor temperatures. Its four thermistors can serve
+  as thermal sensors, indexed 0 to 3.
+
+properties:
+  compatible:
+    const: hp,omnibook-5-16-bf1xxx-ec
+
+  reg:
+    const: 0x76
+
+  interrupts:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
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
+        embedded-controller@76 {
+            compatible = "hp,omnibook-5-16-bf1xxx-ec";
+            reg = <0x76>;
+            #thermal-sensor-cells = <1>;
+        };
+    };
+...
-- 
2.53.0

