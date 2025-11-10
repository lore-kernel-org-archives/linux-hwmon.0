Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EE82206B1
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Nov 2025 15:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762788168; cv=none; b=eAcrb+KXbKuiNs8pBOdQfBDJpfJWNYrsmjUu//UKRw8xSMOOIA0LR58P/e2gGusI5T9qHxEfaUWpowBI21LGDpc99pAFjjT1NpSrmP6PZqCU9uhaNa9Acp2OEJEf12iGqEFNC7kaxNHwKfao/Kn4rgQ+dfqWXBDwXnGlafYmjSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762788168; c=relaxed/simple;
	bh=cP4ULp3k8JLSv+ZU37nv+4jIcjfvJan+jVaSWuTANaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZcvmdJ/DVZtsfMqNso2zvL9Cd1rxvVHFfFtIaMe9QNatyxOzxaD8/wQPPub3xtlUUQNwz2Ddt4aK95mURsX+AP0yFA1jtBlb0InkI+KFXJYTslPGn/Bhx4selKlP8Zc7wJr9NdH5ElujAj2RFojU3pH9YZbyQ6mvHi90sHqBZtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdEpl1AI; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdEpl1AI"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-594285c6509so3448223e87.0
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Nov 2025 07:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762788165; x=1763392965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mwAGnFVHOIwQ6ViZSrq+GvmqIhNJed8iS4vI3UsFfbM=;
        b=JdEpl1AIXOU7QuI5idJxkcvmV97/tqxOAa31zLOIiDpjsV+NNReeAnFs2HQOruD/lY
         04QdebzfOJtVW2l3e+SS8pWlUMN53p0arN8PkYyejKPyoadT35J4762FEBjS0ZpAIxod
         rQR8REvC6/pI5LIl8uBivF2OGvzhgPI7FFUS7F14A00kl5rKTagsVWYJIid0ZqTjUSm1
         xO/9uQgXHfJiA0xr6EosnagUQK+4GHS///lOBpYOHR9Yo84Kkc9EAL7VbKf4tsmbkPG7
         /Ez0lpPc/vHEDIeorYyJyB20xmBuL/CS52LeyIodJYKSeEri/O49VEVVbTvgkswx7BBh
         ppWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762788165; x=1763392965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwAGnFVHOIwQ6ViZSrq+GvmqIhNJed8iS4vI3UsFfbM=;
        b=bZB8GWe67PTYA5LQaZUeNUt71+2JHo+3JiCOc4Tv3HTu+7G3TYAkTcAOqmtc+nkguM
         t4OE9GIADVA8emA5iWNhjBzk3DYeL0hGfeckb0aBiiRv3p4dFSMzYhoIoUNagBy6F6IK
         sx852k3lvVqifXloQlTI61nF05mejH8NG5iSvvn0lrifeldyX0PzgINzQoRwIogACfzX
         +p+KuLAyRBBBIogk/MKy6JACcXgngtw75lLZOyAIg8pkjFXhUtSzgMADh5v7YVzlL7Qm
         Kag7LWvng5GkYXONkGAoqnZhqYNTXey9dFFKc9QPoVoxWEqaFefgD4OZoewf3kg7NGxB
         I6Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUWUA50BsG2PESWwOwQYMBIhCh3hedpUGfyYAoFUyK66qOfeURRPZFgvxFCE1NsYiu43ysg91T4GULKfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YycmDrvddiSAK6rEblNCaM/QXjvv0idMCCb2Vp4t8md1uW2YGhT
	pkE3VfCE9uhiHAaHC3zTePC/PWDm61gXpcm+4D5DmTxnT5NfsRVsMbtM
