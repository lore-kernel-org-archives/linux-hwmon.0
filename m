Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B4C3AE197;
	Thu,  6 Aug 2026 06:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785996559; cv=none; b=JZvOILb3ZIitLhabpLOqgWBbCcWKi8GE7TikuIbC8PLN1W8waz08GROirL8Nqi9lgr82o0yLfamtPIpbPoniYfzBlBhnMGyxXpIrF3ClC5hX8HzJ6qz+K+ypR8Zkp+zyh1qn9gws71PnPNHMR0xeNkJYvpfVWNNGYXWujyhOaJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785996559; c=relaxed/simple;
	bh=i+6257f4putt0FIWxNlNHUFJfsw2E0zSKOhtDtNsmaM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kN9B2usJ3q3AdwC+23PrhgqjtTBL+aOsWPALB6JYv4q5SLMVrGtp/W8+YAqqWJLcOBQjUXqZolXkdCfd7IVPJYRfn2BcZEnmOoVRWkW0gDVZjOMt2P7rxuFjqMH2fvxYt1cu6ONE+pgsg7v4rBgBvnDpkRn/hmPjXHN22OrFGTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=QfHGOGr3; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="QfHGOGr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785996554;
	bh=i+6257f4putt0FIWxNlNHUFJfsw2E0zSKOhtDtNsmaM=;
	h=From:Subject:Date:To:Cc:From;
	b=QfHGOGr3mibriOSb1qwMxRp8lddGxiCks+EHBBMFId/m2pgTFDzwzaLOsS3vLv50k
	 u2p93uKgTeV2T7Ikz8x8gEExcVNdkgRsq/FJ7JoAcrE4Yipjx26v4RBMbDyHmQrzXo
	 tBbERSTy7YZr2/6RPTVR0BGejxl8Gd4zstIBCEhs=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/3] hwmon: Handle const struct attributes
Date: Thu, 06 Aug 2026 08:09:10 +0200
Message-Id: <20260806-sysfs-const-attr-hwmon-v2-0-22fee8b85509@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0K6dkwZhIgr72FY0DLYmtiaTgEJ4
 e4WWLt8yf/vLYIpWGJxyxYRaLRsvUuAp0xo07onge0SC5RYyRIr4Jl7Bu0dR2hjDGCmt3fQF6q
 sauywxkKk8ydQb7+7+NEczIN6kY6bbVsYy9GHeS+P+bY7IldZ/ouMOUi4aKkVKqxlm98nssysz
 WDOjqJo1nX9ATZARkLTAAAA
X-Change-ID: 20260526-sysfs-const-attr-hwmon-f3b5692d2923
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785996552; l=1480;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=i+6257f4putt0FIWxNlNHUFJfsw2E0zSKOhtDtNsmaM=;
 b=nUcL5iYdG0Cad8moR1Ni/1FuBwmDt+h2CPKBKUk1Cn8ZI9+7UHZ0QFqulFsuRSzhtYxTMFXLz
 qE5O1KbRpmGCX9zu+bDbGQHEH7223fjUx7LzlAiTdCbR6qHtx4PzCM5
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Statically allocated instance of 'struct attribute' and its derivates
like 'struct device_attribute' are never modified.
To avoid accidental or malicious modifications (to hijack control flow)
they should be marked as 'const' and moved into read-only memory.
Historically the sysfs APIs did not allow this, but today it is possible.

Change the attributes in the hwmon core and also lay the groundwork for
the drivers to be changed.

The drivers themselves will also need to
be adapted. Please tell me in which form you want this to happen.
One big patch or per-driver patches; in a big series or separate?
Cc all driver maintainers or just hwmon core ones?

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- s/__DRIVER_ATTR/__DEVICE_ATTR/
- Link to v1: https://patch.msgid.link/20260805-sysfs-const-attr-hwmon-v1-0-4c0cb2b290a1@weissschuh.net

---
Thomas Weißschuh (3):
      hwmon: (core) Constify device attributes
      hwmon: (core) Use const APIs for the dynamically allocated sysfs attributes
      hwmon: (sysfs) Allow drivers to register const attributes

 drivers/hwmon/hwmon.c       | 70 ++++++++++++++++++++++-----------------------
 include/linux/hwmon-sysfs.h | 14 ++++-----
 2 files changed, 42 insertions(+), 42 deletions(-)
---
base-commit: ef9d75d6705d89d019d950262a11d55b19f5d9e3
change-id: 20260526-sysfs-const-attr-hwmon-f3b5692d2923

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

