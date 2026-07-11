Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40F139280D;
	Sat, 11 Jul 2026 09:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783763971; cv=none; b=KWMGg0XmFs9OUTS2iJlX9f8j3fW+VoXc/kGBaQ/jLkP6IYXNZ8lCmkk8Np06tJk/2GZt+jOZfb0lBgN7h73DqSpD46KIQyUkIC78U110d/Zjz3MSzy+zRQBEecLzea03wloMzTMZREwgvnwFtZ2tfCjDWcburZGGrMWyMSVr9OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783763971; c=relaxed/simple;
	bh=tqbkpfATa5Revg8z89qrY8SWITwBCXJC91QU01Py5EI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SBPKmb0QbzIWfQs3pX082ysgvZwpOylRhAw83P+n4E8c62ra7QOysnBHIdCGCjDxK6JQsr/1u5mJWYOrpuOuOMJsqcNM1e6X1q5rNXcL0qteAQKZop/VwWtKl5pdKLEmpXdDkvDD5CW8GeVZZ8R7XbWVVSqcm1TKAJx/IDd8Mjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=MbLARKB1; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="MbLARKB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1783763961;
	bh=tqbkpfATa5Revg8z89qrY8SWITwBCXJC91QU01Py5EI=;
	h=From:Subject:Date:To:Cc:From;
	b=MbLARKB1xgqVlouaRo9v84KtFReQMLWOelIh/qYKiS4tThjXYf0/qmSl0iyqBDbQf
	 nOWDfe6VWy/Kzzzd5IJh+ijY1V4B0D/ttT//GA7LMeCc1N5gyu+JcMJAFkn2ujwTlL
	 fywu6f55jrgTRXFM8XjeYxYbb4WpZaQ84KlJ8TRI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/3] hwmon: (cros_ec) Synchronize EC access from the
 thermal device callbacks
Date: Sat, 11 Jul 2026 11:59:04 +0200
Message-Id: <20260711-cros_ec-hwmon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CMBBA4auQWTtJaU0TvIoxBqYDjD+t6SiYE
 O5uheW3eG8B5SyscKoWyDyJSooF9aECGts4MEooBmusN94ZpJz0yoTj/EwRH4nuEgcMzlrvQld
 Tc4TSvjL38t2+58tu/XQ3pvd/Buv6A+Kem/Z5AAAA
X-Change-ID: 20260630-cros_ec-hwmon-locking-d32263db1c94
To: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>
Cc: Sung-Chi Li <lschyi@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783763961; l=871;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=tqbkpfATa5Revg8z89qrY8SWITwBCXJC91QU01Py5EI=;
 b=PdzLrfLh8xtkU54YjkUln9KILAI0hxnXceLaNYjFd64hXFV+IkOoIxjWQlWx08NM0pH2Jvjcf
 TtowSya0G8eC0TAnOIY2/GR4Ysi5KOPKQy8APUDAewNvFr+2ul5XAb5
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

To guarantee consistency for the read-modify-write access in
cros_ec_hwmon_cooling_set_cur_state(), locking is necessary.

Use the existing hwmon device lock to do so.

Sung-Chi: Could you test this? I do not have access to hardware which
triggers this code path.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (3):
      hwmon: (cros_ec) Register the thermal devices after the hwmon ones
      hwmon: (cros_ec) Store the hwmon device in cros_ec_hwmon_priv
      hwmon: (cros_ec) Synchronize EC access from the thermal device callbacks

 drivers/hwmon/cros_ec_hwmon.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)
---
base-commit: ca078d004cf58137bcf8cb24a8b271397431ba58
change-id: 20260630-cros_ec-hwmon-locking-d32263db1c94

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

