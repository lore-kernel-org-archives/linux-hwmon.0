Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7663939BD
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 21:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787348857; cv=none; b=hxp/WaczzsNZnKvPK3lImPVGmGstTQB+FqVEMpLUWEx4vZKuiF/cB6pnSy6QoHbN7WDCqoBS2zrN38suQpXUVc7egptR7KIAOHQpSk3uIOIh+AmiMQrz1ywgJg1024Rwib85ZYc0gAv0vZ+pYFaLPv7Wr04/oLyGAf0obNaT698=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787348857; c=relaxed/simple;
	bh=5Z2Lpou+idaDjMdbBLj5870okjZ93hYD6gJizvIkOTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NQKHMDEYDz9cgB3jnZrtCxvFzqso26JLYZmBxRXKfXXS1OD/magWyCEAHbYsVPlStUOfP5/y0Ji3i/efQstPmm3Wjy5XgWRG/kNFPmEDuWP4vWYdIoIqwgfkj7x4DiFTAyuncdVlOxjzgXo0kvyG3DENy9ntjU3qlXpIJPMY+h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSoHFjH+; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSoHFjH+"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so18039675ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 14:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787348856; x=1787953656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YSjgsk8Yvs83A8c6v1zqzSAqyvIC2+XLW+Y3mp3uQzE=;
        b=dSoHFjH+UTqPqeLtzrtAgF0CDXKh3AMuXJ7+Wmc9Rnn5jF1vTkDXKHAiB19pPYh8+p
         9/9py2zqtMufVoWPRABVnr6UMxKXZrXU1OZmigB+WbYtqT3XmRTOPTTc2y3ilfUBucPy
         O2kqQec5Bd0FvdRflpZsniymUKA12W+sS8rFMwzxIrTgqyuO2LSOCtcfMnQ36yVnqWA5
         1p6phqLgV/IAkU4rtI1BOXPHpSgSsCoY5X9muU29sjNLQphzYoVHHcyLQTNKf2t0pv3F
         rZ6KiIE5byDnUFTrLwcy8P8mqmjNTtba0JRBm+1TRXk9QqqDaEWCDZ3sf+gXiE0DLDbF
         6S9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787348856; x=1787953656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YSjgsk8Yvs83A8c6v1zqzSAqyvIC2+XLW+Y3mp3uQzE=;
        b=pzyykql+3rvIRJmZsTe4+wVjZxsHGVmEkjlGzo5b4HyCzE1+x4CWoHfuFg9t79qVNu
         hBuVA0UFKzQtTsuL9oMkDjtYTsn67ryN0lgbC7t2XDiZV2IYA9GLhASmG5tVZxDCJu7R
         G4Q+jE/NZ8aFKSIs+FYzGFZnOXPUuLxY+VDda1EWQhfizxUPqAW1ma9XonmaO1W/CHix
         5m6FOLsW3GxtMGlRVCuRRTARBI5h8UNamZCkCD8HecrO5XBe6Ya0gSNDSV9Ge7b8j7tF
         QmLwrvdM2P89EUctaL4GxaqlRJx9C676iHm71FuiWkrJMmEtJPU33qLI8NOj+gv4NhLn
         cYvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0NG/J0UBya4mHptNYvY+zDBYK1iFGcGPfRTMRw48Sc3CWGdQruhNuxvX9gr0orPHgW31DqaUYeI1zBg==@vger.kernel.org
X-Gm-Message-State: AFuF++nE2nynXPsLcDiyirgtyfzkl+uMCqqn41idkRI0MpBD3/brF2VS
	DgsQBYj6BmMi/B9dok4TEk/nUelubOOawQBbiZTvBgwEzrTv/ZxkshEj
