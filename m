Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B52822083;
	Sat, 11 Jan 2025 19:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736622388; cv=none; b=u0lGe1sVRsAhoOv7/5hzKuWuD6gQ7GSq8ugmOqQG6NPok+b3hU/4J+kfJVyDK7zctkzwZCXqEnXNuhkJ4bBwx073l0+yWRAc2niPxb0wGNvyvZZaiFFl3A43Mz2PpOjPbqrZhZbqKZB+EUk1GzIII9oAj6K7oDKkwTJ2prPKlXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736622388; c=relaxed/simple;
	bh=nVGmGADrAWAg2fK0i1R1ZFdwB6MJy1gsg80ATrK5whg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CoQG8hHlxGw7hWCWLZcL/3iQB/8Q9werxi3z0Awgp+oYepwk0Mm5JdHD3x3jmbhrEBk7gsHakbYpLoe+P6i4MfcJcs0lg7K2ZCT57RoF1XG7OoKCIVZXDzGEwRVf3ve+snFukbX1j0Los7owpv2L+dRwgBA/dwuhgbBdbnyYx/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEo3ZUFv; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEo3ZUFv"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21631789fcdso53530705ad.1;
        Sat, 11 Jan 2025 11:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736622385; x=1737227185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HSncXnVeRS5eUn0sF2z2v72FmewKInAYDotx6holg74=;
        b=jEo3ZUFvQovMzFU3PjFtuRG7UBVGYntHNBEBnN4p5FtL5oPV/Mbz9tYEjii60kgipK
         h1Res7YKKC5Q+o2LLK4kLUCxe0s9MNAcHmZFvYe8NOxmJJKvCF/3piWfyvZ5R+94rW2E
         Jz9HffSQHXBu89upKVGWySNjo12qzSOXP7czKHCuRfWdTHxK+9wzA3VrPcavKulliiGX
         seO01jJ9jMipk77SujMg+RqggpJAujYp1FjA5MjIBwqtIxxGjjSdQMr34aW4QKnAotnK
         QX75wL+AkORWGACDNN1MXdXpuAR0ltOFY3PfqHw4MXIqnYyqoS1zw+La0ujgSxx/kH7z
         ZosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736622385; x=1737227185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSncXnVeRS5eUn0sF2z2v72FmewKInAYDotx6holg74=;
        b=HzHTDqsm7VYMxAKwAwtZJkSF6fjJj+8oncLXhAn1HXkINexkPM+o6ZXee/8oN63992
         wc1ri66d7PmHxyVouuWpzsXIfy3uwu3tIbDT+En4y3yyt0iVhtcHFhJWeqAlHV2MPogQ
         k7+fhzutATRE+VGtS5CLxavDmrLkaOLjSe9P/746DsJy/eEn2O7+2WNzxfaPkD32Yj0N
         taqriEx2VF3go2szgZergCie7e2YARY/njWofh5YDA9RLXmrjoNDqmRNYFrr8yH0LUzf
         FiIlIJFgpHAcHvKfJFBGiV9nK3MxiAPiN0C9tL8p8o1nslqJynWTBkwcWD8uZCEArI7c
         YcWg==
X-Forwarded-Encrypted: i=1; AJvYcCWjfMKBPCosvgDAG/t786hUu+osMFYlVJ/7pb2v6+1rA1wVq6f7I8M/9qQ64+kRSu5LdNN6/n+WGHx8sWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfyNhSWZa7pMlJAq2KHSMuq8eWQm1BvvBxCGyDv6PeR9gDiYe5
	fcgyBBezrxPEBrEjhdKqQzObvU0zlss/qlA8nsj8DmUxa42Mnr5cw+7+hA==
X-Gm-Gg: ASbGncv8SMFYkz7pQSDwBt31EOE0Ny6pI+Ed1ldMU7iy6tnkMxgCxnK9Qrwl9p6mF2h
	7+gVGhGuXt7TWymcnGV6AfuoSUPQir/LNbsmjlXWlL+5J7bs+2YzbyEwe41n+aX6Zj00TbAR/F2
	O1VIPZvbrUk5WARjfET8cYteaAgAxFkXarSH/4KwWILFrj8op749t66YI3AIevA3Hd6mWVZ5WRe
	uovG+N/IvDGYlYaB86IRGChKWccPUA+WPggV9qZmcAqH/cSoOlpMqx4Jcf6Mc1gLaG+VQ==
X-Google-Smtp-Source: AGHT+IH0NYAYr6tYFhmfA+puZazVEnS4zLAxQgT8+bTpnEOURhrTzRkl/F0t9KeCFkJaKCnvBjDAug==
X-Received: by 2002:aa7:9e10:0:b0:724:db17:f975 with SMTP id d2e1a72fcca58-72d3250abc6mr12916070b3a.12.1736622385389;
        Sat, 11 Jan 2025 11:06:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4067eeb5sm3461026b3a.137.2025.01.11.11.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 11:06:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v6.13-rc7
Date: Sat, 11 Jan 2025 11:06:23 -0800
Message-ID: <20250111190623.24948-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v6.13-rc7 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.13-rc7

Thanks,
Guenter
------

The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20:

  Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v6.13-rc7

for you to fetch changes up to 82163d63ae7a4c36142cd252388737205bb7e4b9:

  hwmon: (drivetemp) Fix driver producing garbage data when SCSI errors occur (2025-01-07 16:36:01 -0800)

----------------------------------------------------------------
hwmon fixes for v6.13-rc7

One patch to fix error handling in drivetemp driver.

----------------------------------------------------------------
Daniil Stas (1):
      hwmon: (drivetemp) Fix driver producing garbage data when SCSI errors occur

 drivers/hwmon/drivetemp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
