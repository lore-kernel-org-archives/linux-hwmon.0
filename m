Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B105619EEA2
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 15:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772902; cv=none; b=AIPOeQe/Myp4aKPY9uSEVPpym0DruHf1OrtcAhEwEVPkA/4ljpzBdFhBk9VqUt75k6+vwvOIM4D6Z0XipNQ7Ngyyu6t2UJgH4Lc+VWuqE03mMjq025dLq1hHSmkiNehjHltRNebPsOerQlTXIlLr9EZjlj3YIrRtUbJA7nHCDW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772902; c=relaxed/simple;
	bh=0SXGR+AQHVV4w16HuMriSd5l0Tl2yQ8NEJMuhu+v13k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fTKvJwi2f96EQtgp+isma4wiqbpX4CtOBaa6pXk5pT+s0exil2vUkzEc/Fg8ctDJkllutSp+zbKkXG4bMUVgamD4otU9YUtEVITAdGp832c4UQeDZoYlQFtioIBU1XR8Otxb5P7l9k2hBcLHsbY/ECT7yPMo6FLidrpURax48mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gtr0E6nF; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gtr0E6nF"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2021c03c13aso42575845ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Aug 2024 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724772900; x=1725377700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pGVjrr5rv0eo3sHHLsXqjVr3Gq7500x0aZF/FYdQeZs=;
        b=Gtr0E6nF/MZn6+n2P7hog0+UGH80B0YVwhWkRRVm76u/b+aupd2wKkVCrJbRtRYFbV
         tre3w9EeAOGJB35GgOAE4eFiAbvlRt+yUOtjSuoYEVG3YLHfpx+ybWRkQfl4QHfrBUyo
         YclFetvRw+5ptppSx9bsp6MrZHs4TVs0WzNIRZ75TlpWUqV6vr/pCq8Ntj+C0GjhFL7L
         3yufcz7Zer5CZoVX1AQjmLgIRinU5/BrD4ijQZKdbUPqcF8T9G/XQ3sNwfXkUyVVGpOh
         hTwaoNCJ+4wsC2QguGw5VksxWak9hU+wd8OOc+OKFy4GCy6IPb0vjQdplgUJfH1pyH1G
         LwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772900; x=1725377700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGVjrr5rv0eo3sHHLsXqjVr3Gq7500x0aZF/FYdQeZs=;
        b=Ad7yHe+CiF9BHcLktttd7jQgdj70jp3uJKq7i31rIU6v3zbJ7TQGjHIzkHMmwMvIAa
         3mIYj8Z3uingb3YUtXaV+8klGo5zusvQNdG0BzQAcypWz+0vpD2PWojzdPSZJD/mAjrO
         rdhqSoYa61YCebEPo+y+puTziyFtkXKxaNM3p7bRXkj2hVSnekO4qir9T774MplKMO6k
         9/wBI8YhIpp6Fdn45lNoU39Zlrr1IOV+YvRNoCo1EbBKHMTcZtmvOjpHYjqJgb4m3yuP
         J/UI/VRy9DHq27J8106g6mCQ9OAHmGJxmJi8PAjwbBLNiFVBKqGFBDytR/SgSGDzymDn
         2cew==
X-Gm-Message-State: AOJu0Yy1MKs8mI4vXDkYbnJtkWxfWGgQlWSJgpOD7PfEBBdMUvsLDFiO
	1FEOoLO5QzRuIusk/Q5JWMguP23X4rQojT0TMmtjDj9NmdZIUvila6nI/A==
X-Google-Smtp-Source: AGHT+IGGCk4sgcfx7XnZvtfWwmiiMsuJgdyjKqNQNOJHftsHncFvEgzFJpeZg3uWyQ6q+Nn1ll4VeA==
X-Received: by 2002:a17:902:d4c1:b0:1fd:96c7:24f5 with SMTP id d9443c01a7336-204ddcaee05mr49539005ad.5.1724772899580;
        Tue, 27 Aug 2024 08:34:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203859f02e0sm84443425ad.250.2024.08.27.08.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:34:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 00/11] hwmon: (ina2xx) Cleanup and convert to use with_info API
Date: Tue, 27 Aug 2024 08:34:44 -0700
Message-ID: <20240827153455.1344529-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up driver and convert to use with_info API to simplify driver
maintenance.

----------------------------------------------------------------
Guenter Roeck (11):
      hwmon: (ina2xx) Reorder include files to alphabetic order
      hwmon: (ina2xx) Replace platform data with device properties
      hwmon: (ina2xx) Use bit operations
      hwmon: (ina2xx) Mark regmap_config as const
      hwmon: (ina2xx) Use local regmap pointer if used more than once
      hwmon: (ina2xx) Re-initialize chip using regmap functions
      hwmon: (ina2xx) Set alert latch when enabling alerts
      hwmon: (ina2xx) Fix various overflow issues
      hwmon: (ina2xx) Consolidate chip initialization code
      hwmon: (ina2xx) Move ina2xx_get_value()
      hwmon: (ina2xx) Convert to use with_info hwmon API

 drivers/hwmon/ina2xx.c | 822 +++++++++++++++++++++++++++----------------------
 1 file changed, 453 insertions(+), 369 deletions(-)