X-Gm-Gg: AR+sD13rC9DmT2GEPo+KqIAOUPtmlZ/61NXMoWwUdEm36Gbc40dhHj7T38PYrKrko7J
	ZVXAjkBKyuyBZ5Nl5YqZE06Ed2ZY3p+ztk+aOlwURXCCzoInx3rO0XoUGAYWwmGZhgIUjm3Im6m
	MR8fd6NNhkb+R1dgc8rNDM7JjnrPvSveEqI+HKmmlgmja8jtEaEWWwZGh4mIqI0qRMwNBVL0qvq
	b8RB88lfMi9Yrt3Qf9vDaIiGRp/zlFM+yKWYLsl0kzJY4O3g4/7fgpoVQxXssSuCcFMeMRbLADA
	f0llN6a5uJm3c2Hkm5hmnuFQiNU7RqAbX6RRLyTRATnw17UVF7IN2lHFaF4VbH36SmEKXNbqNKL
	TE7mZrTONgMnJ0tDlNS4mw8dlaXQWT815ZvtbTr14vAFpSlpCoUPZmRfG0AaNc/H+luEurTG5v4
	qEE32LkIa39lwm96wId3OPN8MvEPIAGdGUPG33DhjSXVkNTnx93ZPeKfQY80vaIZOTZFn6lnH6E
	bwetDrAD7GR1iyvHt0=
X-Received: by 2002:a17:902:cf43:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2d64ade9363mr188665515ad.3.1787348855568;
        Fri, 21 Aug 2026 14:47:35 -0700 (PDT)
Received: from localhost.localdomain ([103.16.69.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10d497sm45664198eec.14.2026.08.21.14.47.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Aug 2026 14:47:34 -0700 (PDT)
From: Aditya Dash <mradityadash@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 0/3] platform/x86: lenovo: Add Legion Go fan controls
Date: Sat, 22 Aug 2026 03:17:24 +0530
Message-ID: <20260821214728.87773-1-mradityadash@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Capability Data does not cover all fan controls on the Legion Go. Full
Speed uses a separate Other Mode feature, some firmware exposes an RPM
reading that Capability Data does not advertise, and the custom fan table
uses a separate Fan Method WMI interface.

Patches 1 and 2 add Full Speed and the RPM fallback to the existing HWMON
device. Patch 3 adds a Fan Method driver and attaches the ten curve points
to that device when both WMI interfaces belong to the same provider. Other
Mode continues to work without Fan Method.

The open question is how the firmware control range should map to HWMON.
On the tested Legion Go 8APU1, values from 0 through 115 produce the
observable fan response and correspond to Lenovo's 0 through 115 percent
range. Lenovo software shows 0 through 100 percent to the user, and 115
reaches the RPM observed in Full Speed mode. Firmware accepts values
through 255, but no RPM increase was observed above 115.

This series keeps the native values unchanged and exposes the fixed
temperatures as read-only automatic points. Should the driver map the
effective 0 through 115 range to the standard HWMON 0 through 255 scale,
or keep the native firmware values unchanged?

Aditya Dash (3):
  platform/x86: lenovo-wmi-other: Add Legion Go Full Speed control
  platform/x86: lenovo-wmi-other: Add Legion Go fan RPM fallback
  platform/x86: lenovo: Add Legion Go Fan Method curve driver

 .../wmi/devices/lenovo-wmi-fan-method.rst     |  34 ++
 .../wmi/devices/lenovo-wmi-other.rst          |  14 +
 MAINTAINERS                                   |   1 +
 drivers/platform/x86/lenovo/Kconfig           |  11 +
 drivers/platform/x86/lenovo/Makefile          |   1 +
 drivers/platform/x86/lenovo/wmi-fan-method.c  | 380 ++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-other.c       | 215 +++++++++-
 7 files changed, 649 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/wmi/devices/lenovo-wmi-fan-method.rst
 create mode 100644 drivers/platform/x86/lenovo/wmi-fan-method.c


base-commit: aca39607c1734ed976fdd65deb75b3555a5a0326
-- 
2.55.0

