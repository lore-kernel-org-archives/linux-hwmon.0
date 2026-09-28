Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236FC4AEBDD
	for <linux-hwmon@vger.kernel.org>; Mon, 28 Sep 2026 11:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595674; cv=none; b=fdD8NrgPpSGD3vxYoCUgYAp7aB/LOfuJRRkn0s1TiZXWr5O23TRxuORWwVZEqfUSTYK1n/kJDsq/q8A3F5Hs4azCwOcyLoj/Zy70UZ0WUlspEovlD0MJYmIb1XKwtTSyd8j3+2qEFL7Eq0yZi8GR2+Sg0dwgNZVo05gFMZ1n5Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595674; c=relaxed/simple;
	bh=Kr9UONxjjUxn99JTOIoxfwCjuJCGfL3FExK5H8HcP8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MVsHP7plDqyXjMAyh55jxMuwwJbhaoy2UMBpu5VfB7sAPBIcOvpqa/Ml3ptHuFUXyAW/DHEHqgbnkAyuERa0+XZUuzmV6FOLDbLaBe8RAIdzllql4NPl4n6YK4lAPaB7tOPEchktjWM3SeGzb5faRo6vz4WcWoQ5Jz9nV44VllU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1K+mSoy; arc=none smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1K+mSoy"
Received: by mail-qk2-f39.google.com with SMTP id d75a77b69052e-5332cd97dc9so12842751cf.2
        for <linux-hwmon@vger.kernel.org>; Mon, 28 Sep 2026 04:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790595672; x=1791200472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H/A1kxT3a/jj/laCahxthkPsj2Zg7yYryLCMeaOi3cY=;
        b=R1K+mSoyF89rzjPsRVWRJsp7eN4IRM5hSkPCr2W5fObQEb6ReBkFX7EoeF9iT+U6Cz
         jXrKSTknR3AJerL8vvVCaXJxKFk9OLucdrZOP0sdes+p801Oo6IGgRkOig1+ixI2nerh
         5tGSHH3MFGv2WtmT49HwuYMV5LEdpIGyY9siFIvMiaaJ8qHP45pV0TsiM4WvCoBEUXbE
         guGSCddw9Atn+KWVGmrYI3YrYIIhNkYmkx+HJgbdAtdD6So0zlagLjdIZoticbGMUfVJ
         iCR2CuT4MjU+XqNL9KedmzDTCZjb0gWvC6Wy1jnbR1PGxd1DQToP8T/7C42ZJjiMNDAP
         6g0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595672; x=1791200472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/A1kxT3a/jj/laCahxthkPsj2Zg7yYryLCMeaOi3cY=;
        b=B6YWM7uDSghQBX+hCSueY400loeZ3MIvpfSW/b1qjCvzTdmqnjwXvP1+J1uLrYNVjP
         J/jukg4RLcXhgN/spBlLj+xpWNf+qDWz38DO6Kdp9GlVGVfKo1bN3CE7JJROKD0snZVS
         G5UowaUlvRsAUkUDHXJVc4HdE+s9UoYPQenQqIZstWNpYDdQqL49AR3pFkVitF6a4MRE
         0/YTxOgNfwY+/M+EH0SyBB8touFxti+Uf6TFDLfbRk7nWi2BMjUdcoQRWEheLSx9ax+v
         OPMUzL7AYgk8r0O5DMN4lfBP1v3V8Jd5ZI1AV0yTlGSXfVOaBJBPcHC4PAFssLj4cSYO
         e5Fw==
X-Gm-Message-State: AFuF++ks/ERbXVWbcZjn9cHIahPsMyMU+h/hkkpXY6J3o/gKtHZQAZVc
	zRVqgaCkoLwstU5qkg3s0vPaJsyDuAzaH7rqqljUMaUkFVh2dcSu/l3Udfi5QsB3BYM=
X-Gm-Gg: AYBFou14+1mps9UbYk9+ZduhBZeTS8sMAOfJs1itUTxwlAgCNh4VPC/tGk18ueRKq6f
	KphIjoZxf6TJoJxwPKSJZ//IXkMmQh+kjKOVBxq6iiwLf6/XjGYr1uqyUy3ex9A6E5X8H3nZreW
	WSaLVfV+Ktv8iBGLn9qZDug5mkvWA7YqLcKCau6A9n9oId0wo3nH98tXeVmjnpuAdzBbNw7io26
	/4hb5OC7ePvsiQhu9nTEwjRMPI3uU7hQJ7enMdKzjYFGriX140I6TGfKHWx3+vE44Nchhty48mn
	ypFZMGZdDFaztqVgXWWL3NyqzuhVk5uP3fT8/tcaWLAOmebdoiKY3xsoK051FWqRGwdj3EORoYY
	gf6xIWy7gIllfJMIj2y2aktgKVyNk2fnUr0fis4tGvFELyy/lwrjZHVh6AhdK/1UMmIWGxgCfL3
	Er6rvVU5T1RsZRV1Zbv2t9hRxSRFuRSlpa1MDVfpzIEE+H5KWQGHv1ls3SafaWDtMpR/ShrYNss
	qWDXtmyvHS6YEnOFC8hvcLDIpCIvv2GoGf3qZTv2r7G1wU7TRrtRho=
X-Received: by 2002:a05:622a:1c06:b0:531:172f:79e3 with SMTP id d75a77b69052e-5330b6ef781mr196045581cf.53.1790595671868;
        Mon, 28 Sep 2026 04:41:11 -0700 (PDT)
