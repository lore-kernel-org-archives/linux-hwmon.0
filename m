Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CEE39F17F
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783854425; cv=none; b=ew3GcKZ/QgCJDJRl60LxR9AEU3mvI1/uR5Pb/sw9kGyzolXdwDQ50vOBH2y9sLFaQEOs/SEgfed05q+W4vxQXKDFM18mJWyR+OOpPbk9YqtDWHk2mpYj4bTbxjrVVxcBkw9sxn8MZpsDLe8BBdz4JeEGLgrJjzjlQe4F+AOV86Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783854425; c=relaxed/simple;
	bh=hqwhm5yMZbYQQNjByQ/P15bH7yCPNSDUo0ZEsdjWMtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ED37K9WlJ+R43JTD7rtBBRmUiA6nxDMtM0eIi4BQeP8xrro+JoW+s06rhh+rRpzq7sh5pNB8jeyOlE76S0YupagNCU4Sg1HTv6RWR9GjY7cK7l2xY2u0UHlaeFurPREiy8JY6+13iOS4xqwq1ZRIOKXMdy+NnXOxvgZ7uww0jnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bT3WBNY+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bT3WBNY+"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso16303435e9.0
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 04:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783854421; x=1784459221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9iws13+QwWBruAinC9XI5/ioQWRS+EiwGg/eqYj2Vcg=;
        b=bT3WBNY+rFqL4UWpc/rqW8yAdmM1Holu5XywrXdv36PWh+7WSe3SKJA2wrNL9KJqOZ
         xkZLP1D6EKhLZNgXlFijANVNs6eaBAYlGTqgAsg5OtaFm/xmDTRN2j/pJqTROLJ3+iU/
         aZBqfd+OBTY6Nksl+shBZm3AU+iw+tmUmLFJqitFgdjjEknyhmy0x0oUyZhDyXTOafKo
         X93y/htSAjZFAC3EJUgYHu1NxtZPOQUqovHMkxr6FijQ1DuyPzr5+Whfp5YGgNCn+3t8
         Q4KW6ccVsh6aTIgnGnLNHm8QVxLcl53mGSaQOLiaUKrNiJpMFp0RVq1mZo72ZI3L3AYz
         aA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783854421; x=1784459221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9iws13+QwWBruAinC9XI5/ioQWRS+EiwGg/eqYj2Vcg=;
        b=MYPDcL+yXa51YsFSLQYAS6VeEIpDHJCxuTyk2HlynFwotPQqM0zfPKVyBzMPZIds+p
         e7EtQeXqU3UM+ci5YecDZO6Q6uBHX80io/WH5hwtAlMUzNHJHUq+S+hKfBkaUsiGyEqf
         o8OpxJ98kpRIC7VJA8/pdxZknUIA5uf2kwcL4AakBx7bgWompbLwDfFTOIZMBISCTHAJ
         Ss5eRSpu97yVmSdcweZW9w1SV+CDX4flsZVx1NmR29XK7Qeor/BrNOrQlmR4ziqncsAj
         4ImGqo5y44kzUavk8wLO9jTRP3A/TW025AaaI4IrLQEk8TAUZWiKNBsKxbPqynN+LKF1
         4Z8A==
X-Forwarded-Encrypted: i=1; AHgh+Rqarse6aCW5rEhJwSX0M215jHp1k6+J/MNL6q3mu+xeFQMZrW0DpSZUKMXLQxtyrN5wwLpwtxfua2Dm8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YypWgsDEVYH24YZmSeDq3tubIIHv2J4xv2wSB349dp18QgeAocc
	DBE/A0DbXbr0I7COKuZZuBHQvNoU0wQJG/ZI2xcOUOLlQop5FzJPPnnM
X-Gm-Gg: AfdE7ckDhtrk2nXv3kaIUOy3t0Y9pK2zCH+GfIBVcIQsSOnAc3b3lSYjER6wDnA/2NM
	faCzwTBia0wKn7aahTfdrmpO4qrpsjRpiHo2dzXKyrWXEFsu8CLZH/1aJISRBq3yqnWcf9wnNSo
	JPHzCvZ7qsL7pYvgyG7ru/tkSieX4jjjPhi/yd/I6TsnjivHuVtilqo8Y0Iqa7hSDEEXbqa1HZK
	eZ9dv7kcXGBMjYgSoAUOFKszBU/RG7yryJvs/rHqghFS34bSsD/oasIojFYn8DxE6Z1k7WSbqHl
	nEU97xMLsHZRFt0SO1fFJGl+QIPuNqSaY9CbX8EHQLplPs2k1/fIBuU5aPW4v5lDhcmJ8mGe3oL
	aeYvAMBM5oAhaXXpmsgHfPbixQVf0AwZ0FlP+1Yl8Eal+SziXcdLR+G8+s89wq4pz6Yl8iZNicg
	ci3s8vV/jJINvXtTZQtGZFnwSRgemk/UY=
X-Received: by 2002:a05:600c:198f:b0:492:6efc:7c60 with SMTP id 5b1f17b1804b1-493f882933fmr49350145e9.28.1783854420895;
        Sun, 12 Jul 2026 04:07:00 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm273637625e9.3.2026.07.12.04.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:07:00 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org (open list:ASUS EC HARDWARE MONITOR DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/1] hwmon: (asus-ec-sensors) fix EC read intervals
Date: Sun, 12 Jul 2026 13:05:03 +0200
Message-ID: <20260712110650.1240071-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712110650.1240071-1-eugene.shalygin@gmail.com>
References: <20260712110650.1240071-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Take INITIAL_JIFFIES into account when setting up next update time.

Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Fixes: d0ddfd241e57 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")
---
 drivers/hwmon/asus-ec-sensors.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 29a23484cbe7..eb71e41fd4f4 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -1009,7 +1009,7 @@ struct ec_sensors_data {
 	/* sorted list of unique register banks */
 	u8 banks[ASUS_EC_MAX_BANK + 1];
 	/* in jiffies */
-	unsigned long last_updated;
+	u64 next_update;
 	struct lock_data lock_data;
 	/* number of board EC sensors */
 	u8 nr_sensors;
@@ -1278,13 +1278,12 @@ static int get_cached_value_or_update(const struct device *dev,
 				      int sensor_index,
 				      struct ec_sensors_data *state, s32 *value)
 {
-	if (time_after(jiffies, state->last_updated + HZ)) {
+	if (time_after64(get_jiffies_64(), state->next_update)) {
 		if (update_ec_sensors(dev, state)) {
 			dev_err(dev, "update_ec_sensors() failure\n");
 			return -EIO;
 		}
-
-		state->last_updated = jiffies;
+		state->next_update = get_jiffies_64() + HZ;
 	}
 
 	*value = state->sensors[sensor_index].cached_value;
@@ -1402,6 +1401,7 @@ static int asus_ec_probe(struct platform_device *pdev)
 	if (!ec_data)
 		return -ENOMEM;
 
+	ec_data->next_update = INITIAL_JIFFIES;
 	dev_set_drvdata(dev, ec_data);
 	ec_data->board_info = pboard_info;
 
-- 
2.55.0

