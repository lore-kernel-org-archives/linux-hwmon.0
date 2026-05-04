Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5418F3DFC98;
	Mon,  4 May 2026 15:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777907440; cv=none; b=K8akBVjQzolNAKZa237EZf0zV7bo25ccWwBmuwWUHQ+sBXZyGqiE33gn8UbQtQpiI09mhULY8EsV89KQhbqzr298i1gDz2ZQ7tVsA/5iuV1CKdbMilQm+Ow7rwmYOpeaz30DWv371KXykB3Ppgz5mkI6M5V72tQmqEcwYeQiex8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777907440; c=relaxed/simple;
	bh=+t/OdoU/zlfVN3qn2FY0PLrHfx7Ma9GpGs39eqhygxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CtBH11CMqN3eUpcPnq0AHFBd/feKlFtnmJUO/i3TFk90q1Lwqyxx1ycthoqNKm/LEUBRRWN4GQTHj+VXZr69Hjeynh2+JYyvTHybRE/KXEGsbo/mHXPHlQ0JBUq3ITWyU16S3lRlsAmnJoQ+eCvLbT2Vn1mq7NnNUJS/gI81ZOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=aRIg5of/; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="aRIg5of/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777907431; x=1778512231;
	i=markus.stockhausen@gmx.de;
	bh=zhqeUmvX59XOFWWvVllud5KJUirdlF1ROWOyXEFRUKs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aRIg5of/5PdCdfudWcWR34tasGAq+18v5MjgW0uAzoY56j8B4yP1vq2bE5nT739G
	 zXsl6+5cQl5c7BLP6MNZ4FrNSoDr+PPVMtSIW2l1OWcYEHppo05YpbNpX8jjuukFJ
	 tvfbwzWvPPQx59r/L7n5yzhFTCV3tpvqzQhUnDrmkb5Z+6Kx7KIrbLGgDuwFu3vF8
	 5aGAHgz7871s/wLlr3BHL1mZ9/nYQYwUAxkDNB9zswLUSZm4OeFpuy7/KF1f2vqpI
	 WnUkJumHaEvqUNuxdx6QtXpc3SylaofMvMVhyFO7FyneCOfLZQkc/BvOel2a+yH/v
	 Vprf1cPhnv7tTheP7A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYvY8-1vp8VT0A1A-00IW1J; Mon, 04
 May 2026 17:10:31 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v3 2/2] hwmon: (lm75) Support active-high alert polarity
Date: Mon,  4 May 2026 17:10:20 +0200
Message-ID: <20260504151020.462342-3-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504151020.462342-1-markus.stockhausen@gmx.de>
References: <20260504151020.462342-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CWT+PJKZR0mTRR5ufMXccvA+/0BmZJMP+JoOHC6RAvCDI2lGWf3
 82VLX/374/Z+/dBSsvUpQznS7DtaW1+HejmenZVEBnYbmf2+H70sWc4lJHnZtw+AB7m0MNy
 kyzTl3qtXKHzDa7itzEa5jSKn0AH9PIx/eK4lI7hvOnmyHK+Kv3Q+RZJ4PMNDlHRRKSxUtz
 Si7r6F01Qnqam/nwsVm4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UW1bH50Iris=;gdlCJm8BCm2KgkIX5sikdGc6Mqb
 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
 Qz8yKQyqKoBDEtjY0XxhaBcNUk607Jkmechs=

LM75 devices supported by this driver support configurable active-high
alert polarity. This is already documented in the devicetree description.
Add support for it to the driver.

Follow documentation and defensively enforce active-low if property is
not set. This avoids possible inconsistencies for future devices with
wrong parametrization. No API breakage as all current devices have
their parameters set to active-low.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--
 drivers/hwmon/lm75.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 8b74cc314196..391e6dfcc6b2 100644
=2D-- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -123,7 +123,9 @@ struct lm75_data {
=20
 static const u8 lm75_sample_set_masks[] =3D { 0 << 5, 1 << 5, 2 << 5, 3 <=
< 5 };
=20
-#define LM75_SAMPLE_CLEAR_MASK	(3 << 5)
+#define LM75_ALERT_POLARITY_HIGH_8_BIT	(BIT(2))
+#define LM75_ALERT_POLARITY_HIGH_16_BIT	(BIT(2) << 8)
+#define LM75_SAMPLE_CLEAR_MASK		(3 << 5)
=20
 /* The structure below stores the configuration values of the supported d=
evices.
  * In case of being supported multiple configurations, the default one mu=
st
@@ -725,6 +727,7 @@ static void lm75_remove(void *data)
 static int lm75_generic_probe(struct device *dev, const char *name,
 			      enum lm75_type kind, int irq, struct regmap *regmap)
 {
+	u16 clr_mask, pol_mask, set_mask;
 	struct device *hwmon_dev;
 	struct lm75_data *data;
 	int status, err;
@@ -762,8 +765,18 @@ static int lm75_generic_probe(struct device *dev, con=
st char *name,
 		return err;
 	data->orig_conf =3D status;
=20
-	err =3D lm75_write_config(data, data->params->set_mask,
-				data->params->clr_mask);
+	/* Enforce polarity active-low (default) or active-high (devicetree) */
+	if (!data->params->config_reg_16bits)
+		pol_mask =3D LM75_ALERT_POLARITY_HIGH_8_BIT;
+	else
+		pol_mask =3D LM75_ALERT_POLARITY_HIGH_16_BIT;
+
+	clr_mask =3D data->params->clr_mask | pol_mask;
+	set_mask =3D data->params->set_mask & ~pol_mask;
+	if (device_property_read_bool(dev, "ti,alert-polarity-active-high"))
+		set_mask |=3D pol_mask;
+
+	err =3D lm75_write_config(data, set_mask, clr_mask);
 	if (err)
 		return err;
=20
=2D-=20
2.54.0

