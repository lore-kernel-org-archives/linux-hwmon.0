Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D38F43F0B8
	for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 13:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231402; cv=none; b=kFHRpgrblhXW7BofzlsK57gstGNeruXI0zV6q49CSVSrk/cZ3xcVChcE9QHSdp+ASkhbGNZZ5hbrxrZxJfmTUReeK/AxPZCeil9vPFjuLx8yZ+pcQTFnGwEBWrHkdQ+U3Pf65oDeA/SJX9H9Ty4c3dLo1cL4rFnswB0KksgjgiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231402; c=relaxed/simple;
	bh=dasNdOAlbAa3mUnfp4BcUwHo5HVNIaligAkQ04+oZEE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bUZhG5LlO4o0yu7KPAYlNq4wLSLrL7p2MssCGnzFd35AoLFj86I/bg9dqxXjJfFZUTJtjQr8QHRGUtZIBGWmECEYdmRfaQB4g9835CGf3c2i0keUntg3PErtxJTrWq5137MT7dUPVcZpUwIG0j+9aa5Xh3p7M8XPq8cdLb/mxW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A+Y9gXgh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ygw92/yH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A+Y9gXgh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ygw92/yH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787231400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=McXOPyPVWI9g1lJzofpCIlTqtqvkUF+0uAfn5iEo/Pg=;
	b=A+Y9gXghRypVqxucX4gwWGrD7J8j0XlaA1ZDtfiPmbuysSAmlB71QYlxL+1p9aUR46Fnwp
	sYeQDzXr7Qx8iBm+fGODpm6QXfQ4yPsyXoH4EJHVhj8ERiDmVUB6iFJjcCqC2TR4FepCfz
	LM4iJP/YSO2a07GeEUlY51MwjtESClY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-_FpmAfTYMH63xXhgiueInw-1; Thu, 20 Aug 2026 09:09:58 -0400
X-MC-Unique: _FpmAfTYMH63xXhgiueInw-1
X-Mimecast-MFC-AGG-ID: _FpmAfTYMH63xXhgiueInw_1787231398
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e820609d9so256751885a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 06:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787231398; x=1787836198; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=McXOPyPVWI9g1lJzofpCIlTqtqvkUF+0uAfn5iEo/Pg=;
        b=Ygw92/yHIlg8ZF6Q5ZJKib0nD52OXzDFk3OWeBEN9LFnz3zESWS6uKCDuMO7vdK+bf
         5E7tFW6wm0C+CwzUqoRr1fgU7S2FyHHfHFEf2HDFPsZjDaSCSJDT7QrsbTgOcgD0lWvO
         de//PaR2UjTwQ7LHoM9WRRoHWCknJwNrS65nECCBJ8jlkfRaeoqUOPyHkrGPcfxpYlEB
         Hu484eZx3w0bOgJent6WvO/fieWt43AQ+OhzvHRfioYlFaRsSyJB0fOQlR6QeZ7s1XBx
         7f8EITezkLFjPLWqvIDso9Zmg9xW34Hd+ro1rkoJKEm54HIFODnj3aPLvaHdcKV+UX68
         Icuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787231398; x=1787836198;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=McXOPyPVWI9g1lJzofpCIlTqtqvkUF+0uAfn5iEo/Pg=;
        b=DLkslM6f2CT2wtutspCv/b/qk7pZvphRRyB3GePXNAnH8rL39yu5g4PZyMXphhM+N+
         rxnKMNRiewy+zmbc4XguzU5A8CvbcWfC+IiIlGZtGnkKqnogn7yKnPSuUbQWpUuXZ2LW
         44rhUsgS6CeGxWgkRa0VhRXhsWTvyKycKMOgcIOWw1MLKS8RHnsuoTAe8+PMprzwZuHZ
         5pi6ebQx/JynUeDK1ewl2onViDA/4JiI49j2exlTnp1qqhapw3GUDwiw1T4yssT353oM
         F8y2V7dwdzrlMlMENEIiD/f1VXJqB/2hQ/6VepSnH5pin61GsCAnKnwYb55QIjmpkNLS
         FY9Q==
X-Gm-Message-State: AOJu0YxjArx1cCr5Hnqs7NY+fsVfqLrARA67973jl+811Tw+VulN5BS9
	Pj3l9AOs1lnIac9H552HHMxLpvvAnqiBDKC2kPX/phsRmOel9wraIjrYzr6qCPbpvPz6wtbcNX9
	z0KXx/KGyizxtTu962VFDOFq4zWtooTOxitX131H1w1pF9EtBS+sTEwiqCsY4ypjV
