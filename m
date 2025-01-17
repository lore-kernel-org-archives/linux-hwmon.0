Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CC819CC3A;
	Fri, 17 Jan 2025 16:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737132202; cv=none; b=mbAW4SikER4JfZigd2k1TbZuP9h/xYjDguijGmj9OBF5aWWxEGrcMwOatTMjeCOHs4FhAydVzTVeRIeOzrvjI/DyKImetKSOq4cbTnusocdariSxap1K1UJKtBoUFk0E12iWROuEovG+8WHGnTnkUi+Tz18nfHj7coWJfA9dIq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737132202; c=relaxed/simple;
	bh=bgC9gjs9GLuadOL0PyqC43HwUfAwCWF+UO1CA4QN01M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ROY3Oy0HdaHnY1ElGUhPyNERLXnVnFWF+NyPUQQnvqTmrRWtC9Eu1gKnDtw0IcP+uWxsQOhxa/6CLK+bwG4RJ49hJPGOzP1N1zuEd2yP48AvZnsJEe+poH1LgRUrd4rTILjMEuGhqd4wXOu9XN9BkhkvFMPTIql7sOz3GlIIfJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhmSlDV6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhmSlDV6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2163dc5155fso45419705ad.0;
        Fri, 17 Jan 2025 08:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737132199; x=1737736999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=aiACHsGpnFhoRTB2y8Bcbs1KRFqeVENc5dk46cWXv6A=;
        b=dhmSlDV6JchJ0Gba2DFm5qDSXyaJ+tO+F+avM2z2RUT7Tj1BBz0mAItb1lHazJHTVD
         AYT6Q+kHof6wfFW3LJiexog2BYnyFLtynw/u8bE7325w5qn49MVB/6lAThh81ORhEqPb
         YjVYek8KPQ7x7B+wsfzJLeYunXbCC0gTleXaMBIFYtrfOYPfxF7cwtUFmDcz8rMCtppf
         IZg4WKmDw/0NhRj+LTYOlBeIHtaoatEgUvAu2z3RgbKED/8W0SrIRkAKOaosq3t/V0s0
         xyyfuXmUUhDE29MS0vXanU73Icv8/SHHQUlL8oDgVOjGioIGCwqX4BgBmutU4bFoPsm2
         XoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737132199; x=1737736999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiACHsGpnFhoRTB2y8Bcbs1KRFqeVENc5dk46cWXv6A=;
        b=dTW/bM3/hbe+5d5/Zayawn7d8KoMl/2Bax9vGKO7C7TIE4zugd3lMnXoBrAOZSXSN4
         JdM3h5O4z8f9i9TJ/fe0ZRh5NIVyJNTm9LWFdPc95vH0xhj+bu4+vEqx4A6kTyvvdTJo
         b8KXqnCW8yoze1L5F7z8I+MdzTkZjzo61tNOE7iyrKqjhVJJSH8Zf09UuvYGx1Qb1Jlp
         8HokJ4T5si5Nd+1TRPqLhigh3bJJCwkwNpYDJ/WTa2Cu5QmcoHudNKQRl+poA4VZ/iPq
         NVX6QK1bK0owzkBS4SI/w0ihQ2S2zeJkNFPosEWbpKUC2DYUfooW+i3j0VRtde8z4p4n
         mOHA==
X-Forwarded-Encrypted: i=1; AJvYcCWNyrGUXyxkD8KMBVJKPEnlhtKMStyg+bM83D4mCcgEO+3oiBlK9rLl0ftrHUc7iEuky0YoQYzZKJF6gVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFWXnpO2aDLFWBukery67vtKXXM86NXppELI8Tqv0P4EqPeBj8
	mTeNjTlDwX3OndY/I8OW9vIOjZ4XUXY/0nzACZjV3Jg6nH4jujWda+9kNw==
X-Gm-Gg: ASbGncudPlFCOaq4aTdxS5TkgTwVPoG46/h7AZnGNlLZkgb1NUCPiLXAnqDw/YOsesn
	0dKuZMd/SIV0MdnjGvit7PPAwfPYsx4UdvepmmuXA25O1w13yEY9x8afTj9/7rSuW2Tl2J7RQRW
	oamu1w6g3iiUbZm6fD7TOAp6cobO2nzVNSDl49fSBDVVh48FdjQXE3CwHKxy6namX1OcZKJzFfq
	W7MDaRyUvnfOwb/AddIR7Px9HW0dgM2DE5ewHjbaztJJrCyH0iDIeOuNe02U8V2I1XjfA==
X-Google-Smtp-Source: AGHT+IFXfVbFudoqoL2GfiVIVczZIFYFOIhDNGuwJ8RP65QDO56fO0m500nL995ExlSHBJmvDOiMeA==
X-Received: by 2002:a17:903:32cb:b0:215:a028:4ed with SMTP id d9443c01a7336-21c3550ecbdmr45159865ad.20.1737132199349;
        Fri, 17 Jan 2025 08:43:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3d8537sm18196735ad.160.2025.01.17.08.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:43:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v6.13
Date: Fri, 17 Jan 2025 08:43:17 -0800
Message-ID: <20250117164317.2710233-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v6.13 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.13-rc8

Thanks,
Guenter
------

The following changes since commit 5bc55a333a2f7316b58edc7573e8e893f7acb532:

  Linux 6.13-rc7 (2025-01-12 14:37:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v6.13-rc8

for you to fetch changes up to e9b24deb84863c5a77dda5be57b6cb5bf4127b85:

  hwmon: (ltc2991) Fix mixed signed/unsigned in DIV_ROUND_CLOSEST (2025-01-15 13:52:43 -0800)

----------------------------------------------------------------
hwmon fixes for v6.13-rc8/v6.13

- ltc2991, tmp513: Fix problems seen when dividing negative numbers

- drivetemp: Handle large timeouts observed on some drives

- acpi_power_meter: Fix loading the driver on platforms without _PMD method

----------------------------------------------------------------
David Lechner (2):
      hwmon: (tmp513) Fix division of negative numbers
      hwmon: (ltc2991) Fix mixed signed/unsigned in DIV_ROUND_CLOSEST

Kazuhiro Abe (1):
      hwmon: (acpi_power_meter) Fix a check for the return value of read_domain_devices().

Russell Harmon (1):
      hwmon: (drivetemp) Set scsi command timeout to 10s

 drivers/hwmon/acpi_power_meter.c | 2 +-
 drivers/hwmon/drivetemp.c        | 2 +-
 drivers/hwmon/ltc2991.c          | 2 +-
 drivers/hwmon/tmp513.c           | 7 ++++---
 4 files changed, 7 insertions(+), 6 deletions(-)
