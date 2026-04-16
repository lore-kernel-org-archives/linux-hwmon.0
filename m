Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA41439A7F9
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 09:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776331105; cv=none; b=VbTOa4/LGAU9AhKt+nBtahQ3OD2ivkNs0UOHHpxRvpRBa9ujCcbVOnArjqN3tdmwEyphHKEe2eQF4OEmUYKS27mQgqCzdnoGhSRsOCZZz+gxzK4+sLTZ4Zr7IxNr/A4DI8TCABWEJ1SBOS8iB111dykmm6SEZEUIS09lagjQ8jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776331105; c=relaxed/simple;
	bh=ukXYTowOQ2GLPlr9/ML47Z6elr7y/440J2GW7fP6Dmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fFXd2QDdE/MS0sgPF+FM8z8dlwZ0NP2GiglfLf6L/mMkEHHpRKeon81d9bFgc4/hc40Y++LppAwliUv8e20npS18Y+ViIvOCYQ1NQabJwxxfRpRUGM+k/y7Q6fvqfzIbCMyzuAWJEpvbRVfUpZNA9ZQGbRpGFvFtx0rfzaMiun8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8Eg6j4s; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8Eg6j4s"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso336684eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 02:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776331103; x=1776935903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DRdRPBWMP2dSl6d5xHeVzh9tJ6WT/9pi24TeffCvJM=;
        b=Q8Eg6j4saj4qMbL7RPcYNzDU3Fhy5xuPfJBOLZr1iREKMgMloB82b1cDljCIX+8F5f
         M5xcDIoe8UZnk9zA1aafCqp1E/9CC2sTxMuhVMCxXNt6TdyEmk1RbdODHbGHN8SIxnRD
         ofSWfwC2banEz00FO9GrLS5msazz3N+h8kRB9AjDgDKXXgtG4M3lVrSXzXd85LpukU6h
         cbct7RQiwuF2CNX7A+p94EZyQNZKl/SoDYu2cHAleZnn+4MI+MEnId2XbpTlClQdedAO
         9jB1KmYRvvw7wnJ+YlmJJLG9fdKoNLOeVfOQe7ibRKvpUtndXZLYxseBQ/AInWAx/kT/
         Gd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776331103; x=1776935903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7DRdRPBWMP2dSl6d5xHeVzh9tJ6WT/9pi24TeffCvJM=;
        b=kQpPjNfKWGTw2/D7cYx+wxD6F7w+x1LG/xlXMWE0PE7ehgGXa48P0fhqsh4RiIVdzY
         TGu0paJK6f8SJAo4VzADJQVtVWes0WaGnmy94iF/O1+NnLG2FW5NhIvFbMmzqwptCtzU
         jqJDnx1YVQEgugvN+dpaTJ0WNST/5+Y2k5ymIU6/vkB1x36HlKjvqSn2eDvtmjjhIoCY
         oYO08FaV4jwK3S6yYBz0Kd+QV554aEaAeZnX6gWrjTkN0zLpeVktONe9DLxWRkUHP0i7
         /acKC9ZAYw1bdlh9iqlbgOmgDAQU1MZHofPaG+twNQGL2ZoQR+pnOruLoh9N4VQBjSwb
         cxvA==
X-Gm-Message-State: AOJu0YzwTcaLigj8Whd2VybLbqJwLLlDAX28dqx/+TFGqoE2NZXFd1Qz
	PP7y50Wban9CKUg/fPySbvwjrDufP8h2bHpIQ4qqfKg6KrdMtcoNM2CT
X-Gm-Gg: AeBDietz+XfG9DGQ9ria3oODVpEOOKTAfjUy1bBwD+Hre0tWOi9TO1pJ1K2BuLagLo5
	uIPXviqiTQrRtvnBhJ38hjT2VWw/pMoBLnmuvAreO1MqH8hy8owE7bLSsSJCjpAEik8XpC6NC0O
	AHYR/F4np3CERrWUx7Myg/GYbj1dsF09TCrc9ZBEXePUou6IG1t8Oo61Hisx59vd4aR4ZpSA3Vp
	C1f1smS41/1pQTnmbrKP01pqNy6TVxHz64frzfrxjfbSeBj1ylUWQ+3xqiUw3Rz0RJmVpASc39I
	we9ErwIYqlBVr5oCjhmQVLChPWDCN/aso/Q9YHlv5LbO1FgWVznzj/+d997wgppGAxiMUtH3eHk
	IoonK883P/zKUOHMjvVKrAp/YpMA56Bzh8Otv7cLpU5gmQfGnIR+sFLPU8x4YX4FDsD9MKTkRUH
	J8WaVIND8pwOubju4QKML5WYEXymT7EX/a7y+1lIzuR1/iXsXFy1Jv0GjoDoIREZ1ARnMzYQRWh
	zTMygwQUvI1d7LGZnf2QZ2iGAZwIfZTEyHpgzYo4NyjA7SgQXMoth0jMJrZuEDO2+mTg217VC3y
	tSYqRU2Wfez/3+nFpdDo3ht2mXhUFU9NVg==
X-Received: by 2002:a05:693c:2b10:b0:2d8:4dee:6ad0 with SMTP id 5a478bee46e88-2df7f467535mr1167366eec.16.1776331102863;
        Thu, 16 Apr 2026 02:18:22 -0700 (PDT)
Received: from 2045L.localdomain (49.sub-75-226-46.myvzw.com. [75.226.46.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb8482asm6591216eec.15.2026.04.16.02.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 02:18:22 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH 3/3] hwmon: (adm1031) Serialize update rate changes
Date: Thu, 16 Apr 2026 17:17:54 +0800
Message-ID: <20260416091754.310-3-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416091754.310-1-hanguidong02@gmail.com>
References: <20260416091754.310-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

update_interval_store() updates the hardware rate bits in
ADM1031_REG_FAN_FILTER and then updates data->update_interval. Those
steps are currently split across unlocked and locked sections. This also
leaves the register read-modify-write sequence unprotected.

Hold data->update_lock across the whole sequence so that the register
update and the cached software state remain synchronized.

Fixes: 87c33daadbfe ("hwmon: (adm1031) Allow setting update rate")
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 drivers/hwmon/adm1031.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/adm1031.c b/drivers/hwmon/adm1031.c
index 887fba9ea149..a46db83471f2 100644
--- a/drivers/hwmon/adm1031.c
+++ b/drivers/hwmon/adm1031.c
@@ -897,13 +897,14 @@ static ssize_t update_interval_store(struct device *dev,
 	}
 	/* if not found, we point to the last entry (lowest update interval) */
 
+	mutex_lock(&data->update_lock);
+
 	/* set the new update rate while preserving other settings */
 	reg = adm1031_read_value(client, ADM1031_REG_FAN_FILTER);
 	reg &= ~ADM1031_UPDATE_RATE_MASK;
 	reg |= i << ADM1031_UPDATE_RATE_SHIFT;
 	adm1031_write_value(client, ADM1031_REG_FAN_FILTER, reg);
 
-	mutex_lock(&data->update_lock);
 	data->update_interval = update_intervals[i];
 	mutex_unlock(&data->update_lock);
 
-- 
2.43.0

