Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C66447AF67
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 14:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784645479; cv=none; b=ej9695R/JVomFJVqa4CCJGRE+r7lLBOFmHtcBDMu3I9dUuzj17kT8CyQlX0UYgcnqYoQnmmMx5+N1rT2kgnnqJCDZ+yx4W4hixayX5JJyBCEq8ULCBuZjCIdxZnO8qa/gN+ojQg0UiFp1NppkvdAqzLlGOG2/1X4b56YGMXjWpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784645479; c=relaxed/simple;
	bh=u7eIth4MxkJWLi7Yql5qSUYx7ooKvZDSrgiiLtsTYXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c6z533+XxWWrNOAvZKSY8G+q7XVcFmjTMv3OnDjxJU74j8hGjsPyUj4/uiVedBSX88SAGj33hoVoolDSgqvyaFc2n8zYThsRJ6Dj9koMLmpul8bja0p4XFSbtuq9ZqqmyZejVXzSsy39YHTIQG4z/W4TkAgI9FeiVOtNPkxaJds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NexcCK6d; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NexcCK6d"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so103284015ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 07:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784645477; x=1785250277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+0v0v2VvQ7UyG88Sjyivl4GAyaLJVxaRadoUC7AMWY=;
        b=NexcCK6dGKACFt+0238cWtNpc8qo3ezS7KK8AdFbJ++tzOpNWPrfSXa3eK7SDOIP3U
         waBeXU20gVv5lChKMoLG2rCjFgOv7cqU1vVMubyhgmrmrZcYMF2BF9c/dP9AaPOAAquH
         AoVH5PVei0nSlSpK00rxTST1eMpLNLa3TXi20gmuKY+NObqVbu29sW4zuV5FjbWwz7ri
         HT2dVzBWTcL0zNWPoiXi0DYICdih3oXhaynXMValmsfVsItqD/HR4MlLQqDueZhFXkKu
         /gzJInX/662dPL9ad9nFQrPuohZo2zjmRid1dZ+skdynlfT1wVY06f3rppjo6QB3o1c1
         25tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645477; x=1785250277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v+0v0v2VvQ7UyG88Sjyivl4GAyaLJVxaRadoUC7AMWY=;
        b=n9IbLubcqkhmw8/5sZiLGNn88Tv40Zmkxl+S4DSPQXCfkx9pdE0EOKOBSb4VdMUWTd
         uqXPvkisxbfFewNr6gZY8C0qNmJp48ZoXjlz8hO54L586fEKqvp2IjQJK+kowbRpVI+M
         y/l9l5inexGrvWeoPGMPtPxF+Mkstc+JuH1Gh/EV7FNxZouMECauc1vqrNmyJHS/VysZ
         z04VRaDQd02QogRIGCsN4pvIKC0O0Bj6zH6e9SHirazenogbG2gXLcBnIsyTdcCqdH2f
         9tSnkcVJsYtv1sI/5RYSUHQc3PaDdS5/skC6K3vv4Y7G/UsM4WHzLdhdmOu//dHrow4G
         FDzA==
X-Gm-Message-State: AOJu0YzZeaAapBX4dyYFwXhkuYx5ZF8MrN4zvd3aokd0Wqtaar8oeZQ0
	r8DVYQB4L8agobCKp5SImN4ylgOvJNNjOWB/uKWZ2yZ/Lj/NBlHWd2Tl+te5GQ==
X-Gm-Gg: AfdE7ck0EkTz9E9MfR32zkUsFTJe2Uxjg+Q3ThqlKwt9MDRObq2zWKunDT9M04qJZ7g
	OHgGLcrjFANsegSO2JlP9dymEz6/UbnZxngmWLeJ/FufZi8TLcHI2vuX0B9bHD7KuzyanDQ4dzc
	N+Pj9l5sC8lq46TB3ibEJPpSNWhAZh7a8RzzoVrFf4wzf8M6XN+iQiM7iPNn2zOzd3iKweSYDtl
	0Ie6q0Mtq+4hXAioHLlqm8Z+7OYmyfSMTiJbRgaQjJcd14t3Amd7072nF3hts6yfJVdA+GwPtlK
	B7r4QTZsMdO0EPARIX2IcZRvdxFKBOEc8ARDg2fbws5xBv7VJ+mCz2KjTyg2Q5KSXKWi6i/Dcew
	Z/y8w0nsMXxWZPcNetIzLYAOtj6yWI0sOc3NBr0dYWMbiPFptYPPf8w85qpOr6sm9HV/o+DU8AW
	8ccYCpFSWiUIloCjo=
X-Received: by 2002:a05:6a21:7111:b0:3bf:8f49:4038 with SMTP id adf61e73a8af0-3c3ad8eccddmr19737282637.39.1784645477457;
        Tue, 21 Jul 2026 07:51:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm49832807eec.25.2026.07.21.07.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 07:51:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v7.2-rc5
Date: Tue, 21 Jul 2026 07:51:15 -0700
Message-ID: <20260721145115.1658672-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v7.2-rc5 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.2-rc5

Thanks,
Guenter
------

The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:

  Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.2-rc5

for you to fetch changes up to 70e76e700fc6c46afb4e17aec099a1ea089b4a22:

  hwmon: occ: validate poll response sensor blocks (2026-07-20 07:29:44 -0700)

----------------------------------------------------------------
hwmon fixes for v7.2-rc5

- asus-ec-sensors: Add missed handle for ENOMEM, fix EC read intervals,
  and fix looping over banks while reading from EC

- occ: Vvalidate poll response sensor blocks

- pmbus/max34440: Block unsupported VIN and IIN limit registers

- nzxt-kraken3, nzxt-smart2: gigabyte_waterforce, corsair-cpro, corsair-psu:
  Stop device IO before calling hid_hw_stop

----------------------------------------------------------------
Alexis Czezar Torreno (1):
      hwmon: (pmbus/max34440) block unsupported VIN and IIN limit registers

Edward Adam Davis (1):
      hwmon: (corsair-psu) Stop device IO before calling hid_hw_stop

Eugene Shalygin (3):
      hwmon: (asus-ec-sensors) fix looping over banks while reading from EC
      hwmon: (asus-ec-sensors) fix EC read intervals
      hwmon: (asus-ec-sensors) add missed handle for ENOMEM

Guenter Roeck (4):
      hwmon: (corsair-cpro) Stop device IO before calling hid_hw_stop
      hwmon: (gigabyte_waterforce) Stop device IO before calling hid_hw_stop
      hwmon: (nzxt-smart2) Stop device IO before calling hid_hw_stop
      hwmon: (nzxt-kraken3) Stop device IO before calling hid_hw_stop

Pengpeng Hou (1):
      hwmon: occ: validate poll response sensor blocks

 drivers/hwmon/asus-ec-sensors.c     | 18 +++++----
 drivers/hwmon/corsair-cpro.c        |  1 +
 drivers/hwmon/corsair-psu.c         |  1 +
 drivers/hwmon/gigabyte_waterforce.c |  4 +-
 drivers/hwmon/nzxt-kraken3.c        |  6 ++-
 drivers/hwmon/nzxt-smart2.c         |  2 +-
 drivers/hwmon/occ/common.c          | 38 ++++++++++++++----
 drivers/hwmon/pmbus/max34440.c      | 80 +++++++++++++++++++++++++++++++++++++
 8 files changed, 130 insertions(+), 20 deletions(-)
