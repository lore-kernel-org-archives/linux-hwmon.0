Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A6019DF55
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777715138; cv=none; b=OodPOWoxFHjlUX+eJw5Cng9grYyIOE8d9tQnw+E6rHMSCUPnzcdWfbZmIUH2+D9H5KxFKv5K3ylouxgFQ1rx4N9jsYIkQVMWuR3Md/WKEbvej+M/NzhXaQDx+/HCFdT46ctTLZQrbKkemUcarvZUrrSF18PBMsD35Y55HFN8oI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777715138; c=relaxed/simple;
	bh=zjmetr59dpT0ANapC2Jl367MDpgyAmp3w1CTXwd/140=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZtzaflZvHzVJORolEw+uHlTeATt51UN77nlHptot3DMs5CQPWeWgEWIRTCUu5y72MFLIz21Jw2bEGv1aMf8ccrlR6rnNdRZBczniBlbKdrUtl73Lq1/Teno86WkzRPrQ4Btm82VRrTzPHrD9uJXYJ8Wv47Nu7YP+fQs/IrI5EpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=WRSR3OQL; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="WRSR3OQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777715134; x=1778319934;
	i=markus.stockhausen@gmx.de;
	bh=CBCRx6hPnhZlW2Ni3mL/bj2oqmBVyoHImGpycQNuaCc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WRSR3OQLRt78NNwwVj6Uzx/8wAOtwNaZavfmfn+M39g0umeOxcwsPmhjgGom4lpY
	 j/WmyBNbL6kOpgBvy+X+oVaMPum8GiqBim+hHsHWNqPd0u1ZTn2pxkoYF/O+/3yZ6
	 173PG35P7Q2FWql/Jjc9bESDFJwiDzctEt8N9m07Pi+RZ5jorauFokNALpe6Pso/Z
	 UhC3TY1Zlwt8MUAra/kTM1TGRBoug1tqpb/Kgwp75vRD1G+HgRfsHFFX1zXflmsG2
	 dEaBnloZL0a/XKTGxRhQVcm/Ux8/5TpKaiJuASPCNE0G6vR+sGO1SlrTo4UDypPKn
	 KR5JJZDViBkWf2bWmQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Fjb-1wDtZx2ayF-00CK9u; Sat, 02
 May 2026 11:45:34 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	wsa+renesas@sang-engineering.com,
	alkuor@gmail.com
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH 2/2] hwmon: (lm75) Fix configuration register writes.
Date: Sat,  2 May 2026 11:45:24 +0200
Message-ID: <20260502094524.3358193-3-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502094524.3358193-1-markus.stockhausen@gmx.de>
References: <20260502094524.3358193-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NK3tIidJd5BdS2xaAeqrwyMa+Zfrp5r4UhUZddMNRAEhI1ZNv75
 6NUTg+m55JIgAbkJcSYF2lSHBdNOByI4HQ/TwPuiRKUKfWr+2Y7tkNJiXdvnGBAldzSIT9q
 EI5dPE3Ls5T6H1El0DW8/yEB+WeNvIi0nHf4dY3/VueCe+yM1+9Lf+HEOMGIchNBubbT5vY
 ip2tNzOnp86Ftp+nq8ivw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hmVEW9T7e8M=;ybzeZBtjlGAoU7k3Ha9fEUxhgc1
 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
 dz6D7iUJlWAZ2Tw==

Sensors configurations are defined by set and clear masks. These
do not follow a consistent "clear mask is a superset of set mask"
rule. This relaxed definition breaks lm75_write_config()

static inline int lm75_write_config(struct lm75_data *data, u16 set_mask,
				    u16 clr_mask)
{
	return regmap_update_bits(data->regmap, LM75_REG_CONF,
				  clr_mask | LM75_SHUTDOWN, set_mask);
}

Basically all bits from set_mask that are not defined in clr_mask are
dropped. Fix that by enhancing the helper to always combine clr_mask
and set_mask into the mask bits of regmap_update_bits().

Fixes: 6da24a2 ("hwmon: (lm75) Hide register size differences in regmap ac=
cess functions")
Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--
 drivers/hwmon/lm75.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 4fd4288ae502..c601bb494dad 100644
=2D-- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -353,7 +353,7 @@ static inline int lm75_write_config(struct lm75_data *=
data, u16 set_mask,
 				    u16 clr_mask)
 {
 	return regmap_update_bits(data->regmap, LM75_REG_CONF,
-				  clr_mask | LM75_SHUTDOWN, set_mask);
+				  clr_mask | set_mask | LM75_SHUTDOWN, set_mask);
 }
=20
 static irqreturn_t lm75_alarm_handler(int irq, void *private)
=2D-=20
2.54.0

