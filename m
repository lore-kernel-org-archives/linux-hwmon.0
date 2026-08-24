Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB8D37FF6A
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 17:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787593870; cv=none; b=MQRtUR32TN2ugsRhNq7uEcW/aM2bRZwf4EY2o+J5ihqPpwqsYbrkh9ktiqr1Z6rZZqbOKdJB01KNZwrFCzCtxHVEuFFYbGktv8Vvdy2aNtiN79ytkDGsDiIHvrzKEhtgf6QojrzCUpoxCKTTT/GrShpnVrz0JnYB7Nm0j2oPBQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787593870; c=relaxed/simple;
	bh=VylVE97urOnGo1fKhA1IwM8dNjVc6rVPycHxhapEvGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pC+khD0a8sBvxepIRkbtsLfE0ZDJtOmXYrMs8Tje8kHqCn1dk5nlBNeoCEEXki9AakJojdgN8R0c55ECW/4jGK4Bdq7NA87G41BuTP+7KY+kaVDye+mv5sT4HwTQ/U4gTyRKyhhn4mS1Yeprjf1w/k8DqECqgcuKKnyvneBkwmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZNEHqdq; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZNEHqdq"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39266382df6so3121286a91.3
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 10:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787593867; x=1788198667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mP6wFrKPhYjd/5KHULwyWUdonzv0xy3jN9195/5g2U=;
        b=VZNEHqdqh73dRJ90JBI/k7ctacPrY2CRjheyuT18bHhSF8WwaPi/E9UAMg63NnjK+h
         R10VcO/NvmDIaFafquDJQJcC21crhJG12B2+r6F3iKESkA1Tvo1v4ykiswng+vkvMUJF
         hXJpZr075UN0KQGDyEkgu9qhtl4UlBfxno5PO08Rk5TZUuGPqyhh2MB2700umXN+/iDZ
         qEJ48N+qzCOW7/Lc+DPpOmK8zutSee9Q+m5Rl1K8hdSr3Re2BbQqdfiNS/rx7RmEb4S9
         zczrXZKg4sjyolnfL7nGkVt1d5aFlFVVMkO/xPFKnkdPZ/da7bAhhQlNctP40DKsGiko
         VM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787593867; x=1788198667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5mP6wFrKPhYjd/5KHULwyWUdonzv0xy3jN9195/5g2U=;
        b=ZRbL3nllGXBtKkkwlzzp0npLUiOwafG0opXVn6zyZxjx33U5JK2buLatgU4T8ncvna
         c0qycev/K65On2RHpxr8Gq4lAUHq4iP+Z1Uk1v7J2iKLVeXvcv8/wy+iO11aE44jn/Oz
         NxR8aBfqRHcueO8BC+UGI8p8KaA7uNfQDMt9ZfukhbCRsDbSEkE4Rpr0/ocNtuefHvIz
         vznWjJjco7g0/aU+LLygh9YJJ+a48eI+20qPjZySFzlk5x9WjJWEb0Z3uMI6HP5URdIz
         RcxPA7a4za99JkPSMmmqErVYWWjwKRt3FSfJPZtuk86cEECm0NvWOTjUossbO4jK5/Tk
         LQSA==
X-Forwarded-Encrypted: i=1; AHgh+RqS0j8UhT6VwpkWJK4YgB8aP3fikLrHwB/aVNt+8Gd4MfPmReNA6oBrZBt0aHH/GZzRG5TNwqnzsYNVqw==@vger.kernel.org
X-Gm-Message-State: AFuF++mC1Cgut13q6Hzbj0g7Babci1ihxUbxOSi87t/qMGM0K6twJzGA
	sIX7JyJUzzXv1eNnRgrumG883xTUxGTy9UlzH9UVn9jLDwEMNz9NqNZL
X-Gm-Gg: AR+sD11SPaNvyj1iqc4gf83IqsdTnGL+JZbu9uVkX9EO3k/ratt08j8LIjJnnytEjA+
	b31a1WtnI2K2Qoi4jGJjjRsskeogymLfZ267z+BTisxDcw3xbHQsCT8BthAWjHMvQp2PgLJxFM9
	sRr8sP2yU1GhM/daNuR64CZJQyxk+uLeie2cUfWvi6JMCtjD1U1ZPf7sDqzwP0v6kapOxuBcBFQ
	ov3V6lLWQQNjohGb3glGrqIAQduNJkwP9AFekdRJo7AqmM9ddsY1M/UarI7oHP/vWhMpW/+y+wm
	zOpIiC11WQUdVnOWbcWNe529vsqa0AQmI2MqOH+Z0shyTK63bwg68sQRwiLtaeOupB67YBPpiVs
	AvdRoSKrLiVbpUtWOf9UiU+kLvg+0Z7kUHTUDkqLb0s9TH+CSnvWi3Xv0J4X1ZRPm1YWWAVJNck
	7q8IzQEVbLsz/w8jBG0ScmMa9FgXxwtkIjMzeFA3YUr24W01933VKjmE8A8tOty8cMl8s=
X-Received: by 2002:a17:90b:4986:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-395c33cf295mr51309257a91.6.1787593867050;
        Mon, 24 Aug 2026 10:51:07 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:ddd2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141861732f8sm26815132c88.10.2026.08.24.10.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 10:51:06 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Simon Horman <horms@kernel.org>,
	Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: kernel-team@meta.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	zinclim@meta.com,
	Zinc Lim <limzhineng2@gmail.com>
Subject: [PATCH net-next v2 2/6] eth: fbnic: expose all hwmon attributes unconditionally as read-only
Date: Mon, 24 Aug 2026 10:50:55 -0700
Message-ID: <20260824175059.2485048-3-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824175059.2485048-1-limzhineng2@gmail.com>
References: <20260824175059.2485048-1-limzhineng2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All fbnic hwmon attributes are read-only and always present, so
fbnic_hwmon_is_visible() can simply return 0444 for everything
instead of matching on the sensor type and attribute. This also
prepares for the threshold and alarm attributes added in the
following patches: they are exposed unconditionally and reads
return attribute values.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
index 6c8c66ab86c1..38bb26cb8e6c 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -20,12 +20,7 @@ static umode_t fbnic_hwmon_is_visible(const void *drvdata,
 				      enum hwmon_sensor_types type,
 				      u32 attr, int channel)
 {
-	if (type == hwmon_temp && attr == hwmon_temp_input)
-		return 0444;
-	if (type == hwmon_in && attr == hwmon_in_input)
-		return 0444;
-
-	return 0;
+	return 0444;
 }
 
 static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
-- 
2.53.0-Meta

