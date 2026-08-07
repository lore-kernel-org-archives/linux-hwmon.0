Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8635413B58C
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 00:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786060876; cv=none; b=Tkx4EyITOlw9wwrVPewEsE9335XXy0Oirlzt67y6O2lAJMs/HCmkcqf7oeMP4+rSBvG+s7tNl7XasBpHHn0s5Gu+SUNFJZDbiwd3LUnNa3Gz7tXicNFwdHeKcdoE6lMM93Xj4LaPYVUQGVNfzDGGg0RK7boK8gXkfhNOgBPZM7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786060876; c=relaxed/simple;
	bh=lT4q2t2A+8eI6YcZz2IDgnHOzY1NUlbawOLctsnRNY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V+WVBGAZhZatl3nyvQqDN9JjJ1J+VpjqNMc5pVRJ0Pvi6oD9jBiV827fOATxk9VIgyywB9G/FRNmHr6RqSrUwKeZZiMoaUZBqe8OCV3sI4PB5yDU9/ztoPeAW9Y1tw7U1bCRQTaScFw0mtyod7Y/byfShG0jNI1QTi+B0K84cXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=lckGm6Tf; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="lckGm6Tf"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e7632b193so203605485a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 17:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786060874; x=1786665674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5GQBs3dETS7CDeKjtzGaEmQSXuk8Kh1aMvycfseSn5g=;
        b=lckGm6Tfdg9zG3CXyWlPWxoGtcXq5cwj4WV1M3Cfa7B4unSAzLwktMG3UyeMYm7gQ2
         Wk65fItfVLw25OTTSQiJrEBQv1HeQK9SdV2Orv7h+A9wOxX1XIbnVRYzaqURV6+qRDVy
         eoJh2/T+m+AtUbEkIwbaaBQ3PFhKjlJSt6h2FAzFc6AySobdCwJtVlP6IJqsc3nvxN/j
         geEUZDflC1bDwpHCU1kfeUdlz71fw0H1vXrCoaVrCmdBMuPsVG9bPay32xttmSAvRCCI
         FuCjAtY0gW9YyhEsUJ/Vtqh4EbLt4PzaYsL1hstj0N5VAdfmmhgOE8E9xLyQwAwB/Rg8
         O+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786060874; x=1786665674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5GQBs3dETS7CDeKjtzGaEmQSXuk8Kh1aMvycfseSn5g=;
        b=kOp75Aqd5ICnszBjGyWIm2to7cd/KvDc0kLGnn8yhE0FJd/+NPHuw5kj04MpDYHOln
         auCAvkO/fDmg5EelDfBo06C83lxEXfdXJCcYWUwk7emB6QaGKBvCHt1Aie6ngW9BUAEj
         7TrGiP0EDy24uPjEeGMMS4V/3F0pDQ4nggiICnAx/xqjGaBYUxKp9ExL6uq67hUCKnd8
         mGnM+eChAI4TtxaEOQxWHauSGgMhsvLu5qpKflGFmG+IBoFhMPBQLoMZg8xcicF/O3ya
         lwywLsQF6aUqNoutGi4elNZQ9vf+dakON3kZwPf5/oZ7AG1KKcXvv+Zo1c3fqcG1R2wy
         h3rA==
X-Forwarded-Encrypted: i=1; AHgh+RroV5ONSIH9YlZTzeFL5PzxCxYV+G2N74e2ydjRgrV7AHNnWWk++q1UE1JNKbkYqnXjAujD7MzLVGjmvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ9jpoWoPpNsPKyhlZDJ28+J9ZEZ/us5eq5kApC5eQorCndjh3
	vp/QMUvuVzIw5nPxJyJRpI/IqKpVSTGXqN4s1KYyCvikLmXt3YmLNf07sK6bVR6Shzc=
X-Gm-Gg: AR+sD1176WXkKzX1mzx26N9FXc7eH00l9mzRcOHsbdRQDVDVamQOtTS/lx4eNijkP2F
	vW6p33CxlMyismgJquvzuoRGpzZxmKQH+qxvOM8fd4ybItXgy5rX3lA15BRxR1WORYfb3w5strt
	MfBk9XACSqn3fIGxdbtKOgubtbyDWIZm2sIkWDbFiepdZYUNqmclUKT+tiwBq1pHs+y3+obG81f
	55QUJieftI5TYlfpX4kh2D+DeUCrPD3Z9c3Sw8k7TCLhZFks50/d/vf2tEX6sM9KQcpHXSlwXKj
	J4IUt2c3Rd3KhhFsGvNHMCB8dm5jxtamrg0r7GMJ25Tlzl5vNyE50ZjGWIskzPnKaN4JPTmcbx7
	7QlwNUFHQd/Dq9BiK+UX6Ox+Rxz88UZuhCS8mjgHNJuPQpakoUnHtwHADgv4PgzRZKAQLa5LCHv
	9Ex2biPGZ701fxQbwxH4wyE42QDII0IEkBhMkW7e7OCb0doVvapYUyS/jjBpF0o1ccfpUF2H6sM
	2dVUKCVuZhS+k0EY1Y7V5Ajdwj2RPIdRQ==
X-Received: by 2002:a05:620a:a408:20b0:92e:57ae:3a53 with SMTP id af79cd13be357-9364909fbdfmr1592520785a.9.1786060874133;
        Thu, 06 Aug 2026 17:01:14 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e279f0esm27341485a.38.2026.08.06.17.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:01:13 -0700 (PDT)
From: Arie Miller <renari@arimil.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	Will Smith <github@notthatwillsmith.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arie Miller <renari@arimil.com>
Subject: [PATCH 0/3] hwmon: Add ASUS ROG Ryujin III support
Date: Thu,  6 Aug 2026 20:01:04 -0400
Message-ID: <20260807000107.1786892-1-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add hardware monitoring support for ASUS ROG Ryujin III coolers.

Compared with the Ryujin II, the Ryujin III uses different offsets in
its status reports and a different cooler-duty channel. It also does not
expose the Ryujin II's external fan-controller channels. The first patch
moves those details into per-device configuration, and the second adds
the Extreme and EVA Edition variants.

The final patch, authored by Will Smith, adds the White Edition USB ID.
Will confirmed his authorship sign-off and tested that variant on his
hardware.

The Ryujin III implementation and White Edition were tested through the
linked project pull requests. The EVA Edition hardware was tested by me.

Codex using gpt-5.6-sol assisted with porting the changes to the current
hwmon tree, organizing the patch series, updating documentation and
commit messages, and running build, checkpatch, Sparse, and Sphinx
validation. I reviewed and tested the resulting changes on ROG Ryujin
III EVA Edition hardware.

The series passes checkpatch --strict, builds in-tree with W=1 for both
built-in and module configurations, and produces no Sparse findings. The
hwmon HTML documentation also builds successfully.


Arie Miller (2):
  hwmon: (asus_rog_ryujin) Add per-device configuration
  hwmon: (asus_rog_ryujin) Add ROG Ryujin III support

Will Smith (1):
  hwmon: (asus_rog_ryujin) Add ROG Ryujin III White Edition

 Documentation/hwmon/asus_rog_ryujin.rst | 25 ++++---
 drivers/hwmon/Kconfig                   |  4 +-
 drivers/hwmon/asus_rog_ryujin.c         | 93 ++++++++++++++++++-------
 3 files changed, 84 insertions(+), 38 deletions(-)


base-commit: f39a03a64a96902e67fccf0ac796e8529def8e2d
-- 
2.55.0

