Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BE136F8EF
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 10:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783764717; cv=none; b=G2uyVwg1D5xTT6dn3XM3piQ1KE+PmWFIq7/z2O8dBn6QBS7rPTGMlDXirsdaPZFoJbEdVlkB5hsMdYJAfNbH0PdCM+xg8AKipm72X/5+fWuG6dpAdPWd3TWOmtL8vSvf2TInIZgEp2kfqNZ4TK49kDNFuoBELg98VtZS9BaFlWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783764717; c=relaxed/simple;
	bh=OM7ZSQdAbzZpo2zRdkbLPVg1WgohCwwJOrVSlp2BQVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RwgNkqcg9iowzQxTSj+yuEXnCXxhRsqPWJOmsLBFMzT9zKiu4zdafnKoIHRD4f09LXEwh0YpBfkpXizKMPio5fYRUkNQPmC2yyQcCb46H+QNph8jOfHyFHymuETxRH9oKuL0SAJ78vJkU0+GnGlwOnlsOTnvBhFEMlk2dkR1Mig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkILccaa; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkILccaa"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-476a130c138so2066445f8f.0
        for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 03:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783764714; x=1784369514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z2y5DSumT39buWcUKNQkqVIesm40vynR3E3VrXfCVp8=;
        b=WkILccaahhen/0VeAgS05Af3j38zeVft6MSf+CClGcNbqoc3X/hL3VZBoh7ty6hNz8
         Jv2nQDm1aWNNK2ATFcJwRTlqqb1b4dZRXOII/KqxQAkt0rOPALqWgH0tcLyhD4R/tPrJ
         u8pbLOHAxVTGFo0Rh1Ah7c3UVFdCLvzY6ijAniDrUmPv44v0xF7C5e5ZhanlnAQvNdrs
         ukPoZgzGglsUomSczfv7RhdZ/KNYj/m2IB6JCyvkwKEVadvZ7Q6XQHKVM7XnB8kEGBpj
         X5BJHXAIuI3U9u5ompux3RkKCgKLWKs1iznHjGnuvKlUQZMPvPa/iVGiLmjXyjyk+dCH
         2pkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783764714; x=1784369514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z2y5DSumT39buWcUKNQkqVIesm40vynR3E3VrXfCVp8=;
        b=hf75ptahCxteT7oDP67tgAy6mEb6ZEKQEhTdlqGhXkpYjK8EQ9RVDm/KdR9e9CWwK2
         w31JcqeAPFV10pGOjdP+soe+BLHv3fcOeCitT8hRcMm3j5qLrxUGvbD0T+RZKhkRLNRo
         J66JXIMZxKyVIMzyHemMH/MHni50tJCQbTqSp3uW8Pf9NDLA1UlEcXt19X0ykw5rMeiG
         OAk7b+sMJQa3eZzU8v5fjP7YM5YvoWHFIK2LiA2IPg5XNoZBE+qfmkgJMcStv6CJdnzx
         GcdhcvZ9J5H+cGzvtugSokvWUs8RQ+RF8/EX3wVDl4CR0r6M6UNISaY1HTLlQuhCXeLy
         znRg==
X-Forwarded-Encrypted: i=1; AHgh+RpaTBv1UiQaLHQn0hs7D6RGCw5H/8itBz2pRpZyt0ZQ2PP2Dfq8pJ7RoItcojaPwbpR4blaxGqmKVY2Cw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz98W2kIs5u8R6vAm/bcDmYMJXWw2hsUqTvwebzks1k+US7p3j
	vA/pmWz+MW1G7EOMm+YEHHuNkHWKAiT+16jDmFVm2EqWTwzTvf3U1MlTLb8pww==
X-Gm-Gg: AfdE7cmpya565FJt1Zi1snHxodg6SJ0k0XStuHpEnrvtjcEKpGXM8WEh6elv8h6OglA
	P23t88X+zVWy4umjoXVeYmCW6Bcgc8QGy69q/Ls6azP0phI6SIi2mv4DDcXhOe85gEmfve4Io+F
	WN0R0ER6q7Pp+NTOaiiojSVyStpAq+nvdslPg+yqzj/+/7tEr03NVkldbBkP/I9XtsX0kch+JHw
	BHHOBsCRV39lMCiqHBG5OPwcDty0zQ17wU84wSYldQxkhtFCgZMlgRhnMb2bAGnDI1aHUxK1oNv
	SrSAZEZRNsnn5rayhAB25gf36kCVhfAek/xpiRMyjKB/ZeMSW7lw1qpf9PxFw28kWG3rXvMJ+JX
	gIcsKEG1KMreN/KFjkt2QWSLloONqqsWy7k0rVA+PEHQKTWPDj5QIvcVeYiVrVtubN2ZZ4Rug6n
	FbHCAJmP+LxvjSNOFZZucBRvSvSFvf6ao=
X-Received: by 2002:a05:6000:612:b0:47f:2c3a:83e2 with SMTP id ffacd0b85a97d-47f2dcd1a1amr2066423f8f.3.1783764713826;
        Sat, 11 Jul 2026 03:11:53 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d6e4csm63962740f8f.10.2026.07.11.03.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 03:11:53 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:ASUS EC HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 0/1] hwmon: (asus-ec-sensors) detect unconnected physical sensors
Date: Sat, 11 Jul 2026 12:10:35 +0200
Message-ID: <20260711101143.571191-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2 changes: make temperature_blank_values array const.

Eugene Shalygin (1):
  hwmon: (asus-ec-sensors) detect unconnected physical sensors

 drivers/hwmon/asus-ec-sensors.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

-- 
2.55.0

