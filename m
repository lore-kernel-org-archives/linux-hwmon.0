Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C643AAF70
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 18:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360616; cv=none; b=XY4lo6B6Pz0uWDLwIfE5bY/8sLCXK5DPG2IfQuupmS3uN2Vo2GMZlUupPup5VzmZBS0fO8OSgcKKMdhWUtuEU8g/nORsrpOj53oMFCkD4o2Tu60jvU73vYwJ0Laf3eP4sX4TMIgIwGnbl+O+W/mL5GzWddUluUWRlZ+2sWh2Y7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360616; c=relaxed/simple;
	bh=w9X6rrNNFvLIgiXrQ7cjPr8/9UJtbJNK/UogagEMFu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ca5FUu3azhHVvp0Kbad0hEhMuHPYuUOay9QToGDXPXF5gYKvtjW8xhcar4Xc4r2XTsT1tfdAm6lMw8GeHoiFjTD9CFVKgCaaC/bGu5uzPvQK6uQMM0Ju7c0EV9N1Ay8xZNrV/2GFkMUOlj3Tvmd+I87ngKd9zZ1ypzCcrtntHFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspiral.be; spf=none smtp.mailfrom=inspiral.be; dkim=pass (2048-bit key) header.d=inspiral-be.20251104.gappssmtp.com header.i=@inspiral-be.20251104.gappssmtp.com header.b=i+SPBDG/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspiral.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=inspiral.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inspiral-be.20251104.gappssmtp.com header.i=@inspiral-be.20251104.gappssmtp.com header.b="i+SPBDG/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so9234535e9.2
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 11:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inspiral-be.20251104.gappssmtp.com; s=20251104; t=1790360611; x=1790965411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j8TY93nxAT2n3faiya/ujXtTbbKatodwcH5jnqQyGyg=;
        b=i+SPBDG/v8Tt9pvhGTU01N0D+g+aMDPz3cZoaP7g7jGY7n8AfLOPPE7Ym8C0oEqF6s
         z65dWtw34anhAlAyu/biM4idNDZsuVG31aJRZMFK9cfTS5OnXnnngoYz0t98QpiXLe27
         2i3cEcQ+ifB+acd5SYHJI3OtfyYESQgP/L9yl48fV2c+Y2gCFdjITb6Q3DSk2fuwy4GB
         /mEcJKN0U+5PcxYcGlR5YX6Tx+gak/52LehPHAfa6kiOOECs3l2xgFPQXms15FrgQL8d
         0SBenaARrbVaHp/dcry4F5pLwzhYA1MerBTIn/vj8af2hxUuAAhKvBSAFRDWykoVcpYi
         Corw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790360611; x=1790965411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8TY93nxAT2n3faiya/ujXtTbbKatodwcH5jnqQyGyg=;
        b=bMTudm1EKMSrKNjvbIhiVhMIUj6HW55ustxhyL36Ep2k5BBZAdv0N3lInEw1Lh0/G/
         SM9AEHWjCpszJolfBc0vQSx14w53LAeddTazfVeu4v5eEgBPofa/3MGCjjP1X4rJLnZp
         /KzEmDBdgl83qKvCe91eqjMGLb/lVlE/F1n+eSCMhvP8cqpNe156PbR2pcNcjo6zZpY6
         USzhJeZr4yqN8nYm3aoOAY/JLZj27eAXtvxhi/KLppe9e2hKyXDQXaKcaKvwiUhudDtw
         0Y1sJr+iTaf9hOVSOClJmeLIm4WCc3Enpgm0VaFXG8Gfe+LF/a6uedelmsWDy3c9bdBb
         099g==
X-Gm-Message-State: AFuF++lRicEvknbJH1mnxf/xZ023G5J7GRsv/0fEh7E0t7/vO6k0XTmS
	OJ4NwUdN6HJOF7kcWKvXggWPwwnT6AY0v3tDrVu6wfDQwCRv3AoCML3Uwo8kmWx2x2A=
