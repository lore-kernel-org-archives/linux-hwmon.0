Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4C01DF759
	for <linux-hwmon@vger.kernel.org>; Sat, 25 Oct 2025 00:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351965; cv=none; b=hgQdktxogNztJAPrZ39Sabb8Kdb9q3U71m3hAKA9yN0pbLZ09KFyDrFIO8MYyHKfllUEpDF4w7Izk+UBVZD1x34VzGbaujGl0R2qRdGDQHgCQI2R46mpnYjIB2ewcl7b6wm/6y0aiL4paTjH91hwp6WIOU3SlA3aMWyayMI+riI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351965; c=relaxed/simple;
	bh=9CvGSj3k52YgdYK4J0MHeIq2HkIZQxGeUJahNJ19td0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OnzVE54FGaW4dYANi3dEz/zEloB70hXGBdEzkR5rLLVF7A820I8wnIOR2wOUQ49M7gKXBPJMybL3ADY4OL0N2dZM303spgr4CoGlLiHLS9kKIXjj4Xmfa6AWpJVyB/qH8fAl7pRJoNajAu9YizCJ6ZtVFYIv/DFhgYClMV/JPbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4nrRPYA; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4nrRPYA"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-26a0a694ea8so19347835ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Oct 2025 17:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351963; x=1761956763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CiHvIx4iCcyVz9XM+n+OAI2ebsG3UALzSjgEuG0sIw=;
        b=m4nrRPYAqpvCSL3yZqRfzxNRxGeBAaJ2TXYKZDbuT43XN5SXQI/ymCC9VrLWsE9nDH
         MsiBtK+gZrxEDoXb1NTsXjdoqa1b0mQvN5kF1oCn5pdlJJIO7zxG/JAZdz2bd55le83R
         5Xc8ESFPlC7704BHUb0JgT8nnZACn3r5ElSTk0cCATWSK6sjDTYbw61tUNxqAznyzVWJ
         eJuB+uTmLwwMh7nQGpPbxDgd9aWtAPGiz6d6tetmS/Y0NFXqNElfro9V+L/xnl83FAwv
         4rhx2ipnVzXGxl+Slmk3vPa4n/jFUwMK2uTxYFNZu4CbaZ5cloh3SBR99Rh+jkv99Tav
         2wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351963; x=1761956763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CiHvIx4iCcyVz9XM+n+OAI2ebsG3UALzSjgEuG0sIw=;
        b=bn3HjM1Nd1R46nYSAHW9PbbfL9yxxldRfvwn38AP0WBcTYz28dUVdEvC8oolIdj7uO
         hR6kKJe9PVtax1esKk2l+ZT7NtCNvs6hBdVxohjxdR3tQqfgr5rIXamngPJbgz2a831o
         KqvcCyu8gjfEwlVSK/W6VrE3ji7HsY0DYjW28KU4ILGsrp3qUTIeLfHxDJCZaoN11IoQ
         IGbv6e/eatsp98wKHtIPiWPdHkorV8Xbrzw0wG2TS1q+SxQLKPShuVBOb2+kFfAeY4Mh
         EVHCeCcwYsVEuBDJ4XFddw3cJWC9qYcoM6GOkLB7ex/eNOWLzk5pLfh6uIyUTfalOUT1
         6h2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDFJOxPWGekT/DPdZVGbBttfgb9K6BKnixxDEyPXR3F4lc9TjUAr7xwrr57Ygrnijw3PJkZlcW97pgcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbpeXaT/yO9qB47k02fnHrv5OZIKMV1WFpXPnJZuOcU5jMgPBc
	Loae1stMmH+X/Epjp8eeTimMDcynJo+V/9G8EN+pzRkbDLS/3HGExl32
X-Gm-Gg: ASbGnctgeKvIwi1A0j1K2TOAiMoxBaLJcqaF/VILtUTtAyPm9wqSCKyynq3xIhTRigz
	7TFE2tiwcheUesohgkSGXJ+JLC3g3hZSAnWyFwCMWkEnKukC48+yr9ox70WsqVdlMFpzmBNWVV4
	gTn8BQhoZ3o4i2OFmwbk63mH+LMQyX0ULAJBf4UakXqoS3TGyv+6Y8oiz7cw80ccnAQJgPKyyQ3
	doxB9grdBKpGu8ZEtOi9yx2C2t/Yr/Q79cAsfAxAi0wqFVieUC5KX/uHeycc8hLPzu9EDN4QB/O
	2ozcore1qauByjts2oRcOc5okh+SlyRbonmO4dF1HQbYERwRilttOPReiRAyiQYghIMIZrh/hnU
	yDZFHTc8SczN0GwgcdiEBKjFDfzrsVmV5E+F+LeQNr58dQCDzsbpwhSPhydxC2/pk0wiE2oIKWC
	7RqpuRqBS+RBaejh58CjfbtLcEw8zv+EjxCEHILQ1qcbojoBgRGMrMzS5qDziFJyRL8UKcLMc+R
	8bMFkzsSxfRxgejk/q8F4eg75njfHVyAFok07N0bpLzfUuCKdY/iw==
X-Google-Smtp-Source: AGHT+IHSa7MdO+RyudQ13l7ZBDW5YjuDQoXfBKNGzygwW/8ijBbpH54bUrATc3DfIp5eGwuXkgv2HQ==
X-Received: by 2002:a17:902:fc44:b0:26d:58d6:3fb2 with SMTP id d9443c01a7336-290c9c89697mr387774495ad.12.1761351962920;
        Fri, 24 Oct 2025 17:26:02 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:26:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:40 +1000
Subject: [PATCH v4 09/11] mfd: macsmc: Wire up Apple SMC input subdevice
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-9-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=737;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9CvGSj3k52YgdYK4J0MHeIq2HkIZQxGeUJahNJ19td0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM4d3hJqcNPewfPwlleiK7fkXZLhtVltl2i2UGbKY
 wMxq6iQjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFQ32DP8D1tQvEl5SoUQr3Tpeel9LQEufdveGjjeWpK55erOQgadQ4wMBy1+6wZ
 LhiSptYttjWV5voFZ8fr10xZCNt+PsEww+B/ACgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC input function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 51dd667d3b5f..3b69eb6d032a 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -45,6 +45,7 @@
 #define SMC_TIMEOUT_MS		500
 
 static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_NAME("macsmc-input"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

-- 
2.51.0

