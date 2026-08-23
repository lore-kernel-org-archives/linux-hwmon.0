Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383E0381AEC
	for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 17:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787507951; cv=none; b=crkGO14oXuBzT+4obMsNS5HUlWZMN4qNSZgzaBssyIniPJpVsFfQOxBf1kFEITrN22aVY920l3FlriGR/0lt40Sg7xHOHWCv2af1iGxsHmn3qMtzj/SoVnCxLR0YqSqZEziFDTCBf7wFCM+pjt0NNcnZUKlExu/GcLSaSh6s+28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787507951; c=relaxed/simple;
	bh=3TgrgwT+3TQqyh+mokvZkeL6QOBygWorjWWJ1gx7cXM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fXUZREHXVIe/oPwq7m0ze5TYot0x9GekqYGqxAgj84nzxUDO7G9ZhtocnwN0Cbw2sKQ+IGk22J9jEQeZI9Y4FmuzZ5nAMTeXuylGiAcxI0e+FTvha2EbkpAg+DrI+3e0IrvDOFxM/1QTF4W56c6yJH62UzdZwapSXnKAiwj+WB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQV8WgpI; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQV8WgpI"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso4379424a12.3
        for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 10:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787507947; x=1788112747; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sjq/3IUGZ/SVynU7JLmiVVao524iN6L5MfR/udlZ7+k=;
        b=DQV8WgpIUutXFj8D2pDLixvkMyjEjXAtL1P6M3sdYHwbJYj4gCKAcOze7yKHX3gEKT
         +u2YwDPFzvtIadX6hKC/iZYbyMyWC7RScJwuKSfhKLNVS6VR7bhKINd4b8WZ8HasN1EO
         4p0VYQh02kKLf/yhqlaVwEyB8N8/M8IHnGqFk9dPmO9ZRgpbzEOgV446/COhalYDNSAn
         5Vz5j7CFAjlUzXXrGMcrow6os8K09WzqV/hD8+atFpREHuddPwNmwTJxL6yYrpgYDNxr
         inv/ir8rulc3v45r0pX8fNBqiHG9SXiU4FvYko6e1+ii2KO2dzQ1nPhIcrmM1sa/QzZ1
         vY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787507947; x=1788112747;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sjq/3IUGZ/SVynU7JLmiVVao524iN6L5MfR/udlZ7+k=;
        b=ePEtcAaGRifx56k5Zu8E+DMeJbeNcjBjkhizBo6drjNQCvP8neqYAn5bFGJ8egxtXy
         oneY6uD9DdVkYrIBbHcklaU+jW07NNSwgulfwmNloFJHcBOv8S29VVLK4AeU+xwgbV0s
         hApOa/55PKhnpo7QNVxrQ1Dq4/hXr4WCzRso0qMPnA2Wyz+/MByqxEM84cph5LOXGt9R
         thQGuVRfncKq/UhwzIcykY/UPGYNdm89cGnlZOJ9jL8/h0tcneAc+1PJR7pBo/0g831h
         AQ5BsNV4dqkSOL5PwqVsGMGnHq2ceGDoas/aW14gV3rBoJ4kXxypdyf8RD+QwZhBcCoC
         GU2w==
X-Gm-Message-State: AFuF++l3jjGi72IfbQ/jHUzVvWEDS5WJJOie9s3LaWVfFGx3Og/JEWsA
	4xcUxZ0x/fivcl52W0m9Id4DwpoKFPb7teZaAuou4IWvyZD4Y+T4yJFOQMPnfg==
