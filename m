Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4C62D7813
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Oct 2025 04:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761108435; cv=none; b=q18xFX/EysHEfWa/3yf4YN0gHyIPpBHBNeK2u7zQchWTNFlvs/BlBZ9lWndrzXGHYvpbxNt9DKZCjilgZsNq0fcV/6uhY5xtlI64RSmBSyxluE8Cxupaxfvl6xOlcILGN/ZiKtLRpkP9YdU3KtMuedo5e5kFVUKiSRnwQdCLunk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761108435; c=relaxed/simple;
	bh=CHAFGElaJJM6vqsKWvce129HGl6ku8z5jgSnDpe1PuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PYM6usrnuDWDo48O7nFx54h5w2M7o3TMP82xUzoFGghj3dz9zJdmf3JWBydcqDy2fpXRqraP+FUpNqgejBjLnOVdlpoQT04Be81rY1dptxwFrjbQMRSldKgPhHVEsrjV0ywU2dVYYwsUifOB+b/oyGR/ZXtSmvbjhm4L3X3LoPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=rF7nshgX; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="rF7nshgX"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-782e93932ffso5565401b3a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Oct 2025 21:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761108433; x=1761713233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARDIlFsexdBsHJ/mYs4iJ+oZYHRCoUuyGXAqhk97moc=;
        b=rF7nshgXo7uLWccNn8t3L3wsY52chgNtUSL9hqUWGGTd6XqbOaUCAewttCL4ri3VwA
         UGaATqZsZ9wBBpWsmMWU1vuFkndFhXHucZk43f2GrDRRnwhG1uCuE3FA4Qp+DXPx3LgR
         vjyyP79ojAdFZnC7nCNZuu2y69ee9g/uu2sn5lLZvVaEB77Ljs/4drlkfE/xQJf/pQC5
         BrOJsKUykA2ZWgigl3C6zfYfqX0eCS/X8UoBahklqNQryMA7OvOlJguwieo6vdQTByHm
         mXsqd90SKiS2xGb1ihNWdOm8MphCX8DbYNFVzib6Ftl04OZKs74YCdvSZnZ2nwq9VNgD
         PnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761108433; x=1761713233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARDIlFsexdBsHJ/mYs4iJ+oZYHRCoUuyGXAqhk97moc=;
        b=Cl8s0Od8vrpwIfNNbRnOLoWKmO8Mg2miCdSFjpSJN59n21p7BNt48KSw2kpzIWZNxP
         9fXvIY63IReOut09F6o+uhR0nHGv54uRZkyFx2sTRUL5O1w7Im0mUrvNOa8ER43xmfvP
         h/D+YvS6nQG14Dzv2EVYbW0cMsnYJhEEG4emtGbacAMaIhLbmw/J6ldMXbdgaDX/pE2t
         pjLRVVTQO8Q8M2VTR+ZyK7y5bjotJdziWlJNn7HYKv9Fe8RhOekfVge8s1DZcsmD7Lmd
         nDcsd16lMGiakm/4wHO6/SuW7H2AfDVGsFynhAP3xFOEWD59KAv5+5dBtGDeSIkXIfeO
         6HbA==
X-Gm-Message-State: AOJu0YxBinsAWuoS4fXxxU0Qa7OPGRXEDhb0jOov8oGJkLneJ5Nu2GDP
	5OnHvYq3Y8ZP19FHoXxok1bRdPLx/hId+zUleAc1I0xR/KuYgZfccE9CrW9OvGKsVnQ=
X-Gm-Gg: ASbGncssGt7/Cf61P3RdoQYU0FP015hr+8KGunRYxi5IOtmeH+lIuChB+vRnQdlF8cj
	dZs4TwEn1s1WmxA19FeGB5PpYcAjNQ9ZqhujqzIb+H93GjZYycqQf7v40w5PxTYj8SPjgic0drb
	d8ul7hT//tKKgF9kElVGu0T5CtZGshNz4kDssXn6+GjRF3JRlY69qoBPbf4Svvxi3m7F/K9xqnU
	lXd2v/gArXK6pA+UXbfom75YAJrWuIf8Wy6YwuiMoJIqNEybRWhz43/oOatepssl24R2IwH9UDS
	u56rmIE3hSOxxPeDflAMZtgWJ9q1LIlOzCEU9QiCoV/pv7c061RhZZA+M/NfwD0/VTSIhyo91bw
	tv880kkr1Ij9gXbQG6liugBVhz0U8wCJiEPsVLM4LL2ZSsjWURgX7aF5YEsX2rTiFth0Dhf21tj
	M9I5wHWz6x2aPh3D0TZo4h0RjyKA==
X-Google-Smtp-Source: AGHT+IG7v2tgI6or6tIkrpsvq7pRrpwD1oTrsV+QwYIgQi2vxNVriCFRUTuiKuUNQqyqsYpRcg54FA==
X-Received: by 2002:a05:6a21:998f:b0:2c1:17d4:4139 with SMTP id adf61e73a8af0-334a86108e5mr23495747637.29.1761108432842;
        Tue, 21 Oct 2025 21:47:12 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:8004:e310:f3d:dd0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223dd9d6sm1257413a91.7.2025.10.21.21.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 21:47:12 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 3/5] drivers/hwmon: Add TSC1641 module to Makefile
Date: Tue, 21 Oct 2025 21:47:06 -0700
Message-ID: <20251022044708.314287-4-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022044708.314287-1-igor@reznichenko.net>
References: <20251022044708.314287-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the TSC1641 driver to drivers/hwmon/Makefile so it can be
built as a module.

Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
---
 drivers/hwmon/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 73b2abdcc6dd..a8de5bc69f2a 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -233,6 +233,7 @@ obj-$(CONFIG_SENSORS_TMP401)	+= tmp401.o
 obj-$(CONFIG_SENSORS_TMP421)	+= tmp421.o
 obj-$(CONFIG_SENSORS_TMP464)	+= tmp464.o
 obj-$(CONFIG_SENSORS_TMP513)	+= tmp513.o
+obj-$(CONFIG_SENSORS_TSC1641)	+= tsc1641.o
 obj-$(CONFIG_SENSORS_VEXPRESS)	+= vexpress-hwmon.o
 obj-$(CONFIG_SENSORS_VIA_CPUTEMP)+= via-cputemp.o
 obj-$(CONFIG_SENSORS_VIA686A)	+= via686a.o
-- 
2.43.0

