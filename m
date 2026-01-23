Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95AD275B03
	for <linux-hwmon@vger.kernel.org>; Fri, 23 Jan 2026 18:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192540; cv=none; b=CxIZxe7ZLa6c2yJ9LdYyJGs2yqV9xvq4yecoy1OKaVWcjM1SRZnyhju/fCDZkb14WRDeYDs8MlIQBVIgxtjmdAxorDrsRDCdO5MfekPClm1eQsT1SvJEeyEr+MN3Am2JGb4lVSa1IzGTeUVuBGThlzpWRzubj8S3ZZc6geB6CE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192540; c=relaxed/simple;
	bh=u8UanGH828x/wa/TE/D0ClcvT3TQ3+GCvwMRIjSql6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8vL+vM2M0Wu/EYNaPfYG+A46QAWV9vjnNkkoot59UPtspdqIy4PRSDwhdOdtDU6Jvaf+rjHMp31o3oq5aJ87MNMpAE9xMbLtOC15LW9TwI2xWyaRvVJlBbp674O61cia8h79u2VsVvgTCSL8O2BVW42pMYpGt4F72/N0ujIY0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnMpkFdt; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnMpkFdt"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8230f8f27cfso1006176b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Jan 2026 10:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769192538; x=1769797338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wgD+Lhq7HXYqBeKTh5vKd8poAoMtNS0Hz8zr8Bfuzs=;
        b=VnMpkFdtCCkWqz8gI1uZPEWjtKAsIA6IJwXIourWANLuXwEiIUbWXAHjB3jG/S3u4z
         KoXWHwShLxSW9nVJAoksvRQbdMATcUD/Hie87RS/YeGvvzlQZ3TXf2EhGRA58WYEkvbv
         z5tDQlXAOjDtG08rGqjDR4gHI5ar0UjpEag8r8vzRX9fmX8JX8kG2mkTzDGYAKdS5H5p
         MmH/43Q7GsAHiF3gRREtuDKjbYc9oaCKqnXmlTTUyA8Hzx3JxWZmVUY1dPv/HUQaD1va
         DYVNadZ1WVwLDImV8YMppT3nBCnfODj0T4n58xWbZ+Y7SqFHUT6QSyUJXoh6VgrwyNfA
         S06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769192538; x=1769797338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+wgD+Lhq7HXYqBeKTh5vKd8poAoMtNS0Hz8zr8Bfuzs=;
        b=pVdUrRhTcass/bSsNAWQ8Ce0C9p4KLrJiiGdIsM7zzD7C4FFZy/xAkd2QK/PGIlhRS
         TIARaL7WRTl3ezV6hAu/X1nHfX1JbvjXr7offDxThLNrGcnxFMi68zmjlJeeYvbrCh6F
         ZuCHtt+kao3kM6kdXOLIKmrh6hq40SN5cbCwoc7+EVoyQ+jmavDjGW1Q6/P2nWD+W4EC
         R+nmvrwYGfhlepXuXbp+AISoKkffi3eCkM/VdDqhC3gybjWxsSkugpn1RwxXXBnxchYq
         yz2F2YZU5r2vvdinitRJo8wNMFjwigStZ3IvvGjfPdvxvF8WxV6wPzFg2FIhMWdC3R/K
         2h9Q==
X-Gm-Message-State: AOJu0YzDfHc9+q4eSbhGgb3MAByqmrtY0WGo2U11XuiTLwFocdAbwYF5
	h9G9wVHmfaBaG4QiZOigczZzXD9YKvUu2tF6S1oETUBU1K4nFSegysTm6wzl+h+0
X-Gm-Gg: AZuq6aIrBw6LT0r1K0jYvFygNmck7b7wdqizpXCtus7SJwkUNLhWduwbXoy4jdWSIlK
	n3eRWTG3n3TZuqcxjTtybM2smOcqWnUnIywxxu496NoCn5NqcKbvw2aaldeTTqIQrpNUXAQ3ZT5
	/r/JeBp0PodV7puNvu84Cz1adpyVGDCH7gELi1fSNaQmoyc3AEe4NXI1jTP2pWjxxJg4CAr658s
	z7t1ihzp+ORMp5AwudYsus3TPMiJdk2aFyIkBc6wNsG3/wwEMJ9wzIwBun3REz+e76Dlnv/GGGu
	EDdBtisGuuWGqbcviOWJWxiUQkl8sdM/DHFWhe1FSK+H4CdLekzE0JjStQUOAvM8535chl7CBSd
	qJ/LT7BITUhHTO2W3XN6TkUi2PW1RZSMv1uZhCEcFmGauzahafxHOPICc8IENROK/FkW1WjKZRt
	3IFHVObf6zQOTcCaieSxAVPw3K
X-Received: by 2002:a05:6a00:22d5:b0:7a2:7458:7fc8 with SMTP id d2e1a72fcca58-82317c0fbbfmr3029305b3a.13.1769192537702;
        Fri, 23 Jan 2026 10:22:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231871f97asm2759775b3a.40.2026.01.23.10.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 10:22:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	lihuisong <lihuisong@huawei.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH RFT 2/5] hwmon: Provide helper function to find thermal zones
Date: Fri, 23 Jan 2026 10:22:05 -0800
Message-ID: <20260123182208.2229670-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260123182208.2229670-1-linux@roeck-us.net>
References: <20260123182208.2229670-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a helper function to find registered thermal zones
and use it in the thermal notification function.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 9e9ad42b6d7d..1f35285ca7a0 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -261,6 +261,21 @@ static int hwmon_thermal_add_sensor(struct device *dev, int index)
 	return 0;
 }
 
+static struct hwmon_thermal_data *hwmon_thermal_find_tz(struct device *dev, int index)
+{
+	struct hwmon_device *hwdev = to_hwmon_device(dev);
+	struct hwmon_thermal_data *tzdata;
+
+	if (!IS_ENABLED(CONFIG_THERMAL_OF))
+		return NULL;
+
+	list_for_each_entry(tzdata, &hwdev->tzdata, node) {
+		if (tzdata->index == index)
+			return tzdata;
+	}
+	return NULL;
+}
+
 static int hwmon_thermal_register_sensors(struct device *dev)
 {
 	struct hwmon_device *hwdev = to_hwmon_device(dev);
@@ -297,18 +312,10 @@ static int hwmon_thermal_register_sensors(struct device *dev)
 
 static void hwmon_thermal_notify(struct device *dev, int index)
 {
-	struct hwmon_device *hwdev = to_hwmon_device(dev);
-	struct hwmon_thermal_data *tzdata;
+	struct hwmon_thermal_data *tzdata = hwmon_thermal_find_tz(dev, index);
 
-	if (!IS_ENABLED(CONFIG_THERMAL_OF))
-		return;
-
-	list_for_each_entry(tzdata, &hwdev->tzdata, node) {
-		if (tzdata->index == index) {
-			thermal_zone_device_update(tzdata->tzd,
-						   THERMAL_EVENT_UNSPECIFIED);
-		}
-	}
+	if (tzdata)
+		thermal_zone_device_update(tzdata->tzd, THERMAL_EVENT_UNSPECIFIED);
 }
 
 static int hwmon_attr_base(enum hwmon_sensor_types type)
-- 
2.45.2

