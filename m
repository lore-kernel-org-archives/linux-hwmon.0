Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0635A3EFD3D
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787649962; cv=none; b=Z6s/fXdaGFeNN0tx0S357QtD6Ag+yi8tm7sSFa5rIQ1PdSyRwEppJqNy9Pz0NTu1CUvVcadBNaXYN+HHPEVZjWnATeEutAE0c3kn+PCXlAMUogpP9SjJLoOzOLs9UkQAxthRBlB9KMhyalGxT4XwWjOx5t3mjo2VRv6hk0DEIJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787649962; c=relaxed/simple;
	bh=XND/vrnNdGnRRh6HJniJijvZPaDsItJ2CT/DFUG7XLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lxCpVloeXwFYgfqMAbx48AWndEJ7Lwy4NICBM5Wp5ZUjKLAOY2E6tEAXzPmEtQsDo1DruAlEgs+P5xMEJB5v3cP0wQ/YD7gbC5BkoiRsJK3zquO5LwCj3g6bYH7HRJ/KBIupZ8PP1ku7igdfMPeGa23Ex97rPt654NQ2Qyy3hxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=plhqprVe; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="plhqprVe"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15d47266baso523100066b.3
        for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 02:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787649959; x=1788254759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aK2NBAZNJ7hyQkISsggpnV+gCwOX0/yVfqvSX9ZERHA=;
        b=plhqprVeUgBvrRRE86R7A5KaIVfYnkEoO3EUr9GKeiTS0Nl+c+XLkR4EOwZnPfLFom
         HiVivZ7y0uMUEBLgjt9dINNpniLAPNkvM7Cirm0bmLDhmXqd00LALH9SxXT9ob0AJddf
         nn3Dd8W5Yg/AGoKvEq82DmU+3KD98RwXBoqEp5NnTgfwKfX86Mh52JKI1RezV7Pgo0hy
         2kmsbfJbLl5i84FziIhG4Cnckk7E1wQLI9t7NbZyUapOLi5RQ74ZwuSHopztG763ep9X
         GA8XSAhK13R9mFEWwAZzWA38XOTlklHhwWRN327kdxNZStFtcwUt96CgKkW36Msm+lZa
         iRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787649959; x=1788254759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aK2NBAZNJ7hyQkISsggpnV+gCwOX0/yVfqvSX9ZERHA=;
        b=mK9DCeuP5GFgHEhG60oEGajyoL80UHLD4HVxd2QkU0a8E5Tss5yk0xI5MA+8cxqnch
         r6RY10341XgD92kZbMpvhLNNWlWdIbNLkuMP67wW24QHELMgimtGbGjIxqcxIaNFeR63
         L2luD6encOc5PgXfhLV+YDISxSQS/J3uzdclsarQ4TR3MjmwNnaMlsObupc1ZLF/3c4p
         5bvmrwcANvJP/HK3PyULlHeKMg+oeo+jb9+RlamJnh406yrwOhTUFgYXFJ0Em1CkitRx
         8BvRRX5XW2jH4OTsHStCnk+EwgiSMKvg7n12PS3hzpnkXWGoDuBzzPHv4A6koTcsShyP
         V7jw==
X-Gm-Message-State: AFuF++kfeJSDaIp/NplpDSTxEWDLyu03HofCLf+wQqVRA9NLXvBAP2AD
	zBlCNoNWuzmGL7rg7W0KgqXXGTKnxT5EX6s8p2bkRQA9MYR8aCO1Oh9p
X-Gm-Gg: AR+sD12+u6bFf2o4EzMMKER3DqjpCbVBlHfTAecyeYM2/zBt5UbRZkRi0sNccJL3ofJ
	7wfglZxTp3h07LCIIB8XFcPVnaIhNoCYzJH4dnV0TKq2JDGg04efwjbSCiKvY2uhY9Yw4SAHQCG
	BXD5a2OZK85oy9IfizNBRuLpc3YTlvrAu3Nw02aLvPMb9cIuVMink971tRzVQUusnRcA0kcdCVc
	ZHibKx/QsnblbWOX2YTDhwDPq88pBTAgULw9ru0agwbicdBp1l3GqxOFoW2SJkgs4PEBkDHDbwM
	1rMIM5PBXuUlWSAuGvA3+haU9547f1BEl66essxHL9FLZVcCUYwHVf1fFconC5dxOx3AcFsip2Z
	Ynmwxc9sxHmLd9NNCzV7XYg4HdB46ruOj4Ozt1DGZ5DRxFlpjUBLBDGT5jeSqklApdCSxPUidQJ
	piJiTkQfnNHyO4uvDKVE3/j99wu2rFDT3+Oqwb72O3j2g4oMWm3TybJgJMdQjGtAKb3JhYddgwF
	hNCf1YxIqGoPJO7NrVVztNbXnV5ABEkzOaCwtEhI7q+Nz/hBTeXqyh3g9UoaS1gGehJyF+jHprN
	/2Ho1c7a/bNFi286FQSKIEA=
X-Received: by 2002:a17:907:d0c:b0:c20:53c7:488d with SMTP id a640c23a62f3a-c24e5ade3a4mr545156366b.14.1787649958817;
        Tue, 25 Aug 2026 02:25:58 -0700 (PDT)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606bd05sm1612570866b.2.2026.08.25.02.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:25:58 -0700 (PDT)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH 5/5] hwmon: (nct6683) Enable pwm control on ASRock B850 Steel Legend WiFi
Date: Tue, 25 Aug 2026 11:25:46 +0200
Message-ID: <20260825092546.669450-6-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825092546.669450-1-jdahlin@gmail.com>
References: <20260825092546.669450-1-jdahlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fan control has been measured on this board: with a fan in manual mode the
applied pwm value tracks what is written, and the fan responds
proportionally from 337 RPM at pwm 60 to 933 RPM at pwm 255.

Allow pwm writes on this board.

Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
---
 drivers/hwmon/nct6683.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 6825e6c3af34..df28055b1a1c 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -972,7 +972,8 @@ SENSOR_TEMPLATE(pwm, "pwm%d", S_IRUGO, show_pwm, store_pwm, 0);
  */
 static bool nct6683_has_fan_control(struct nct6683_data *data)
 {
-	return data->customer_id == NCT6683_CUSTOMER_ID_MITAC;
+	return data->customer_id == NCT6683_CUSTOMER_ID_MITAC ||
+	       data->customer_id == NCT6683_CUSTOMER_ID_ASROCK8;
 }
 
 /*
-- 
2.53.0

