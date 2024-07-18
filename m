Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B7729CFB
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 03:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721273981; cv=none; b=nI/b2dqwWX3Ivw6yChJxTapJvPmgLPI1jMfU5cQfCq7v9d8OZWifNtD4XINKSyQRcZyeCDEP202WJt+1j7EipJg8QwxR2pt8htlWZZjT1npPY5TGXkly7sK1Ge5adtjOUCJ2gRt4fOsnwUlz0n7smA8F/jgsUkqxBDbUyD7gUp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721273981; c=relaxed/simple;
	bh=sk9+PYoYK8TaXqdxaED5RtC1u0sAk0lar9OpGLUkXOs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UpR3Q2yT+0MSGZOi7hicjF4B1gf7mUj9znzKhrOD0DJILZhl9otMzi0WqlXmeDgsDlOJEMq7WvYPdc7MAtw6kuPYEqv7OgYr/miENBScE/ys7nbKUefS6gR4XyiwCTo7s/sKAAZE1BQeHbzz+ZqWpLAzMH41reufgt+rMJby1es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8s6YRoQ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8s6YRoQ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fb72eb3143so1907165ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 20:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721273978; x=1721878778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=TjrD2qHQnShBJo7gJkoQlSXQkUaM9xt75JKT4GQZ4ZQ=;
        b=K8s6YRoQu+fpJT529V9MUkTdowQBH/iW6nhLOzaBoeE5lpMN6NSo0SvnXOqMiLUnRZ
         gNZcGK0/tW6Nqc5523u7fTNnFRuGGKU3vKRewNemz+7U0XjQADzIVYS8aXLYP7gnaYPr
         qR7abn/wTjE8AoDnxen9o37UVS/X/pQDZLfxn3I9k7wyPU/rQuISMYr3ChcnC9u/03Mo
         skzm2SI3VlaCcdrtevr09q3tW/Sl0XtjhvMrjRKQxvvMLxYSgZriBdjcF9mTaspRIoEx
         9AAVSr12plg5GygTERDLZiDxBonlfdTL1fG09TKbBeA9C6rBtPP035ZpBGfcbsLJ+luB
         sNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721273978; x=1721878778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjrD2qHQnShBJo7gJkoQlSXQkUaM9xt75JKT4GQZ4ZQ=;
        b=Ahwk2BXh0nnDIL/XtiZhF5GTN9LX+QbuGPzXfurrTm5oaG6BS7uN/QPbi4U/DYNAGS
         QW4S3kGYMPncaRTzfM4Q1i1bRTg6MvqF0I03oV0NkSykHnzUWNIhOCiCbcqnrcYIpAwi
         IhgALT0K9ouK/sSPwlpRzvRzIymrRvn0pDs/GUvpAI/v+47i8SvOqWyNKIIm8IY8h6Zw
         Uav2MZDPA76nYHY7Z7BUBZqaeY9a9haCRkiIg/WyrJZuMBeghtovvQp5wgPdCG8QtDUL
         sknPlrbupmQWuZVcVpnReg6HJgXRN7y6hf0Yu2cRZEdA90j0HcNlwEt+bqSt7Qny/pBk
         O3Iw==
X-Gm-Message-State: AOJu0Yxlm7JDnk5qMIMUdacECHFdaZGblq/3ULjzaxOUWI1elT8LKnaP
	lTS6PGPCJh+pQ3O01XNjN7ggmu/zs/gqRLQ8EwU3YMxuLHY5o0wxg7lo7A==
X-Google-Smtp-Source: AGHT+IGDz5Z3xb7VyJ4NISknZ2pXKsl7OfhlZKxB/+tFLbXtZC5E0HX7MK0ruMrshT1ZGIC3xv6RzA==
X-Received: by 2002:a17:902:cf02:b0:1f9:e927:8b83 with SMTP id d9443c01a7336-1fc5b584af5mr28479645ad.5.1721273978411;
        Wed, 17 Jul 2024 20:39:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc5f804sm82905825ad.308.2024.07.17.20.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 20:39:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/6] hwmon: (lm9534) Various improvements
Date: Wed, 17 Jul 2024 20:39:29 -0700
Message-Id: <20240718033935.205185-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up driver, convert to use regmap, and convert to use
with_info hwmon API. Finally, add support for temp_enable
attribute to support enabling or disabling channels one by
one.

----------------------------------------------------------------
Guenter Roeck (6):
      hwmon: (lm95234) Reorder include files to be in alphabetic order
      hwmon: (lm95234) Use find_closest to find matching update interval
      hwmon: (lm95234) Convert to use regmap
      hwmon: (lm95234) Convert to with_info hwmon API
      hwmon: (lm95234) Add support for tempX_enable attribute
      hwmon: (lm95234) Use multi-byte regmap operations

 drivers/hwmon/Kconfig   |   1 +
 drivers/hwmon/lm95234.c | 869 +++++++++++++++++++-----------------------------
 2 files changed, 351 insertions(+), 519 deletions(-)
