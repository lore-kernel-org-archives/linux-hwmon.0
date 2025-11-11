Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8BB2DCC04
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Nov 2025 14:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762872278; cv=none; b=T3KpyODcpY/lkucg7zHJcQCn1F2opnf7v54XlU48mANs3spB3gx2FTsVBR1ckpgRuKBL6MWDJu0mj+ekRBGNWHXDEG2qRXPwWriFmQTkfrfPqO7k6pFyM7+CYtL8iTS8HmFx/xSRbWo1aug5/tbvhr9V3SXr6vokPQq8XVU4T0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762872278; c=relaxed/simple;
	bh=y8t7dgVWv5gPJxaJppIsGqbz1EVFsOkgb6ryGsNSE+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T34OfOD2Rin8XdJGBR8tk+JyC66Sc6udAmU9ayWOpFascB6IXg9+0fNxJo+zbMczOB/L8ylRwKiEJB3SDbsOnOHzJC6Syvp7WfM4GSCCbeFCTvnsRLalHqqCY/8c4j6bF9bKbtzOCtH2/3oTb+jw6NmgRiZPq0ofq0D4JiKoe6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPKIBY6q; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPKIBY6q"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b713c7096f9so621211566b.3
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Nov 2025 06:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762872275; x=1763477075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UVOB8A+PcaLDpWyQLR0l44MeTzTd0XLGPEhD0sPw9I=;
        b=TPKIBY6qIQ9C3AvQZA7QxxL9U84z8ztzpGLx59VRFZPMS2/tDejZTl5UknulTpZzJe
         GTZfMpDFwg+Z4L6KVONVjgkxqH5tQgjvKDsdEqI+VvgR9P8gd5nFo55NYW34ZgqMYh1c
         1X2ccC820SiueQgmPoMnbeH7+tTU9DmS9exVbxUsnjZZHSXsqGVNTCoGK2sfHd2XJ6Nj
         ntXkaw7mG5WqI09Iyiv/TJjxP1prkF243r7w7v6vejhGGFo5pLnDjla0DUCpDg9bUGlL
         /6T2LNG/nRwux+52rp8SA+ayusOeRYt/uMY2TkLhm+x2trxBokaGkgE8AqeLq7tkfBpR
         fUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762872275; x=1763477075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8UVOB8A+PcaLDpWyQLR0l44MeTzTd0XLGPEhD0sPw9I=;
        b=rRg8G1vm/bblXz+6ugverozriVsq+aP9cM4I+eSGi0vioigsx6XvBNPGvqZHRy2sw6
         ubuBC99sN5EypGw8hC8RxOtymy+IDsIEMXVTqmv9qLUIL6HTAXAtR/qXLaL4q7f8R9AS
         QHhPHF0UQ60YTw42aNtE7NbsA96TkGE4DHpduJe9TsbJbcPp2ZUtnsiMGo2ZZXhOedzO
         L3HbtM+ub1QLnmcFZPpOfhhP7c9XllLOVtPo4ABpb2oOCZib4EuNzbpYGQkzB5qKdFrO
         jF6dKTWhjjO179qTdDUjYMxsgS0A49Pzd3iYu12TNbUB5CmpED8cXA7Xdn2Srsy+4+Kt
         webw==
X-Gm-Message-State: AOJu0YxjC/jQt2irAh8e61qG2XxDuRWE0yKVLEQ26A4sLHI8pCsSue/Q
	zQbfpzwfbzzjA4eeuaiagVIi4LzM/584kMWwJm0mvbAZfSyLwYjypr1Km8u4AQ==
X-Gm-Gg: ASbGnct5oOtMD/7TkYTEQIcogH8IuAlOp69i45A8K2Xhc6l9+ThRey1ifnFOaU8eNWJ
	Qa25wSCMTh1NyLTHWmFNUdDnVKyyfchUGR2kobgWq0j1ARqFlvqyVvn09T7hoAFwQRQ55hCoBwm
	CM0mPo9yvnOdgJiVh/qXmXiutt6yrvo653Y+N9mwWfRKSclQY6s/Dert658p7ktbBuizz5B3zA6
	dT0VZX/OuSVxQQiMya9hQUX2FE0q3ukcC1WhxjzF7iVH9HGUIXyAfEMwjWpEoJbSVoQ6HGrMmTF
	MOUX+IwnOSXsxom2fkoDGJWvXAB50chkocMJew0Gf5SgedsMSJJ3a8UrR6gbTRqlN1tDAHsw87W
	agVB/AP9/1vylvl75fkys+EaZvF+vMLAw8nmP1HOZuYO9iXoc4IDs4qWg2nyeriiuNqzw94qE/i
	+HZfmtLm+eQNJAxEBf+TJQyE+PZPStFKTH4+h+8itHrVz7v2Ao59puu66AaQ==
X-Google-Smtp-Source: AGHT+IHAWGYgmPyEAZJqTKSd2mu0gZImGplk3LiAWkfYTJ+EixWMwN0H4UGNKwJ6rKcqkEZsw5RA9w==
X-Received: by 2002:a17:907:3d90:b0:b41:4e72:309f with SMTP id a640c23a62f3a-b72e0592203mr1212517066b.50.1762872275331;
        Tue, 11 Nov 2025 06:44:35 -0800 (PST)
Received: from fedora.tux.internal (85.191.71.118.dynamic.dhcp.aura-net.dk. [85.191.71.118])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97ea95sm1377118366b.44.2025.11.11.06.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:44:34 -0800 (PST)
From: Bruno Thomsen <bruno.thomsen@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Bruno Thomsen <bruno.thomsen@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: tmp421: remove duplicate return in switch-case
Date: Tue, 11 Nov 2025 15:44:06 +0100
Message-ID: <20251111144406.7489-2-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111144406.7489-1-bruno.thomsen@gmail.com>
References: <20251111144406.7489-1-bruno.thomsen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use single read permission return in switch-case that handles
attributes in tmp421_is_visible().

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 drivers/hwmon/tmp421.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 1eded169e843..23ed3fbc9c99 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -262,7 +262,6 @@ static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
 	switch (attr) {
 	case hwmon_temp_fault:
 	case hwmon_temp_input:
-		return 0444;
 	case hwmon_temp_label:
 		return 0444;
 	case hwmon_temp_enable:
-- 
2.51.1

