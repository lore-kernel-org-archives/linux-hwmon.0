Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6A31804A;
	Sat, 15 Nov 2025 06:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763189492; cv=none; b=Bk2cQlc0rPtKw2RVlc9hY70FE2bbOsKoILJBxP8qf4Xiwki9qY5SPz/JQppr10UhZCeddgZUutJ6ZZdOrN5q/MIOtBFy8B3sdnzXDUtkgXHP5GOK+vG9sY8ce25dKUVp/KAqthZaL0O6vxVQtSOtR53S1MIve596zb0jRxGbqco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763189492; c=relaxed/simple;
	bh=/mw9emOFH0TJya/tnWIX5J9Imr2pwb1wRLC6N77Y+6s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gHX+Dy1MbacWO1Bk6kW9q6vi1wtSe1d2Wukm0GfSfOqtcy9z2xHuyFCl8Qr/gkZfGqVKdxgosqC/nCOC/ALsillsdAPqShDlYR8aBlPwaaXGvYGagmurZCONQaXV0N//2ZaX06SZD/StKYQJsi9Azx3HnCrLIWa3kuJ/aVvG3LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=XYvuMB12; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="XYvuMB12"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=grYrd7pcBDkC3E4qk7f/jBiIkt1ZM7pRMTVhaOYRLRo=; b=XYvuMB12aC6tqf+NywxICg3FFk
	XnyD31YUT31GFejfEDEFIRQZfY1BOT8h80AdQYX1Wo7jN7/1NnwylyFY0rHWBK9MTBl+11hA48qNW
	L7p2sChxb8qf5m80Mzr69wumb+mKukdvrgEDpj53xDgv9xUOsNE0dyi8POfFi1gNO0RuetV2oLmak
	DQuF734uPwfyoTAAlIuuejETBF1fukpgdbHB4XAa1f3OL3yLFi23t3Q58RewE23q+SOm+rFbHX9J9
	DSF60YV7L57sJZ4LIVNQtfhy2FTplguo8mlZ8/9Xb5XqZlU/Yo/Tl7rBdZ2jM8HwoBrUmf4gtw2cu
	DZlYdH3A==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 0/3] regulator: Add FP9931/JD9930
Date: Sat, 15 Nov 2025 07:50:48 +0100
Message-Id: <20251115-fp9931-submit-v3-0-92f5d0772b68@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMgiGGkC/3XMSwrCMBSF4a2UjI0k6cvryH2Igzxu7UVMS1KDU
 rp3046k4PA/cL6ZRQyEkZ2LmQVMFGnwOcpDwWyv/R05udxMCVVLKVrejQCl5PFlnjRxoa2qwNS
 uMYLlzxiwo/fmXW+5e4rTED4bn+S6/pOS5IJr3ZoWHGhjmssDn147PJLvBrZiSf0AstoDKgPWN
 QAnKJWt7A5YluULM41UPe4AAAA=
X-Change-ID: 20251107-fp9931-submit-0ac249b5d6b0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=/mw9emOFH0TJya/tnWIX5J9Imr2pwb1wRLC6N77Y+6s=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJkSSvcOzPGVYZz8w/Bq+cpFwZv3VFjxas3Mitqsd+LF0
 khtK62JHaUsDGJcDLJiiiy/rBXcPqk8yw2eGmEPM4eVCWQIAxenAEwk8wzDb5bLtmcP6Kx/FBv/
 22zz5fkFxxbMPRJ/587yExNNlZhPhYkx/DOXk9oVdMpiUbFDmdleTaYKNZWokOhYVb//Nn6ftC7
 FcwMA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Add a driver for the FP9931/JD9930 regulator which provides the
comparatively high voltages needed for electronic paper displays.

Datasheet for the FP9931 is at
https://www.fitipower.com/dl/file/flXa6hIchVeu0W3K

Although it is in English, it seems to be only downloadable
from the Chinese part of that website. 
For the JD9930 there can be a datasheet found at
https://e2e.ti.com/cfs-file/__key/communityserver-discussions-components-files/196/JD9930_2D00_0.7_2D00_JUN_2D00_2019.pdf

To simplify things, include the hwmon part directly which is only
one register read and there are not other functions besides
regulators in this chip.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v3:
- cleanup indent in devicetree example
- remove unnecessary checks in hwmon part
- Link to v2: https://patch.msgid.link/20251114-fp9931-submit-v2-0-cd6998932c4c@kemnade.info

Changes in v2:
- vendor prefix fiti->fitipower
- tdly in ms with enum
- no #thermal-sensor-cells
- regulator node names lowercase and under regulators subnode
- s/ts-en/en-ts/
- remove duplicate v3p3 of_match
- remove ancient driver.owner assignmed
- some style cleanup
- Link to v1: https://patch.msgid.link/20251107-fp9931-submit-v1-0-aa7b79d9abb6@kemnade.info

---
Andreas Kemnade (3):
      dt-bindings: vendor-prefixes: Add Fitipower
      dt-bindings: regulator: Add Fitipower FP9931/JD9930
      regulator: Add FP9931/JD9930 driver

 .../bindings/regulator/fitipower,fp9931.yaml       | 110 ++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 drivers/regulator/Kconfig                          |  10 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/fp9931.c                         | 551 +++++++++++++++++++++
 5 files changed, 674 insertions(+)
---
base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
change-id: 20251107-fp9931-submit-0ac249b5d6b0

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>

