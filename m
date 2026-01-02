Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828612D94A7;
	Fri,  2 Jan 2026 10:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767348975; cv=none; b=Z16uHNInmMaug6IzF6EpO3iQ1qBTsupq/CNatgi+j6wDKtU2vuSNCBnFR6/LCujRxzk5uFb1QwTk6PClysCIrbKSmii09izt9AK+Tkt2Fkd8TLZRyJZYCYWBANVbKFZ6bK62kQEgN30RzV1ejkRTKjtR/kabi+RXN5H+YZGpE4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767348975; c=relaxed/simple;
	bh=Q62La6tMG8NLXgwOLg+zY424ADxKVzFDoaNWZx8Y4nE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jpfOrEHXqrHIM/jgYTt5I57mQe6qRO7F8efMVjVA9UaleUauniiYQmjtSYOvb6JhH2e+tKhmYdZFkumktF7ULS0JIjrQiDQs2MmZsH5S09y4H35ZfwSmPvPlSl7iNx+IzlJEm88rmAW+R5by15mgLWnjp+HncKhfTwUbJVYdROg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=9pHrkj3x; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="9pHrkj3x"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=gFdX2U1Y4+TZXY+xuTQsbX1tSz9wsuRRTDUZpilP4J8=; b=9pHrkj3xk+SqBNRIUMxv3eaW6w
	gn6kaAVYs3tB2ZxtnOXcVEUlJ0pD23caNPDkE77DFLjWWKMKcbNfx3pWyll7sRCPCaJKgyRfAAMyY
	4XcmrRsO+7slu2iIMi15O8r3e7dL5jvVPEFFuVhtWOiAFufIv/+EXW9eaD2PRLenB8raXpTZD8tER
	pAxbAgI1b+ihLJbXwNmnrJNvJDIZbwQuAzuMGoeUb5jQXWO91qd6CVemI4zusOt4y5rt9TuT2DSGt
	5EY9E0Iolaf/9lgMgfGpV7r2CYqXjEToqAl7XQ56Ua/2jg28fEUJYT6loIAjKm0VZH1MsSUophUko
	Gc+vSO4w==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 0/2] regulator: Add TPS65185
Date: Fri, 02 Jan 2026 11:13:55 +0100
Message-Id: <20260102-tps65185-submit-v3-0-23bda35772f2@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGOaV2kC/3XNwQ6CMAyA4VchOzuzdQymJ9/DeADWSWMcZMNFQ
 3h3Byej8fg37deZRQyEkR2LmQVMFGnwOdSuYF3f+CtysrkZCNASAPg0xkpLo3l8tHeaONTQdbW
 uUDSW5asxoKPnJp4vuXuK0xBe24Mk1+l/K0kuuCoPpmq1KK12pxvefWNxT94NbOUSfBL1LwGZk
 MbkhbI1TqkvYlmWN/R1OUL0AAAA
X-Change-ID: 20251222-tps65185-submit-272cc756e0ad
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Josua Mayer <josua.mayer@jm0.eu>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=Q62La6tMG8NLXgwOLg+zY424ADxKVzFDoaNWZx8Y4nE=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDJnhs27INwTpWiTfOPo/Li5F1en1E5eJd7cEM1w55nE7v
 WbCNrnHHaUsDGJcDLJiiiy/rBXcPqk8yw2eGmEPM4eVCWQIAxenAEykqo6RYVL5OxeTA/G8XdeS
 PvQd1I78871AQOKri/gmodn95TM+2jIyfD5QXdnxQHpt9jvWlc/rt74u3Ks/6+b2Wb/S1iWUT4k
 VZgMA
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Add a driver for the TPS65185 regulator which provides the
comparatively high voltages needed for electronic paper displays.

Datasheet for the TPS65185 is at https://www.ti.com/lit/gpn/tps65185

To simplify things, include the hwmon part directly which is only
one temperature sensor and there are no other functions besides regulators
in this chip.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v3:
- fix subject prefix for binding
- remove description for vin-supply
- Link to v2: https://patch.msgid.link/20251227-tps65185-submit-v2-0-1882024b8f33@kemnade.info

Changes in v2:
- try to find a more common subject line for bindings patch
- align pwr-good name to pin name
- remove runtime pm
- make vin supply non-optional
- use more standard regulator ops
- Link to v1: https://patch.msgid.link/20251222-tps65185-submit-v1-0-34986b504d5f@kemnade.info

---
Andreas Kemnade (2):
      regulator: dt-bindings: Document TI TPS65185
      regulator: Add TPS65185 driver

 .../devicetree/bindings/regulator/ti,tps65185.yaml |  96 +++++
 drivers/regulator/Kconfig                          |  11 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/tps65185.c                       | 454 +++++++++++++++++++++
 4 files changed, 562 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251222-tps65185-submit-272cc756e0ad

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>

