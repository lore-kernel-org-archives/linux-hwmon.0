Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589A821D3E8;
	Thu, 13 Nov 2025 23:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763075473; cv=none; b=owRvX1Q+haJwg/Lz/QQ1UfVTf03N20g+NoTPtUoFim1cKmvRBPVj4Wr4a5wBl5U1NrBGqtKEfSoFES9x7hqEPxnRX7sUt9HCk67F6tvrRlJX/BIfG7JV+HlcUjzemFo4w5fhcaf6TbQvuSUFZ6Hdb1T6DciwpAoPGGMNcwGi8gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763075473; c=relaxed/simple;
	bh=frxn0IvtIXiU4Ye6BwNmJWBCWzKVKKR8zicTclVfg8M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qDGyamCGI1fm9V321oI9teTemJ7AjHvICyazafcCl07BqGiScXK7hnunOxZzjyCZrtmRHQDtPfIh2onUHrVAHrcczuXTidbWMR2SQNoN8Uj2YGZgXZApQNLtO68iY3T4waG7/ZhH7z7Y3Zu8/bGcUoydltiL6vBZAYtqRbOF38E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=aTq5ZOug; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="aTq5ZOug"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=Y8HrovWKvX8y7aX2LjmCc1TForPMWvEd0h0ldABH8kE=; b=aTq5ZOugdqXehvFWdT2qzAJeS0
	u7943KvWT3ZOM0mtIJFBq0FmAAXUFe6JrgSxeb3xwhHHWo+vUE+Dz3G5VALHCTnppO7C6MOuqLQNu
	kos5O5NLA22UDBDNIINnQwvncbydSuqQBnA/9wb2ui3nskCOP9qlhWuUE9x0O2s0YeQOqZj3jNy4y
	ZcKL48dFtkwTD978qzuDQT4csxae1328e7sZbsXk/373mRPUKS2gtmA2pI7fjIGBFtLRe/a8UlXty
	PQXhb4kxvBVAGLjXj9gWygyQ+elpyIgHCMGge/Hc1ELl8seosdUeUVKxe+8QRV79u6rlt3cbqgp/Z
	lflkQ36g==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/3] regulator: Add FP9931/JD9930
Date: Fri, 14 Nov 2025 00:06:40 +0100
Message-Id: <20251114-fp9931-submit-v2-0-cd6998932c4c@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIBkFmkC/3XMQQ7CIBCF4as0sxYDaEtw1XuYLqAMdmJKG6hE0
 3B3sXuX/0vet0PCSJjg1uwQMVOiJdSQpwbGyYQHMnK1QXLZCsEV86vWF8HSy860MW5GedW2dZ3
 lUD9rRE/vw7sPtSdK2xI/B5/Fb/0nZcE4M0ZZpZ021nb9E+dgHJ4p+AWGUsoX/D3/960AAAA=
X-Change-ID: 20251107-fp9931-submit-0ac249b5d6b0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1806; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=frxn0IvtIXiU4Ye6BwNmJWBCWzKVKKR8zicTclVfg8M=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJliKceEXh/s3cp10tEmsYPFuLzVf3ON6YtF8Qnr/4X8m
 vjm96HDHaUsDGJcDLJiiiy/rBXcPqk8yw2eGmEPM4eVCWQIAxenAExE5RHD/5yOyZujyy61LTp5
 0CXrpJZYqZHf1vmxImdLcpm3BiXVezP8FSg48PaszALJOfNvfrjMEZtu177QIlnUS63fYtuOks4
 H/AA=
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
 drivers/regulator/fp9931.c                         | 564 +++++++++++++++++++++
 5 files changed, 687 insertions(+)
---
base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
change-id: 20251107-fp9931-submit-0ac249b5d6b0

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>

