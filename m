Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEEA3AEF5C
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283004; cv=none; b=PkDrQ59tokE0w67JBMUSUcuHZXlGr/anq/uwavhbKJe2c+B/oZJy0a3hy+jOnIeMbOSxtp5k84DnEVPQP4QtSaravKrcaOa7PmBb/z3S6Qm4Cbi6fzlq5KhMNrF40nIS7+JHGQ3DQBGts3c48LTp6MfyqWQdcMxllxo6Dco3BiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283004; c=relaxed/simple;
	bh=MU1UHlCT8FzYV5iBozHmfjiLmGEZw1XWty2n8Ga4oV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TeS4dDxwjdBEY3eyXY/uWgwPMD5hK5tB495UDZre7479LvlS108ej1P0Cm+iLPO7z4XdKPyoaEN/OsqL7nIn9jfKiqZbdE4gC9q8o76BO1CnulNATdD4GIkBhbd5EYdKkp/waPN5hcXoGPrGmOmJUT0pEbFg/XAK83IqdHR7U0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpC46tZ1; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpC46tZ1"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ab39b111b9so13307625ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283003; x=1774887803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GMgGJYslsjygUkgl7Hme70FS0OUcIYfWd+dtwioe89s=;
        b=JpC46tZ1sO3V/E7u+alV/2lzQFnVKps/Wx0H+7OPd5nsYqEKfl4MJnJOAmC3O/BJDE
         XcR8IJJIvcL9jO7hdUFOM8XwjIKpZNOZpHzJcV0G+JO4RTSNcFaD3DOHrqI4N8Hqbr9q
         1U6GoJIbMfk5ARmST4oXxEBPQc7neBe9jxgRFt485cN6m7BqqV5c4acyIELND7GfRKCc
         kPVq9lIJBUJ2ECJYU6ogeVJ4eAzg5CgLcH78fz1W09ZookAWOmo7YMXjsylg1pzvXAcL
         Yd8UXSLXDFEf5GqcJ0G59N1kDQc+0Hs8EgpRig1oAa7FSphD95lSUJRQSUDuQ/c4Zych
         AwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283003; x=1774887803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMgGJYslsjygUkgl7Hme70FS0OUcIYfWd+dtwioe89s=;
        b=lOcs335N8fXuDB1j9MNkSPxuA/ZSoqAruUDBpwzhMRehr17IoxWysTBCEPtJIduF2P
         F7Fi/CIigL+QquUbZ2+Nx57UQIIUG9SaB8NIeGouE3FXMe4GwYMSgyunhZyagCGqEA05
         ssdUcGOq/NSj+m9DVfT7YcEeIkT+KFDfFV51QCkZFQ8atWKje9NbF2d8Ux2WA/8jk0RF
         U/Z4hzSH/cgG+7qO4MsrMkP0Fr175i1iN3GgU+VSNY6olarMHFvpictQ5j1kwV0U/4ei
         9PqX+cYWQxkYpZYR3diTX8Y4Udj5HxpLMiWQ0ri2dlEZ3jCBPzEOOzYL7CypiU4ptU3U
         ypHg==
X-Forwarded-Encrypted: i=1; AJvYcCWwlU+wgzSOlPySvAJO6VjBAF8uFd0lR58NCTHmc1q92kRzvO5yn20DDoOqy863VVdI1P8eXtZmNovidA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF+EWf5tpYmlktp7bgoWzf0wMm/I+9FRR7aTmRmrwdSu3rbSYz
	nfC3XsUsW1i4YmaUMEsLiBptr/x+sW4gvcqstkptqgB3kHLjsrrYkBvyZypDk2RgqGI=
