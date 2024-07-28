Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731FD2F28
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 14:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722177442; cv=none; b=fz3fRYEcatN0yXY7Fz+xK8JuTxQxkpLBGSzqUFsja9bDbJF6QaBbQpck437iVj9r1etmKBIQV+o2e+pAagGFP5/V7Z7YsMvGe4667hp39V3gjnE4S2eGi0oWTqJ9DSK5NhsyUqGfYwuw6FASzl+/wxLpunR/X8HIfDBhwMlP8mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722177442; c=relaxed/simple;
	bh=nbdJug5zn2m3JgWsVyQ9xULnlbLqPOo47AZhHQRIMsk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bpVTW8f7vVg55r3Awu53Pi9wScz8GU8Z1jiaQhhKJPVSYmfNXZxlDYBSG3tbpnhTsS3Ht9RXBFPtliM3xuSxoZy1cAYLNECodaxDwaxxDeDYxv+hmtVfmk1vpRpdNj05WjFJPWGLYmi+cD03Nd3/FU5PHj5J+CfRQUxqnUS/Xgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Klcd5PVJ; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Klcd5PVJ"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3db157cb959so1751296b6e.0
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 07:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722177439; x=1722782239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KkpbVRpKNiOVQhkYuC8K5xX5pA0wpZp0Py/VZMVJzBQ=;
        b=Klcd5PVJ5lxvipjIDkZL9mBQOcwaquQGZkk8VTJnfxtQ2x29w0S1Zh0dz54pAo9+JF
         xMpEHrd0gaUZ9BVq7k9vV16xAxhe1gb5yz5I8WEsd1NePQazXiJ/zARViqnyFEm2wpZ6
         jMqijfWqyCfKGjoS7x+cIvlec76njqZnRxSgAkd4l1SQyBfjFQDLlM6c6egjsCKF8lKQ
         T/49OD5am6Q1nNPSDUnB3YtcXxyDK1xE2WdTJoitbLGY5eqFNBLASXqw/UOwOg78+ODy
         JqcFdiyX+pH+jmmxoWXPZ3OZIlCE9SXFV455CHhY7LkPYDFc0AV4bxLhHdQVjGQhcCLH
         Tp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722177439; x=1722782239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkpbVRpKNiOVQhkYuC8K5xX5pA0wpZp0Py/VZMVJzBQ=;
        b=nrOr2yaSS7abKg1G/dlOKDr807j1MbSXKI1fP652NGUpMwQuEA6JpfyPOj4KExHVHW
         1Leqdjjng54hBJDNa8uOGQlHkcyVGOP2X2Ni+3hDdDIHnuOTQVjGHFE4tw/qDfGKd5Uk
         sAaG86R+mHPsz49UiygqgxbvFJ9hvezI67j6ZiJ85z8VxOtRpsMcPwNZ7CTY0GMHGGOq
         0+3jQsfhAU/4Usgz3yYdcTMfN38wdbZISIvKFzYkRdXw2oT2hjW46iPCjFG9a5qvAWts
         86RLaYT0q4pD5IiqPUT7OdzaSQrajB5DGvzK94Gi13Uht4S44OcXQTfmsM1Bm64yJ6kB
         LCCA==
X-Gm-Message-State: AOJu0YxYXJtYy9ErlNzxMWpUf/2LezlXo80RhQvG67u3N5IvWtotV1hm
	DPNRcZVvotsJYecnt7rALqZ68eCu2M7h5J5l+Co/hr26NmGB7UysdUEjSQ==
X-Google-Smtp-Source: AGHT+IGH0c2/3ePdkLSvtq1StY5M1Bbe2n3Iyb2XvEITtsmUD/rwgIz6VxeQWHhovamk3VfE0hVuhg==
X-Received: by 2002:a05:6808:200d:b0:3db:160b:d5e7 with SMTP id 5614622812f47-3db23a09513mr6783193b6e.22.1722177439016;
        Sun, 28 Jul 2024 07:37:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee5734sm65511685ad.135.2024.07.28.07.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 07:37:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 0/7] hwmon: (max1619) Modernize driver
Date: Sun, 28 Jul 2024 07:37:08 -0700
Message-Id: <20240728143715.1585816-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix limit overflows, improve chip detection code, convert to use
regmap, convert to use with_info hwmon API, and add support for
update_interval sysfs attribute.

v2: Initialize chip as in original code
    Separate 'alarms' attribute masking into its own patch
    Added Reviewed-by: tags

----------------------------------------------------------------
Guenter Roeck (7):
      hwmon: (max1619) Clamp temperature range when writing limits
      hwmon: (max1619) Reorder include files to alphabetic order
      hwmon: (max1619) Mask valid alarm bits
      hwmon: (max1619) Convert to use regmap
      hwmon: (max1619) Convert to with_info API
      hwmon: (max1619) Add support for update_interval attribute
      hwmon: (max1619) Improve chip detection code

 Documentation/hwmon/max1619.rst |   4 -
 drivers/hwmon/max1619.c         | 495 +++++++++++++++++++++++-----------------
 2 files changed, 288 insertions(+), 211 deletions(-)
