Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435FD3E5A17
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 16:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778947855; cv=none; b=sFUK03eqVsuOWFi+7Jg4Wj65bELTFm3h4GnENxiRII6hjkf/CafVbTHkYIWwLr+kxxKZ0hw3oEnrf1mQ5tbbMzdSZpbu654QDwhH1GhgCj1CB9euo5kHtv3BVeXtUP8YeGTUize95AAeMeuIf6ccbyMvzGO2uinDPndru0DNv+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778947855; c=relaxed/simple;
	bh=Yecx+BTtAbiNUWINlUY77HFix2PSh5bmZlkraJA5IkI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CHDpcEdupwj3IrRH2kFHZmAZ5RmvqmUFkNkSRm72eq9KQfkoe74w2TRbxgB+vwSyETdcgopzVD1ZPyCXsqU3P/VzyV5IQ6RqO3sYLKkB11A8CIISrs5fIwX9OaO3AIV6k5l8z4NFaYojQlnQ2fx81s+Y+jTWTEOyhMh90eEheUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tBd1zBCf; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBd1zBCf"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b45cb89f7eso5651265ad.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 09:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778947854; x=1779552654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=whYzxfm5ps4K2a8SUZCAvYuUvFnuFuh28riHObBjpH0=;
        b=tBd1zBCfRV4dEzWoZEM0eXNrBwy49T8RLfj87AOZrVml0YlxCWqLppjELetNw6P6m3
         58bGhZalPiqHugB7iUxweKd+1UvZja7Z+h72njcc4OI+slGsWrI5aYc1KV9b0JjX2S0w
         Kj2SXZMmC5nwvtYmyeojCLhLrbXpQARvPEzkaPhCLmHYSEHq/1sj4WHSX0fQdccaUQFO
         OwNwGP0SI6mpldvacIpsnZucPlbm+1nXKXEoxET5gWku97+GG/40np7wuyPvhcZW9wF6
         FusEH04oHTYQ0LXlsTXXIHt/PznRlBTyO2RUC4HkC0kEuGxpZHVxFb1fhH3LW9qCrDVw
         INcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778947854; x=1779552654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whYzxfm5ps4K2a8SUZCAvYuUvFnuFuh28riHObBjpH0=;
        b=g3lzhai3AUFOeg6Xczqlfla3JU7B6dE4/T09NuLNk2BQZuIi5zl+/qrboMUpBjfBYb
         OjRqvS8agxNRcJVsak7MjV9i689TmZF4Gi7zSGZspouipaIMdF/2X5CIzAbqWV/3znSd
         RoB2m+2C4L91KsZ787BDlJKNuzagP+hPvBtKQrdH9p0XA7gkF6nnaQ0phSRkFIVuoWix
         zDFCWBpVca+J5wtKwhtVoFTe3i9+6+If0X9YB5X4Ltx7AQoGRv1pvBajScVFVuue+J+U
         Xy/zX5vILzsXnqT2W+3gl62eUhbnjqC+++7ETAVdFeFnYyExlTL7SBKl2WOOFNd9PCib
         Hkyw==
X-Forwarded-Encrypted: i=1; AFNElJ+DZdszg1s0JFnhiIhOCMJbFRIpzz98Y9Q68S0Kuvk1YY6Yu2Gc8lmaurXRHb4Sc2v6y6cWKBg4dmGarA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPUNPvmKg3RwoTfcW1nbfR2OcHkE//F8BR77CLAn5KLXr4dykQ
	2kpEnuOBixdQOiXcJIe7hM0RdcdJWjANWiZRvgZDwEtdd5gpa/VtAXCP
X-Gm-Gg: Acq92OHME5I0kCgSzDh1vgArbHRZLfPV9q/dJV9xISuCjggHjaxbrj3jzCvNkQMyW3Q
	YjuL9Bd7Dv2t1BwqntzcqsscDca2iMwbVN2GBbGf/TtpaY9FH1yrxVRwar/QMd3La4s110zfY3T
	LnvfINuMOTntqU22t3TKnl1scNA5vqhRpPu+0CqNzDe1JWpsxInorP7q8sG0byVfoEDeQfBslpa
	xFAzg9mrAC2ufqXyp9YGYLoYYEb0FYvwmdQ9j86XdlU+tI+eQaDhP9mIc7C2JxOVDlrxaGI/peg
	1CS/KwO78o2W/g7BvbvMoRNd+YoLEHBRaUf0hJMYjZj3JG4tApehH5+Ql3z4u3KA+yP+gajoHz/
	w7Sy6gPBuaKE53KL4Hw8Eq1st8yqOwebBNbn6A0B/v48+aZ11CTPUhPwojC+eHiRe+HMoSX1aF/
	eTlBevJLn9L520NAs3jAlZs2FbJ9VRrrBd/4LGCidhKaDhq92iD+xILRySVnDg/C8X58OnUv/Nj
	WgeGAJeUai9g9j4CWyOpdYYvBZEwMHjnpWolOu6Nup3Y6XvZZNV5hmg/Tbvbvo=
X-Received: by 2002:a17:903:1b25:b0:2b2:5515:661c with SMTP id d9443c01a7336-2bd7e8ca3d7mr118739585ad.31.1778947853613;
        Sat, 16 May 2026 09:10:53 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-184-71.dynamic-ip.hinet.net. [1.170.184.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0f94c6sm97752565ad.56.2026.05.16.09.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 09:10:53 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: linux@roeck-us.net
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH] Documentation: hwmon: lm75: document sysfs interface
Date: Sun, 17 May 2026 00:10:35 +0800
Message-ID: <20260516161037.1486-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the sysfs attributes supported by the lm75 driver.

The driver exposes temp1_input, temp1_max, temp1_max_hyst, and the
standard update_interval attribute. Some chips also expose temp1_alarm.

Add a sysfs-Interface section to Documentation/hwmon/lm75.rst to
describe the supported attributes and clarify that temp1_alarm and the
write permissions of update_interval depend on the chip.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
 Documentation/hwmon/lm75.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
index 4269da04508e..cbf737948c1d 100644
--- a/Documentation/hwmon/lm75.rst
+++ b/Documentation/hwmon/lm75.rst
@@ -181,3 +181,21 @@ is supported by this driver, other specific enhancements are not.
 
 The LM77 is not supported, contrary to what we pretended for a long time.
 Both chips are simply not compatible, value encoding differs.
+
+sysfs-Interface
+---------------
+
+================ ============================================
+temp1_input      temperature input
+temp1_max        maximum temperature
+temp1_max_hyst   maximum temperature hysteresis
+================ ============================================
+
+If supported by the chip, the following attribute is also available:
+
+================ ============================================
+temp1_alarm      temperature alarm
+================ ============================================
+
+The standard update_interval attribute is also supported. Its write
+permissions depend on the chip.
-- 
2.53.0

