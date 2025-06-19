Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D919242D7D
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Jun 2025 19:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750361884; cv=none; b=qJUscj03KU4WTJn1+18IaRUO7IMKBhw4u5/PCKo1mBBDvPNp4GDVG2apOuokERB/FNQAVXvdNR3o4+SfiIh/XfXx4bUyR2DdEq0xLWvlIKDertTV1PUoiwoC05xaDxRH0HPRCs/F5F3AW8/Edl1+sZqYRa4keQT4ZIqkJx0g5D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750361884; c=relaxed/simple;
	bh=GKZDoxyun/W4D4Ps9+AWIMGftkR3a/WAsAurvdXocC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QKQRtn/rKGwugC8XP2PF00+3y4ntZyZLq6RMqnrkeCYicHlCJxtZamdpduOgIXieGyPXEKRBCSXORZcRUiDqKbJxmIH0DPLi7Jx/JcPLR5XPIpmt0hCdp4PBrqcMdH7YWaFWBHUwVfuy4QBF1SOZoQzj3lpVt0bLBf5s7wJSeyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zefS3bVp; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zefS3bVp"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so1600968a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Jun 2025 12:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750361880; x=1750966680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaVEbAHW7iY/RUrqsyRdFPDF+vOux5UgaQ4QVWxZ9uk=;
        b=zefS3bVpcCMPvpRZsv8T0qBCL3ugLIOI3rrnZAQriXuIL4knkrb8R/eRdCkQx0PhVi
         JzQm8EWgO0/fhUNXHI4pXBrwWP0K7IoLGb6496G0tQje2LCI4VgFr8v4sIFt7vAqZJSJ
         xvZ3rdmrZn0ODm7fuWTyAvmxZVa7g9Ty+c44GbXM0thU58lDaZLayP2Y9aPd1LrYCojl
         tnd2Y9g36V+neTHgsFdhHIAQNc9dv/m6wFi9nZajeNR5OjrT419DqWiijzIxSTkqoWSC
         Kk1rls3itQDnC8JzfA+EKeTLQ4oMW/hKXXb0qDRvxYP+rq9LHW8gFxGgH4zkerilJ9Hc
         b8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750361880; x=1750966680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZaVEbAHW7iY/RUrqsyRdFPDF+vOux5UgaQ4QVWxZ9uk=;
        b=w5U/inveCRlXEqxpIdyknJSTqPNU5x1IvIYbfBBwpv7athy2fva5dGlKisQAJ7bOvs
         ocLPieFQ92G0oHa3uGBFQR3b5gvK1OtEfg0cBMwGncMjDjFI9dEDzRSiG+mTiJYwuEdi
         a7TbTFCau9i+Z/4NgIGtBgF2rMIU3c8FtkzFwBWIOzYHgwzvlB6DYh4Y5MRSz4J/UpHn
         cQYgRXh/Vs9Wz71R9cGNj/3rT4u8zWwR1cEXVL+UHKr2vo6xFz+kg+B0UgAopoBK3+k0
         NGU8JkyohEXR7RHlvD1FNJYHe1Cg7s4DUHIeAzd2PnbWOxyJDvUxW2zD3GgctvO+REvM
         kNhA==
X-Forwarded-Encrypted: i=1; AJvYcCV9heVdCkybxBXVVby83pt9htnLS/w9Y8Ma2/A/W1fpIuKisjnxw/RKUGUbHdE3jwRs5cHgbj8QSH+FYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVtPxBV+jb8vYIsNRs4zNwsZYWstwquL1filncBD9NTz3SpKo8
	MbGTJZUlEWuDNDKIzvBRCnDwGQj5bWV1ecBIHB0bAcqKELiNppJPLT4jY6oolkyWgBo=
X-Gm-Gg: ASbGncv1x69vG0qQnUNi9EK4+pVQDqj0HtrkRB0b0DS7t1aYan5qGbzeXUQGzZAbRnw
	PMUFK15Dthskj68Ev2w6NkvbBhM5J1ft/8ebNc1x/XtrM22Rswl+0gKWtU/CwfyS1PYAl/okdbC
	TvBYEltfBGFIt8dL/OyvQsGzqXV5lyJ3vZU3kl1ToKoauZ7m7mqOJGAaLZBWmt9XNHb5fPQWYEY
	MHOzSCCRZeszjYixUl3hXmE+jHbWF/R4tE726Fx8IONDNgtmpbobq1L7+vpAV1sKNBvPeMWqNQ2
	Q0eeeIZYunqmEJ9H7puG1m0BYjN6pOpEVUai89SjegK/pWnZiikd4XZjUqJ/NCIBp8M=