Received: from Z-System.tailddad04.ts.net (c-68-83-199-219.hsd1.mi.comcast.net. [68.83.199.219])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53322132f3dsm60937351cf.8.2026.09.28.04.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:41:11 -0700 (PDT)
From: Zac Lanzon <lanzonza@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Edward Blair <edward.blair@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zac Lanzon <lanzonza@gmail.com>
Subject: [PATCH v2 0/2] hwmon: (asus_rog_ryujin) Ryujin III pump control source
Date: Mon, 28 Sep 2026 07:41:04 -0400
Message-ID: <cover.1790512964.git.lanzonza@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2: patch 2: compute the elapsed time with an unsigned subtraction so a
jiffies wrap on 32-bit cannot cause a long sleep (found by Sashiko).
Patch 1 unchanged.
v1: https://lore.kernel.org/linux-hwmon/20260927120927.72810-1-lanzonza@gmail.com/

The RYUJIN III pump either runs at the duty set over USB or is handed
to its internal controller, which follows the PWM of the motherboard
header its 4-pin cable is plugged into. Byte 2 of the set cooler duty
command selects which. The driver sends 1 there with every duty write,
so a pwm2 write takes the pump away from its internal controller, and
after power-on a pwm1 write of the reported 40% leaves the pump at full
speed. Patch 1 fixes both. Patch 2 adds pwm1_enable to switch between
the two and to report which one is in control.

Patch 1 fixes a user-visible bug and applies to v7.3-rc4 as well as to
hwmon-next. On v7.3-rc4 the driver does not bind the base RYUJIN III
360, whose ID is only in hwmon-next, so there patch 1 changes behavior
for the EXTREME, EVA and WHITE EDITION, none of which I could test.
Edward Blair's analysis of the WHITE EDITION firmware shows the same
pump control source. Patch 2 is a new feature for hwmon-next.

Tested on a RYUJIN III 360, firmware AURJ2-S750-0108, with out-of-tree
builds of drivers/hwmon/asus_rog_ryujin.c on 7.0.0-34-generic:
hwmon-next 9edd5ab2656 as is, with patch 1, and with both patches. The
pump cable is on AIO_PUMP (nct6799 pwm7, set by hand for the tests); it
was on CPU_FAN at the time of the first comments in the linked issue.
Pump rpm at header 50% / 80%, then the reported source:

                                  before       patch 1      patches 1-2
a  on header, pwm2 = 40%          1710/1710 1  2100/3060 0  2100/3060 0
b  on header, pwm1 = 40%          1725/1740 1  1740/1740 1  1725/1740 1
c  pwm1 = 60%, then 40%           2460, 1740   2460, 1740   2460, 1740
d  then pwm2 = 40%                1740/1740 1  1740/1740 1  1740/1740 1
e1 reload with the pump on USB    1740/1740 1  1740/1740 1  1740/1740 1
   then pwm2, pwm1 = 40%          1740, 1740   1755, 1740   1740, 1740
e2 reload with the pump on header 2160/3090 0  2160/3090 0  2160/3090 0
   then pwm2 = 40%                1740/1740 1  2130/3090 0  2130/3090 0
   then pwm1 = 60%                2475 1       2460 1       2460 1
f  pwm1_enable = 2                                          2130/3090 0
   pwm1_enable = 1                                          1740/1740 1
   pwm1_enable = 0, 3                                       -EINVAL

"On header" is the state after EC 1A 00 28 1E, which leaves the pump on
its internal controller. The internal fan followed pwm2 in every column
(40%: 1545 to 1590 rpm).

Written back to back, 2 runs each, final state:

  pwm1 = 60%, pwm2 = 40% (patch 1)    source 1, pump 60%, fan 40%
  pwm1 = 40%, pwm1 = 60% (patch 1)    source 1, pump 60%
  pwm1_enable = 2, pwm1 = 60%         source 1, pump 60%
  pwm1_enable = 1, 2, 1               source 1
  pwm1 = 60%, pwm1_enable = 2         source 0

The failure in the linked issue needs the power-on state, which a USB
reset does not bring back, so it was measured from power-on (PSU
switched off), once per column, with the header at 100%. Source,
byte 9 of the status report (the duty the pump runs at) and pump rpm:

                           before         patch 1        patches 1-2
  no write yet             0  100  3570   0  100  3570   0  100  3570
  pwm2 = 40%               1  100  3570   0  100  3570   0  100  3570
  pwm1 = 40% (reported)    1  100  3570   1   40  1710   1   40  1710
  pwm1 = 60%               1   60  2430
  pwm1 = 40%               1   40  1725
  pwm1_enable = 2                                        0  100  3585

The patches 1-2 column above was measured with v1 of patch 2. v2 only
changes how the wait before a source change is computed, and that wait
does not apply to the first source change after the driver loads.

The two writes that patch 1 sends for a pwm1 write of the reported duty
reached the requested duty in all 19 trials, 9 with raw commands and 10
through the driver.

The commit in the Fixes: tag, cd258aca0dc4, first appeared in v7.3-rc1.

Zac Lanzon (2):
  hwmon: (asus_rog_ryujin) Fix pump control source on the Ryujin III
  hwmon: (asus_rog_ryujin) Add pwm1_enable for the Ryujin III pump

 Documentation/hwmon/asus_rog_ryujin.rst |  10 ++
 drivers/hwmon/asus_rog_ryujin.c         | 164 +++++++++++++++++++++++-
 2 files changed, 171 insertions(+), 3 deletions(-)


base-commit: 9edd5ab2656f040d726b5388f49ceac10bb2944f
-- 
2.53.0

