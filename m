Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ECF50E5BF
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 16:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748444; cv=none; b=Np9tRUopZ+WhpLmmfwVMGnvmEDYckFkVqj0oWJchpBR/67k/gattI+dJfqA5mS4nTZi8hZwRgmN+YJW974KcDLZep3iJmHpJQ4hcLTXp7s9dz0LYncKO5I53v00sjYuDgB5eRb9hen6LgcRecvHE0Bjrw7OnLlcLqVR1xgK5xeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748444; c=relaxed/simple;
	bh=URGeA7w/chQlkU/MBb4klfhc6jrTrNP9CDBMx9r9OmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pd5/xskLdH17Ak8geWZJYqsIcmam9DBQBVS80Oj2zsB+PJghEERHpT8zObnU0T3AHJgWbIruOu/9rMIn4KrEpkoUJbjvaeB2JDtnfQlzz8R0Lv7LeR/sf3wEzzYRFKZEQIpmmDAAREb0WsduXCzioPjOYJnjRXiSzHJSNo8vUco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3upBK2w; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3upBK2w"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d91ede8035so11573715ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 09:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789748442; x=1790353242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SActHdUMawXLcOqYGrSqy2fZIutS+3r6VSMbaH7My1U=;
        b=U3upBK2wYBVgkVhgr9zS7GTwFP4KLofvXiuxSkXsh7hNgGT6sGRiKWCy1dIAdxyWZ+
         EjLqs8mHKD+pNG+K3IdhUEphVdlEgx0FKkZwLQLQpLMHEyD0G1PNx1peqh77te4WPamo
         UqBw2fP94/ZGwwxwfTmBmLGADWzHTqKwX4eU0E6gcc3UHlZn54n3lGsuO/Vy85evwQmh
         L36x/dR1LhCrNJuVT5OdCyNClXHTAanxFmlVXQXdwlADEZK60r/epH4sK4kQwUdGGtD3
         UVBr3gfIAB+EOZNnDHUYelGKC8KIYX4fEUBaOTfvB8hX6/PsiHf6A+m5ftodZl3gc/bN
         Hrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789748442; x=1790353242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SActHdUMawXLcOqYGrSqy2fZIutS+3r6VSMbaH7My1U=;
        b=eu5wHHgTNX8lVCQhFcNY0073HGBiztgfsZi+eknzmDPVPq71+n6ItxdaAftqXc1DJo
         a+3noj78aArSbnfUXgVcJSGplTT4FuUaqN4GrI2g311bVTYYSWtzrrhwg5Voy4LrRCuv
         oujEsMShnyJzipmns0D4X6czA4PTZ5wBOMVvTm2MO0eXdbGzqHozt4c4id3OFRe90xRV
         zV9dlyBebbPeOC/PaZ+siJFAl46lEQJmtv1Ew2aKot6Uc+2kGilgrKIOsEDGV/IW/lMW
         8GYWCuX84k2NHG4DJaregPH5SUWnGsDUi/hytGqH1K8lv+RUGuOFmNwEWRFToVT/SVbF
         W/ow==
X-Gm-Message-State: AFuF++nwaiRtTXu97y1MlKjrGEkDQOzR86dL4EyuxojvAvTytp2Pnsh9
	ZPDkGRCohDsxhELmWmwQQTQBYmAQgkB3f69J/nL9f+GxWhIzuY58fGmyAHHbCTAd
X-Gm-Gg: AYBFou3NfaWMFHmtDKHQKPCqn/hhA9WLQwupANfnGG5tCEbvq8/GPWPA/B4z92Zo9oF
	+7eA8N66JoCbMEL/8TclOk9ZaD5o3LigtEj/Hfeog8rDN0nTTtr3rIaLbobHi06IQmd3B7GlRHH
	4alwRsMHfJCkxh0niKiUuq0M0FcKblxOzoJxLLwUg+/qBkV1N/FEzk0n/BFvjmYLYrDWzfVXI5E
	pQJ0ql3GJhhfPFgwwIIvBBKocXfJ0FSEbn7Va65XjFQ4j3JL4yCrA3RkzdkPLIY51LfPLyZJvFl
	l0MqZFGW0eEoevAKPT3zNrHG8BT7sJxor+YHpTJg3H0QIngUXFeO6PqStWvGEE0SZPs/TvwSf8c
	jq4e2H60lE0/dMdm9RmnVWUDXQ9/8ExodJ9JRoJAjAVoSUT8Fv2tspywFfSX8RRXvEHJdQyaglY
	JVlUGZ68RiebmgaKhnrn8ny6buouE8TroAPcdaHHdNaKm690DsU/et+1qweuDJk+bI7UKmQfL3L
	NMBTQy2EUSz
X-Received: by 2002:a17:903:1b6b:b0:2dd:c100:942d with SMTP id d9443c01a7336-2ddc1009b84mr1946445ad.43.1789748442410;
        Fri, 18 Sep 2026 09:20:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c288f088bsm5668038eec.28.2026.09.18.09.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:20:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] watchdog fixes for v7.3-rc4
Date: Fri, 18 Sep 2026 09:20:41 -0700
Message-ID: <20260918162041.18444-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull watchdog fixes for Linux v7.3-rc4 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-fixes-for-v7.3-rc4

Thanks,
Guenter
------

The following changes since commit fd73f4a6659897191fa0d40695fe370925dd3780:

  Linux 7.3-rc3 (2026-09-13 14:38:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/watchdog-fixes-for-v7.3-rc4

for you to fetch changes up to 7cb575b71ab98194d2e040bded3a7281e089c5ed:

  watchdog: da9063: fix suspend/resume handling of HW_RUNNING watchdog (2026-09-18 08:10:45 -0700)

----------------------------------------------------------------
watchdog fixes for v7.3-rc4

* da9062, da9063: Fix suspend/resume handling of HW_RUNNING watchdog

* digicolor, rtd119x, and rzv2h: Avoid division by zero if clock rate is 0

* msc313e: Fix premature reset during timeout update, and propagate error
  code in resume()

* sp5100_tco: Fix pci_dev reference leak in sp5100_tco_init()

* starfive-wdt: Fix runtime PM leak in starfive_wdt_pm_start()

----------------------------------------------------------------
Li Jun (2):
      watchdog: da9062: fix suspend/resume handling of HW_RUNNING watchdog
      watchdog: da9063: fix suspend/resume handling of HW_RUNNING watchdog

Tzung-Bi Shih (5):
      watchdog: digicolor: Avoid division by zero
      watchdog: rtd119x: Avoid division by zero
      watchdog: rzv2h: Avoid division by zero
      watchdog: msc313e: Propagate error code in resume()
      watchdog: msc313e: Fix premature reset during timeout update

Wentao Liang (2):
      watchdog: sp5100_tco: Fix pci_dev reference leak in sp5100_tco_init()
      watchdog: starfive-wdt: Fix runtime PM leak in starfive_wdt_pm_start()

 drivers/watchdog/da9062_wdt.c    |  4 ++--
 drivers/watchdog/da9063_wdt.c    |  4 ++--
 drivers/watchdog/digicolor_wdt.c | 13 +++++++++----
 drivers/watchdog/msc313e_wdt.c   | 16 +++++++++++++---
 drivers/watchdog/rtd119x_wdt.c   |  7 ++++++-
 drivers/watchdog/rzv2h_wdt.c     |  7 ++++++-
 drivers/watchdog/sp5100_tco.c    |  6 +++++-
 drivers/watchdog/starfive-wdt.c  |  2 +-
 8 files changed, 44 insertions(+), 15 deletions(-)
