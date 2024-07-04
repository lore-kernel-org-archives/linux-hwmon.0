Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8932013A260
	for <linux-hwmon@vger.kernel.org>; Thu,  4 Jul 2024 21:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720129041; cv=none; b=dPWQ9Fhyr0EsNTy5ZUygiRlk7jTbIucWXgY7CJk59BIz3wm2RKwj8Fb+A6ZIf8Jy6ClAWRqBes3HCfCzlVnRa8eU3RleKrG7fvcIeM+Rs72m7tJV4D2Ua7Z2TNnkWIxdecN1nKPiOw2NMvOEI6UU6EHbJ4mOv3MUbrOVm19LpFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720129041; c=relaxed/simple;
	bh=Z0femB2RvkyedyK7tgMy/6mpRysDO5ZM6tSV9X/yzj4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YJJapGM/8M3knPObZN1fjJKQVIOtVdffyHqUAvJ8x8WS3qYZXid27+oJYNXm8T7LNyGPzuh2doKMnvYLjCWc3CFzdnus2rr9t07gtSOOmzFLZY8l7ad2Snlm/mG3MQevgxP5Qw86/x+JahFb1k/5RIG/kvcvHz1AhAQWXjCCzsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEIzpMmy; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEIzpMmy"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7065e2fe7d9so726985b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Jul 2024 14:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720129038; x=1720733838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eIUVVxLIKvH2D8f6HVI2xB56zt42vTeimEwwTqdihq4=;
        b=IEIzpMmyq/i2CdqHM1NUZRRbvY4W9d2BUv9MrL9xR3YRasb7Z2JS3EZ55GkTqUXaip
         049l8qRhIkS24EKcFWbybIPZ5Zhf1Vs4gfUdYm1gWHCLXEWNy8UC4wRTohRDfp0NwtlD
         lEUD/05nH6s7hO1UdXBmfdp5SaT8vImAn2nqkcwwy7DL3ZSNwO3NZxbpjVjKrPqvJhMd
         DSh20yFkWdUuanN4z8Pfw252LiMhew3YeBuq2RIBqHw3s4WYsOyjFuMdg0SASBi7A97j
         cJ9zItt7hReb0Uvd6FV67t6f0i6nyhl589cvKIpkSq2uPJBnLnK+1rVrXs6JADd0alQO
         dOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720129038; x=1720733838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIUVVxLIKvH2D8f6HVI2xB56zt42vTeimEwwTqdihq4=;
        b=jCNzBoc893A+bncudx3vBRiC4YMcaREGuxhr4oY9ehcVn4ipSK5rrFFjVOwecC0nrk
         rplkVxrtiahWRCbKAQzfcLVAv9NXJiHTUr2iYi78ObosyUontMo8GqMCi0B81t6N2sLR
         BPm9D89kbSZ1w1AyeGpNgwMH8m7Pa6230zMr2+hqTrbYTPSWBVGYWXP4fhoZObXrJmkw
         CKnzvdsi9r6CSuTGPzG0xvE/2xvHeESm+gN+gsCyoRmP7WVmCF1/ZdPHW0iI0+I2yqxR
         CuH2OknYLLg2KTIzwmHI9yPiuitkFT3dnIZIjUUhoKupjvtedMksOIVY1qy6pZV8ajwP
         qe5w==
X-Gm-Message-State: AOJu0YzsUH6gzl0QWnUoO0PAhtYpxote8pZf56f8buYh4Xai5zR+QqKG
	Acl+NGXJk0TvEM0Fwi4u1RC1GmK/MF8umzYr1Pvx2XRKstU1hWESnHdcxg==
X-Google-Smtp-Source: AGHT+IGmH8CSNimErBqS9eMAlPkPxCF9fqr4HT1OAUdujwoyj2hkbH+6lEQtm1EOPsbRt5KuKIF36Q==
X-Received: by 2002:a05:6a20:3947:b0:1be:c33e:1357 with SMTP id adf61e73a8af0-1c0cc892921mr3261957637.34.1720129038353;
        Thu, 04 Jul 2024 14:37:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1facea87fa5sm120066655ad.131.2024.07.04.14.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 14:37:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 0/7] hwmon: (g762) Convert to with_info API
Date: Thu,  4 Jul 2024 14:37:05 -0700
Message-Id: <20240704213712.2699553-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to with_info API to simplify the code and make it easier
to maintain. The one notable functional change is to drop platform
data support, which is and was never used in the upstream kernel.

The first five patches of this series clean up the driver.
Patch 6/7 converts the driver to use regmap, and patch 7/7
converts it to use the with_info API.

----------------------------------------------------------------
Guenter Roeck (7):
      hwmon: (g762) Simplify clock initialization
      hwmon: (g762) Drop platform data support
      hwmon: (g762) Reorder include files to be in alphabetic order
      hwmon: (g762) Use bit operations
      hwmon: (g762) Make chip configuration devicetree independent
      hwmon: (g762) Convert to use regmap
      hwmon: (g762) Convert to with_info API

 Documentation/hwmon/g762.rst       |    6 +-
 drivers/hwmon/g762.c               | 1222 ++++++++++++------------------------
 include/linux/platform_data/g762.h |   24 -
 3 files changed, 411 insertions(+), 841 deletions(-)
 delete mode 100644 include/linux/platform_data/g762.h
