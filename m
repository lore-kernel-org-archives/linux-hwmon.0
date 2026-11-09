Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226317;
	b=oZGAkfYVOMgq/5f6P04oPu9fy0byL37/JwYhAod5Uc81A+0al2U9E3ZUxi+1SC5YP9EG
	 wSclgSLcdlh7HejZnDa6jTIFTtOw+aCMxBHMqaK9ejusj65fGeoEiUgSaczB1Btmvq8mN
	 QmyMhZe8DNt546xByrE7vt61Pk2a3qOkOE2mzR8Uk/0r8t8SpRCp72kpnU5Wh0bjqLlA+
	 +voLLQS6FYX1LZJiwJJLgIFhRgr6awXMS0YXgi/LVUt1WFVdaMai0VcYeWvWg2nQn5tDw
	 bBYHEGkBwJmfT70Swl98oWhARdVmsK/t+1yAL6nQ+6Lb7U2jgP3aeGHbUOBvIC5aQEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=rOoAO/cKnojQ1mjIUDSYzy80JHx2s+cP2ZxIueKDKk0=;
	b=P2iTU3mABooMjNZt43IiCGQAqoov+8BLQZb1XIa1YVMPec9aaoqy/dx5rO6uHavSOMmf
	 4EycLa9xoFCxb8MaQX3XeUxX2riQ1T51+TlWD2XRV+fGx5GAaVCa/qQEUTfFREzp/RV20
	 r9bfFWNr/HE0Y23Tyxm5gER3L/BMPKt+nVw7FFHQG5j0sHomtvRlrn+RxrS87ECUP4GRH
	 XOFbVTAkziKBgLOXSAwxXn+Jnv58FD6pME1Sg+GpkVfvUn7KD0Bpbx4KCFUpXVc39InJ4
	 UhoztiAVY2jbf5UxSm4gdJoNXrZJSoNWz2+R/PSgqIYtl/28j6NtizZxreh+mS2wB8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RbR8YWVO;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D2B606A323
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 12:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52D2B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RbR8YWVO
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1438d9363fbso439367c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Nov 2026 04:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794226315; x=1794831115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rOoAO/cKnojQ1mjIUDSYzy80JHx2s+cP2ZxIueKDKk0=;
        b=RbR8YWVOz+jr23GxOq782kbhyAEaDpRxtqVXfsCdQqajVBjiYCGIuNunab9XcHqNa9
         hpjj8tofVmUn7EGJmKlPlS5HCSUMjeG+ex+YIaPlvtRTo95MycqCwnfv78gEPLHLd84a
         UuyslXsJBwWYO8hKZpgi6iNmFZx6Kr7k8hEYIOjOFD9O2nyj9948zVTTMViN475b+i3t
         jwbm+yJKPUzDuL8FlZ03c676Z+S3VicHWIv+yZmx0+hb0kWc3TbwIwYGXfCVkoM6fk+N
         hNV8jeDkbWyUc1iR44AAaGsAYOzVMboResO2FuJy97Lt80Trq/eMIhpqmiD1mOXn5LSj
         ZPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794226315; x=1794831115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOoAO/cKnojQ1mjIUDSYzy80JHx2s+cP2ZxIueKDKk0=;
        b=XII7K//NVI/WzdVclvhZ+3v5d/1DVI1LP30Dk9TMNrKZNarDDdoE9vNb4IKkAtfN67
         elujETsjkD5i2sBz3YBgqKWsXSKjRgpHf5wvFWxYQJiE7kDEYF+fJI1rRwXZ4jQRlJTE
         ySXSCm9fT6jpCkZJ3Gq2+ruahCxgtCjtCMPLGniyZwApcRiHE6abVOrdT4UaaCg8nR18
         Nb7Lj+Atst/AAqY4qdw9kcAjeGNtOFtXBf2mZS7JZ8KYmAuxPis6x+e2b2z0goR2LdeR
         2FLB0tW5+SCxgZxv+/OFsqA76o4HlIQgD85Qr8B2JIJqvEYkHYHWWhRB+jNZ0RpAYcCA
         8M1A==
X-Gm-Message-State: APuU4Z9BI/Jgv3/KecbAzxGKYmXNrSPywsBjCaW1u3nsvPx9Ett6/xDW
	Rdv5/rMRnP5LMeRwzMBB5Qmw6EqDITxTv3e1j879nt/wpyiderRunHnesLsXE/6OIy8=
