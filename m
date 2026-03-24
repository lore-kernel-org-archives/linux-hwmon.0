Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE933F7E6C
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 12:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354907; cv=none; b=UnipOJJCILDbuE/9f+T6EL9KqRocyL1oT8kW933bCCOvWWd0fw4TTHhb023hAPn06QsNGFp1XWytoO+gJ1Lg9vsCw3ynzRAQ3LtMS9egmTqQPsSw68t8kdPR9qcLB0ZGPq2v2GFrVxsDpidXK/RtSodDmfdDS8lbTyXS+/J1GM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354907; c=relaxed/simple;
	bh=WaY8VA+nf3RFgcpab7xjAIIY3896A3XJIbzzMAno0dY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=tH1I0gNTcXZ/twnF9sZLOJP+wlzLoRknw49n5vCFa6o83IFQjhBpEWGz/+X8HidmYuYgX90C6DTTpgFP0RXzW7pI/HcbMF3AQHYm20DZofEz8aBN5Rjpr6Jlb+UzWMMHXsJf9/50Kul3E9OT6Mvz2lYUb5c2zacrfY5MTqFCp6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+EsBxAf; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+EsBxAf"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so2536391a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 05:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774354906; x=1774959706; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8wGyax00Jc300F8XlSPyGvsy9TDxm6JUE4CSraS8N4U=;
        b=O+EsBxAfy7rk2C806V7RJSh0W5ldGrt2jQYpUaaHUCR9Kj+LlcRmBq9nFeYhS662Up
         HzZKN7HKgRra0+uis+ra0WpY0mYVeo1J9Vw/i++ho+64n+o2hq20YrFyXJtDBcXfYYLu
         LsE2zxxX7S58XgvPua34fJljQVyzwgscm7dvEVkR/2AXAzPdhNhjekFeXJJoZi/eLDhI
         L/k6sMapd3S0K6D+O5hglL47UuKIDa5dmIG9arcYua5i/QEFC1sN4nGFOenM29MguZxq
         EGwvsB7PJgytecgDmKXRO4o0ADBiqrhilBIYREMpfMZ7ucdARo9vGjgFWf36wM9208yD
         Sshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354906; x=1774959706;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8wGyax00Jc300F8XlSPyGvsy9TDxm6JUE4CSraS8N4U=;
        b=dPSsBEy5KghlB/REp0ARThOXeomVEU+HhTH43E6PfEuMnVK8Q0DJHd5AtKBSZOcEZn
         Krp/KyunFMC7MkuOu8EcBoBCDyKkLN99nNXEOCvrufGYn+d7I6WGUvlnSTVLQOA2Ev/X
         AJs1isNl6Yxja90nqeQyxfkXUb6mjqqg8lHbh81fdvOXJnUs6N3ETAYI3j7Pf2SBHile
         OLu360tYjLuz/+57kLzoWtM7JlHETM9WyGpJRA0h/rEJhRtKQJdpAxo+v620+LzrqUyS
         Qp1UfPPK4mrg8HPYq6aulCiQcfCnq8yUAtA0nGJUosI5+732Hg/+5UB9h/d0kW7aGga1
         +ovA==
X-Forwarded-Encrypted: i=1; AJvYcCVE5zLqI51uDs4yCQj0Ioq9rBnLpvuyKatQg9QQ0ZeBI/fpjlDeDdgw37cUZOQi3Xcw7wai6hoKtXBCAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjLmMqm172y/8FGrimsyDXNiKxXDwfmUTAQo78MROlay3mQWXy
	6XunbdWjHtrShG2KiXFlWkSTIhTaCDGyLtfGmN1lj66KGUbfal/AGkGm
X-Gm-Gg: ATEYQzxskTfRBnR9D9J0vKc1eQ4qr1tIqVNPicvMiddeTLi4Lpvf4lRAl6qVErN5ApM
	rwcJGKnNanyvra13wPupbTjE2UFuC2k6POXZAfXiBd4bW/LIquM6PnC2jYgVVZc0z7NRkLBtqb8
	MT+vQ1rUmBSiyM1oHSvdDI/7wbIY+0TCh7s7bhrgrsLDvvlIrbfW0xKIFQsDGRaNXQJBQuP2IdX
	y7bKh1+V0/LPtprua7V97lCkz1jrmG+7zWQonpR7HXXjvaq4evUNbdUmPHB6UvHMEdkKh1byf0u
	RdoCCs1A0qCKpY91mU0pV8aZUfMtB8ZDJ5hyGbrpClFOgcR2pT7y9ueYmjl9SQQo+Td6+X0TusS
	MQ1+Dp7CxC74/lz0fg+XbPoa9S9L0gBxuuK35v8IwXOHMbjXLCAGZ1JJLJi7nf0PYI3vAPjjf8D
	xF4GlVu7NcInKR9E+5bmle/tvt0oU+GyArTBVDLWBDMBlCg0pUibfgB4dIjwQOrBs=
X-Received: by 2002:a17:90b:5390:b0:35b:96bb:47b5 with SMTP id 98e67ed59e1d1-35bd2be5e99mr12538215a91.15.1774354905768;
        Tue, 24 Mar 2026 05:21:45 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74443ccbe4sm9904920a12.22.2026.03.24.05.21.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:21:45 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v3 4/4] hwmon: (sht3x) Add support for GXCAS GXHT30
Date: Tue, 24 Mar 2026 20:21:09 +0800
Message-Id: <1774354869-119736-5-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add support for GXCAS GXHT30 sensor. The sensor is software
compatible with the Sensirion SHT30.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 drivers/hwmon/sht3x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
index 64404fe83f0b..0bb81af4396e 100644
--- a/drivers/hwmon/sht3x.c
+++ b/drivers/hwmon/sht3x.c
@@ -934,6 +934,7 @@ static const struct i2c_device_id sht3x_ids[] = {
 	{"sht3x", sht3x},
 	{"sts3x", sts3x},
 	{"sht85", sht3x},
+	{"gxht30", sht3x},
 	{}
 };
 
@@ -946,6 +947,7 @@ static const struct of_device_id sht3x_of_match[] = {
 	{ .compatible = "sensirion,sht85" },
 	{ .compatible = "sensirion,sts30" },
 	{ .compatible = "sensirion,sts31" },
+	{ .compatible = "gxcas,gxht30" },
 	{ }
 };
 
@@ -963,5 +965,6 @@ module_i2c_driver(sht3x_i2c_driver);
 
 MODULE_AUTHOR("David Frey <david.frey@sensirion.com>");
 MODULE_AUTHOR("Pascal Sachs <pascal.sachs@sensirion.com>");
+MODULE_AUTHOR("Zaixiang Xu <zaixiang.xu.dev@gmail.com>");
 MODULE_DESCRIPTION("Sensirion SHT3x humidity and temperature sensor driver");
 MODULE_LICENSE("GPL");
-- 
2.34.1

