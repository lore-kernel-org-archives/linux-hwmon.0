Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8537A48E0D0
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 08:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720877; cv=none; b=kOQD8PzMDvXxPdTZf1KA13dqwhdota1+hyu6Jik61QsMqz9DCFJHzfABUSwB0dfdrbFKimhs3ifXoJGundeSkH0W7THa5P1TOUWUxO8fhRQDiF3h6xlCOkBKF0xOklSJO2L01je5wwiOB6Z6tYmLvii98nB9DhEvnfHjvKH2iCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720877; c=relaxed/simple;
	bh=wrkRKuHru9tDnAksOKICjvX2eXVZPnIV0pkf0wg10Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uc1Wg7BQ9ZS3yzGTK0487Dyi1WGBeYvu5MzuBhAvK0RB6rieV2ALURoP05fxcSM+/fBCB/kCfGLJ4xNdWul0myjkghtFq0fbhvjltOMfyPSWRCSSCSp9jgbY0sLYf45ZOMeXJOomc52tSKTFUhki7G7ZEaObOaM9gVbMcr+fQwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hg/jOWHP; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hg/jOWHP"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so434860a91.0
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 01:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789720876; x=1790325676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GxDmGUi2C59ZkDrEBuMyQkkkrDWgX+iuYFMfWFNId3U=;
        b=hg/jOWHPlkv4fYETiJx+uSqvxJOYvUBk8L3ZNm0Qm5jVa3Az7SxZnV018vVEMxB9vk
         qmY6gQqU6WWpy/qd9DpKsIAUBhSwkNh7vhDGrYwnbLrgePitxgPFib29lbHjt3eULWV1
         +LQHOatYT1wcTLM+6koOOlssHLx8+bqr5y/Zy0KF5jhg7KuI9m15V+01svN/9YNIyw83
         +efVVmQZsXGo53yXtSjzta4kt7Sjz9tis6kGfcechcKLgofgxOsvjC9ygIHpnfk3PCKv
         lwZekC4mEpq6Wc1uTqMmhzG+NDBX9kDuGPbJSxvJsVzzVSh1K02BgWyhYNnq2LElZEfw
         SZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720876; x=1790325676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GxDmGUi2C59ZkDrEBuMyQkkkrDWgX+iuYFMfWFNId3U=;
        b=j6pJYQMVoAofJLazsnGQHFJnGXjGcgyebp1Cm891vC5I6DeYuCeG+8P51+wwuRjMXV
         GWw1NpK9lU+4ZLtYKVjJHcv6+lFfJKe+9uTCtXbARdvO+wTpNxXzc0NoVdgEYojl/FIf
         8C4JiBzUm+3S8z/spFzTiMCeN1XHbeHLCfF6BF4//BRrIeC42OFkmssyt2PP1Tq2UWeB
         qYFe5okE5VQjP3wBzOH77m2MH1iMC+es0CzDhjwuFq/IFqdUywDGYad2E2Uulen74V3H
         7bMcXy+2jrsLpzkzedz5e/5yPdnJ2vZuQpf/Zd2rXZkpvgdrVp3sIve+wzypa8wo2L7n
         uDcw==
X-Forwarded-Encrypted: i=1; AKwUvBz9W4nouKXED4vQLCGd3oJlWtgf47TEiFjK87mkmzoZWVsiHIQJdg3ST7bVNW7FPdWV7LZAk14yOX2LrA==@vger.kernel.org
X-Gm-Message-State: AFuF++nkB51AwEeSXZ+ev1QOrMyWAJYhQU+XJD3SzC5Ei5evOorNIS0Y
	TGRSorkIi3IPFHBHMMNbPmdknYMbL0+hn6M77ReE65znqspnKxd4gagW
X-Gm-Gg: AYBFou2mJw1gav1srjUZWi8Eoi7+Wt2/EEYeQVIavuze0jFQUlXfQmN7s5rLLhHFrH1
	R2o9PVzi6AKta/5skj7TktYMSuzeldcDqvjzD3GDdVy36ckDPsE7dPCXHvIuy3VTLOkJAOsryjx
	0HdKq3bUxT3NK9KXlqUlJXPFvodEnKiFMmPIYQHAw0R6kJ7u8wj5BpvNl4kAtBMHvPWZxLWwg4u
	dQgswy8w6P9g8og3HjADQcfHllCffsV0Hq4bCVvuH7Cv0aZrir1d2n3bHh+J8o0JJYkNFBbF2Hd
	Ari2vTSCWH9xwOCBTKT3aAV5ZuUYyrRu6fUzV+WGUF0aXA7q6dyOlzJ2ftrTVlFaxyQqbrdJ3Rf
	6bmNPofA/B6CxZzZqcDkqoiJSt6lQSAObo5MxRADnVcoVt3kD6AN1sU2LDPBjoUqwBpcqtyIUlK
	l3r/+Jap4feC1PvNyMcdxQWCyUVkJrfcUQ3GWNL+OxMJhivJbmJb3WchKlTa0yHuBv8oBhWYwPR
	pAviQYnje4PL/9n7L61KqtQGaMfjtqBsoXuagoQ6mGANhjDTY3SHIP8tpjjdzOGs/+4Yexw750T
	Yw==
X-Received: by 2002:a17:90b:574e:b0:39e:1fb6:9659 with SMTP id 98e67ed59e1d1-39e54f0772fmr4397778a91.22.1789720875692;
        Fri, 18 Sep 2026 01:41:15 -0700 (PDT)
Received: from cs00-MS-7C09.. (2001-b400-e35f-d966-bfea-f724-5ada-7374.emome-ip6.hinet.net. [2001:b400:e35f:d966:bfea:f724:5ada:7374])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5a50d332sm2093716a91.9.2026.09.18.01.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 01:41:15 -0700 (PDT)
From: hsyemail2@gmail.com
X-Google-Original-From: syhuang3@nuvoton.com
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Sheng-Yuan Huang <syhuang3@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: hwmon: lm75: Add Nuvoton NCT7715
Date: Fri, 18 Sep 2026 16:40:40 +0800
Message-ID: <20260918084042.19541-2-syhuang3@nuvoton.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918084042.19541-1-syhuang3@nuvoton.com>
References: <20260918084042.19541-1-syhuang3@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sheng-Yuan Huang <syhuang3@nuvoton.com>

Add the Nuvoton NCT7715 compatible to the LM75 hwmon binding.

The NCT7715 supports an ALERT output, so permit the optional
interrupts property for this compatible.

Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
---
v4:
- Split the devicetree binding changes into a separate patch.
- Allow interrupts for the Nuvoton NCT7715 compatible.  

 Documentation/devicetree/bindings/hwmon/lm75.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
index b48bf3fd721f..d55b8b7e49c5 100644
--- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
@@ -31,6 +31,7 @@ properties:
       - nxp,p3t1750
       - nxp,p3t1755
       - nxp,pct2075
+      - nuvoton,nct7715
       - st,stds75
       - st,stlm75
       - microchip,tcn75
@@ -78,6 +79,7 @@ allOf:
                 - ti,tmp101
                 - ti,tmp112
                 - ti,tmp75
+                - nuvoton,nct7715
     then:
       properties:
         interrupts: false
-- 
2.43.0

