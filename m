Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3564397923
	for <linux-hwmon@vger.kernel.org>; Wed, 26 Aug 2026 18:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787770095; cv=none; b=fQIMmzN1XQ6x7YEs5tOFxsUPMq7E2vefRos7HMBuZ1SUdS1epDe3CCzn8bXVK1uMid5tzf65lsWTAgS0+YJXmj4wIGQjg/PidHrHJs3MwwrZtOgsK1n22uSgCArPoLYfzGWm9kTuVgns+q6httCXaPHLkNGifXizUzhKyFKI8qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787770095; c=relaxed/simple;
	bh=OctojdIU8m+qvpily36Kzj0/g3R7pymJgNJ0NOynGkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lr2Elfi/jsS6LHUGFCBq8VQwonRA7u+Ihc8w7HI9Jt4CIKHNn/6sV99mG3oeundUuA8EVZGHqcOOlAQSjXpPFABS5KrbZAr6pJYvIQJFWWJ1IUvUM33HibDpdDik+E+B58qQZEhrcVpuRkmElGkIGdlh6zXNQ8s2neWoUP4p4qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSFy9KAF; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSFy9KAF"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1670dad7a8so221167966b.3
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Aug 2026 11:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787770076; x=1788374876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFyM3Fwec1jl9XCBpJd4z0243DKYa3L7/AD6Vvzau7o=;
        b=CSFy9KAFNMMDVxB7yo3QE4dFidASejrwM9iW2XMa9gcPajEsuEW1WZV982eF1p9duF
         CCTVni/vuKwHLLhlARoz8bW9acM7HG3UJe68ZjoDV+yXE6Yya6I6p3jbovd38wS65/q/
         iE5Qgq/4/npsm37d9HZcS2P1VIwiSuaMazsdk9brEPvLHWpR32Ejd6uOxUCdQOA2bOlz
         YcLb5PF6AmZlhgIoZTa2N09x+1K9q9XOdPH+xp+YBNejBvkTnyzXlM9k9BmXHCQAGQDY
         BRGrXsZDkDj/h/FOChgKEykwI8K4l2VSoxT+8au+UnZtPQbHmJ3hCHBAB83Y/PRW3AV2
         2/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787770076; x=1788374876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eFyM3Fwec1jl9XCBpJd4z0243DKYa3L7/AD6Vvzau7o=;
        b=qiCp9m5LpvnmoMz1HbEKKNDFUNUR5TYstvuXWm+zRge/IvHgjubsWsdnh3E6WoaQCo
         qSPwxhczC0fV8dEQXGjPHToMjTslbHecxmp7h/9YjuOeqSjboUgbTvmbqGS3/xyCimA5
         z30izPcs+6xsWp2zOCcNMAjnGJdNFSFUiKAX6ESCsllsT8FXTbeZ8IIZokhrJLe2fQ7Z
         kLzzilGiDf0+Q8eYZQ0Z5AlLeoYxiBlDSqafg+3HZ1yJg2bwLGlsh6YPMA8a+EboDNEU
         wer1rY+8i9oTHHXb0qLwouuhI7+aOYadDazmzgc8y0PcmbhFQV6LhDLKuzKaCLhhPMAf
         xDCg==
X-Forwarded-Encrypted: i=1; AHgh+RqPfpYwmypjG8nD8+caJIGQj60yc70WfFtFdjiBn4dEBUrqDBxztEXgrrxlMPcZ9n7/5UCVNAtKTG+R3g==@vger.kernel.org
X-Gm-Message-State: AFuF++nl7TUJGa6W9Z7kUVMJz2CdqsC5nMpwPiBSClSbSVxifz92zc8O
	hPLXks6wKRiqmAEzM1Bp80yOJ/CnMnBXjNZZkp/x51KMoyo1OOFh2QoU