X-Gm-Gg: ATEYQzzCcGnynj/CNbYpRPJW6HENlOTWaxRTbAx30p2hbsr2zhy/3YXNayh9pd1pk/7
	Fmy7Bj6OyCkslWj5pRj+4nq0nhBPDONIqS5ZbiLnhAcTnL/kZjfeYMWF+0h2w+224MSHX9GB332
	xmBb5f1Ted4nT609cEgZ1dYvc6QwtK+xdBuGFcYjWEee6+Ydfzu922r81axnj4GIrSaijnLs7bR
	o9woiOCaIH6158sAY41uVflKnJjKk47jAaORFhtJiYAUvvjV6FKHeSlNQeZob6U/1Y8HxgDdPQf
	/FZ8yR32FLaUDpqDxJmtio71qW07VMm1KBembpVf8rrW6KHZtOwjdzrQd5JHaNGC6h77mnkTYf8
	66JTpwEkngvuwOhnLF65TvSRAEa/5fiEl6WbtOJ3Agdftv9TyAh6xT6RpapxZB770UvoWSf3mN2
	Zdq+vGIer7psMeADKSPA6PWFkOJVrsIWTKzyjkNPUvA90rS16HrRlzITy6Dd6kdK9OcsWAJbtRc
	UugA0C5/w4oHMWzVh55J0zqv2SSFnMA2OJ5iB613g==
X-Received: by 2002:a17:903:1d0:b0:2aa:e3c7:6048 with SMTP id d9443c01a7336-2b0827484ebmr126158735ad.23.1774283002534;
        Mon, 23 Mar 2026 09:23:22 -0700 (PDT)
Received: from lakshay-piplani-HP-Pavilion-Laptop-14-dv0xxx.. ([2401:4900:81e1:cdf2:5b00:592f:5488:918f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516cb9sm118477755ad.2.2026.03.23.09.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:23:22 -0700 (PDT)
From: Anshika Gupta <guptaanshika.ag@gmail.com>
To: linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: lakshaypiplani77@gmail.com,
	Anshika Gupta <guptaanshika.ag@gmail.com>
Subject: [PATCH 1/3] dt-bindings: hwmon: Add support for NXP P3T1084UK temperature sensor
Date: Mon, 23 Mar 2026 21:52:50 +0530
Message-ID: <20260323162252.15508-1-guptaanshika.ag@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The P3T1084UK is an NXP digital temperature sensor compatible with the
Texas Instruments TMP108 register and protocol specification. This patch
extends the existing DT binding for "ti,tmp108" to document the
compatible string for P3T1084UK so that the hwmon TMP108 driver can
bind to this device.

Signed-off-by: Lakshay Piplani <lakshaypiplani77@gmail.com>
Signed-off-by: Anshika Gupta <guptaanshika.ag@gmail.com>
---
 Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
index 9f6c9f6fa561..47714df5aaff 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp108.yaml
@@ -4,20 +4,21 @@
 $id: http://devicetree.org/schemas/hwmon/ti,tmp108.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: TMP108/P3T1035/P3T1085/P3T2030 temperature sensor
+title: TMP108/P3T1035/P3T1084/P3T1085/P3T2030 temperature sensor
 
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 description: |
-  The TMP108 or NXP P3T Family (P3T1035, P3T1085 and P3T2030) is a digital-
+  The TMP108 or NXP P3T Family (P3T1035, P3T1084, P3T1085 and P3T2030) is a digital-
   output temperature sensor with a dynamically-programmable limit window,
   and under- and over-temperature alert functions.
 
-  NXP P3T Family (P3T1035, P3T1085 and P3T2030) supports I3C.
+  NXP P3T Family (P3T1035, P3T1084, P3T1085 and P3T2030) supports I3C.
 
   Datasheets:
     https://www.ti.com/product/TMP108
+    https://www.nxp.com/docs/en/data-sheet/P3T1084UK.pdf
     https://www.nxp.com/docs/en/data-sheet/P3T1085UK.pdf
     https://www.nxp.com/docs/en/data-sheet/P3T1035XUK_P3T2030XUK.pdf
 
@@ -28,6 +29,7 @@ properties:
           - const: nxp,p3t2030
           - const: nxp,p3t1035
       - const: nxp,p3t1035
+      - const: nxp,p3t1084
       - const: nxp,p3t1085
       - const: ti,tmp108
 
-- 
2.34.1

