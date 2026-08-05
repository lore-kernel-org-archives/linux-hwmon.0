Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4401247140A
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785935761; cv=none; b=QGHhCWxypWW07lX1nui3KcuTifYNrQk6Sya+cgj7H8CEDHLfl+g7CQi0nqEWWsV0R9Ugv/vCTgdm/3if4yLqohcZaa84NMl3wSgXxlJYTjtaEkJ1v3hEt2+4/9532a2vIgOXP2hGMbVCM7RuB0D4irRRVr/264S9L519GT7T/t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785935761; c=relaxed/simple;
	bh=+gw83Mh3Ir+pTpfrq0+pitALUCJUqx97EkYCdiBEbRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fn3hAOQVvgokqRnrjB2GC4hNFZJo280Ue2+DuhaVICdGOuCx2S49Uy/glAAWPLBX8wc0Hq1fjhXFWwBuqSTDNXxJd9Vv5oz1i7fvpplOkjtY7Bzvwp//OP6OcheNIbtQ5Kbum0b/Yv2SpfEKvBhJSCHsmsFfyFC+HP4uJe/Ls1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ku0EsZGG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ku0EsZGG"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cca0c5799eso9026945ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 06:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785935760; x=1786540560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tv7r0pILyVz8vcjgz8J3/h+ifgsbbGqBLwmu7dyifLA=;
        b=Ku0EsZGG5qLwyKd1DIO9dwrzIPWocFr7AkGTsPDRRVGLc9SaUnJOEiF/nekL6gD3VR
         W2o9GIv7wrCNi0dk9n5pHvCKEQvF48W4npvMTk4aKoZJIyEE1kUR/aq0YrsBsHnWBayG
         fVXPjJsnJOYbvO+aTu6SPqYdk9k5kWOKA5m3sbrLSynkePWPNuu7U3qOmbODicaIjpPG
         DMX1BqQmIX/BBsycqviMYuu9zTwAhGtgoHm8HZY/T63ezrvAhAGN9ZTS9zngVDNNvqhY
         uR5iSq6ACw+zKr16cZgpp/PSKv+elLvpOi+GvnWQPML0cF9MPxrxn05TPpI9fiqCBS9k
         4LPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785935760; x=1786540560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tv7r0pILyVz8vcjgz8J3/h+ifgsbbGqBLwmu7dyifLA=;
        b=cZZu3BeRkSSRsu4yOZKRje3eO/p6MCHO68dLYrxjjv4cwL6Z+VspvRp+FWMKnUMe+V
         8WKE5HqmwDRGf80haqp3+tNIapghVfCT0WswMrg3ykgJ2xQiXzkdZqQwSeE8NNmrp+xl
         +WngIpfwW96rnoh8TgdWH9HrSHTBDagXHik+nWWKJ3orRvDIF2FjbSiWQqosy83J0Qxa
         aPvh0Y0hg4K+nM4r2hqfSWdzJ0ERNA9QBXk8ZB0aS176f/KAa8YKWucpmIa7bSAEu6WB
         wSo1m76mcC3+I4r3qEkW0xsElh+dghlZ76twh50KTEktFgCuHh4mjAxMkLmYRkH/hq2w
         PTCA==
X-Gm-Message-State: AOJu0Yw6EbMI+GrgRibdiOIeGNSMJdoh9PuJ1k3wgcjujPmEthd1Xq0/
	0GWthFUKLQA+Nb8WOJfeYICVr5NLobz1ykuQbcxbd/BwoYvBzqJn7hHR
X-Gm-Gg: AR+sD12U8D9tGSZYJzLphTZNWTUkJuMlfFWJhyt82zAxtut7j4eSu+Pdp+cyYRtzlWd
	c45NoGBcXUaGGIJWau3E9AWJJKTLzt9in211zn7l/cWqJ7sJEMdYJno+cqbj0mDNNek3UelgU/3
	YJKTX0mKJdLW2LoGm2ba/Os24MwA1f4U65qiZjV0xOMaFk+D9U8djYxqIrdCAq7Cd8aoGiqmvXN
	/uYMM8T7eCknPV5MB+OwN51V1dwVLKpltACFgu7Qu/QTK6DIEPYw5llZqlz/pgnNoPLc3tF7dff
	3hWmxXJbvqUX60Rvan9ULBKxmP9odYl1rRRfFA9ui76MsQSjn5+LzIEe9v3p1VNUijT4daPfsN2
	tq4PNkDEb0CNKYnqo5/F1dCE+cYPUwx14ZLosmE6EQMysCNaFHz+W2Qm78JQP5y7NoygZcIsXhx
	aVO32Z42I5nB1nOpz56hLOrpXmjx/QyZJUmbqqqiGERrHNyGwJ7AY2y8YhlMTFaJkZZkNJU93j
X-Received: by 2002:a17:902:d986:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2d0caa031e5mr82849455ad.21.1785935759549;
        Wed, 05 Aug 2026 06:15:59 -0700 (PDT)
Received: from tresc054937.tre-sc.gov.br ([189.4.123.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673a9e4sm18292261eec.18.2026.08.05.06.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:15:58 -0700 (PDT)
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 05 Aug 2026 10:15:20 -0300
Subject: [hwmon-next PATCH v6 4/4] hwmon: (adt7470) Add thermal zone sensor
 support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-adt7470_thermalzone-v6-4-5605a5f95467@gmail.com>
References: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
In-Reply-To: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Darrick J. Wong" <djwong@us.ibm.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-pwm@vger.kernel.org
X-Mailer: b4 0.15.2

Register the ADT7470 temperature channels as thermal zone sensors.

Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
---
 drivers/hwmon/adt7470.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index eeec3db0da88..f652532f2f32 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -1396,6 +1396,8 @@ static const struct hwmon_ops adt7470_hwmon_ops = {
 };
 
 static const struct hwmon_channel_info * const adt7470_info[] = {
+	HWMON_CHANNEL_INFO(chip,
+			   HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,
 			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_ALARM,

-- 
2.55.0

