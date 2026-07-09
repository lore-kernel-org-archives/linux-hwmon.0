Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C36D3CE0A2
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jul 2026 20:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629669; cv=none; b=CiVO39aTO05kuUoUKvNZlNM4VDxrmLjh8RN2kIX17Y6nMoHgGgTiRzNUOcu+WKH45oL7c3Cx9xy0GoOj7tO6EKj6cYB/sRo6G7f9TDnO97xPqKdH8+FcDJYzfVVBiOqY7bc3J1xv0Fu+4vPqBhOY1qmcJZVGjQIcMNa5DCMdJkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629669; c=relaxed/simple;
	bh=Ccd+cDZchbdwOJ1KHsxrFrbN7LGWCXhcgm9ONq9gYn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AmpHBoey5tPXzVx9UxlbwpMQEPqNeLWFDyPB+3S5bGEogpLH4J+w8M6kwWwgJkcUgPGt5af353Ul6sUC0g8ouS2P1gtZCvS5A5NoAbol81f6usIVeA5HyUB+3X1FOMWXPHXNYERPjaqEPKwFmEJ2PWrmTOgg1JP8914ER4rM+rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYTPJRkG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYTPJRkG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c1950518so8730475e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jul 2026 13:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783629666; x=1784234466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2E06cTUHTD5a6rdktHekLSrSLxtN6HdydCujWQuQI8=;
        b=YYTPJRkGscUrLAygbVJnxCOl87iC2jxR0eohj7ovl3YqNvng8cEHCavYzqBHvgr34/
         tFfaQqJC0cGtFtRoS5s0nDxGsHt9a0sVaJsIF5bbbVNxJQq0mFbXIv+Z6sEIo8BwnPuG
         FKeTkZ/VaZoXuebaUSahLoHBFAuRtVZ7xs+QoyWxIqNDUKaE6+8+aZSGby2MpRj6KtG6
         TEpz/PDi7VKb6xPJAoki7z5OUOpAX0ckciPxgFtZhUdequHdOCUVLEuJwUgVDoGaB4U+
         KH5137yYIctcVfbfF1WoN9a64VfISAovvOTxqX0UyqlAMYDT275rIajMU18IetsBIPgi
         FYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783629666; x=1784234466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2E06cTUHTD5a6rdktHekLSrSLxtN6HdydCujWQuQI8=;
        b=D+pYR0rNSCmSWNgRthzOwY//B9ZYzQ0c72yhxnSEX0pPWn0U2mt583SQI5r6H0AqeG
         wIJVj6HTM+4G4i9Cn7Dg30kKimA/1p/oWWWa31vPAng1nSKBenGzDUKGKpC/ELUgz3cV
         xEp416fdKfJI6Bmc+XdF1L2ULx84wovydw/mQLet6hFTqDldYNq5wGbSDi4QswYeWowu
         tCNXedIznN4h9wj47mFR921idXZ0SMPz0OVdHEBY88nKaQIxGBP4tZ1lRMlah2ZlVNE6
         pg7nZXoFWVsCxN5bX3pniSPeUJPzORo6bvp2jr2ikJIJEx+3kzPRX3O+XoudK1Uy5rlZ
         hUyA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1gz50mt37z2z+YTGwpEwLj9zQ90MFBFkZqfyk+YGsacYXZvhPXvGQcxiFzBTyfIXTG8fNyVNYKIbN3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxppQl3OToVYSAFXaZhQgXNfYGbJx/FNo2RLEINLaPz2ItdQWE
	NsKBxy1z6ciZwI8xHWjtTLqm/f54y5JxvCMYYqlJoUui3+mhnUPvt1VT
X-Gm-Gg: AfdE7ckvQO4EWW5Qv2KLItoRO9RF/z36THSYr30hAPxEVv2f6WwMfPo8uJhw5pvBggy
	pZYRMu42oH97uq7eqK5nbuviHu2cdungN2saq2M10m40RoSzriz58IdqSCBdIZfNm5+do7LGBdf
	gnKR6ERfsDy5vrho9bD9KT8NicF7WpAQNDPEGVjWv668hR9CYWzwLmwXQl3mR4xpPFuAtXkvszx
	jnMPsePI3oxWHJ8e5vUhiRO0I+OsowgcrvFZ3dpUgkcPlcFubGE1+u9bv59e9joLmyUjxQVGnJh
	om2D3qGcU/8NqgQYlLAt4FTFVRNkv4qzqmdUgxBGOZX8EwOkW1BlkKD8gjT7s8CyzQnyLWbMG/P
	AIF6PztmP1ry3Wi6JyHPIGY2GbDe7oGMm7rwLZEl6u3LRR76nwgRoiLfvns1tRTvBlUP8L/fzLr
	7OMJClUNJ/Kasa5PL5v0SivftbcNzNQG8=
X-Received: by 2002:a05:600c:c3db:10b0:492:714d:8c4 with SMTP id 5b1f17b1804b1-493f2b33803mr4771835e9.11.1783629666379;
        Thu, 09 Jul 2026 13:41:06 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm87100785e9.1.2026.07.09.13.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:41:05 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Vishaal Saraiya <vishaal.saraiya@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (asus-ec-sensors) add T_Sensor for ROG STRIX X870E-E GAMING WIFI
Date: Thu,  9 Jul 2026 22:38:34 +0200
Message-ID: <20260709204037.1998433-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709204037.1998433-1-eugene.shalygin@gmail.com>
References: <20260709204037.1998433-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vishaal Saraiya <vishaal.saraiya@gmail.com>

Enable T_Sensor for ROG STRIX X870E-E GAMING WIFI. Board specs list the
sensor, reading return -62, which is one of the blank values for
temperature sensors in the ASUS EC.

Signed-off-by: Vishaal Saraiya <vishaal.saraiya@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 drivers/hwmon/asus-ec-sensors.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 29a23484cbe7..742520c485ca 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -743,7 +743,7 @@ static const struct ec_board_info board_info_strix_x870_i_gaming_wifi = {
 
 static const struct ec_board_info board_info_strix_x870e_e_gaming_wifi = {
 	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
-		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM | SENSOR_TEMP_T_SENSOR |
 		SENSOR_FAN_CPU_OPT,
 	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
 	.family = family_amd_800_series,
-- 
2.55.0

