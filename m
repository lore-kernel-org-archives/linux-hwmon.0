Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A344329E5D;
	Tue, 29 Sep 2026 23:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790723109; cv=none; b=ZDUGDFrWPmfxBfR1UQWm9StWQ+pK1oF1GA43EyffS6sELwQQ29cib2TCxiY8q9VB4foo9sKs86G+ZiChjApQ/xJ4UcoaVn55wy4jAvFfKK4Yi0W3G8jz4LmTAvN1NSWTCiTh2k+44pneAIANlwcWptVYffuobu3Kh2X+x0uh7i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790723109; c=relaxed/simple;
	bh=UVIH989FrHhWR2tRZRtFqOaPdbLHHUMNwpfyKxWgAnc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Jg+pgNux9h3lvPaF19IxtjXkyKa/fnFx1vwtA4oqFjQNmX/nd8I7YZj4XPmkEbacYk3ms0FEP5XrFcQZGB/YHs7UObNCrSdEV2M8bZBBv9+Kzj+mNqCQaZrMTP8s5he2jDlqeIXvCzWbkkIGFO11TXFVkCP/KUDAYj/TNyUepo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkojCulP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkojCulP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB41CC4AF0B;
	Tue, 29 Sep 2026 23:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790723108;
	bh=UVIH989FrHhWR2tRZRtFqOaPdbLHHUMNwpfyKxWgAnc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=IkojCulPgELJqPKOfINb1S8ndVCwuteApQ/t3+ducc0edJEa+/wsGFVfC1CcnhZES
	 /+wUGfv4ao9kcJfY9N2TC8N/EyQrtTzA41KTwCQ/y1tiJh6Xn0d9aRrdymRb0zPwjp
	 IYADGa6WzjIboTUtLaowFu509kKiJUsEZOD9ub6/yv1MWCewvDt10c2fuwcMLn0pDz
	 G90KKgKI5bo+NNOynOIkRbh3USrZvpDVYTw/lzi9iu1vTLuuck5CbXRtFrIBUuXV5Q
	 Vcx7R0khBg/3/+/zDdCNgfJxRqgNq+Dv7542BLdVnOmBdFFpqUjmo3IC5OVbRCd8mf
	 2uP/k9abjzwCg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 924FECA5FA5;
	Tue, 29 Sep 2026 23:05:08 +0000 (UTC)
From: Luna Hart via B4 Relay <devnull+lhart.opensource.witekio.com@kernel.org>
Subject: [PATCH 0/2] hwmon: Add support for TI
 TPS389004/TPS389006/TPS389008
Date: Tue, 29 Sep 2026 16:04:03 -0700
Message-Id: <20260929-lhart-dev-tps38900x-v1-0-7045c5894152@witekio.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAONDvGoC/x3MSwqAMAwA0atI1gZi/dariIvWRg2ISitSEO9uc
 fkWMw8E9sIB+uwBz7cEOfaEIs9gWs2+MIpLBkWqIa00bqvxFzq+8TpD2WmiiLMulZ2crahuIZW
 n51nifx3G9/0AoJCU3mUAAAA=
X-Change-ID: 20260929-lhart-dev-tps38900x-f932bcdb4057
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Flaviu Nistor <flaviu.nistor@gmail.com>, 
 Luna Hart <lhart.opensource@witekio.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790723106; l=1463;
 i=lhart.opensource@witekio.com; s=20260928; h=from:subject:message-id;
 bh=UVIH989FrHhWR2tRZRtFqOaPdbLHHUMNwpfyKxWgAnc=;
 b=B1TWvhGM3hqg+fSTDhaelUjQz/pbyOtVymIs0Ud7JeR7Bq8oRy/hgK4+vl6q0hTty1lljKR3H
 FN9QA0SEVYABF0wz1AouCN6Cv1GF6LHm3KStYS/BpXJN/yL72MMkCmj
X-Developer-Key: i=lhart.opensource@witekio.com; a=ed25519;
 pk=Dm1WPzsg+HuKn11WChbCWrNOk7GD980BnpCdnUwyDuU=
X-Endpoint-Received: by B4 Relay for lhart.opensource@witekio.com/20260928
 with auth_id=1079
X-Original-From: Luna Hart <lhart.opensource@witekio.com>
Reply-To: lhart.opensource@witekio.com

This series adds a binding and hwmon driver for the TI TPS38900x family
of I2C voltage supervisor/monitors. The driver implements voltage
monitoring functionality from the ADCs of the monitor chip. It supports
basic configuration of voltage channels, specifically the ability to set
the high-range (4x) voltage scale.

Tested on TI J784S4 on custom hardware with a TPS389006. Kernel 6.18 was
used with these patches during testing.

This is built atop previous unmerged work from Flaviu Nistor, but
features a large rewrite of the driver to utilize regmaps.

Signed-off-by: Luna Hart <lhart.opensource@witekio.com>
---
Luna Hart (2):
      dt-bindings: hwmon: Add TI TPS389004/TPS389006/TPS389008
      hwmon: (tps38900x) Add driver for TI TPS389004/TPS389006/TPS389008

 .../devicetree/bindings/hwmon/ti,tps38900x.yaml    | 137 ++++++++++
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/tps38900x.rst                  |  55 ++++
 MAINTAINERS                                        |   8 +
 drivers/hwmon/Kconfig                              |  11 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/tps38900x.c                          | 281 +++++++++++++++++++++
 7 files changed, 494 insertions(+)
---
base-commit: 4781ca52761e666cf18b591e6bb0478396c90320
change-id: 20260929-lhart-dev-tps38900x-f932bcdb4057

Best regards,
-- 
Luna Hart <lhart.opensource@witekio.com>


