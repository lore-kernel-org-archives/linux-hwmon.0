Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A737F3AA4EB
	for <linux-hwmon@vger.kernel.org>; Wed,  3 Jun 2026 14:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495858; cv=none; b=C+e0IARnBIJfNjhC4W2+NBHdYidoTsaanu+hHC/RouU3EGcNNzzsIXE8fKo6jJJybfQ4Q1U93tmQzCxKxSZ9Fzn8pRVa8c9ul+JwMXiaB+st4LLmjwTQCvNXwRtJiZNfHeCcp6XwyhI+BVD4m20gFyca2ByLmezTTmK071azy30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495858; c=relaxed/simple;
	bh=CGFF+18t2BhBOdyiWzPFWns80o+l2buwNiedN7HApsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FevJhkT7VpbO+gwOYrRoCW+2ox6rBtMiMNDJ6hMYKazkcPMZPT53MoIIxx5/WS8E0YZ21EImdWEeo5mBpHoQqdOKMsG5PZQN6NIggY/OIBTcBDyw6bXN6HhB+GsCGo1DcQN7HSaHgm83ohBWRjlk6Ip67Hc78qMu4DeEZPHDWIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+hDu9ja; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+hDu9ja"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so4244169f8f.0
        for <linux-hwmon@vger.kernel.org>; Wed, 03 Jun 2026 07:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780495854; x=1781100654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmuRKl9fxrcF6ArlWkpcPVYc+ox+WNl3WD2EPf+Twng=;
        b=j+hDu9jawN7jluH59UMi2n8JXBCcETONR/kwacZo1q+01NNxjxbjQGB7JZebzkuIBN
         wCYX2eX6QfUrl0evIHyNEsbHMMbTgRTGbQu3eEprLNkOyGVlQwv7t3z43I+z5qfo+2W5
         Aaw6RJsv5nAfgo+72Iu8mIFHWrvdQbGrzYvclnfWjvtBNRziIehybTs3B8Kbs+KlM5np
         hgFBs71JQcik6Lu9vlK5+Dzp2xiXC6ud4fwmc4+nTkrq0vW2oMGsidiI8LZ8yrk0X4Bz
         y+B5MOxQIR/WDxuhvW/wAY3ZOxydpZnb7W3hp0bdzh8YHjJs7E6VlGYYM9c7h1IeptTa
         dacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495854; x=1781100654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FmuRKl9fxrcF6ArlWkpcPVYc+ox+WNl3WD2EPf+Twng=;
        b=S9fWN9Wty91/8vr+5YFCMNUWh43TJiC4qM6zXo3cEZs3BUQAl7rmXcJlt53TIlOuhd
         a1qNbSlrHCByyXlGi6Rkkk87hccVtDZxshdJEXGBKRxrTnfrgQT3Vzf472W63Lekkdy2
         YaB/RCzp7QvWmpzGflUB0TGDVVpBPupqSODABQ6GHL4NfokohZEdy5lOw7tfAT/pdM8x
         vz4sSpx75Ne78ROOCj0zoT/Mj/dqLfOZq11bzn0s9Z6VewoUeDZ58/SFhz++h7qf/e5y
         RKxChzB/etKHLs4aatBfcJKkGuVmiOVn7sJofhFZcZ1dTmDZLtzLCCTbHCC1NOu8dCyR
         7YuQ==
X-Gm-Message-State: AOJu0YzIX/YRs01+2729kZdQM4saDy01Yg1QLgKOMbK6rngM4ZOSnG2/
	x+XBC3qR1MJFtTG0lUyYh+KF/4KhOpMoVNMK4Mvl4PMsBYx5ILT520KlpvYT3Q==
X-Gm-Gg: Acq92OHC/stZC4TOkAgaFNHFcQl1FzUMrKNQOqVdnDEi0OE4iMKifCPscvg1EIkkeaD
	8VkNL7je7AogguWiWnGuneOZ1dXGGX2qwf+uQsq7UgCOIl5FctY9IOfyfhQhxzHlvEzHzJfejJj
	jFIMzbt1Y9x/YCflWPmM+OXqTC8JCaRFtbhLoix7Fo9pgPub0gmlCu35BqKMgnRr5jl8we1SdlN
	v/t+oP2fx/tb3i5AL1aPZnAHm+UzjEVaHvmJOBQk5yQDiJVQXIvwlrbhB8tAprTu7OcdnhsBtQp
	ymoqoo+Ebf2DGOiPQt4sxhSe4dfaEyOTmUYWVTXu+2oNsPUTMHJG45s4j9C+T1GWftbHLz6TKkK
	rDgZj6iByxGQjpgleo3YSQRx/z2xOhKkqj6mmwNm0lCEWpadwLj9AtdmP9ikm9N5pmP48CDjIXO
	S81kJodhirEW5lm329gL5RlI4=
