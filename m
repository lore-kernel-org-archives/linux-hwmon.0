Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73303C3F62
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 21:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784236916; cv=none; b=VX+WftpdL518zf7/vKW1oHK5vASeCIj3Igjg6J+eyZjM3+cB71HZdyZMClOdr+rdvFXmkkCAq8hmt/BPhq7iu137T32pXII8lJYqT0BH848za06xetlBSaYIKvWaRCRI2D9N5WPJ9ZEBRg5msWvn6i3wxMYpFY5z6U1Syi1TkA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784236916; c=relaxed/simple;
	bh=Xkbry7Ckhih7oUQ+rnPYJWu/qW8xoRySqajhom5hWR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aJpWwvvv5nJ9ODxgS4Ygek9OEYTwLiBUb3HywAqvJ+aRvLL8xjiUISgliTChUR1rSIZQxtirZdh9O8/kXUp68dRqclOfhLZIJuwoVeb0e6O3qQRr+/sLAHyQle4jMeUnV8OeiAcUlKi/grSy7W+1ap2rOo5PYMKRE7Rkh/AKfgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIUaTvrp; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIUaTvrp"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7ff05e5d009so95698307b3.1
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 14:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784236914; x=1784841714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKYB741Vi9+5Td+ttBpzIWdLFHulzs+nfBDpWAYF04A=;
        b=eIUaTvrpcY6ZsEO2DIqCkIFRm60i6qylpdQUZP9j5N4DWz2xofU6x5/A9Ret2r3atA
         DXSmQlDaDAc7hltffggEA5jWumM/f37WY/sLwZHVNxHajL7OsY51570UGGDcMc1pyzq9
         dctUojG5eN74/qTcwT8VawkNCHY+A3YmfiLs7fWyHD8UpFt0KgBOcNDqiMsOeVhDRZ0f
         +r2+uLghhSvMcWzmai7e3W+pKiCn/pfOR2dCrmWUZhBKnagp7EtLlox/WL8tvVVP8i2I
         huKWkyOq+UfMN7C3gdE5tTcnLKaTTTpKlYK9tPn4g7LkASq2+RBMggpkGLrMPlk5XHrq
         UpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784236914; x=1784841714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NKYB741Vi9+5Td+ttBpzIWdLFHulzs+nfBDpWAYF04A=;
        b=BORvVnjots5flNdbWzX6vwoxhf500ofjyZf5DZ5tljS9wfveMY3ZezOr5HXxqc/zVE
         giC/h89JSaDbcdrsRGMGbyHcnUGVeJaET88NMeWa/sksu5w3L7qZ1ffwWXvCRVGlHaEP
         lkkw6Rf638LSPEvnkTxZgKqcvvPT55i6dqi8dsr6+H562+oQ0K1mAnMSBxL+hPMrXYot
         YwM2SHA50eeSkvrwB2kTu3CrkvPWsgJCoNOqgZjQGaezw4ATPurMe+zTA/AzVB7vHQbq
         i/+9BI3VGRllUlUEnla41pVm3v+3rnhue3Wh4yeC7Pm1358foCBHT16AofXvxiDX6rh4
         vzRQ==
X-Gm-Message-State: AOJu0Ywo1YF0irIAurJRTcfkCeMBS4UErG8kBAhkxVz0dJBupcfKO7ii
	bhnj863cCCEwGxqkc6Bbh6YA74NrPpAw0tggLvbLaWl15/0KKNw7U28X
X-Gm-Gg: AfdE7cmvvLpkToPvOsoaxHWaTm4tZSL4DZQdwyHojKToZVUqOx/88GapToQW0Kg9qAN
	0ugOObZXaohqGu9aiyGFMF3g3o5kE4GsroWd+UbaVuKc0NrQJKVBSU5OkmsYSfqhkoHtn+HR/48
	mYTv4iC4E7ECojJRfHSPTHvIWgD5lB8k9K2xIT5lgLeHLufzCJtAM/VN1Wcdg/Fdu4P6S1kBLXl
	2xvmdizpgY3YuLP3VY6D3i7IYSv+q0nqLSowrUG6wfh5RIFJ9A8uNM5KpcG6y3y193XMcsrxw7P
	A8a77QWMMrQsa19lXIst+URr/RCwES2NEUHeDX710Khd4lhmGZDWlZRgyVD2y09XkLooiHcc9+j
	D+dggtiH9YZxxjUufqz9zjuuvWap959ZSRjUm/mtcoipeL8i9ZFxLKK6mOgeEhZtLP3OUc8dAfE
	mDs+UpyzZCiC9ROYp6ihIPugW7Jyo=
X-Received: by 2002:a05:690c:9b0b:b0:81c:ef47:2dd0 with SMTP id 00721157ae682-81ec00c8b00mr90286367b3.49.1784236913517;
        Thu, 16 Jul 2026 14:21:53 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([187.94.103.218])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81eee7fde39sm5026477b3.36.2026.07.16.14.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:21:52 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 16 Jul 2026 18:21:38 -0300
Subject: [PATCH 1/4] dt-bindings: hwmon: add binding for adi,adt7470
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-adt7470_thermalzone-v1-1-cc55ef35edde@gmail.com>
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
In-Reply-To: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, de Luca <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The Analog Devices ADT7470 is a temperature monitor and PWM fan
controller. It supports up to 10 external temperature sensors and
up to 4 PWM fan outputs.

Add the YAML device tree binding documentation for it. This includes
support for the thermal framework by defining the "#cooling-cells"
and "#thermal-sensor-cells" properties.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 .../devicetree/bindings/hwmon/adi,adt7470.yaml     | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
new file mode 100644
index 000000000000..e0c0fdadd1cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/adi,adt7470.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADT7470 hwmon sensor
+
+maintainers:
+  - Luiz Angelo Daros de Luca <luizluca@gmail.com>
+
+description: |
+  The ADT7470 is a temperature monitor and multiple PWM outputs.
+  It supports monitoring up to 10 external temperature sensors and controlling
+  up to four fans.
+
+properties:
+  compatible:
+    const: adi,adt7470
+
+  reg:
+    maxItems: 1
+
+  "#cooling-cells":
+    const: 2
+    description: |
+      Cooling device exposing the 4 PWM channels.
+
+  "#thermal-sensor-cells":
+    const: 1
+    description: |
+      Number of cells required to uniquely identify the temperature sensors.
+      Valid index values are 0 to 9, corresponding to temp1 through temp10.
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
+        hwmon@2f {
+            compatible = "adi,adt7470";
+            reg = <0x2f>;
+            #cooling-cells = <2>;
+            #thermal-sensor-cells = <1>;
+        };
+    };

-- 
2.55.0

