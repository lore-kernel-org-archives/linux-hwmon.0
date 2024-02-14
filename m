Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB56113B799
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 19:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707939832; cv=none; b=iev/SnE+gnJjxstCMNivXxeO8vZ8ZyRJf8s9fmM9Nu9Ik82UDTQU/Tgak5qD9Gj41q95ESOGI6aJMQudV2Pccse9WvtzKmsJMH2YftTxxgSPVB3fXwWsjk5tcDvb7GULrFpKcmJRFq15HbVt++PjXUrnZ63bYX7ORAB5Z21k09s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707939832; c=relaxed/simple;
	bh=d/ZfKUCK7zoN8uFsafV2+ScbSXkfSSjHiC23tgLMr7I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jHMU0zEt7m1KTCKnaiweLICGaYYxvu3+sEK36rjKENyj6AubRstoH+ZvxQ6sR/5IPpqkF8MEIvYgIkAEylQW/+zGe6sTdAMvamcGTX3bjVnBBBBf7qqAnh+Lr6aYVOy9UzO7wzAsOitt1u2ZB9Pho/Om0jh9HcKOWXVZr+KERj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eDQoHbOJ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eDQoHbOJ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d94b222a3aso944375ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 11:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707939829; x=1708544629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ua+cZ2NYyEoYQvSxeWhHvJPHy33vqt/xFqDA4lURIjw=;
        b=eDQoHbOJHyx5KM4f5CpWQiF+FfzzHfPKP00xEyXJaQyyI8Ilieoypqu07ZeLLB8Xhy
         c7/HuGJjGLkchDub3mQE7KnZcL3qkTHh/cTXMiJhrRhpKVHyvjy5GQF/Xbxw8EfcR53X
         PvVT2r7zRt+rVkecLLC/EBMxkv67JYEzIQlafA26k3LVvgTLwzl7FVjd+sIrtGsb6y7Z
         7UndKyy+hURkFM64XeLJv58Qj/EL1VT2Bt5DbFrTfGQGg+Ely0DWsGGjnfLMLGgKgyOX
         POZ2gFVwVTk2tCouXQNQhh4pjECcAis9WWEErGRn5tWpvo5+sgXUsCjscL6AlQ1QXjQy
         VntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707939829; x=1708544629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ua+cZ2NYyEoYQvSxeWhHvJPHy33vqt/xFqDA4lURIjw=;
        b=RTkY5ZyVmz3B+RaKRREYigN8NYEk7exrdhmCIOuyfBF458LB7z4bRA/WAYiKWAc4wU
         z9P5+W/54EI4TwmQEvfEKbpijseoND5kCwIfXAHh+5gZ3y5cJgAz9FXKm+MbIKUfkvJ3
         vh27lwtoR3JlnfmAC3oaKO8jFsLYESMfszL9z71uc2grrbxNSyt0lBTb9Pwm9sldqbFU
         V2FZyovkWPzIx+zk9URN/G2uGTepA34AywE579ZF4/XGQFcrrDikd3rVY/Jlk45SMR4P
         KhQBfjp0jW7ITf+o57xIvUxFaDvNUdLMLjkn5ajr6H9NOpWBo3zcHr4MSqmTY4Rpol+B
         859A==
X-Gm-Message-State: AOJu0Yw2WkA7ld24nA2tCisooPgI25S70JfpeH3aqltROTp0OTxdCxlr
	dOT7+39D2LCuyelGGt3cH5jCIjYeImCfRtUuRVt/ttApjp3g49EzR58BBIiM
X-Google-Smtp-Source: AGHT+IFWS3IzpNs5Cp5oNKSKeyWmK2lE01OT0l7l5q5uKuXuPvYLtylafh0CS++pRAivS0vGhvSjzA==
X-Received: by 2002:a17:903:1211:b0:1db:35b5:7e3e with SMTP id l17-20020a170903121100b001db35b57e3emr4751288plh.29.1707939829409;
        Wed, 14 Feb 2024 11:43:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXFLi8j5a/qxrpWwdlu4x+KCMOOWzmN8ehcAJUEel5+DhXE4ooi8qzb47tEaXgKMZjrXHdP460T0qe12ezosV6qx6TafdU13tI5ZtpZE6CAB80XkU+gyPzhN0BHKybnYIToAr8XlsZDP9CGFDHwhoQFCqTN/AGaGQfB9+iPd7pN
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e13-20020a17090301cd00b001d8f2438298sm4085488plh.269.2024.02.14.11.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 11:43:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: [PATCH 3/3] hwmon: (pmbus/ir38064) Use PMBUS_REGULATOR_ONE to declare regulator
Date: Wed, 14 Feb 2024 11:43:42 -0800
Message-Id: <20240214194342.3678254-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240214194342.3678254-1-linux@roeck-us.net>
References: <20240214194342.3678254-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a chip only provides a single regulator, it should be named 'vout'
and not 'vout0'. Declare regulator using PMBUS_REGULATOR_ONE() to make
that happen.

Cc: Conor Dooley <conor@kernel.org>
Cc: Naresh Solanki <naresh.solanki@9elements.com>
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/ir38064.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ir38064.c b/drivers/hwmon/pmbus/ir38064.c
index 04185be3fdb6..69e18cb468f6 100644
--- a/drivers/hwmon/pmbus/ir38064.c
+++ b/drivers/hwmon/pmbus/ir38064.c
@@ -22,7 +22,7 @@
 
 #if IS_ENABLED(CONFIG_SENSORS_IR38064_REGULATOR)
 static const struct regulator_desc ir38064_reg_desc[] = {
-	PMBUS_REGULATOR("vout", 0),
+	PMBUS_REGULATOR_ONE("vout"),
 };
 #endif /* CONFIG_SENSORS_IR38064_REGULATOR */
 
-- 
2.39.2

