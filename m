Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AE5219EB;
	Fri,  1 May 2026 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777637162; cv=none; b=NkyUsD+kv8Ss0GM6yStfBxheNxsgIV5MaY1ajVPuhsWZY2TxqUfQJ4aTUnMHhghNhUFqBW2E3ZsIOm6Fe9o+wSpHvXuvKPL5ALTd1EnWNTP9bO2yjeB4E+vkX4at/8rSFblDHwLy0q6MeukaXAbj4mWL6YBntVI6o/4F0eGuphQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777637162; c=relaxed/simple;
	bh=8iyeq+C7Q8QA0E+CwqSZo6ihdpMjHEbJb3Jf3VkPZ4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SsWm7RHaf0AJiET6RQui0Tn56NZwOGtCwMJk2lZUQwHq93kT5Pl1Pp5dAbyrwUyOXhXmS9rFzuFlsUUKmRzlQbaZaxNq41MctrYFAEox+hGrJG8TMGu7nNl8oAUNVPWa2N1GGwt/Sk0x/OvxK5SRhTNIYkUV7p9PwdsJ/MRexx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=S2IyIPcd; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="S2IyIPcd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777637134; x=1778241934;
	i=markus.stockhausen@gmx.de;
	bh=q9mbLlAUpFtH1kJqdTQTllxIdXHS22ESwwmwvkV5uK0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=S2IyIPcdpFrQBVixqz9ioi3CiI6n4ywMfYL2dyumhcGj6gHs0xv3XMEdMSTQsiTa
	 F0iBuE9vHJrmwuLjXZm5wByWcPkFaNwAvhSxpkbULJlyjyXOEY6k+QBnxBLHTaaKK
	 2pf2TYCkSvcTkzLJVH3DlHTOngTqWHhbBm09zXO43C5yVzVrJJcTWYXRrIuPDRkU3
	 2xOI93Dk27AyTLvfIM2NeDRg4tyOG8wCW+Ca4IBrDKtF79Wv8qrMqyi/ZIrPhp0D9
	 SrvG8qzg8cjvljqPCcnZgnOLsNuSgVOCeFZIZRzE+snKzVV0Gufu60nbsxrQqbjcP
	 96X70hz0bHWMwwd7Bw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5mKJ-1vHlcT0tPH-00tEYe; Fri, 01
 May 2026 14:05:34 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH 2/2] hwmon: (lm75) Support active-high alert polarity
Date: Fri,  1 May 2026 14:05:18 +0200
Message-ID: <20260501120518.3085501-3-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501120518.3085501-1-markus.stockhausen@gmx.de>
References: <20260501120518.3085501-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Mo6vqm2jrcjfNhWAqKepqRMqlKkR96r3rzvsH22wmaX1BbF/Be2
 3Bd1PCY00kYRZ+Xzn08bC/6qxpxawK08ZKJq1ExU1QHwkEPv/nf2s9PBBXV3WS2LpLMGm/U
 Qrq+NmqeCkK942zut5WzyfbG9p4MFp0ctk1zdOeTSd6ciy1Egc1M8nq1TFxy9/Eqf7yBaYj
 4pTa6p7SHuVdMVR4zplVw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:74tm0Q9CGGc=;uU+QiTPlhGt5n+qcdfHuamac1Ql
 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
 oY9T1TogZ3q7Oxw==

All chips supported by this driver support configurable active-high
alert polarity. This is already documented in the devicetree description.
Add support for it to the driver.

The default polarity of the devices is 0 (active-low). So there is
no need to change the clear mask. For consistency reasons adapt the
hard-coded configuration value of the AS6200. It is the only device
that defaults to active-high polarity.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--
 drivers/hwmon/lm75.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index f1a1e5b888f6..4b075a7b1cd7 100644
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
@@ -137,7 +139,7 @@ static const struct lm75_params device_params[] =3D {
 	},
 	[as6200] =3D {
 		.config_reg_16bits =3D true,
-		.set_mask =3D 0x94C0,	/* 8 sample/s, 4 CF, positive polarity */
+		.set_mask =3D 0x90C0,	/* 8 sample/s, 4 CF */
 		.default_resolution =3D 12,
 		.default_sample_time =3D 125,
 		.num_sample_times =3D 4,
@@ -728,6 +730,7 @@ static int lm75_generic_probe(struct device *dev, cons=
t char *name,
 	struct device *hwmon_dev;
 	struct lm75_data *data;
 	int status, err;
+	u16 set_mask;
=20
 	data =3D devm_kzalloc(dev, sizeof(struct lm75_data), GFP_KERNEL);
 	if (!data)
@@ -762,8 +765,15 @@ static int lm75_generic_probe(struct device *dev, con=
st char *name,
 		return err;
 	data->orig_conf =3D status;
=20
-	err =3D lm75_write_config(data, data->params->set_mask,
-				data->params->clr_mask);
+	set_mask =3D data->params->set_mask;
+	if (of_property_read_bool(dev->of_node, "lm75,alert-polarity-active-high=
")) {
+		if (!data->params->config_reg_16bits)
+			set_mask |=3D LM75_ALERT_POLARITY_HIGH_8_BIT;
+		else
+			set_mask |=3D LM75_ALERT_POLARITY_HIGH_16_BIT;
+	}
+
+	err =3D lm75_write_config(data, set_mask, data->params->clr_mask);
 	if (err)
 		return err;
=20
=2D-=20
2.54.0

