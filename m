Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2BB22FE0A
	for <linux-hwmon@vger.kernel.org>; Sat, 20 Dec 2025 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766238578; cv=none; b=hzJyi7bDKWkaok6OiGdRBBlC6LrBmh1Wb+e3Sxs3I2keX/ypg+hRzTh7YB8NeE8FLOtKzH30/3JVKTN0GKxVvWn27oaEP1lybSRFZiQTNETP1oCwpPQPRgdJ6LWnd4JveLrYHnrBdC1Yv1b3V6z1MiY4ST2qd5R/4/Oh3x5sgoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766238578; c=relaxed/simple;
	bh=uWLsLhl1eX9m7vHHryddR3jD5f1VcRwxODNPwt5Lj4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Elld95BICCxC64yFIbP27g9ItfVC9MpcXa01RW7i8/+1s9zyjbWQrRlegmqqaJwerfWJ26Vby+Jp74mQzsBpSI/6rrStvVSzTHyEZBTh0D+iZalexaLjvNdxZh6xHdZa86O2RbJIvkozk9JCFhcxmIo5THW8hd9F1NdBbe29Nrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXQTFukX; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXQTFukX"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c1cf2f0523eso1793759a12.3
        for <linux-hwmon@vger.kernel.org>; Sat, 20 Dec 2025 05:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766238575; x=1766843375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CA6PlbbJT4tD9CiBeBP//7UuX07vGEOnP/9L2UfXP7s=;
        b=VXQTFukX+a1o3KufmpIKNONkpvUWSxr/ftt3GeLGYEy7Q4WqlAodjMd/gWANT5stSx
         TePSPMhGJaRqeECx+fIVXi6bH7/PIqgvMc9/pipKz1IaMj8jJRlchDcAWnEzL6JYlIF3
         nOgHs7HGwaD+svQ2nUlwNNjAedHRAREVslsuFl/pJPbbbLP1SCVsXyXdSap1hp84SEUn
         XzmLUlJropj9pMqOr9C0IeXcb7nU1W06t3w7BKdKXIheN3GhM+xdhCrFBdU3yebJa9ah
         IQdJcTz51DtWrB22A1/E2ftsEzbsix9VxfxD/rsp1RW3sF03EFkKjU2ckDJvi/Wmx6X+
         Y1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766238575; x=1766843375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CA6PlbbJT4tD9CiBeBP//7UuX07vGEOnP/9L2UfXP7s=;
        b=cj/m93cUN9xwK2I/j91shth2uwIJYkcwUEiY0XJ0XpD00pH6ByreiPui7327Lp8d1W
         u2c4hMrHzbHIjwLX5ZKNc9q7zOXkw8ABNRYfzT3q2IKt4Y34cz7N/rIviAuOVtKLiruj
         Gfs/x0faaotd2xVNIiT3nvjdr/cDjvbOm42LS5zx68x+5OczgtU9ZsBSLfd0mjQwku+m
         nbv87Lpd5jd71856O/NfiAlNHTbIgiCH5NFPcsiTMcDnoaT5CYs5ZWC8QifArmKjsfTF
         574P6BLSghey0Qgh7/j6mEAmjtMzsdULQTT341KpZY6ybo4gk4JTLWn1N78P6BDshUvB
         IyXw==
X-Gm-Message-State: AOJu0YyD+Pfh1UU2SkvYty93iGtS0DoQ+o1S7MUmLimw38QZlKIocu6P
	iXwAry/99kcg+ux1f8RHGOiYhMwz9WhTk1Yp7buSxD6WqsYLTNrn99gZ8fJ3Ug==
X-Gm-Gg: AY/fxX5klPLB2hdhkdqdHWgt6vEje0O6+CfLJT15j4Ysju4i6rcO0GHS+IeDD/H2CoN
	g3rpGk4orVkLeZz5ujsZtTvn/qE5CcQQGL+N3NX3YuqIlg6gt0f1Z6m/Q1YwLqZDafn8+HeV/XB
	Q1jxp7DgJv1MGuGR2GuulxGWTllvOlYdGbbrBJJAoMqiR+kf6cJfGNOALJ4myU2OKrLskL4zeKA
	U9a/vZ5M7Im82/JVxSGUJZAdJ/ZAu0iUiSyKOBrR0CN30ZRqPyaN9xK7rfl5IMp7B8h6G1C6gaF
	vwVYUryS0TWOvjmdYSghQr85JbQ6NbioQNoj1S+YG4SfjTijcU5NZTywhbnuunLpkxANUbot0J9
	2IaGAzWPoHuxdpd36pHKjBTYwFUxZN18b4I6x38ch3THC0K4dgLIB7JUSnx9/gv+IC0qeaO0/Pj
	Emg8Bx1wErwrnwGdBIYV5WzvSU
X-Google-Smtp-Source: AGHT+IE2QNDwIQf/FAS1kF+VxWyyxdVtrX6LYtpS7SK9jizTvKrjma73IbmDyfKbvzAgvQUDXe3UXw==
X-Received: by 2002:a05:7301:7c01:b0:2b0:56fd:4b67 with SMTP id 5a478bee46e88-2b05ebfbfe0mr6020267eec.12.1766238575321;
        Sat, 20 Dec 2025 05:49:35 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fe5653esm12961086eec.1.2025.12.20.05.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 05:49:34 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v6.19-rc2
Date: Sat, 20 Dec 2025 05:49:32 -0800
Message-ID: <20251220134933.4070599-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v6.19-rc2 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.19-rc2

Thanks,
Guenter
------

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v6.19-rc2

for you to fetch changes up to b3db91c3bfea69a6c6258fea508f25a59c0feb1a:

  hwmon: (ltc4282): Fix reset_history file permissions (2025-12-19 08:44:22 -0800)

----------------------------------------------------------------
hwmon fixes for v6.19-rc2

- ltc4282: Fix reset_history file permissions

- ds620: Update broken Datasheet URL in driver documentation

- tmp401: Fix overflow caused by default conversion rate value

- ibmpex: Fix use-after-free in high/low store

- dell-smm: Limit fan multiplier to avoid overflow

----------------------------------------------------------------
Alexey Simakov (1):
      hwmon: (tmp401) fix overflow caused by default conversion rate value

Denis Sergeev (1):
      hwmon: (dell-smm) Limit fan multiplier to avoid overflow

Junrui Luo (1):
      hwmon: (ibmpex) fix use-after-free in high/low store

Nuno Sá (1):
      hwmon: (ltc4282): Fix reset_history file permissions

Okan Akyuz (1):
      hwmon: (DS620) Update broken Datasheet URL in driver documentation

 Documentation/hwmon/ds620.rst  | 4 ++--
 drivers/hwmon/dell-smm-hwmon.c | 9 +++++++++
 drivers/hwmon/ibmpex.c         | 9 +++++++--
 drivers/hwmon/ltc4282.c        | 9 ++++++---
 drivers/hwmon/tmp401.c         | 2 +-
 5 files changed, 25 insertions(+), 8 deletions(-)
