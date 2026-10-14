Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E93056510C
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 17:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999259; cv=none; b=bMROAfBzBqe2UdQVvDj2oGDqOYRFtwtIl+h1kOfyj72WBQ8TkH2mMxJcL/QbS5wQ47ROEt20NV3k4Xa3eRiNkzhz6MiBwlqn3WyVRh09v08kG/0Sh4OSDcW46SzUvM1pByrjn1VVJSTVA4Nv1FchzEl3gigeFgp09hS/Zr9utEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999259; c=relaxed/simple;
	bh=nL8AKCXv4wFFNZr4gsMPaVgnqddBtHtqnb8fOUCJWV4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DzqXbdLAUT9fXPYxbo7RWDRvEnMn1xw+EicFu4kgVwBBG63n7vhd85+ydLGdkgVu9nLaagoeyqPMpwpn5L8asghn9lNTfEvUR8Or/hVF0nK7ZG3pP7GXYtrdQveCV7SFQuVIUSkLdhFaFxmCA62RadggBA9Ee+vW2UMfTo9DnQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlXs/NZV; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlXs/NZV"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2e3846d1caso711460566b.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 10:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791999254; x=1792604054; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tiUB8PFGT5iZBTUugnLJiJSnsGsuX1stV8dPYo7E0YM=;
        b=NlXs/NZVO0P7m6CA2pn+aCWdu/kKAaY6UGVjgYJiSSvmK6WZneH1tTqhYOhBehGrrm
         ccGVWKlfpkoFQAENRTg6hj4f7S3xWc+d4lq8TomtD5FcH8rNX6yfmK6bQ45V4T1Go+Lt
         Lftw2zbf3B12CJ78aJzd0mM5r05z78NEUNYOiFyludAqSaAV03z/u2xdZ4qzOiwsrL4t
         KmclPWbrk37WqDivvmg034wmXYQWrI5DZbm0y6TRQLWsVSroMNZ3PRKBMoipZKyP8zUN
         qbZwolGKOBhPdaaug9Q+F7xRbZhsMMoRihZTP508O5QlX9BY+6grceqBviQlghRUnCSS
         Sd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999254; x=1792604054;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tiUB8PFGT5iZBTUugnLJiJSnsGsuX1stV8dPYo7E0YM=;
        b=uOKE9qL5zCrIYMo7wSv7RAEWvzueRA+FtwejthzzfzEocADpi97p9RsXD+dLxmHimx
         AKZVCb68vPf6tfDgnSG3oT1caBWlEqG1qyVip4DKZPi5eq/iyhHg6C6kf1nwACUw2d8g
         b3sD9W186Pnu+M70ivBxW8JTdIpVdbGiGrF0jqxygnqotrD6woxndBxLnwYERQolR1M3
         Zh6KfoYi0/WsJJpo2e3L7NyL7fDmpkL8LFCaWy4765y6G4nQI40JXsjj3Nrfxg8J0tJ+
         3Jk7GuVTSgMzK0m7CzR26IceRl4nz6B3eN3Xeu01dxEhjJmKvfiDVHSK9RVDB4eUrqp6
         jxzQ==
X-Gm-Message-State: AFq9FYJBpVW4Jbina1WW40s2ZPQfS/DmThhQDNix7pFWy6PPr/zHPmGm
	uYPKAXauCme0q2/1qQA7uhTvH+y9gxSdqg8/RkFP8FQx+HeuzrVHl/zXxkPOezyN
X-Gm-Gg: AYBFou3XlFSspl6wEmsmSiNo1FZJPGMZ/0HEaVvo0NaqLhFSnavRuMY3MEOHfyEgB1t
	a2azo69BDgPKuMz+gbYnUVWKR1KDpxovKjvlrKJyVW5F51NBm5jLKzyywElKEFJKdxpbxQZPiuQ
	hi6G+HvX47tzApJmScB5wMNQ7LDfq9N99IZPBW/JU35ULprm4GM4J7UcyvMN+CmM6h9FhoLEPmG
	QjLkfkXneizH0Cws7NDnqbOZ0+tqHUQClMU/9URRe6zcN61YrsJAXs6utXXegRstIbbXNvPULtq
	tG+N5TMUq67lhUlRSwxA5PpoS08EIh6WPewmO9r4pNaxPPG3rFpWEJma/QmbBy6N9wM7aZgph/8
	2EPo++XkagJ7Gi0qjmFOEgoTc+ljFkR2Hvun70CLdz8I7fTXSWTinYZSPoLLVL6UpcYyxn4Ia08
	vSWVusgjEN/aHhQI6WB4YIZPUvFwhFYBg37aylPCJz/E5DXf02RxDYzqwBnf4MxHEy3R0TZETvR
	XpWNFwlyay4tsht
X-Received: by 2002:a17:906:d54a:b0:c2e:8eb7:53df with SMTP id a640c23a62f3a-c31a9ff6379mr1582638466b.44.1791999253765;
        Wed, 14 Oct 2026 10:34:13 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:f08c:65a8:f8e5:f310:5a71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cecesm9381366b.21.2026.10.14.10.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:34:13 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH v3 00/11] hwmon: chipcap2: various bug fixes
