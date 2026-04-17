Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC787363C5F
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2026 05:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776404720; cv=none; b=IfD28QsAbzkzB0QXosMaDYO34INLu3ZlyAI3mgFl01yJ8AiADO6sA5L3aarMT0fU4SRgnG54bJ47ucnU6htQbyFATQuBRFtdnHX6C7bVH3np2fC2QPCBto1ug0vnsMKaAtIU6BnmmGcE7L/v/iTbCdLApRr7z6GsinmT0maSUQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776404720; c=relaxed/simple;
	bh=wZdC9BWYRO29lozphVxX4EXA0IaDwFtXDAIqJ14A2+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fDuv7ylLNemmXMkvUt79UhY23FgHYlDXEtSng6PwOkswsQp0k6MTqbPcW/ZypvvvVKsBrZ613sBCz0IMkH3w7WCT+rdk6plhyXSVGgXhN5f96c1tfk1sPQj1/UvAe9FNNR6keKUGvgMO8kievwSiLVh/xxfJA6WugIH9IR3UREY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HD6Fr9oq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HD6Fr9oq"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48374014a77so3090185e9.3
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 22:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776404717; x=1777009517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+lxZRGzM2UzUkmShnZlluG7LoCdnbRayUSlhrqOwgrA=;
        b=HD6Fr9oqYhcqiwo8r85p499lMRRo7Fz0CkRjvsLzolKUGyBi5kQyD2rBQ/7GYulTPt
         RkAetcf9Qojy/Tf6JY7TGbdCbHkg5PhPbtUlfw/CHmR87337gVRROtp0UqdN5/lqzN5u
         iFp7xLqy8+U39RKkfxZX2BR13On9Wmuj+yFaN+gTNgNeKNohCK0UHMb9Kc/ak3f6v8Mo
         eR/D0WfsIrXeRBdArgZW8kalAPJLY7NgzMwMB2Ju28bwFEVaFaWYOP+cX4hKUoAcJnwo
         Nn24NdXnCnE9dINMqKr9kUBgETXSEqEVxlLBW7/K35GP7iu2CDCZbnOjL7lxWBjTGgcf
         9HnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776404717; x=1777009517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lxZRGzM2UzUkmShnZlluG7LoCdnbRayUSlhrqOwgrA=;
        b=srpV+K6kn6QwqhiwiOvLF9jDSGRCcTID3SBllPjekMl85EApGmZwJtpZmbDl+vTvwq
         BNpc8nc4012W5g36nWE+ezbR+KyRyNktZ77PJT2HZ/da2g6cGqF1IffevK4J+YyD1We6
         v1I0Tdg2nmiKRIUlIGtz4kz8qrEx3LOOQcgmQHO8DMdSWgITJGAcinqgnuk8PYwJTspP
         Wdf7uvMIS+WANRJ4S+SYn0k+XEjuZGXyjMUQ7xDLc+M4m/sqiwHhRYRtTXLg15jaKlPv
         z3leKkV7KNafu/8yJO8c635LL1XYEcgs3ystZVTzy8doY49f8Ak6NUpYHW7czAaowJDj
         yF8A==
X-Forwarded-Encrypted: i=1; AFNElJ+OKJVvujUGGZcnbeEOYHTmqnIeT2Svi4fa07EeyTsepSWTp+tWNlKHwoUNoaj4NbTcvFrnAkivOLFxSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKYtnX1d9fWzBrI1XU3u9ksowoixW4iiJUIvbaBUDRUZbtHxQ0
	6jNSJC/gb5OLaEsOVGmx6iGhOPp3uN0USrVwmtGSFH+6aldntY0tVlbL
X-Gm-Gg: AeBDiessx66Pt1z0M5jUFGqsv9HWnKfmmYG8fnzdx/te3M0dOw3yaRl3X0N8Bb6Dxid
	Ar2QOvXg6Qiky4O+1KzDkCxmpH108Y14J29v8fvIKxZfi8Xx4Kydcexs+Z9LUm8SSlkMHb25sb/
	TxuYn25yGFXVrziKFb4DgT8u11/7lfiKYPv4nUFzaWCzi+aCRjVFw9seq8Q+n4Rbz1P7cjJUqYH
	5+fpwizaKt5Fpfw+og//XuSvp5DPeuu95AxPLFLIJJLFAZdMPT0lEt6XL2rKq83LLUyzOWaBJl3
	tbZSihsYAzwd5AEe3Ejzjg3jZOUyZMQYbKM6s/0QCJAd1WuR22HJvdcdv1rNZoZhXVdtqnZeEQg
	zKKbYysi1/Ln1ZDcIdpq7nDuQ1dAym6z4HBG+cpUghme9OyE66Q0Qi2NW5Oyb9WlQ8DbQ4QENlC
	9Ai/cAZLB5oKgnvGg4U2HOOxyynux02kqHmuGqefpvpIa/K415v8ayObmDl563/jk7/ua4AEog2
	aoXP9MTAo6rWw==
X-Received: by 2002:a05:6000:381:b0:43b:5b25:67f8 with SMTP id ffacd0b85a97d-43fe3dd4ce6mr1872053f8f.20.1776404716906;
        Thu, 16 Apr 2026 22:45:16 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.249.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a174sm1868657f8f.18.2026.04.16.22.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 22:45:16 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: hwmon: (lm75) Add section for sysfs interface
Date: Fri, 17 Apr 2026 08:45:11 +0300
Message-ID: <20260417054511.5432-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to other HWMON sensors add a section in the
documentation describing the sysfs attributes, their
permissions and a short description.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 Documentation/hwmon/lm75.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
index 4269da04508e..288cf8485ea6 100644
--- a/Documentation/hwmon/lm75.rst
+++ b/Documentation/hwmon/lm75.rst
@@ -181,3 +181,19 @@ is supported by this driver, other specific enhancements are not.
 
 The LM77 is not supported, contrary to what we pretended for a long time.
 Both chips are simply not compatible, value encoding differs.
+
+sysfs-Interface
+---------------
+
+The following list includes the sysfs attributes that the driver provides, their
+permissions and a short description:
+
+=============================== ======= ===========================================
+Name                            Perm    Description
+=============================== ======= ===========================================
+temp1_input:                    RO      Temperature input
+temp1_label:                    RO      Descriptive name for the sensor
+temp1_max:                      RW      Maximum temperature
+temp1_max_hyst:                 RW      Maximum hysteresis temperature
+update_interval                 RW      Update conversions interval in milliseconds
+=============================== ======= ===========================================
-- 
2.34.1