X-Received: by 2002:a05:6000:4694:b0:454:35b9:803 with SMTP id ffacd0b85a97d-4602184cademr3759686f8f.30.1780495853866;
        Wed, 03 Jun 2026 07:10:53 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm7217131f8f.2.2026.06.03.07.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:10:53 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: hwmon: lm90: Document SMSC EMC1402/1403/1404/1428
Date: Wed,  3 Jun 2026 17:10:31 +0300
Message-ID: <20260603141033.111300-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603141033.111300-1-clamor95@gmail.com>
References: <20260603141033.111300-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document SMSC (now Microchip) EMC1402/1403/1404/1428 thermal sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/hwmon/national,lm90.yaml         | 109 +++++++++++++-----
 1 file changed, 77 insertions(+), 32 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
index 164068ba069d..a1de96e0b87f 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
@@ -12,38 +12,67 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - adi,adm1032
-      - adi,adt7461
-      - adi,adt7461a
-      - adi,adt7481
-      - dallas,max6646
-      - dallas,max6647
-      - dallas,max6649
-      - dallas,max6654
-      - dallas,max6657
-      - dallas,max6658
-      - dallas,max6659
-      - dallas,max6680
-      - dallas,max6681
-      - dallas,max6695
-      - dallas,max6696
-      - gmt,g781
-      - national,lm86
-      - national,lm89
-      - national,lm90
-      - national,lm99
-      - nuvoton,nct7716
-      - nuvoton,nct7717
-      - nuvoton,nct7718
-      - nxp,sa56004
-      - onnn,nct72
-      - onnn,nct214
-      - onnn,nct218
-      - onnn,nct1008
-      - ti,tmp451
-      - ti,tmp461
-      - winbond,w83l771
+    oneOf:
+      - enum:
+          - adi,adm1032
+          - adi,adt7461
+          - adi,adt7461a
+          - adi,adt7481
+          - dallas,max6646
+          - dallas,max6647
+          - dallas,max6649
+          - dallas,max6654
+          - dallas,max6657
+          - dallas,max6658
+          - dallas,max6659
+          - dallas,max6680
+          - dallas,max6681
+          - dallas,max6695
+          - dallas,max6696
+          - gmt,g781
+          - national,lm86
+          - national,lm89
+          - national,lm90
+          - national,lm99
+          - nuvoton,nct7716
+          - nuvoton,nct7717
+          - nuvoton,nct7718
+          - nxp,sa56004
+          - onnn,nct72
+          - onnn,nct214
+          - onnn,nct218
+          - onnn,nct1008
+          - smsc,emc1402
+          - smsc,emc1403
+          - smsc,emc1404
+          - smsc,emc1428
+          - ti,tmp451
+          - ti,tmp461
+          - winbond,w83l771
+
+      - items:
+          - enum:
+              - smsc,emc1412
+              - smsc,emc1422
+              - smsc,emc1442
+          - const: smsc,emc1402
+
+      - items:
+          - enum:
+              - smsc,emc1413
+              - smsc,emc1423
+          - const: smsc,emc1403
+
+      - items:
+          - enum:
+              - smsc,emc1414
+              - smsc,emc1424
+          - const: smsc,emc1404
+
+      - items:
+          - enum:
+              - smsc,emc1438
+          - const: smsc,emc1428
 
   interrupts:
     items:
@@ -169,6 +198,7 @@ allOf:
               - national,lm99
               - nuvoton,nct7718
               - nxp,sa56004
+              - smsc,emc1428
               - winbond,w83l771
     then:
       patternProperties:
@@ -191,6 +221,21 @@ allOf:
             temperature-offset-millicelsius:
               maximum: 127937
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - smsc,emc1402
+              - smsc,emc1403
+              - smsc,emc1404
+    then:
+      patternProperties:
+        "^channel@([0-2])$":
+          properties:
+            temperature-offset-millicelsius:
+              maximum: 255875
+
 additionalProperties: false
 
 examples:
-- 
2.53.0