X-Google-Smtp-Source: AGHT+IFgv7zs+5tNzhJ+/45mr9xcHdPZuYMSm3sFSJY5FBT30yY7DEIBynYd5jjaVL96Mia5N10NXQ==
X-Received: by 2002:a05:6402:22c7:b0:607:2469:68bb with SMTP id 4fb4d7f45d1cf-60a1d1a3e3cmr160535a12.33.1750361880403;
        Thu, 19 Jun 2025 12:38:00 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60a18cba2a6sm336394a12.54.2025.06.19.12.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 12:38:00 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] hwmon: adt7475: Implement support for #pwm-cells = <3>
Date: Thu, 19 Jun 2025 21:37:45 +0200
Message-ID:  <b5cc994cbe74095e39468fd694c721d7c879db78.1750361514.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750361514.git.u.kleine-koenig@baylibre.com>
References: <cover.1750361514.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1806; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=GKZDoxyun/W4D4Ps9+AWIMGftkR3a/WAsAurvdXocC4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoVGcMm4I8jyxFpy5bMXn2hRwQ2vmgPG5zu8r6s TwpdBC3VAWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaFRnDAAKCRCPgPtYfRL+ TsuiB/9pmfUWm9dqxJTFQtO0u4t3GirVNY3lNVWHPWMfX1+qfar/v0Kc3AcCT4uNaFSZNSJn4bx MfVTFCENKGdau/eXCucvhYifPAbABrgieoqiR4XyQ6GYjsF9xMaagqtiPkW23A7USSzOdx9Uoyx d/SnFljJkisf+eMPLJLmC4ai2fbg/+vCY6hzs5jCV8JMe47CzzeCmUlOCZAMXlRrJ4miI0wLyS7 TENFQQ6OZLEDyAPXV6/yjrSXla7jJYpQcpUPcK0ZVzHgZl6ZccyoZoZsg8SMwQrp+gVkrC48oD+ POEVUEnMda03dtA2tlfIdH/D0EYVq6Kz52PJV6uHePdrssO1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The adt7475 driver and binding are outliers requiring 4 pwm-cells. The
typical value is 3, there are a few devices that use a lesser value for
historical reasons, no other uses a value bigger than 3.

Implement support for 3 cells to make the adt7475 binding match the
usual PWM binding.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/hwmon/adt7475.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 5f2541c11fe9..8cefa14e1633 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -1704,12 +1704,15 @@ static int adt7475_pwm_properties_parse_reference_args(struct fwnode_handle *fwn
 	if (ret)
 		return ret;
 
-	if (rargs.nargs != 4) {
+	if (rargs.nargs != 3 && rargs.nargs != 4) {
 		fwnode_handle_put(rargs.fwnode);
 		return -EINVAL;
 	}
 
-	for (i = 0; i < 4; i++)
+	/* Let duty_cycle default to period */
+	args[3] = rargs.args[1];
+
+	for (i = 0; i < rargs.nargs; i++)
 		args[i] = rargs.args[i];
 
 	ret = _adt7475_pwm_properties_parse_args(args, cfg);
@@ -1724,11 +1727,22 @@ static int adt7475_pwm_properties_parse_args(struct fwnode_handle *fwnode,
 {
 	int ret;
 	u32 args[4] = {};
+	size_t n_vals = fwnode_property_count_u32(fwnode, "pwms");
 
-	ret = fwnode_property_read_u32_array(fwnode, "pwms", args, ARRAY_SIZE(args));
+	if (n_vals != 3 && n_vals != 4)
+		return -EOVERFLOW;
+
+	ret = fwnode_property_read_u32_array(fwnode, "pwms", args, n_vals);
 	if (ret)
 		return ret;
 
+	/*
+	 * If there are no item to define the duty_cycle, default it to the
+	 * period.
+	 */
+	if (n_vals == 3)
+		args[3] = args[1];
+
 	return _adt7475_pwm_properties_parse_args(args, cfg);
 }
 
-- 
2.49.0

