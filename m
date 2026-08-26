Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A14D2BE03C
	for <linux-hwmon@vger.kernel.org>; Wed, 26 Aug 2026 18:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787770095; cv=none; b=fTuwhMOLOb0hy7z7d9ly8h2MHF74oxqICFk4FvP920ykIKPGfKVh1F7IHqLATdEAA4Rrg8uaLfhFfROhot8bk1pBlXxGnNUSLPOVB0QZkNch4ugPf3pg7d7t5Fjdo5KtWdqXikE9ggqfX2Y3D0WRusk7fSLZF+Mcp/fTbX/844o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787770095; c=relaxed/simple;
	bh=3zTrUNP97wjygcEyxUmUMs4ernWyBlapMobTCcEOsLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mnSBsavL1363lDla7Z07+2u1wiv8ik5KcE1kWzsyEcHbYI+Ii+o/mLEvnkpVuGeJoakZ69uqpe7AiotUupjckJ7pgTX1PbqnQ1XFiLVFqzAj0UJwT23AQUu4WvYVUdN0hpMa76PL1G9Nq1kyx0X9OxQAzcAl0hpvmDzlSNAWlK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5LWND5o; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5LWND5o"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1712a04ddaso201455566b.2
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Aug 2026 11:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787770078; x=1788374878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNGuRramHsyQedVrqROIzZg6iP7sI/lSPknDcuWVUUc=;
        b=h5LWND5ouEDslBg7kR3By1Nd6rW9nS2zBCTUjBfNhU+KfI8IrzPndcYemsqZg6Q+nU
         wN/r2nP5LILJsZeBFvHP/ZzDHCtQSmInciJeQYHkxaoBzuezuODM9lbSgn6t3/8z051P
         QJfB6/7ZllyUYLjhBmFjAHD2+00GUSSKuexpR795IKNisRUqeYWWk+fXUDJ1520sKjDP
         1kY4nP+Lz7whfSKEiQfozgAhRSuDWhe0m6iS0asQuqE+o0bl31G3GN9Y1ZrDtAFh199N
         gLHwfyx71u+ecnWFqFkgFYdgXC0rIJ7TY8RD2okHKDADZdhcyYCrlN9YbPChLOjlbyfC
         vP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787770078; x=1788374878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yNGuRramHsyQedVrqROIzZg6iP7sI/lSPknDcuWVUUc=;
        b=b2cErqsFdoeiK7mTmKPxVVhrmZD+I54FgSUYBblvbE2QJM+WIJXP+Ext1GON0Je8Hg
         3qbvdnhR+bzO0gIWmH4AheB3jKaTA6zmaMpuGsc+a5/YazTG1CVIo3yr1ZbPonWUoJho
         1iWHmkSFgEUd5OafbsdVqwSK6e9ZFR2AAOIj/E2gDjuA1bifxjsLfOA6XLMgjsfhNuur
         TcsjiwyX3JL232Mq7hMm7XsyZtszdQi+D+4HOvjsOZI5DTM0mutrhmjxC2MXciHomnWA
         81yevdk5v3c7sPG/86j/lO4Uarh8J0cJHHp76hYTEgxXPo0VFAi8VeG9+WTKOqC1PnlH
         VNxA==
X-Forwarded-Encrypted: i=1; AHgh+Rop3GS3gzSAapD9oXt1T/2hEpMtUSVitc8tODEmQ57UNvcKfij9poC95QpByXkTBm9iDMly6ZoTWMoy9g==@vger.kernel.org
X-Gm-Message-State: AFuF++k/9k7zlBmOPYkl3eRE+KP1kozdXjc696GZqHtWCqQLQ7tUmN7+
	LTmx7wjPR7d11enwgC4D+yjBKGjkK00zP3tTItSeKBjBSqaI3vL1sUIr
X-Gm-Gg: AR+sD11NKW79CPKujY+JTZepBRckBol13sYCubF195pdOqpEKPpPAijm9RUw5G1p4Ul
	XF7RP4p6Qv3bkuLHNpBNIJtsVTRLwgKVfcxzskgBa9TshuilHi0VzmAD0S70vFy1+yuG2slwZQO
	oAh3tpPBFFvBSio/Oq86v9mN63hQ9OJrvF/2RGwLbqOPqpBG6HQFH8il96txm+NmLYScf9F9Kvm
	ZvXyA+8k1CaTqAG3fvDx5JlUM7xXU6El0hgRgwjHOIBXhIaATrlk5SEg9VnztNcm/cLN7fO4xds
	v7tOJ8ifzarcNjissFc5V1LBsx13imgbPnLtcZhMPunHOEQKASRRQeaaGPkG9DUF4Bf4z6XmudZ
	+t1wHAGrv3H5MkDS42mjLjwTNVtlfnARuQ5Z1GGaNvPDfZW4qBPV9KFm949eex2N55EiEW+U+X4
	E9v0hltPAZJ4va7hMgxCdYKDce6d2tAwvCEXsmbct/P4VZzSy6LbLc2qU48h1QWL1LTBvuisBFk
	t8erbF5/KTbuurQCuaL15J1mipReCENTb56n9dxhhxdzSTY
X-Received: by 2002:a17:907:a713:b0:c21:8a0f:56dc with SMTP id a640c23a62f3a-c250c449b8fmr1129537766b.4.1787770078207;
        Wed, 26 Aug 2026 11:47:58 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.67.216])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2533945d0esm114523366b.9.2026.08.26.11.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:47:57 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] hwmon: (lm90) Reject channel 2 on chips with only one remote sensor
Date: Wed, 26 Aug 2026 21:47:49 +0300
Message-ID: <20260826184750.4798-3-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826184750.4798-1-flaviu.nistor@gmail.com>
References: <20260826184750.4798-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Validate firmware channel definitions against chip capabilities and return
-EINVAL when channel 2 is configured on devices with 1 remote channel.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 drivers/hwmon/lm90.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 1c603272538a..3faeb2c6ab01 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -2712,6 +2712,11 @@ static int lm90_probe_channel(struct i2c_client *client,
 		return -EINVAL;
 	}
 
+	if (id == 2 && !(data->flags & LM90_HAVE_TEMP3)) {
+		dev_err(dev, "channel %d is not supported for this chip in %pfw\n", id, child);
+		return -EINVAL;
+	}
+
 	err = fwnode_property_read_string(child, "label", &data->channel_label[id]);
 	if (err == -ENODATA || err == -EILSEQ) {
 		dev_err(dev, "invalid label property in %pfw\n", child);
-- 
2.34.1

