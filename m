Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42B73769E4
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 22:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179265; cv=none; b=oIy2ZqFcrFnZn3uPwku/Iahg+dbIj3uXxJHIkzIahpV9WNcu3hwy5ifu0JEO0C2fHYpcvQKASXp85xhkMZ89Q5dvCCivfUxX0QiklcoZP1BEHouPA6N1yAw4psBRzEeg5d+pbjj2dhIZxOVPVPrPWHBs2lFyC0IS2q6gApZU80o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179265; c=relaxed/simple;
	bh=hV2AP1+ap8z9HTyxEQ1P/+SC3eladyH8RUAMJxtm8/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GD+U2i7xPhSs1/tJhpf1S2FzC8f4iPCH40EOngUYqqXylX0mfjbTo7xWUiJHl9Qw1U5jR968+SPE9cagU5jGpSDs3kbWjblS0Evd2DSAGChxyNP+pL7LHSYb6mIqFZR3vDJHD3U+SACpLGXlrj4z+tyaUBFwseER3TenuOhSd2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjzxicO7; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjzxicO7"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c858014845aso469927a12.1
        for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 15:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780179264; x=1780784064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQn9fbXhe8OSMhQtg1B7FiWYhRXYQP4dkFv9v1H9TPY=;
        b=RjzxicO7v8cx8ogX2zXdSxMf6kV/HgydWuId7EQYhqKWhlhDITyqZd8DHjJ3odf/wW
         eqokfDaA9yLoeyDFJZMNZIF3UmgSBYTMNOFhd8ABM9y8yAKHBkPxKX9BRBsT/mlEv0Rl
         n+6SDFMVuOGRGfmQW8vZ5SjfP6+HN329+v5fSReNs+kErxhqzzvAnAaKor2uOw4UBlBL
         YWZz9YgI2xPlogVj5lffIwmN838rpw0HjP2BEFCLgBE5jJboDaKJIzek9yl5rdqXY9lG
         QI8k95jueiz7SymNMjvdoxvQqLOe9SeIZsbAWlikmOGfQHmz7vh0XBfHKAH/yZ2mx4J7
         VKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179264; x=1780784064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nQn9fbXhe8OSMhQtg1B7FiWYhRXYQP4dkFv9v1H9TPY=;
        b=XRP3+hhuKaDGGKplxMNrJu8Flbrsucv+OjxmIgLn4bZrxHEDHnRnqyAGGom8iqxqM4
         ZePo7hL/8LXXxcXs1w4OH2upQwRE3h3j2QEkk8ljA4Q1zbQkWsp/0eJAGpcoTyu9qnoL
         fh9hiHJ5hVf/H1bgIzDgc9a4s9QbNtCdc/kv0bNR7sVPta82snTmSD1tZKxnTBJGSNI0
         Tx5bVCwJY5QstTmNYnlhAdWlHTCJnpOtjdUhBs97x+E7DOS+wr2oNy5y6D7Nd3+mOaI8
         hr1Ye20ULk+l1Z/01Jrgq6PZ+4UGOX1qDagl2A3mOYQiVg0L+Dx4lmT7SCeIBRbuVCx7
         Xb8w==
X-Forwarded-Encrypted: i=1; AFNElJ/R1F8IHAKX3NzsmZ39XINSNVapWsa7xDH7hW6W1VwMBSOfLv0UPLD+Pg+h+bUCAjiZQMETkmCD3fJ5sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTD6bAg6PcN/dR6PzoAGnUsDdF8NguPR5mi8cbhz+lyWthr+kT
	r6NCZbdFsXf0aqcrDZXfz3SWNW4eLTfjEFGOfMwSBLoiaZgqTB9T+KJE
X-Gm-Gg: Acq92OEZHFCS9Bg0cAttLirFLc0Km5s/dsK9PThKaXKVEevlRF5deCwpo+mdbSGVeU/
	XeQ7Y8w6lP8su25FK4v8Kn92DXtEfo5+FMVUwNXte4tAo3XoVM2Ncvlc5AiGVU+YT7d9hikkOhn
	IEE9ivy1/wctMZO9WIXffgppESwkWHsNuQ39aRNF4chQZOU+MiURM5Yzk5OK4lZm+W1F+Q5UrjP
	QrUygYhvBFg8xL5jXyAimeb+8vhjMOUgvpUwe2FBeXxTE5u7XzQPDgGTc8G33OdwlXxJNzMDvcE
	vEXZH2NqzGmC6EYmEDqIIjrs46YSeFbHQeTrNTuc10MpiRpdorMX0zoOAM54X+z1PPyjw9koIfI
	7JPLPbADzLdJKqkUIvolHUQk2EkNIJ1PuDRS7vCCbP51nMjV3f6gb03dovxjxKOpYQ1ZLdMRcvD
	3CiGTfNqEIAptHdr0YxV6vcXOqMykNc2yQqlaXPIk2jnHI2B9doTPE4jvYOMA9OChSEyOV2N1PT
	UZ5Q9o9BzMeXs8=
X-Received: by 2002:a05:6a21:3cca:b0:3a2:ce0a:a629 with SMTP id adf61e73a8af0-3b40fbaf402mr8406477637.12.1780179263933;
        Sat, 30 May 2026 15:14:23 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771a9299sm5515226a12.7.2026.05.30.15.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:14:23 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: linux@roeck-us.net,
	jdelvare@suse.com,
	nuno.sa@analog.com
Cc: abdurrahman@nexthop.ai,
	bartosz.golaszewski@oss.qualcomm.com,
	linusw@kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	manishbaing2789@gmail.com
Subject: [PATCH 3/7] hwmon: ltc2947-core: Use zero-initialization instead of memset()
Date: Sat, 30 May 2026 22:13:48 +0000
Message-ID: <20260530221353.159461-4-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530221353.159461-1-manishbaing2789@gmail.com>
References: <20260530221353.159461-1-manishbaing2789@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use empty brace initialization (={}) instead of explicit memset()
to zero-initialize stack memory to simplify the code.

No functional change.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
---
 drivers/hwmon/ltc2947-core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/ltc2947-core.c b/drivers/hwmon/ltc2947-core.c
index ad7120d1e469..d95265986b18 100644
--- a/drivers/hwmon/ltc2947-core.c
+++ b/drivers/hwmon/ltc2947-core.c
@@ -273,11 +273,9 @@ static int ltc2947_alarm_read(struct ltc2947_data *st, const u8 reg,
 {
 	u8 offset = reg - LTC2947_REG_STATUS;
 	/* +1 to include status reg */
-	char alarms[LTC2947_ALERTS_SIZE + 1];
+	char alarms[LTC2947_ALERTS_SIZE + 1] = { };
 	int ret = 0;
 
-	memset(alarms, 0, sizeof(alarms));
-
 	ret = regmap_write(st->map, LTC2947_REG_PAGE_CTRL, LTC2947_PAGE0);
 	if (ret)
 		return ret;
-- 
2.43.0

