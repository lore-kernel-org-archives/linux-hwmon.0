Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A2917753
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Feb 2024 07:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708070155; cv=none; b=eYPM8JnFUuloPsz2WCoBaPDzUFjNUY3Var3Bhj1qS9KgIup20z3gzBARhABIZ1mxoFATbIND2amfv77geHEmKZ5cZOI+GvR4sDl7Cp0OiIejuWimDqdTGupdr+YBPvUX4QukQc8w8MuVJlDeQRQcn4PUJjHz4ln3hG1Gh72EQBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708070155; c=relaxed/simple;
	bh=p92qClcpEb5JX/EeaVZ/9X9wSdFmQ4Oo0VeBW6x2QZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Os5PDhRM8jmE+9SKwEqqNpa1T1xPRHMyx/oB2+LJ62b6PuZeM/CcE01I4T0t34GEKzAbvgyMXBuqclMim33DVxzhmGJHfjsBlhAut2ng8m6VrpACAh+vUffRgYvB2sehzm4jJVLsz5JmO6rnivhbR3T3JnhBD9vaVc5MKeEyzLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A0NxhxKU; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A0NxhxKU"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55ee686b5d5so515758a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Feb 2024 23:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708070152; x=1708674952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOT0jdNXZvIhcM5Ie5HqkhIcQqrl3AOpRJW0bZ4tw64=;
        b=A0NxhxKUIJXOioB9zh389SIqoOo7tJmMNZdTEF7upifsMTn4JvKYMjSrmknPt0Hfwn
         dx2qZKMPzXHz/J5GKCAfZu2L0kRxvugTA7wcUUD+WVGuDoExP0YTDMW9D/G9IDfLTIf/
         T7aXPGayKy9fNQFd2mRMoQ5jYKnKDn73q9V3lTN7vRVsjiEykPyDm+m4OZa09SFyEWqD
         /3Ic76isUt3kW7fYStB4SHhT7/QTpGx9z9wBuEkraCmuUzRPx8hoJuGOVvUikuS7+6Ob
         MpU8rnh6+5MhHV6TBupWpaxPwnPNF/pL1M7YaD7uTjFyLmnjBrACo2t41Yd/AgsVFy9H
         DzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708070152; x=1708674952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOT0jdNXZvIhcM5Ie5HqkhIcQqrl3AOpRJW0bZ4tw64=;
        b=CyXFlNYxkzGR1Z22j30Mrc6HjPJuQx0sx6P8l7bC7xHpznDSXC6DsimKred2mgU8YT
         bbKpUSbYSRQmt+t1Za2gLUNwSc5oh3hJve+UJkWo5loHiuUvcZfU7MJsH1U73yPaDJ8p
         jRNFU04lAia+6UqhPIf9RrYGIm1h/zRzkdDa5M/BlSvSE+o6hB9SwC0zJEDeQbIvXRzk
         S8VHnIDNtnKrtrEmb/WJQsB8AXHGfN2AWmXMolNHMiqolXIBhtaFTHzwq83BjhHj+etj
         2V5zUzqvD3Su6a94dnBrASzwnVTZ1VPXfIYwcJCJtH32TRLe+HOM5+Kl//5d/1I45Buq
         zmfA==
X-Gm-Message-State: AOJu0YwgVbB8T76+T9rDuPgmQvGQD9Tu9OHxOgyCehakwXvrpV3Nub+/
	lguYnriWg/yXSqysY9RWGq8DgfZxrM6igv+NWm7JLtdIomvX8Qux8AzVrC3maKWDFlWvcxZYtjL
	6
X-Google-Smtp-Source: AGHT+IGi4VoANB7n0/XvKMPIaGqywZZxiiFZxGd8mDSeCQE15ATfDTvlu8TLFahHYfmOlwQMypxqbg==
X-Received: by 2002:a17:906:228a:b0:a3d:eb7b:8eed with SMTP id p10-20020a170906228a00b00a3deb7b8eedmr344882eja.34.1708070151938;
        Thu, 15 Feb 2024 23:55:51 -0800 (PST)
Received: from [127.0.1.1] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id f23-20020a170906561700b00a3d828c54f1sm1300750ejq.135.2024.02.15.23.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 23:55:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Feb 2024 08:55:46 +0100
Subject: [PATCH 1/2] dt-bindings: hwmon: add common properties with label
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-dt-bindings-hwmon-common-v1-1-3c2c24ff1260@linaro.org>
References: <20240216-dt-bindings-hwmon-common-v1-0-3c2c24ff1260@linaro.org>
In-Reply-To: <20240216-dt-bindings-hwmon-common-v1-0-3c2c24ff1260@linaro.org>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=p92qClcpEb5JX/EeaVZ/9X9wSdFmQ4Oo0VeBW6x2QZw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBlzxUD6KwcK+jdwBtKcEhhuA3k2bq1sDN+vKWPS
 0iHA9vMDj2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZc8VAwAKCRDBN2bmhouD
 19OYD/0QRb1MW5XOXDS4h5j6vJ5EIr3ySyJMAAbL3LbvZQ7ec5uZo9aMM4pqgMCco0flfVeTRAS
 RpmhCu0HLBRvln8Vysa/BnADSpE1DmnGY2C3MaZh4IYR+jPWK0E1myQJaC4rPSUKfWCQHmKtVIA
 rdK3kx5SfrAyoR5/eAWLbCdYMxjssQpT2OauZbHIRksFaXzVjaaOO/fjYqcSbIqaVeDCQ/2cPbU
 v009TaEe4w9G/iothr1M9KLv9EXe0+bsFd7fQJpEuakMS/GIU97VXohbA3pWnd18fcQUnKqLPKQ
 E24O1HA1ShkUXz9cDYYfmB7OP2Iel/qyUOYRAysCH8g4CusPaN8XTQabvqCF6hh5TppRQMiC3Ej
 Hinsk34iBg6wa5ZIL+/DSRbp4wGfh1PaJxNjxoEEyGlag7KuXKg9tK4IlqwjY9no7MwhA2oiY2z
 Ihdmz6c7ud2do5827Jo8nw9xeIPsaX/5kpLPu4bA3dyQF2Kr+QEiGk/R3BXAwkYZvUG763Pejtm
 8LURenFrypB7FlifLxq5e9Kno05bnJQeu71GBqV/r9sIOqD+B/YIOuyINqaXQ8HYgwOxUyn6O8x
 Ne0l4le1mnxyKRMjBMWu0uM8n9lW3SydxRxP3YN8+g8KhCQ+BrWtca5L/F13PI/zxy0oCxZu9IV
 fyexQKfDkCUQQhw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Linux hwmon core code parses "label" property for each device, so add a
common schema for that.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/hwmon/hwmon-common.yaml          | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/hwmon-common.yaml b/Documentation/devicetree/bindings/hwmon/hwmon-common.yaml
new file mode 100644
index 000000000000..d83f4180f622
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/hwmon-common.yaml
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/hwmon-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hardware Monitoring Devices Common Properties
+
+maintainers:
+  - Guenter Roeck <linux@roeck-us.net>
+
+properties:
+  label:
+    description: A descriptive name for this device.
+
+additionalProperties: true

-- 
2.34.1

