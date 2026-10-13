Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0EB4E3240
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 12:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896272; cv=none; b=VdGtpM6m9oD3XP3BfCHrJES10CMoSw/r73gzJMjlZZ+iWPPUjsfrnuJPwC0c9BkYIlq1i6QXACqTzKtd5nA0zc5FMR+vr4AHKAbhZhfyYGL8J1rZJ3mznXPb1C8zcIzr5Ah/e8XH7g4YRxrMD9jAs9K93bGF0zTrv6+LZkBUNwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896272; c=relaxed/simple;
	bh=3GF8ccrJ2E7j4uN5tjI8S9AApC9/OI47ZxEUXhdNQ5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=te2HKpsXy3XyCKEGwKB3OynIVabPTIpOEx6Nc0Y8AbuTyp15Hqi/uX8KTs7PmmKzWJmTiBmEyml89/75hZnWcCrxg6xcutIC2HOOxtaeZz6J7giP1AkkEiq1StfPwjTujCKbCWn5CrBH2QSor9Cx4BiHO4a5wKHYRLb1QCilrVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=xiVmiPVw; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="xiVmiPVw"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso3638754a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 05:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791896269; x=1792501069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nunSQ8CQNv0JezPiian0cV99V25mrgz6BvoT7slRlb0=;
        b=xiVmiPVwxUa1zJvo/e0Q7CS+8X4bwk599NOa4fh6Ug/D522+oHPeIOA2tYA6QgMgrg
         oPG/e+hyosFyi3cYXrrruQZ0WloNrWmQOMjXbw4qf+L2gwk9hTwBOHL2tm8kVdawYq9Z
         MCwmYyv4plNMmZyOGRFrQOq74q6FcJs4hEAz2JmwKYAl8YhO9yYyPRw2hm+C0qIXkWo/
         rKtM5JH2bgWEmnYjtTMnw7MVmlfTaj6HQKdZl0LfEDSgJMGrrDDenZtKaw0BjT3KcMJ1
         L/F+WhaH85g1/GWTXwxZjCRD/UGp8WmvucjpL1y/s1JQNqD3JjdiI3fbX8jXmpo6Dgs9
         9EUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896269; x=1792501069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nunSQ8CQNv0JezPiian0cV99V25mrgz6BvoT7slRlb0=;
        b=j+SyrdMA+REtm+bISG5rv/PCRz2qqv9gyB2BvxN/mVEdLeIJwKhzhjlMR61EL5k1cS
         uztRCRUpmw+Pd1oRQvhZlYAn+IHCqwVl6zrgeWY3Q7RoBQXgnsdJWRNXIQJawMNMwDkm
         y+nz8DUOuFwd517ZHpb5x4xk9w7poPbji0r0aq1qRDjCeE5Fi6ixi5b7GZzwqJw3mo0Q
         r/VlYcUdAaYcRnTYnSbdPtIk2mC0NQ4WqIu8wLcXygZtIHoOSM/JmvJv1PjaB61NGKgV
         C2kknUjGtmAT4IakkeHkS7s4iS6FlKf38becmSkCCLBOfL6D2juRuFO3hLZXji/SZF/G
         uJ6g==
X-Forwarded-Encrypted: i=1; AKwUvByhqU+jkJD0OeVI8XVUWu4w8uztTvLHtheqfLgkejumv61lWEp3cryAK6taBCtwW/hGLc8lsEKptwGIrQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLhT0jDShuDSclzEVY9ndU/S0UsHb4uLap0jAIXHX6fUOnd8bat
	HM5bvjz9TuHKQ0sEimfa/ZXq3nyRK+XZKEZ6DGZ5D65Lu0iF5n2TgFQxSRD/DIit3JY=