X-Gm-Gg: AR+sD11FGaMf94R1S5ggLpxbCEiWQzg/Up4CV/yfsJUsmaG4XndErUkVqMBErzwIVNN
	KZSBdq1kriss9q5rZ1NOZPc9R8bZHZeE9DJfXParC9mESCuwwtJbATspWM2poGowvrpoKvEz7aj
	jwl3Ejk5iQWoU3Et5cmqQQ07Wt15JT6OGJ3vmLbKgeqKIAG5XyrrR3e94nn2oK2YE704Qm/Sl79
	VGTnVeMjMztTTH/BiICqLQgYVqkltoe6avmXCOXdXjLGmiK+UJ/pNJpTCDHObiz/9swp3Uq+kls
	Kxbb8gb+X1dyqDwnunvJzTggnni5ZAyasy0jXCfZKVRtyuDg1wDIUFLwlr8hjn2FGXhfbauvZ0o
	bBDNBTAZzLFPJ4nrlFaS4ez8EnLXBJQn8aJ9RZGfAjkLLHhKPWAJ8Rlw64RZ3RBEEEzfVDDvi7A
	TVzCVZtx7qVeyKGWJDmeHi1XS7ydjY9UKBODeNPQ5S7WZBplpJcCWwXAjBNwKSJAYh7YQnllb5i
	HvmqRrmHrenlQRXp4Enng3kF84Ja4Ji3IL3WQ==
X-Received: by 2002:a17:907:e915:b0:c21:6f8c:2335 with SMTP id a640c23a62f3a-c250c391e16mr1061278566b.16.1787770075996;
        Wed, 26 Aug 2026 11:47:55 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.67.216])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2533945d0esm114523366b.9.2026.08.26.11.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:47:55 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: hwmon: national,lm90: Fix channel constraints for temperature offset
Date: Wed, 26 Aug 2026 21:47:48 +0300
Message-ID: <20260826184750.4798-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826184750.4798-1-flaviu.nistor@gmail.com>
References: <20260826184750.4798-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Limit temperature-offset-millicelsius to remote channels only, since
channel 0 is local and this property does not apply to it.
Channel 2 is only valid on devices with two remote sensors, so reject
channel 2 for compatibles that do not support a second remote channel.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
Changes in v2:
- Use else statement in if/then block as suggested by Conor Dooley. 
- Link to v1: https://lore.kernel.org/all/20260824183900.8983-2-flaviu.nistor@gmail.com/

 .../bindings/hwmon/national,lm90.yaml         | 28 +++++++++++++++++--
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
index 164068ba069d..a8b2a24501b3 100644
--- a/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
+++ b/Documentation/devicetree/bindings/hwmon/national,lm90.yaml
@@ -113,6 +113,23 @@ allOf:
       properties:
         ti,extended-range-enable: false
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - adi,adt7481
+                - dallas,max6695
+                - dallas,max6696
+    then:
+      patternProperties:
+        "^channel@[0-1]$":
+          properties:
+            reg:
+              enum: [0, 1]
+        "channel@2": false
+
   - if:
       properties:
         compatible:
@@ -134,6 +151,11 @@ allOf:
         "^channel@([0-2])$":
           properties:
             temperature-offset-millicelsius: false
+    else:
+      patternProperties:
+        "channel@0":
+          properties:
+            temperature-offset-millicelsius: false
 
   - if:
       properties:
@@ -149,7 +171,7 @@ allOf:
               - onnn,nct1008
     then:
       patternProperties:
-        "^channel@([0-2])$":
+        "^channel@([1-2])$":
           properties:
             temperature-offset-millicelsius:
               maximum: 127750
@@ -172,7 +194,7 @@ allOf:
               - winbond,w83l771
     then:
       patternProperties:
-        "^channel@([0-2])$":
+        "^channel@([1-2])$":
           properties:
             temperature-offset-millicelsius:
               maximum: 127875
@@ -186,7 +208,7 @@ allOf:
               - ti,tmp461
     then:
       patternProperties:
-        "^channel@([0-2])$":
+        "^channel@([1-2])$":
           properties:
             temperature-offset-millicelsius:
               maximum: 127937
-- 
2.34.1

