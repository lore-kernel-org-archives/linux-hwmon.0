Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2E446BF
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jul 2024 20:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722111615; cv=none; b=IEF/UnxvZqvVv8n8vRaZhfM+2A2IEQkW0XQdvEPtolm/ikFO/003W/UGyGOW591HgKL1mJh0oBhMwRbB3zAnZx5z5HvgvcB0gQ72CkDD8rMFRIDzhz44fGN2ZCQwwsAp5zxAOhnw8J1dfPViKVro34KHEyUCe/Ude6OnkJTjgNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722111615; c=relaxed/simple;
	bh=YQHHDV4cQlc8/u+9bfzKK07LoGXVXoZYTPgaD1XeVvM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n2CxfJoo4xIV7lLf8kydwFW77j6jFMUzr3NcVCo5dfyYFKU2Wuy5auQwKIj96FejDpoHfKbmnlPZuG65l07quEdOdDLrhopYYY9s2Xg4DOVzXKnSQB/owFikdEoDLj5c8kZaH+buUS8E1RKvAQHWJ25ND3gKoELnfSLRU0KGJD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Li0KObpC; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Li0KObpC"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fc569440e1so16324345ad.3
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jul 2024 13:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722111611; x=1722716411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3vK+BZLnw2BXpahGXjGU4zWf/42uDeMwjRU8ghq9pJA=;
        b=Li0KObpCAVScjjIQclrnsVrysbmy89jWpKoqUoig9lyj3z/dD5vZ5/IiyEaLxNSPAy
         D+hJgPr3jkMHx66PpFsnJlsxB4NEER78rOYAq9t/SfyfET8Jx+ZTCBZXVh0k2ncDlKcz
         XS8BsNCLigiRnSJwoAasB1NX+Nk1Koa/J73WNByLTx/ULOsJ9oPgGML1+RkxU3qzqF/F
         0eKU+d7ICmGyF+tJBLvVwo7cscge8vYOqpsieZ2Yg1/2Zk37BhkbgwovWnoMNwb6XWfj
         zmfFvlbMjpNW5ay+xguNOEIDD/dY5/Q+be+mAzHnmeEHCHRNE7EG3CbW3DJZUUAnlJAo
         APLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722111611; x=1722716411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vK+BZLnw2BXpahGXjGU4zWf/42uDeMwjRU8ghq9pJA=;
        b=SS4rnGhEM/Syr8HK5iH+NJ/69g5H2/ESVd+h7yOiR6Xx8Id8W6IK8oKF1ONxuMRkrV
         o8vzoSphEMHUZTOGSu6gZsjSpML3LR1Z8Boi1IzTlczb7x5g7rN/Qx4eXJA/zTg3A5XL
         DQlig1nhueVrQyN4BkyTEBvRqiQMhj4LTFQZhtu4995qFpMCw2lDm0cjxcmWbINLad/p
         LGuCTlB1GI74/B9FeuetXs/bnpJU9JwyYJGnx61ACIfpA0Z89DQZ7Ws0wwnDa/KMEDKF
         kWKP1kboffmSHuETl94rGAJrXQDGAUGCc60W7u2vlcAzyeKXxnSqpl+hRe11WVbE8xKE
         1iwA==
X-Gm-Message-State: AOJu0YytKwHFdgw5ZZ3VHj0chJlOmmeDN0Rl80j5DbzTzFxL2dDUBgBT
	R1UO0ZHk3r4X9w6x81XXxC4RtuP6WXchHnf/EgL5dulMFbeOQ5kTSxZsHQ==
X-Google-Smtp-Source: AGHT+IGDW4weTFiGqEHsJqhyoCzeoZyMZu/N+08i0VonspvMdQYBv9zRmfDpMVLms0Qq9fea0QR2mQ==
X-Received: by 2002:a17:902:f683:b0:1fc:3daa:3a3 with SMTP id d9443c01a7336-1ff04854dd9mr36997545ad.39.1722111610907;
        Sat, 27 Jul 2024 13:20:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f94c10sm54887665ad.245.2024.07.27.13.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 13:20:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH] hwmon: (max6697) Document discrepancy in overtemperature status bit values
Date: Sat, 27 Jul 2024 13:20:07 -0700
Message-Id: <20240727202007.1656841-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the MAX6581 datasheet Revision 0 to 3, the local channel overtemperature
status is reported in bit 6 of register 0x45, and the overtemperature
status for remote channel 7 is reported in bit 7. In Revision 4 and later,
the local channel overtemperature status is reported in bit 7, and the
remote channel 7 overtemperature status is reported in bit 6. A real
chip was found to match the functionality documented in Revision 4 and
later.

The code was fixed with commit 1ea3fd1eb986 ("hwmon: (max6697) Fix swapped
temp{1,8} critical alarms"). At that time it looked like this was an
original bug. It only turned out later that the problem was the result of
incorrect information in the chip datasheet.

Document the discrepancy to avoid confusion caused by old versions of the
datasheet.

Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/max6697.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hwmon/max6697.c b/drivers/hwmon/max6697.c
index 0c34c0c81232..0735a1d2c20f 100644
--- a/drivers/hwmon/max6697.c
+++ b/drivers/hwmon/max6697.c
@@ -248,6 +248,16 @@ static int max6697_read(struct device *dev, enum hwmon_sensor_types type,
 		ret = regmap_read(regmap, MAX6697_REG_STAT_CRIT, &regval);
 		if (ret)
 			return ret;
+		/*
+		 * In the MAX6581 datasheet revision 0 to 3, the local channel
+		 * overtemperature status is reported in bit 6 of register 0x45,
+		 * and the overtemperature status for remote channel 7 is
+		 * reported in bit 7. In Revision 4 and later, the local channel
+		 * overtemperature status is reported in bit 7, and the remote
+		 * channel 7 overtemperature status is reported in bit 6. A real
+		 * chip was found to match the functionality documented in
+		 * Revision 4 and later.
+		 */
 		*val = !!(regval & BIT(channel ? channel - 1 : 7));
 		break;
 	case hwmon_temp_max_alarm:
-- 
2.39.2