X-Gm-Gg: AYBFou2Xx5WxITyao0Hlhsi/v1zBPv/JEclzja99Q4nIB5nyvhFiwhhjCOb+Y6Qj8pe
	dfXk4I8ap4IKy2tr3JGwv/Q1p698KctzMHjTahPugAuRq4lCbp1s/Zie+aKsj1VEfkExXvuwOqL
	R96r0kdcv8QokTvQGAoCe1YkLqhnG/hPkU7X0P5/hKtz/CFQaWcOCTeDC8qrWVD5FrM8aTCOBbX
	doV3yxAypreg95hiUJidEdzwHbeQbjJcqsvgQlGrO5mDk8YECJxxWWXlUHCqt9lw+vMlv8Oe4aD
	8Agg8NOe1dvY/p8HxPkqbupRqZnJvnDbhWrpKAUrx1JCvc5/62rcv89m1b9WEge2q47cWpJcY+y
	pU+fiuqUJJVHEl9uwQz++yXT1A4JbmGTQVlZ4w+E2cApwSQGFC5rgyyhVVvFq/yWS5EryqXAAYk
	RnwpcUqpAZce7Hu1crX5TPTAz2Y0n8jXVXroanWxdUZKJU5vznIj3wFbmxaCoiUyHNJAItJrPJK
	4Oj/v+Al710DKhSLL5agFG92qMYIAmVx/w5Gjx56f1EKbsa8HZ+jcUtFNByeroBPMoMGk3PyLw4
	ejQYDY98jQQtF9W9XRSTg0VNI4O0NOo=
X-Received: by 2002:a17:907:c317:b0:c2e:62af:b6f3 with SMTP id a640c23a62f3a-c31a9afb29amr1158692166b.15.1791896269434;
        Tue, 13 Oct 2026 05:57:49 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-045.globalnet.hr. [213.149.37.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm605985766b.74.2026.10.13.05.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:57:48 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	lars.povlsen@microchip.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 2/6] hwmon: sparx5: separate temperature reading from sensor dispatch
Date: Tue, 13 Oct 2026 14:56:26 +0200
Message-ID: <20261013125735.1542349-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013125735.1542349-1-robert.marko@sartura.hr>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move temperature conversion into a helper and dispatch reads by sensor
type. Preserve the existing temperature calculation and error handling
in preparation for adding fan monitoring.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/hwmon/sparx5-temp.c | 54 +++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
index aa91780737446..0fd5c147f8167 100644
--- a/drivers/hwmon/sparx5-temp.c
+++ b/drivers/hwmon/sparx5-temp.c
@@ -37,38 +37,46 @@ static void s5_temp_enable(struct s5_hwmon *hwmon)
 	writel(val, hwmon->base + TEMP_CFG);
 }
 
+static int s5_read_temp(struct s5_hwmon *hwmon, long *temp)
+{
+	int value;
+	u32 stat;
+
+	stat = readl_relaxed(hwmon->base + TEMP_STAT);
+	if (!(stat & TEMP_STAT_VALID))
+		return -EAGAIN;
+	value = stat & TEMP_STAT_TEMP;
+	/*
+	 * From register documentation:
+	 * Temp(C) = TEMP_SENSOR_STAT.TEMP / 4096 * 352.2 - 109.4
+	 */
+	value = DIV_ROUND_CLOSEST(value * 3522, 4096) - 1094;
+	/*
+	 * Scale down by 10 from above and multiply by 1000 to
+	 * have millidegrees as specified by the hwmon sysfs
+	 * interface.
+	 */
+	value *= 100;
+	*temp = value;
+
+	return 0;
+}
+
 static int s5_read(struct device *dev, enum hwmon_sensor_types type,
-		   u32 attr, int channel, long *temp)
+		   u32 attr, int channel, long *val)
 {
 	struct s5_hwmon *hwmon = dev_get_drvdata(dev);
-	int rc = 0, value;
-	u32 stat;
 
-	switch (attr) {
-	case hwmon_temp_input:
-		stat = readl_relaxed(hwmon->base + TEMP_STAT);
-		if (!(stat & TEMP_STAT_VALID))
-			return -EAGAIN;
-		value = stat & TEMP_STAT_TEMP;
-		/*
-		 * From register documentation:
-		 * Temp(C) = TEMP_SENSOR_STAT.TEMP / 4096 * 352.2 - 109.4
-		 */
-		value = DIV_ROUND_CLOSEST(value * 3522, 4096) - 1094;
-		/*
-		 * Scale down by 10 from above and multiply by 1000 to
-		 * have millidegrees as specified by the hwmon sysfs
-		 * interface.
-		 */
-		value *= 100;
-		*temp = value;
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input)
+			return s5_read_temp(hwmon, val);
 		break;
 	default:
-		rc = -EOPNOTSUPP;
 		break;
 	}
 
-	return rc;
+	return -EOPNOTSUPP;
 }
 
 static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
-- 
2.56.0