X-Gm-Gg: ASbGnctluqyOJOz+sXXZwu6p7F3LGUB9c5fbd4eJ5IL9fG2gvl+Ej3hAA45xXGbr+Ew
	fP74TFzdvJD1kgrc9TCEiLjjNVyDshfB7Y8kyYrTDgVSgyxf0gC4jvl5nSyldKI9ou2gITjaSUI
	0C5H/P0ZCarOe3q5iKlXeMCuC9RrVX4Bexwfq+sEXyx7rrQju1lw7bhRN5ArR/Ts5qKEjEN9kl0
	2bFDYki9zEjwH3JYOY1e3oZ2PVMr4DmSk2GoiISHixDxCJ+Ps4WobfZDCO7Fc4oWmgMRcrvCPXh
	SLb/hsR2PwY4NwgLXKvV/Jjigs76JQgae6MplSn48nK/VC6WzKX9JYcX6C8S/DEjxNhsroodzyF
	FpIV24g82gDXzd3P7MfS02Jd0xCS9XmJr44MRIMqhuoOEkmnB926LRkannHR8g7HTMVuxcqhNKL
	4qEaNi7zANnINQXfdiXPo7qv/YGj3pDyiTqzD4h5WKH126TgJQs1cjfqz1uiXe0hzZMPHCm5z28
	/7rComv
X-Google-Smtp-Source: AGHT+IHe1cchgjpkjPbe5+TM3uYZZMPMk1ynGXp8eA7FAAAv4HDZKqbKETUnUPo6ruoyv7CE3w82cQ==
X-Received: by 2002:a05:6512:3da7:b0:594:5000:4568 with SMTP id 2adb3069b0e04-5945f145f07mr2696787e87.8.1762788165047;
        Mon, 10 Nov 2025 07:22:45 -0800 (PST)
Received: from localhost.localdomain (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a3a1a71sm4133906e87.83.2025.11.10.07.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 07:22:44 -0800 (PST)
From: Alexandr Sapozhnikov <alsp705@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (dell-smm) overflow check during multiplication
Date: Mon, 10 Nov 2025 18:22:41 +0300
Message-ID: <20251110152242.26-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added overflow checking when multiplying int by int and writing the result 
to long to prevent data corruption due to overflow.

Fixes: b1986c8e31a3 ("hwmon: (dell-smm) Add support for fanX_min, fanX_max and fanX_target")
Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 1572b5416015..ee2fe651c07f 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -34,6 +34,7 @@
 #include <linux/thermal.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
+#include <linux/limits.h>
 
 #include <linux/i8k.h>
 
@@ -736,6 +737,11 @@ static umode_t dell_smm_is_visible(const void *drvdata, enum hwmon_sensor_types
 	return 0;
 }
 
+static int dell_smm_check_overflow(int a, int b)
+{
+	return (long long)a * (long long)b > LONG_MAX;
+}
+
 static int dell_smm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
 			 long *val)
 {
@@ -769,12 +775,17 @@ static int dell_smm_read(struct device *dev, enum hwmon_sensor_types type, u32 a
 
 			return 0;
 		case hwmon_fan_min:
+			if (dell_smm_check_overflow(data->fan_nominal_speed[channel][0], mult)
+				return -EINVAL;
 			*val = data->fan_nominal_speed[channel][0] * mult;
 
 			return 0;
 		case hwmon_fan_max:
+			if (dell_smm_check_overflow(
+			    data->fan_nominal_speed[channel][data->i8k_fan_max], mult)
+				return -EINVAL;
 			*val = data->fan_nominal_speed[channel][data->i8k_fan_max] * mult;
-
+
 			return 0;
 		case hwmon_fan_target:
 			ret = i8k_get_fan_status(data, channel);
@@ -784,6 +795,8 @@ static int dell_smm_read(struct device *dev, enum hwmon_sensor_types type, u32 a
 			if (ret > data->i8k_fan_max)
 				ret = data->i8k_fan_max;
 
+			if (dell_smm_check_overflow(data->fan_nominal_speed[channel][ret], mult)
+				return -EINVAL;
 			*val = data->fan_nominal_speed[channel][ret] * mult;
 
 			return 0;
-- 
2.51.0
