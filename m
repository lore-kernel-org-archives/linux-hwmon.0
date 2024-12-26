Received: from smtp2.math.uni-bielefeld.de (smtp2.math.uni-bielefeld.de [129.70.45.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361F235280;
	Thu, 26 Dec 2024 17:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.70.45.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735233035; cv=none; b=iDVs9HCgV/NbgTDuhucGTWyVcjOUFlC3zj8Iz8R4Bxl6aN0lyXJLkl2ufaSo51+wzwe9xqTlITT1uXCt6k35jCTllENkXYg7tmiWc1nSXnpvekgZyPwyOmDLworlzDwZv5WcDvY1JsfV8BWsJF7W6uITyZ+ZkzR5atL224LfkFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735233035; c=relaxed/simple;
	bh=R/UYS6EhbxHtw7kM5a7s+ADwCRdsxbVATNsE/xf9izo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GVUQNVawNjb5AwYn5sym+8ALaV/MQtyjgWSrtKSPoRcBzRboRKHO8/79ztWYoIF3MJwhvx47skx6JlBQuX7WfeSvsAg97Uog9aN/6GeEXnrpw9/kqG+W9msewTRGOJNRke4AYNuoX0ZhnGAx4yHPnceF7fr1HMHHEkegQwajKsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=math.uni-bielefeld.de; spf=pass smtp.mailfrom=math.uni-bielefeld.de; dkim=pass (2048-bit key) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b=cdhaLFqD; arc=none smtp.client-ip=129.70.45.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=math.uni-bielefeld.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=math.uni-bielefeld.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="cdhaLFqD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=math.uni-bielefeld.de; s=default; t=1735232430;
	bh=R/UYS6EhbxHtw7kM5a7s+ADwCRdsxbVATNsE/xf9izo=;
	h=From:To:Cc:Subject:Date:From;
	b=cdhaLFqDPbB/Fnyh89Hapo9IfLLBVbhW2jo8GdXKZee0Yp9+qmb0/XeejK9+3IzP2
	 SW2LjPWrWh3+ISJC+3FZrGCg+mmJxZMsjfmAFMJpOkjTOo/qDbKfSni1Y+nTBQUy0g
	 hKxw9maSALXiZkmswHas7nsx+TfWXfiXcnWhwRKKI1S8JevFV87h7yWT4JYvAjNJ3u
	 3dfRLYuNw1d2KSSTSXTFZ4G92RYJb90EeVRfQTS6jqCDfqiqvgJFe70XwW06Z5MkxD
	 JIIalbrLlb+Ov6UlplZRXA6gdfHLK8HTDT3OE5zfXssKCi5gd45AmCrGi38gyXuQuy
	 oBvHOnvg/0wVA==
Received: from localhost (58-32-133-N4.customer.vsm.sh [170.133.32.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp2.math.uni-bielefeld.de (Postfix) with ESMTPSA id CD61B204A5;
	Thu, 26 Dec 2024 18:00:30 +0100 (CET)
From: tjakobi@math.uni-bielefeld.de
To: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 0/4] hwmon: (oxp-sensors) Cleanup device type handling
Date: Thu, 26 Dec 2024 18:00:15 +0100
Message-ID: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Hello,

this series tries to cleanup the handling of the various device types
in the oxp-sensors drivers. The current approach is error-prone
since it relies on ever-growing switch-statements, which are
present in multiple functions. Adding a single new device involves
touching a bunch of functions.

That this is problematic is already demonstrated by this bug in
the driver: While oxp_pwm_disable() handles the aya_neo_air_1s
model, the inverse function oxp_pwm_enable() does not handle the
model. This is obviously wrong and a result of the current design.

Introduce a different design with better separation of logic and
data. While at it, also fix some typos, wording and add a cache
for the PWM enable mode.

With best wishes,
Tobias

Tobias Jakobi (4):
  hwmon: (oxp-sensors) Separate logic from device-specific data
  hwmon: (oxp-sensors) Fix typos in documentation
  hwmon: (oxp-sensors) Fix wording in code comment
  hwmon: (oxp-sensors) Cache state of PWM enable mode

 Documentation/hwmon/oxp-sensors.rst |   2 +-
 drivers/hwmon/oxp-sensors.c         | 576 +++++++++++++---------------
 2 files changed, 275 insertions(+), 303 deletions(-)

-- 
2.45.2

