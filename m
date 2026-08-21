Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82DA4C77A7
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323773; cv=none; b=GUOOZ+3d+AZ0buJPpF/Q9ErfgFpNap75BOJIReIDUBbMEUuyoUEDrufPj2FEMXw8GhHE0VfslEMxxh1cchYmL9OZV/l0sTJ+LQ0io4mMMfPcDQfNd2VFXG2jh1sELPYwKirsz+mwYdFXEnS9RRrsj5+9WU/gFY6X2Jgeu+ewOIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323773; c=relaxed/simple;
	bh=Y82sOKhkJO6EdllhvrFXJl+C0P8YYSG9j+AiM9TIOYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hzfo3ARzXPuMd89SUhsvgHHHbUpFJWwKhWhUUfS5wkxzgeW7XfkvmVGgdq1lqS0RGeHUBtoGQ0Lv1QwoVqfdyoMAaOlJIW5JFboIISO5u3tQtkt/buRmqMbSRY3huEiCVLMT4sd9cFLeO+VPyf1Q03cXtAjjAAHqBnHtmElOX4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtHtkakE; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtHtkakE"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2caced6038eso10857085ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 07:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787323771; x=1787928571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kp3qGPFsodBk3aapqtrLeWEdwxvmJBOzk35IEbbvdas=;
        b=WtHtkakEkJsFHNWWDhMcTaUqhElUuuiDQPWvBNdV+/jLPgikvtDHt3GezgQTpsWk6V
         JWWISRJPv8IuwC/oTeLmO7/OWTURGypz7xotUT49LIJvfsurN2/pOd5y+MtUcgEA8IHl
         BUgymFNLab7m/SdILdZBFkfIa1IxgOoh95upbwol+OTbjMrUu3/zToF7hBPIBBFCfkZX
         4Inj7mp1f2v6P7+Tr2bxAdkexngfTG04p7wCS4mYiIUML6zecqoFhx9c8j+sEqhxPjjs
         rlagA/XpXy7bknv+4g6G5MLxbXHjPx8MmKHBcrb8mfSBVvD4nJ4KeiM4GNIdQBtRbrZd
         LmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787323771; x=1787928571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kp3qGPFsodBk3aapqtrLeWEdwxvmJBOzk35IEbbvdas=;
        b=tDoS6teCNbgUusbp6VwZvyu0TFMzXHx7HSJbUOThVE0HuR/MQr3tQIRtU99/nbrKzb
         /1iJuF0ID9jeseQq9Q+LCw1WJSDOWxNEA9fJO/YljSVyn8Bss3dRf3MDlLt5AzSEgNMW
         9Yj6AwXTEierTA2zEzQdNh2XkH60Ec4vnBvwlLtg1wyhO6L2FUjO0rCANDdzPa1RLv3x
         EMHsrLh9xlmlSGFywrHMOjdU2/c9kF7HM5tzElUudIqJXRUj6bG86Nl8Z2rtK6zPva/P
         /PHDDkh2VU6cKN66tgKqjwqW0x6n/U4xMNYtuBXglt92uMo285Aru3C3rDHysScvHtQJ
         B4ug==
X-Gm-Message-State: AFuF++mVl7tJ9EkoGq/qe3aI6fxuf4eiUUoqTo671X8DUdUW4hit7jcX
	ElBKgMFQRYjg5dh/TxZt78p4tubteFj4MVjLkpbzLA47d4RC9WMOZUqjW+bdOg==
X-Gm-Gg: AR+sD13XhieSxKYYwwujWV/1/+VDWdQWIKUacLG/ocDQVqiLjpl0jVOkG1S7BP2RfoB
	GK9GqppFbUvd8QLJbI4sUlc+GEVaRljMhvIbKAnX9AObD1wFIiJo7MS+2JTOB3qAheC4e6+Yslr
	dFo6modnPRYb/VXd/JIZEeCFhBF93IdOUqROFFDbB+ryh1P+SN72B5M7wtmmx3/8YO/A1qqAzds
	jBHJ/SN803hPWvESz9wAyfvpn1a6YL1N18GK1dOb+niCRAZR4Q9179hVrBoGxbGTHwK+4tVQ2Qo
	vy7F4/tczknKcOMFLp7KpWVbrHj3Tm7wm6/PVPW/aNQ7ROdkdXmF572bvBh746OqUtruTLZ/xdM
	3xzlqzAngI7ZK3ANu+vgOBinzQns75+EEndCAfoGMaWH3UHgV5FGsnx9VHmwx3Ltl62vaEQ67Lb
	11vsYswJUDbxWa4EVIivFFladSxVDOeSgHIjWD+nG9w4X2/6CYSxXEDAPmBAAC1io4O/QSSmCHU
	Rb4tFDL0xP22wx7B5Z4WOUt
X-Received: by 2002:a17:903:19cf:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d61a15e3e6mr190763755ad.9.1787323770628;
        Fri, 21 Aug 2026 07:49:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf191821sm27219609eec.28.2026.08.21.07.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:49:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH 1/2] hwmon: (sht4x) Add missing locks
Date: Fri, 21 Aug 2026 07:49:15 -0700
Message-ID: <20260821144916.2889031-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko reports:

Heater sysfs callbacks (heater_enable_store, heater_power_store, and
heater_time_store) are exposed to data races without the hwmon lock.

If a user-space process reads hwmon data while another process enables
the heater, heater_enable_store() executes without holding
hwmon_lock(dev). This can interleave I2C commands and mutate shared
state (data->heating_complete and data->data_pending) concurrently
with sht4x_read_values(), leading to corrupted I2C sequences.

Fixes: 53dfa12299c1 ("hwmon: (sht4x) Rely on subsystem locking")
Cc: Alessandro Zini <alessandro.zini@siemens.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sht4x.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
index 9cace0e8acda..7a0dc2ed723d 100644
--- a/drivers/hwmon/sht4x.c
+++ b/drivers/hwmon/sht4x.c
@@ -277,6 +277,8 @@ static ssize_t heater_enable_store(struct device *dev,
 		heating_time_bound = 1100;
 	}
 
+	guard(hwmon_lock)(dev);
+
 	if (time_before(jiffies, data->heating_complete))
 		return -EBUSY;
 
@@ -314,6 +316,8 @@ static ssize_t heater_power_store(struct device *dev,
 	if (power != 20 && power != 110 && power != 200)
 		return -EINVAL;
 
+	guard(hwmon_lock)(dev);
+
 	data->heater_power = power;
 
 	return count;
@@ -344,6 +348,8 @@ static ssize_t heater_time_store(struct device *dev,
 	if (time != 100 && time != 1000)
 		return -EINVAL;
 
+	guard(hwmon_lock)(dev);
+
 	data->heater_time = time;
 
 	return count;
-- 
2.45.2

