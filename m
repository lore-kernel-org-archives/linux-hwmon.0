Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A883DB651;
	Wed,  5 Aug 2026 19:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956677; cv=none; b=pTLTcsfK/yD0Gk6gZ6yzAGPG8p4eGXpe9LOIXlVUDxn0ABlX7FbGVxXS6aJqA3UcBJ54/Qq9qaifN15zFWyO8Mj0yBMbq5azwzyc0nnELqJodTGbiWSt+RNxLYtXuryR7h8TIxjR/iB5vx7fcl7m9uGjr0ftx6zSdYlwHfgnB44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956677; c=relaxed/simple;
	bh=JR7ifx72LNrUWeDX/XoNysYEEzKkJ4WtTuNGxGhWZPw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZJTJjVYcLrG1/3ybWXYvOHzNMK3r+gkpvBb1mGKrEX/xxB6rzqAta3hLgNA1L4tk3Agdbf4J/0vrCUsVsEEWZ7djgWINf4dOGFdlz+FkLF6uM/2ko+Vu2iAxulrBjoxoYKlpRLZcucwWfhEqrLtoP+hzlTnQ5vbAHxsI4HvbVss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=l7ErfRaG; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="l7ErfRaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785956664;
	bh=JR7ifx72LNrUWeDX/XoNysYEEzKkJ4WtTuNGxGhWZPw=;
	h=From:Subject:Date:To:Cc:From;
	b=l7ErfRaGNxVeiGvmnI9kTiDVFnnw3+oNdJJTDKRQXSz807HnizWMPKpdc9N+fu+tP
	 s5Z5iUX9xbdeTJ6ilqXjaRjOCb3eoG9NU5LZof9HMS0rSVWL4BxpWS2KUXQqr9lAXd
	 M0IIxbxGkbbGCdHZKLMNRCHUxX8xg2VAcrYgH+oY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/3] hwmon: Handle const struct attributes
Date: Wed, 05 Aug 2026 21:04:18 +0200
Message-Id: <20260805-sysfs-const-attr-hwmon-v1-0-4c0cb2b290a1@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDtgRwzoVaQLEyd1Ck1KJtoW8
 e6NdvkW/2+gnIQV+mqDxKuoxFBwvVTg5jHcGWUqBqrJ1C0Z1K96RReDZhxzTji/nzGgb2xrOpq
 oowZK/Ers5XOOh9vfutgHu3zcYN9/vk+VynoAAAA=
X-Change-ID: 20260526-sysfs-const-attr-hwmon-f3b5692d2923
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785956663; l=1318;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=JR7ifx72LNrUWeDX/XoNysYEEzKkJ4WtTuNGxGhWZPw=;
 b=L9b/CZEwXUWxELkRI3103LILiykH0NQrzLRumUNcR6NPMR3YMtvGcJBjfEPUH4mKWQ7AFCEU0
 8E8rnPil1DtAiTDJgzlS+QPW0B50UQO/jUsaONNxm0rd2zyajjPTQgg
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