Date: Wed, 14 Oct 2026 19:33:59 +0200
Message-Id: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAe9z2oC/2WM0QqCQBBFf0XmuY3dMcR66j8iYh1HHdJWdmMpx
 H9vFQIp7tO5cM4Egb1wgFM2gecoQdwjQb7LgDr7aFlJnRhQY6FL1Io6GcmOeOsd3YMibbTJLR6
 sJkjS6LmR1xq8XBN3Ep7Ov9d+NMv7TZnfVDQqrS6JbNWQqfDcDlb6PbkBllTErZ7/6ai0KiwWV
 PKRsaGtPs/zB9kuNFnrAAAA
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999251; l=4477;
 i=javier.carrasco.cruz@gmail.com; s=20260924; h=from:subject:message-id;
 bh=nL8AKCXv4wFFNZr4gsMPaVgnqddBtHtqnb8fOUCJWV4=;
 b=Z2vaocdnoERSYZk+VRbiKEsTnZJS19GA4AL/1aPoJHqCxJXIIhYIiFEuK+70eo172PTVAwjCd
 v5WaI88OFsOAzy8z1dsSkfCJZLK1+ei8PF9JsxHp//2wdDBHAeBofY6
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=VV+hcMoOj1Sx6xSiY0W/FZNAskGZe2AagSMVj0PsmAs=

The original issue (race condition for the alarms) was found by Sashiko[1]
when an unrelated patch affected chipcap2.c. The issue is real as the
access to the variables is not protected by any locking mechanism
although 2 different sources (threaded interrupts and sysfs) could
modify them.

In further iterations Sashiko found new issues[2] that have been added to
the series:

- Fix be16 data handling.
- Defer probe when the IRQs are not available yet.
- IRQ teardown ordering: split the current implementation to provide the
  available interrupts before registering the hwmon device, and register
  the IRQs after the hwmon device has been registered.
- Disable the device after the hwmon device has been unregistered.
- Enable IRQ processing when the regulator is already enabled.
- Balance regulator counter.
- Do not discard the pending alarms when the device is disabled.
- Reset the completion to account for counter > 1.
- IRQ serialization and synchronization.

The last item required a dedicated mutex because the hwmon_lock was not
suitable to close the gaps where an interrupt might go unnoticed because
there is some dependency between the data read and the interrupt
generation, and also in the completion mechanism. I went through the
different alternatives with a combination of local Sashiko and a second
AI agent, and discarded some complex solutions to close gaps that are
more theoretical than practical e.g. the interrupt was fired, but it did
not reach the controller due to nested GPIO expanders. I added the
Assisted-by: tags to those patches accordingly, although it seems that
this requirement will soon vanish.

Additionally, a harmless off-by-one in a for loop has been fixed to save
~80 ms after the last failed command retry, and the error reporting has
been fixed to show the right issue. These two ones have not been tagged
for stable as they are only meant to improve reaction time and logging
inaccuracies after a command fails. The deferred probe does not have the
stable tag as it is just a reaction if interrupts were provided but
still not available. Of course, I can add the tags to all patches
if required.

The fixes have been validated on real hardware with an Amphenol
ChipCap 2 CC2D23S sensor.

[1] Link: https://lore.kernel.org/linux-hwmon/20260625162114.417EA1F000E9@smtp.kernel.org/
[2] Link: https://lore.kernel.org/linux-hwmon/20260821093706.D1EB11F000E9@smtp.kernel.org/

To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Changes in v3:
- Use a dedicated mutex instead of the hwmon subsystem lock to serialize
  the access to the alarm indicators, which no longer blocks the alarm
  handlers behind a sysfs read.
- New patch: do not discard the pending alarms on disable.
- New patch: synchronize the ready IRQ state.
- Register the data ready IRQ before registering the hwmon device (its
  handler does not use hwmon).
- Split the fixes into one patch per issue.
- Drop the patch to fix the channels in the humidity alarm
  notifications, which is already applied.
- Link to v2: https://lore.kernel.org/r/20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com

Changes in v2:
- Add fixes to the new issues reported by Sashiko.
- Use hwmon subsystem lock.
- Link to v1: https://lore.kernel.org/r/20260821-chipcap2_locks-v1-1-1d8ccabfc1b2@gmail.com

---
Javier Carrasco (11):
      hwmon: chipcap2: fix command error diagnostics
      hwmon: chipcap2: fix off-by-one in command mode retry loop
      hwmon: chipcap2: fix be16 handling
      hwmon: chipcap2: defer probe when IRQs are unavailable
      hwmon: chipcap2: fix IRQ teardown ordering
      hwmon: chipcap2: disable device after hwmon teardown
      hwmon: chipcap2: enable IRQ processing when regulator is already enabled
      hwmon: chipcap2: balance regulator state
      hwmon: chipcap2: do not discard pending alarms on disable
      hwmon: chipcap2: serialize access to the alarm indicators
      hwmon: chipcap2: synchronize ready IRQ state

 drivers/hwmon/chipcap2.c | 192 +++++++++++++++++++++++++++++++----------------
 1 file changed, 128 insertions(+), 64 deletions(-)
---
base-commit: 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
change-id: 20260820-chipcap2_locks-c01013a24a0c

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

