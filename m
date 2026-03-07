Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F413D1922FD
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Mar 2026 22:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772923568; cv=none; b=ldDZ72xEpxmS5G42M2Q3n4cs3JHmO6LZyg9DHKKM3xGSCVYmX1byIdmfFW5qxYfu2731XkHIO0jJR1GojesALRewZQdwcSopsOxZNG5QUSmOyDgCLT2kTF8T7wdCFTcynk9FnPP3ETawdldWmTaKKJtaSX7HpVzV4h4d6kDtDKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772923568; c=relaxed/simple;
	bh=wIGWkI1QDG6glLoqXS+gCGiTbBDzVaUNZK+DMGi8qHA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vo4x7j3YRoVXP4PdxV0QQ99rFRGvuaIWqGshNl5w7LqCaEPlFPUmCJcJF5/ZkLTADKdGBK39BLjWX9Ykamb8/bzwYfsAqsB9e9BVETr8BGhqmITKQN7VTDwcz18z8R0wxHaMg39qi4u/dgpWyEGrn0My/7o1VQ0WvrqIBz28Lfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKSFOjGU; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKSFOjGU"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso6341977eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 07 Mar 2026 14:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772923566; x=1773528366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuUKiCvw2cY0TU2tw5tHwYbi7/V9LJph8R2kpSjJMUM=;
        b=WKSFOjGUfD1q10VglSVfO61j1xX/uraJWbFv6p7xU0ti7Fd/TGXodoRQhLIzIKTR0s
         DzxMpk3kipUqKDMP3j6rpkkz00KHMo7Jbwi6soMLxJIFKFLus8yDNWT+6SSrMo2RAQXJ
         nIwjDTD5yykFxOFSbsXxySkaGUO8pMlfZgVeDG28kxHfSDMKcTD6kLnN4dh4JYrSrQz1
         yfx204fVKnzCn52Kf+CpT3QKO10ZNEsQ0fCDQoCBWFGC3cGyAxtvaVTBqUjd73KhVcqA
         Gg4aeSjlgwYxNwHjaXglFfLVrFGjz5jeez1U1uaaXgmENJ4z3gcWDIxV4cKyTwY2RqeF
         6APg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772923566; x=1773528366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uuUKiCvw2cY0TU2tw5tHwYbi7/V9LJph8R2kpSjJMUM=;
        b=OCH3OWTLzj0EqVLF+EV2WncrwWC2d+WflQqpzIyzMCjTN1QHH5+3UfxVSUw+2o+9H2
         HJiz6sxZsIDUKVLGQXTLk9ABNWaWBjusQKESQyqObocgXR8CKojp4rwMDS7+hpbmJ10I
         X/1R74BIJcqvRoVBCClYO+0RfK2Hth+2j2fiJRl6iSCUNfNDOVu8Xo+pdTH2mIb2q6DZ
         ofK6fv5jL9oMm02sdAx0T6fBD30yP3opps3QDzkXtVZvuvY7/ABshPXFkyYiebE1qYvW
         zp8psJhpSKBy8Lm3PZcQys+PvdO0Ddu3t+8tRJb22omMO22RrWfY1ym+mMDy2VEgKrcm
         i0zQ==
X-Gm-Message-State: AOJu0YwYiHWiaLtvqct9LlUEMJsAgBg0k+NoU8Taqs67IFda845+pe0j
	NU3Mqt8rP8RNUJLksnhF08bLVOYEcex8sRwNTFAuVh+CbMIEJA91CqdHsp/g2zlq
X-Gm-Gg: ATEYQzwudGscqtxbD0hJxVD+YIm4xe5kbD6tkVmq/iIpy2hjuEIz7V8Cdj2QZ2/EPpm
	S8qU2gbzTqOw4JcXAnvoeBPtZ3/ZZnFsmF6xWLZb127HUKLCAMmdS2jRx0Jpi6NpWbEHcsZuGhy
	qM7MS1I4p3ypDcPwV6j7p9SYlRRbgZjbBIvtAB9RiNMhnUkH0HIicSBUTsOpmb7WrSHgsDybK2Q
	PO02HEL7ZGe5CFGwS39c4fWJJqMHOmlqtKq+KsKx3T3UDkjURcdF3qa+CBuGli2bYPDDg+oyL9b
	xK/7v+N7IvmBZBk1nc0NVoIth2wNaIcDzl2n1SNy1SdqeUEAPpXavqdZfPUK1EsuNGp39r25oSq
	i7lKMzJoSOCZ0PiCyHslBbckhWNe4zYWmKsDKG25tlxaB1970C4yrdsqx4CG7VpAoAiZu8Km6bD
	W6xW31/erTcbnEaziwXKXES5Fuv1th7r7lVOtDfzUKcioWkT8NFXXiCEppLgZHkzay/GER1sSUX
	Uc5KYw=
X-Received: by 2002:a05:7301:fa0d:b0:2be:514:3697 with SMTP id 5a478bee46e88-2be3e62e57fmr3603579eec.13.1772923565968;
        Sat, 07 Mar 2026 14:46:05 -0800 (PST)
Received: from localhost.localdomain (c-67-164-93-214.hsd1.ca.comcast.net. [67.164.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96aec4sm4857344eec.25.2026.03.07.14.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 14:46:05 -0800 (PST)
From: Sanman Pradhan <sanman.p211993@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH 1/2] hwmon: (pmbus/max31785) fix argument type for i2c_smbus_write_byte_data wrapper
Date: Sat,  7 Mar 2026 14:45:19 -0800
Message-Id: <20260307224517.38316-2-sanman.p211993@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260307224517.38316-1-sanman.p211993@gmail.com>
References: <20260307224517.38316-1-sanman.p211993@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanman Pradhan <psanman@juniper.net>

The local wrapper max31785_i2c_write_byte_data() declares its data
parameter as u16 but passes it directly to i2c_smbus_write_byte_data()
which takes u8. Fix the type to match the underlying API.

No functional change; all current callers pass values that fit in u8.

Signed-off-by: Sanman Pradhan <psanman@juniper.net>
---
 drivers/hwmon/pmbus/max31785.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 1f94d38a1637..50073fe0c5e8 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -55,7 +55,7 @@ static inline void max31785_wait(const struct max31785_data *data)
 
 static int max31785_i2c_write_byte_data(struct i2c_client *client,
 					struct max31785_data *driver_data,
-					int command, u16 data)
+					int command, u8 data)
 {
 	int rc;
 
-- 
2.34.1