X-Gm-Gg: AR+sD11xaSA6nGPRuU4qqWwK05shPuFL9SlnuGMDl1FBunryxwsX/avNp02Dn6u/jap
	3bwdYiDydr4IvFCAk2Urrhh5eecSfU/zWHWcpYOYl2G/w6sl47J3OpRo9HZGsh/UTd/62XZEZZ6
	QV2eVgkQypwEq2mtbEP0lYXWjJDjw8fNS73tERWWJwHrVwDBLVXByePa32osvwk0mN6yr+sLnxQ
	fVkl0quCrXZAYf3csqxL1pKRKI/66xN+/GRbmTxdifWjUm1eF1pO40LyHdEav4brksZuqlxJ8z0
	0/0iq9tOVtzfnz93GusLIZBlpwcvJx6JCSUoPcclliVYjw2eLNKyEcxZg74nP5IV+pIp144OEQA
	RkMxYIdRqFMgBz66bQ3r+ofARHquDDL9Y
X-Received: by 2002:a05:620a:2985:b0:936:51af:1de0 with SMTP id af79cd13be357-9371e67beadmr1008274885a.47.1787231397794;
        Thu, 20 Aug 2026 06:09:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2985:b0:936:51af:1de0 with SMTP id af79cd13be357-9371e67beadmr1008264685a.47.1787231397296;
        Thu, 20 Aug 2026 06:09:57 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937204ba087sm364217985a.21.2026.08.20.06.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 06:09:56 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v2 0/4] hwmon: (ina2xx) Decouple in0 and curr1 alarms
Date: Thu, 20 Aug 2026 06:09:20 -0700
Message-Id: <20260820-upstream-ina2xx-in0-curr1-alarms-v2-0-fdce35abc41e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNyw6CMBBFf4V07Zh2RF4r/8OwqHRGmsgjUyAYw
 r9bSVy7ujl3cc6mAomnoKpkU0KLD37oI+ApUU1r+yeBd5EVasx0jinMY5iEbAe+t7iucTQ0s4g
 B+7LSBeDiSrnLSmTHKmpGIfbrkbjXkVsfpkHeR3Ex3/cnL//LFwMaLmnJ+QPZOC5uQq6107kZO
 lXv+/4Bg5RpltEAAAA=
X-Change-ID: 20260724-upstream-ina2xx-in0-curr1-alarms-f85e7d692fdf
To: Guenter Roeck <linux@roeck-us.net>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Lothar Felten <lothar.felten@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jared Kangas <jkangas@redhat.com>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787231395; l=2081;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=dasNdOAlbAa3mUnfp4BcUwHo5HVNIaligAkQ04+oZEE=;
 b=9/G75VVCcfInRC/L6QmvBhBlMZt8mCondjMJQB1pQi/QNGTZpT6pC/UWfgTT/x7Ys+FnEErTn
 zKcwGcCOwSZD89NC9Q0KKtGy9mD9V0qMIB83cPp4Xapblmuhuw5GOig
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=

The in0 and curr1 alarms in the ina2xx driver are both based on shunt
voltage in the hardware, which causes unexpected behavior when reading
the two inputs' alarms:

1. Both alarms may read back 1, even though only one is set.

2. The active alarm may read back 0 even if the limit was reached due to
   the use of alert latching. If the inactive alarm is read, it clears
   the active alarm, and the alarm may not be set before the next read:

        # echo 1800 >curr1_lcrit
        # head {in0,curr1}_lcrit_alarm
        ==> in0_lcrit_alarm <==
        1

        ==> curr1_lcrit_alarm <==
        0

To address this, track the active alarm's type in the driver, and when
reading alarms, return early without polling the hardware if the alarm
being read is inactive.

Patch 1 is a locking fix reported by Sashiko in [1], followed by some
prep work in 2-3 to simplify the fix in patch 4.

[1]: https://lore.kernel.org/all/20260729162836.89BDF1F00A3A@smtp.kernel.org/

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
Changes in v2:
- Squash v1's patches 3/4 and 4/4 into v2's 4/4
- Split active_alert assignment in alert_limit_write in case of
  failures between zeroing old mask and writing new mask.
- Add hwmon_lock in shunt_resistor_show
- Add #include <linux/bitops.h>
- Touch up code comments and commit descriptions
- Link to v1: https://lore.kernel.org/r/20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com

---
Jared Kangas (4):
      hwmon: (ina2xx) Acquire hwmon_lock in shunt_resistor_show()
      hwmon: (ina2xx) Parameterize ina2xx_data in ina226_alert_read()
      hwmon: (ina2xx) Replace masks with enum in alert functions
      hwmon: (ina2xx) Decouple in0 and curr1 alarms

 drivers/hwmon/ina2xx.c | 163 +++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 136 insertions(+), 27 deletions(-)
---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260724-upstream-ina2xx-in0-curr1-alarms-f85e7d692fdf

Best regards,
-- 
Jared Kangas <jkangas@redhat.com>

