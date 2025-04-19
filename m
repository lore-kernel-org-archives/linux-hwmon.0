Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BB715A85E
	for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 16:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745079250; cv=none; b=NqR1QVoaExiByYgSH1YOF5me+/UAU3OoHIvLDXeFZ1yAIIbL1gmv7jEJlxMx+EDyoCg6GB3/6wKRanA3Jr+w/UEpqLk135b2VNPNZrwwCIxp+DmKafzd72uCbo5kZGSge1ZwxtmiRTU73FzhKxsYNOGGBj9WbpcPibLfHE3HqzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745079250; c=relaxed/simple;
	bh=VjiRoDTZ4w9Q2HB+2LBYN7mn7ApC3nH/FjhotaZEsAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsbZ1CsXqiFCTs1Luc9LBjXxIj8wpkeVWMsWi6yc2NDsdWgr6R2AdMDjKi+paTzeRXIDa/ZutNA2ObdK8fjHt45Y9jkJq+J/XCBq8LLIq6rLH9DONHmTQVXTx5dSkoWmDi+9qOxSupd6W8+s+tg3IX+eWluoslAsOMshTsugaS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOgedFfG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOgedFfG"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223f4c06e9fso24630965ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 09:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745079248; x=1745684048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wejKy83nxrLP2ZgrtpElQszs54kWIwGDbYZVEzGbAw=;
        b=YOgedFfGCV+9zusw/faQ0BiYATV63elbZvqrtqb5I4NpUNmtXE7Pi6HvwcaiePySba
         7PRJ1Z1F0k225ZVKpCP/NpZveDCZ+fDXotoRIeRFIMWSjPiE+0jXaLPY3c35lJM6/Q/q
         76BqSIRXJH7avgmuV5RMhRWNtiZxlgw9TVCk9pYHIcXKmf+6i4vbmnnLuTAvFVB+lQXH
         aFd0bMI1iHoiVZRucylEhI5lSQcCNqsdNBfFbzwGGEfKD4ytwLj9Pj7WmzfLWisOtZo8
         +/RxjwGRtWcKYQx6S3lTjqPTEz20EKMzbu0RX0jrvESmNExzK3fOFWfQj5DHVBsjDUpq
         Pb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745079248; x=1745684048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2wejKy83nxrLP2ZgrtpElQszs54kWIwGDbYZVEzGbAw=;
        b=LZQVeyhft56bksNtIVwJxjT/rrTP9HEGqp8t3koBhDa9Dyf5FcKbtBuVijKhFw4rI/
         8aNBqLczePQJa4jA8EldLmh4Kh7SnPTfFN4Z9qXMNxiBD7enfl69i8mqC89OMV+J4yii
         v1Bpt/T4X2Wrk8eHKp+VbW/wXJvw0p4PaNg0ZdQWzfDWOaoyvPqcGud+/2ehLJ8gQs/J
         yBLUQYBVEoVZa7jj46/49ClbgP9/jl/P8Z0EA9MWxoj24RM406/ZCoSZWlaGsXJbDzeq
         +47vtfze1qlIOddhfTPW3RDKPG0XRj9AMQN63J2WzHNUzJFAJ6vTM7zLQW64J0YBX+Jd
         ekQQ==
X-Gm-Message-State: AOJu0YxT9drLg9+ACuDu7oFIJaFd4S/Xa5OthO9JJ17eLgXEeqspjIXP
	Ob0PcneC1AH2YGNvhLetvDe59MRtyvHct8HhjdbdI00H01z9eOG8W/LYwA==
X-Gm-Gg: ASbGncuf/G2c/x05l6cHDlnTcPfLZiJYBytjANh0+RxC9lzvjSddjTOpWgGvEg21Tyv
	qZ46LW/ElbzxvKAdnf5SSbcDv5NxqiYd0w2ze3xMNsZbkOXlvMtVRBbI3DUeJ9S1e25grovaFCU
	2Wc+wmxsgcG/eEPikZtEEDYSVXIpJ0wwg6k9lgYiidivKw0d1et8keENoYO3RUodpOnPuzk0E6Z
	cjtXE8mqg7cVfY0kTvGHYvmNbu8jBPhw53+kraYTqdDO8ex9cYb/3zs2wUtZcKfPdV8fpn9fG2p
	EWY4jsHq2YBV9hNGvSi6SHILNDF2mxme4Vu4b2v2S+JGtpSCT/SVLA==
X-Google-Smtp-Source: AGHT+IHbxc09kmQ0LPQr4MocXyGjEek7/TB2+5TSk620AWh4gjnPaPau8/ODS8g/j46xDy2CUx9HUg==
X-Received: by 2002:a17:902:db02:b0:21f:58fd:d215 with SMTP id d9443c01a7336-22c50cfaa36mr89830815ad.11.1745079248029;
        Sat, 19 Apr 2025 09:14:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaac925sm3426295b3a.124.2025.04.19.09.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 09:14:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yo-Jung Lin <leo.lin@canonical.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/5] hwmon: (spd5118) Name chips taking the specification literally
Date: Sat, 19 Apr 2025 09:13:52 -0700
Message-ID: <20250419161356.2528986-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250419161356.2528986-1-linux@roeck-us.net>
References: <20250419161356.2528986-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas/IDT SPD5118 Hub Controller is known to take the specification
literally and does not permit access to volatile registers except for the
page register if the selected page is non-zero. Explicitly name the chip
to ensure that the information does not get lost.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/spd5118.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 02eb21684c3a..c5ad06b90cbf 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -621,7 +621,8 @@ static int spd5118_i2c_init(struct i2c_client *client)
 	 * If the device type registers return 0, it is possible that the chip
 	 * has a non-zero page selected and takes the specification literally,
 	 * i.e. disables access to volatile registers besides the page register
-	 * if the page is not 0. Try to identify such chips.
+	 * if the page is not 0. The Renesas/ITD SPD5118 Hub Controller is known
+	 * to show this behavior. Try to identify such chips.
 	 */
 	if (!regval) {
 		/* Vendor ID registers must also be 0 */
-- 
2.45.2