X-Gm-Gg: AYBFou1WEOhdx2Zne9maFEux3Ego3febWPO3Txg77Oc0BHjWw1ViuDdgdr5ij67XvL0
	fz40Htzgx/Nqk4/2sfklkXzlNQkXHx3CBVr70ZmtHsxRxcvo1hWexz6v7NgDtHCTvGMl8azs5sF
	SgGc8khdOc8MgBf6aFQnKeYO9nknDGFv49Xd2b1l5cQTlW6h5gyG6ThA5KE9HtWpKlwd5YK3Z4d
	Oqojl0Tzw1bMnDAALyWarZHyPaMVI6818Yooala4DfGte7HDf/oAE9ZPkHCrH4Fq82g6/yIYfWf
	GpN9bEh4p8l1PRzf2eb1kSZbxLuCegXFn1FyEf64SVQrrCKPWBaTdjJ/Z3TN9KQJG7uzQB6RmTL
	sukLsvkQwCrf3q3oL8EReFHu9dPX9u4QZKDqwQkV1cdcnvpiTfjlerW7JT3QDEyh0boEXoF4fy4
	5PJoiaHWl5m86Ber0NkvnxPM1QvXIwyoCDXbZ/U3ZC0XR/dn/POC7RnW1LtWdp73PL0NicXh01O
	RgFvnM0AVz4AS0UcU/3G8Dla8KLDJHyTLo4XgVPBgxwrXDqrlwu0PrmDO9FHIQdp5jTIAbawMA4
	WP2ztqHG8LeJWU7OvT3uYjYqOBXdNhe6UDBul/6woiTO
X-Received: by 2002:a05:701b:260d:b0:181:8948:f022 with SMTP id a92af1059eb24-1b39fed1e46mr5037953c88.21.1794226315281;
        Mon, 09 Nov 2026 04:11:55 -0800 (PST)
Received: from evo.www.tendawifi.com ([103.98.7.211])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm16188496c88.10.2026.11.09.04.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:11:54 -0800 (PST)
From: Archit More <architmore303@gmail.com>
To: Juerg Haefliger <juergh@proton.me>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Archit More <architmore303@gmail.com>
Subject: [PATCH] hwmon: (dme1737) Use str_yes_no() helper in dme1737_init_device()
Date: Mon,  9 Nov 2026 17:41:27 +0530
Message-Id: <20261109121127.10937-1-architmore303@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace open-coded ternary string choices ("yes" / "no") with the
standard str_yes_no() helper from <linux/string_choices.h>.

Signed-off-by: Archit More <architmore303@gmail.com>
---
 drivers/hwmon/dme1737.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/dme1737.c b/drivers/hwmon/dme1737.c
index b1bd3682c5fb..c3bf5f4ef941 100644
--- a/drivers/hwmon/dme1737.c
+++ b/drivers/hwmon/dme1737.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/jiffies.h>
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
@@ -2316,13 +2317,13 @@ static int dme1737_init_device(struct device *dev)
 
 	dev_info(dev,
 		 "Optional features: pwm3=%s, pwm5=%s, pwm6=%s, fan3=%s, fan4=%s, fan5=%s, fan6=%s.\n",
-		 (data->has_features & HAS_PWM(2)) ? "yes" : "no",
-		 (data->has_features & HAS_PWM(4)) ? "yes" : "no",
-		 (data->has_features & HAS_PWM(5)) ? "yes" : "no",
-		 (data->has_features & HAS_FAN(2)) ? "yes" : "no",
-		 (data->has_features & HAS_FAN(3)) ? "yes" : "no",
-		 (data->has_features & HAS_FAN(4)) ? "yes" : "no",
-		 (data->has_features & HAS_FAN(5)) ? "yes" : "no");
+		 str_yes_no(data->has_features & HAS_PWM(2)),
+		 str_yes_no(data->has_features & HAS_PWM(4)),
+		 str_yes_no(data->has_features & HAS_PWM(5)),
+		 str_yes_no(data->has_features & HAS_FAN(2)),
+		 str_yes_no(data->has_features & HAS_FAN(3)),
+		 str_yes_no(data->has_features & HAS_FAN(4)),
+		 str_yes_no(data->has_features & HAS_FAN(5)));
 
 	reg = dme1737_read(data, DME1737_REG_TACH_PWM);
 	/* Inform if fan-to-pwm mapping differs from the default */
-- 
2.34.1