X-Gm-Gg: AR+sD1321V5GwmHLJS6ct/I4gBK13QjGKe0p9eInY4kgG86j8gLiKCLf3aZ8HSGfdzz
	l9q5gdWnw8oS24ByIN3wr4FVyoVS3LkbURT7oiTpnv5RxRvAnaAxNEqFmUTVWuMI/rUhIamdv1Q
	mQkL72E5oEI8JvRMZuUxvWrUyIj65m4Ir2DMjFBsmykUp45gyy+KmRbQpHWwYc5fNTUxBeSOSsy
	8O+H7uldzMikQn9kuONs8fwT0oprIxYLHHGuFGRCXMW555CoG2Ud3Ty95GQuO21tTmMER/wbRDm
	5Glc0q/R8Tzdf7eHcgDrZWGfAERQ/tE4yUMsn/htb1bA8+97Q/3O6JYvO9GBHHD5wpaZmhSRO4i
	nvwMxzPWGgApGYuyExa1QW30NhwSnXerbSlw198BCkeDpWmaIbpVfYfE9CairRMvhFJrJIV5gvJ
	zLL+4S316PEHJwAx6qLitNuUJgbKatE2jBiaYwEJfG7mCDolcLYL2FWwlmXQ+qQCqMEzIdN0gG+
	bXjxQ==
X-Received: by 2002:a05:6402:321a:b0:6a3:f3dc:d7f3 with SMTP id 4fb4d7f45d1cf-6a42f216053mr25270642a12.16.1787507946853;
        Sun, 23 Aug 2026 10:59:06 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:148:9afb:38d7:b606:f380:289e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199cb8sm4153933a12.16.2026.08.23.10.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 10:59:06 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH v2 0/4] hwmon: chipcap2: various bug fixes
Date: Sun, 23 Aug 2026 19:59:00 +0200
Message-Id: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOU0i2oC/13MwQrCMAzG8VcZOVtpo8jw5HvIkCzrtuC2lnYUZ
 fTdrQMvktM/8P02iDaIjXCtNgg2SRS3lMBDBTzSMlglXWlAjRddo1Y8imfy+JgcP6NibbQ5EZ5
 JM5SRD7aX1w7em9KjxNWF9+4n8/3+KPNPJaPKdTUztT2bFm/DTDId2c3Q5Jw/EOXfl6wAAAA=
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787507945; l=1997;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=3TgrgwT+3TQqyh+mokvZkeL6QOBygWorjWWJ1gx7cXM=;
 b=v35qConihnxbkJFI9UxHBD/4b0tniOfkuY1qF5kSgsZf29DXLkxUzuJFir5ip/dcNME8F5ppn
 Fj87w4pVmTPDd6974UKZ/s0QvnFlMwfbdd0uFEjXMC0S67OzcRpP5pz
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=Lge8w8xidNSf/INy7JAIbAW+Hezkp3nsBh2OjKL7lLU=

The original issue (race condition for the alarms) was found by Sashiko[1]
when an unrelated patch affected chipcap2.c. The issue is real as the
access to the variables is not protected by any locking mechanism
although 2 different sources (threaded interrupts and sysfs) could
modify them.

After sending the fix, Sashiko found new issues[2] that have been added to
the series:
- Wrong channel number in hwmon_notify_event(): pass 0 as the channel
  number.
- IRQ teardown ordering: split the current implementation to provide the
  available interrupts before registering the hwmon device, and register
  the IRQs after the hwmon device has been registered.
- Enable IRQ processing when the regulator is already enabled.

The fixes have been validated on real hardware with an Amphenol
ChipCap 2 CC2D23S sensor.

[1] Link: https://lore.kernel.org/linux-hwmon/20260625162114.417EA1F000E9@smtp.kernel.org/
[2] Link: https://lore.kernel.org/linux-hwmon/20260821093706.D1EB11F000E9@smtp.kernel.org/

To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Changes in v2:
- Add fixes to the new issues reported by Sashiko.
- Use hwmon subsystem lock.
- Link to v1: https://lore.kernel.org/r/20260821-chipcap2_locks-v1-1-1d8ccabfc1b2@gmail.com

---
Javier Carrasco (4):
      hwmon: chipcap2: fix channels in humidity alarm notifications
      hwmon: chipcap2: fix IRQ teardown ordering
      hwmon: chipcap2: enable IRQ processing when regulator is already enabled
      hwmon: chipcap2: serialize access to low/high_alarm indicators

 drivers/hwmon/chipcap2.c | 76 ++++++++++++++++++++++++------------------------
 1 file changed, 38 insertions(+), 38 deletions(-)
---
base-commit: 388b607d107c07aaade04c7f22f344cab6bdccd3
change-id: 20260820-chipcap2_locks-c01013a24a0c

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

