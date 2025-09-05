Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95252C3248;
	Fri,  5 Sep 2025 20:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104947; cv=none; b=Yt7paPZK2E+A8w23zNwgCkaT3GYLnJkCSYPtCR62bTunOQKRat5o9OVWTk2nHMu8d+z32ONb4jkK/vzpgzghEg/CX2tOKh/ywBNifMzPgGgt8UJxGBn9LpU7RZA+EtH4av2RQvKedfDje5nmmW5cbLZqKX3rMT0iqbBXT25xXPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104947; c=relaxed/simple;
	bh=RdvwpH3P0UQa/xcJvCNAF0Bhn0Y6iqjZvTmQS02LIHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SWJ3+Zey7chVLp6G4EIKqXiVxK3E1y0tSqi7Q5mFKNstXnKkZIltxtmOPSrtOLOmCWRlHSzg7P/mKHMmUA990dn4bPhhjVw1O4tMiouxU3wD45nYBuIPKozovwnnO922SMkCQ4IcTNN9tAlGR8wcRyN//IB8mCTE/YWY1yUOmJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eR+U9mxm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eR+U9mxm"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-24cdd95c422so12799535ad.0;
        Fri, 05 Sep 2025 13:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757104945; x=1757709745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2BE9u3wM9hWmj+qX/TjqOm1as26MeFuo9hOZ8//b+w=;
        b=eR+U9mxmnep88oJkAO1cXdczkRrXjjr2NCr0getDspLCWooPvaiviMvYkIYiQReQ3D
         hB+kP9vE++P1r+AJmoehCUvcxtp7QsPgefXa4rsJNAgEY0RG9LdBjwVvISkRiarI9UB/
         1uRRLdAxqltr1lG312ewloxRefSw3SBtINo2fp2upyeLj9yMXJkhzG9/az7Z2k7Ai9hc
         fEptGcbEtsLAU2Y675fAFV55DdG4r2uiGVYTzo1+uJ1ESCIrgn+rDWHdWaeXC0J/Thu7
         HKcrVc1XS3vpVhzMmOKkrO8lUsTr0By/uy8QTxHC9ayI8jZLno9oaHzSdvV6pL8l6+EQ
         6TXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757104945; x=1757709745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U2BE9u3wM9hWmj+qX/TjqOm1as26MeFuo9hOZ8//b+w=;
        b=sWrCd+yJDiPliKqwm9GafwWPfsJV3tuJXLJjUjtvVxzvE/Bz9jpCKMYIOBNplJiEe0
         f7eNNLXN7Itfw2Nh6HBBmJt29RjRa0IAqL6NtbNYHRdrlaZLbvC7cTRRwiAgBD2GmGbn
         eglIo1PzOVjW91cqb4FJJnB9zZCvrPXk4HNNZoJs/wQUT+bhaCOZMfmlCkZw+u/l7Ct4
         rU0/07ifCWq+PWL5i4z6m1eIQDabdTT4th8Aw+Uf1cJi7SWrqTV06k0V5cdF+0SX16bY
         pa4zovGJBk5mUmxBIfa1T65Kd4ij+nUtZpvVAMjTKb4JoN5l2MygxHOPC3tJ8hwTSm7t
         hTHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaKuxJzT9SUnLHpBufZn0Nun2MSIabYtn6/PLrpX8AYYrlbBGL7m7vtfD9JQgGCKYGUP/raEbzlSVo@vger.kernel.org
X-Gm-Message-State: AOJu0YxXdWtR5s8jpD81J/m0t++kiCpRJhuBqr21UszThop2q3fUhUGC
	4o2MrokJlPmhJcUToNDVXKTH0O6Mtt21YpFPBaHmd5XFnGiFekULmDfz7KtMWWB8
X-Gm-Gg: ASbGncvfHAZeMj/HzKfll6nhcUj8YWyyyDRyR6HUpoFiIvJ7kDJ2g3rnQVwJyzCJscN
	Wkq0mtaAL14A37YHizzjElLN0V4eVXvFijF595TwJxs1Rgk5W6o1x9G24pwbdqqBA0HISRQ7ool
	4KYVFmHd67XXg3uZsHm/BHTSv030UOJdhASJ4KiWlY++y2Uny2XVUlp0MU6mwtjx8PUXH4d7H95
	RmkIEgjjajrGAeeLRoMQ10G148eEfH5VKGeUfvfNxSQ+tgLe/ZXxoQARAdZduIdiqFgVMKXiLiu
	/K/1d7tqQgIBM2sasFT7IAl/IsD6I/bqVn0p2Dh/hZPGKFPLXwwW9NJUbUCUWyn9/aV7HA1c66q
	n3KqCSAD4kFNRhDhJFuvneDf9jm7JHaJTro8=
X-Google-Smtp-Source: AGHT+IG6ms4GO+Lh5nOe2z4WYUdj4y5ybz0w+W7/kEqToGPkU7g2BIDCYFWZcZkIK12AeDLVRz7a6A==
X-Received: by 2002:a17:903:2c0f:b0:24b:26c5:6759 with SMTP id d9443c01a7336-2516e884e6fmr420365ad.13.1757104944686;
        Fri, 05 Sep 2025 13:42:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24e6aa6a268sm17829755ad.45.2025.09.05.13.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 13:42:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Christian Kahr <christian.kahr@sie.at>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 16/17] dt-bindings: hwmon: ti,ina2xx: Add INA700
Date: Fri,  5 Sep 2025 13:41:58 -0700
Message-ID: <20250905204159.2618403-17-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250905204159.2618403-1-linux@roeck-us.net>
References: <20250905204159.2618403-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible string for INA700. The chip is register compatible with
INA780 but implements different ADC ranges and thus needs a separate
compatible entry.

Cc: Christian Kahr <christian.kahr@sie.at>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index 8b491be9c49d..d3cde8936686 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -32,6 +32,7 @@ properties:
       - ti,ina237
       - ti,ina238
       - ti,ina260
+      - ti,ina700
       - ti,ina780
 
   reg:
@@ -115,6 +116,7 @@ allOf:
               - ti,ina237
               - ti,ina238
               - ti,ina260
+              - ti,ina700
               - ti,ina780
     then:
       properties:
@@ -133,6 +135,7 @@ allOf:
               - ti,ina230
               - ti,ina231
               - ti,ina260
+              - ti,ina700
               - ti,ina780
     then:
       properties:
@@ -143,6 +146,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - ti,ina700
               - ti,ina780
     then:
       properties:
-- 
2.45.2

