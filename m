Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B2421C19B;
	Fri, 20 Dec 2024 17:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715231; cv=none; b=gR4SuZln4NB3ARQ6rx8PVwcyVv7VHq4e0PpwRkgDZJDnaALfMqOJ0VXZtI+X//5hxGviD7Gv/qAVVyEmE4jpYAVs0SSbXxnMo6MJUrngSnWWP8F0WH1TZeA5kh0E3esOKSr3ZbQc7+6lM4ddqXDgSWQCLGZKSOpJaKLqfrl81wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715231; c=relaxed/simple;
	bh=hauOERCBb3hS8j77hIzIME0ydKd4U0Rm+2wONeGr2/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mq5NoqV5n/0zXsErysrbY6CNH/SJ83nWdmms/Om0CBXeW8++uLrx4v49TmOPSkGAlK6pnAgo4hmbtVIKEyAmZEmjOUxr6kJ+np5sZkihMVAyDC08TPzyz3acATxkb/3t4pNPxKilpzjyq0KeMfTy7HR/8DuRy0f+zkadsxCL1bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcEWvyUD; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcEWvyUD"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-725f4623df7so2184248b3a.2;
        Fri, 20 Dec 2024 09:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734715229; x=1735320029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UArkncCktxW90HT9xgryukAWn3o1O3X1rUo3lvdGP5s=;
        b=AcEWvyUDoSPCQ+RW7ZEjNDoPOt9JGvvo8yq8oH2WeLVPaHBscCBPTcIZTx5ZSO5tcv
         wfGHTxQCdr8URNiyL6SAq3DaYY8gOAPZZTUM8Gk6TkF4nZ2utR+82v1IukUW5UhuNzLm
         0Jg+Su4Xkor+5pLMNjANrG1MoQSfIeyZqvAc1kIE2TAdEX5Zh+UUQ+FthIC/CLrmrVsV
         LvacXpKatfkgvfEV/Lch9w8IHlhyVGTD01psKzXA6lehcROwJSDno7f+xtDksgij7F8q
         nlTiswtCYTybWStqqRIpnnTPfeEpkitkcr68TujLrQ5ontQCYq1SjrYLoqbT0myuz0OB
         WI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715229; x=1735320029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UArkncCktxW90HT9xgryukAWn3o1O3X1rUo3lvdGP5s=;
        b=QFTvcxSTl10S6gTb2ST/eMXJAisy7Vxqm7SuxK6X0OuUeZ8GbdiGJaL8XCYiipJW9J
         8aJ2Sn6MRRE/Lk1oL84H9qXYuBYHQae6pxowg7xEkhwEFWZf+88y5oDWdUhAxzbYZH9w
         kTp+SSKSwEYwhjWLIhy7gXG+Je5ZSncDmysb20kYid470PB/8xTuaHqsfqdY9rq2fbHw
         OFECaKkbELrDhYrxlv3tMMfoaatnzAMaRbQLavosV5rvCu8PNtHKEqGTGqadSBCSos9h
         +2DMzSmy9h3hjNKu8V4B54qw9uzYEWZFDrusjU+SX9OCVVgWhpiz+UFXTRyM7svEeXvM
         r1og==
X-Forwarded-Encrypted: i=1; AJvYcCVp+Lh31wg6VoPDeO+gSGxtG7tEO/8PO28GzZcXP3puWHKZ80jQ5s6pobcXUlT1f5gLU5DLo/BWSHZ3s20=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmwWKdimEUT5rUfMimFJRRAsb2HZCbcvRtbOnkMOGUih74feax
	cKEyxVlFvyxbTbv6Cqk+Vyz/KEzsUeRSOkOMROuxzKw1Q3cvJZRUCv3sVw==
X-Gm-Gg: ASbGncub/sLqNAWCdB4V/HvQDOwWotud/oDt9rJzPcYqvLdNpSrZKQ4hFUgRUUhHwAz
	h0wzCwkjdBQTyKhZdluN0qtlqEcqvlBr+keDinwNWGmPVfEX6N6KifQWIOXJG91j9uXsX/LlMGk
	bHplDd6Wd0YKDuHaROQSoxOd+2qzIJ25CnfN5rQ27i5aUQu+AqIZ4/oBnq/LL/BTeqs70gx5vvy
	Ppz1atsHMlrK0wfo27FegGGtObQcnEU5xvq8DhDRxbBxHIxkYseSPlABJTTM2k2BTSzHA==
X-Google-Smtp-Source: AGHT+IHQfm9+A2bql0IENWoqvTYnY8O8Ss9eeIdNOqqXi/eBBZGRFDFyEpwk2OqPXsu0vBlbGUdLgQ==
X-Received: by 2002:a05:6a21:2d09:b0:1e1:6ec8:fc63 with SMTP id adf61e73a8af0-1e5e046520fmr6159747637.11.1734715229134;
        Fri, 20 Dec 2024 09:20:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad836d22sm3357458b3a.77.2024.12.20.09.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:20:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v6.13-rc4
Date: Fri, 20 Dec 2024 09:20:27 -0800
Message-ID: <20241220172027.1001380-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v6.13-rc4 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.13-rc4

Thanks,
Guenter
------

The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8:

  Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v6.13-rc4

for you to fetch changes up to dd471e25770e7e632f736b90db1e2080b2171668:

  hwmon: (tmp513) Fix interpretation of values of Temperature Result and Limit Registers (2024-12-16 15:58:25 -0800)

----------------------------------------------------------------
hwmon fixes for v6.13-rc4

* Fix reporting of negative temperature, current, and voltage values
  in tmp513 driver

----------------------------------------------------------------
Murad Masimov (3):
      hwmon: (tmp513) Fix interpretation of values of Shunt Voltage and Limit Registers
      hwmon: (tmp513) Fix Current Register value interpretation
      hwmon: (tmp513) Fix interpretation of values of Temperature Result and Limit Registers

 drivers/hwmon/tmp513.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
