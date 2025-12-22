Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE96B1C84A2;
	Mon, 22 Dec 2025 12:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766405939; cv=none; b=nlloovT2WN2D9PPCzgnWP4pZFvXhpwi9r4kreeORfQKuH53tQlg0wLmLi2mEKrakibrKJM2PzV9fX/Ll7HVYErj2KAsUznot3jskjnOiM/IvobjSwG6Cq5SAggs2vKVqiVtTc8yFr7TnDaDWuzvAJYiDyJvNLObzEaNdMHqx77w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766405939; c=relaxed/simple;
	bh=y1WoYDdmRzAcmCanGvpnb/Y1zVnFvLtEW/oemCX/8H0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MIpLDjMK6VWjmZQ339mhKFkdWiHMtiHSIWiDMF6V36oNTfHpyaCpnib8P6CUJepHOFVWDrYE/1ao66w4e63zx17JVusSoyEjJEaeWBMtg/uUvSOixPJ1ziiAn/4RNw0gyD/5qx+2YjTbfMazYHNN5INvDgGsbPyi/J0AeEAYCOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=RKH2VLw7; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="RKH2VLw7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=HBvgHlqJISazESIS5DCJFWBOWcdN+BY/xvldDqpmW2c=; b=RKH2VLw7k40thIf4sj4lVncTDa
	0ZDWL+xR9g21cui7Tp93y0O9MVEUntahOJF7Adu44niraq30Jyln1mDDun2hc44/cpTmhNXLbaKRo
	4thJYSGYZAH1GXM4MJtCEDEi4s8Ux3Io1w6lAsgNeH6Ird5do0zPki1MYRbzmIsjUwMTq3ita4XU1
	yE574yob3+YXh36/Z7KHqhGnOqq74YzOFzVxArPRLTZfOS5kr+6UAom3oQCmgRMR8Ql0drb+CSVtx
	f5Xd5iSKTfrQRCTFPzH0OVzv4mZBMvCV21hHV5+3NK7QtFaUOs2VNGBy5smAsoybcl8YEOga1TllW
	/0sfN/7w==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/2] regulator: Add TPS65185
Date: Mon, 22 Dec 2025 13:18:29 +0100
Message-Id: <20251222-tps65185-submit-v1-0-34986b504d5f@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABU3SWkC/x3MTQqAIBBA4avErBNyQIuuEi1Mp5pFPzgWQXj3p
 OW3eO8Focgk0FcvRLpZ+NgLdF2BX92+kOJQDNig0Yio0inW6M4ouaaNk8IWvW+NpcYFKNUZaeb
 nPw5jzh9PcT5oYQAAAA==
X-Change-ID: 20251222-tps65185-submit-272cc756e0ad
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=990; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=y1WoYDdmRzAcmCanGvpnb/Y1zVnFvLtEW/oemCX/8H0=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJme5hoeSbpTC37vn2GYUhD0RclzrnBZdUzo59NZXzmL7
 yQzavl2lLIwiHExyIopsvyyVnD7pPIsN3hqhD3MHFYmkCEMXJwCMJH9Zgz/w3JDNv/iSnse/0/l
 U8aqgzb73rG9cZzXYfWw/Yzv+lp+O4b/1Uxibidsq6cayAdHr72xUrJ2TpAz365TTTwSGZ3zJNa
 xAwA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Add a driver for the TPS65185 regulator which provides the
comparatively high voltages needed for electronic paper displays.

Datasheet for the TPS65185 is at https://www.ti.com/lit/gpn/tps65185

To simplify things, include the hwmon part directly which is only
one temperature sensorno other functions besides regulators in this chip.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Andreas Kemnade (2):
      dt-bindings: regulator: Add TI TPS65185
      regulator: Add TPS65185 driver

 .../devicetree/bindings/regulator/ti,tps65185.yaml |  98 +++
 drivers/regulator/Kconfig                          |  11 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/tps65185.c                       | 658 +++++++++++++++++++++
 4 files changed, 768 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-tps65185-submit-272cc756e0ad

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>