X-Gm-Gg: AYBFou26otzSRp4RQeKy7Kt7sKuQ0GkA4DPXgBp4HW4Cpj/Z69bFUagfMgWhh9IPigj
	DJndFznPOnom5pkpFyFck7SmN668yMRRkyGJt8g8t767TgHGVTvmKoYJYpmrgixKUWoe3dxWCtU
	f2Ji9qP8/Vr00Z0uweBMICcqE9n9B83F2kIhkbj5fOpnQHGJK/QMJOx22uekByyM5D6NA9h7rBK
	Qierb8uwqUsTnsD7dlphwZRdu1OJologYA49Zn3cp0ukJXLysXMfRkx0y2JmeUDdJHqtFPu7aWV
	3B15v+piMrV+tQjjFzVuB+rhPKqxZFan3cCIFsEfMqbDcR2hFZou55gtLo/6DDKv+CJ3av3tjf0
	xTkf7IpQFZi34ol+iWfiprjgLfyfCl+2E3NwFzJRgMfQaTybEWRM+VJU/grmyaniXfAy14Z5X1s
	kcx6F1y7vaPhFQc1NA23DWNvf4tmtBjRAJW//U4FhyAiCYfy9sjeBB+Tp7+Z84/+NoaBSYt/lhc
	GqThRKo1V6/FRRVvxr3tNC3sI0PBK6RCFsPGl7pUgl4os0d
X-Received: by 2002:a05:600c:4689:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49fe66b4001mr115747665e9.9.1790360611169;
        Fri, 25 Sep 2026 11:23:31 -0700 (PDT)
Received: from vger.localdomain (178-119-186-126.access.telenet.be. [178.119.186.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm165253895e9.13.2026.09.25.11.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:23:30 -0700 (PDT)
From: Tom Verdonck <tom.verdonck@inspiral.be>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tom Verdonck <tom.verdonck@inspiral.be>
Subject: [PATCH 0/3] hwmon: fix jiffies wraparound in one-shot ready checks
Date: Fri, 25 Sep 2026 20:23:21 +0200
Message-ID: <cover.1790358356.git.tom.verdonck@inspiral.be>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several hwmon drivers store a one-shot jiffies deadline that is set once
and never refreshed, then compare it against the current time with
time_before() on every access. time_before() only interprets the signed
difference of two jiffies values correctly while they are within
LONG_MAX jiffies of each other. Because the deadline is frozen while
jiffies keeps advancing, the difference eventually flips sign: after
2^31 jiffies (~248.5 days of uptime on a 32-bit HZ=100 kernel) the check
inverts and stays wrong for the next ~248.5 days.

The consequences differ per driver:

  - tmp102, tmp108: every temperature read then returns -EAGAIN without
    ever touching the sensor, until the machine is rebooted. This has
    been observed in the field on 32-bit systems that had been up for
    ~248 days.
  - sht4x: the read path instead concludes the heater is still active
    and calls msleep() with a bogus, huge delta, blocking the read for a
    very long time.

Each is fixed the same minimal way: store the deadline in a u64 jiffies
value and compare it with get_jiffies_64()/time_before64(), which does
not wrap in any realistic uptime. No functional change on the hot path
other than removing the false-positive after the wrap point.

The other hwmon time_before(jiffies, ...) users I looked at are not
affected: they either re-stamp last_updated on every update (the usual
cache pattern, e.g. tmp421, tmp464, tc654, g762, ibmpex, w83792d) or use
a freshly computed local timeout (pmbus/ltc2978), so their two operands
never drift apart.

The failure itself takes ~248 days of uptime to reproduce and follows
directly from the time_before() semantics; it was traced from a field
report of a 32-bit board stuck returning -EAGAIN after ~248 days.

Build-tested on x86-64 and cross-compiled for 32-bit ARM (Cortex-A7,
arm-linux-gnueabi) with make W=1; all three objects build cleanly with
no new warnings. 32-bit ARM is the configuration in which the bug
actually manifests.

Tom Verdonck (3):
  hwmon: (tmp102) Fix jiffies wraparound in conversion-ready check
  hwmon: (tmp108) Fix jiffies wraparound in conversion-ready check
  hwmon: (sht4x) Fix jiffies wraparound in heater-ready check

 drivers/hwmon/sht4x.c  | 18 +++++++++---------
 drivers/hwmon/tmp102.c |  8 ++++----
 drivers/hwmon/tmp108.c |  8 ++++----
 3 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.53.0

