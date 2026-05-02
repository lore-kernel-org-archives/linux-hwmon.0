Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622482FE04E;
	Sat,  2 May 2026 19:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777748680; cv=none; b=PmyXFCXzEgEs7P06vVZ+Z7aBKQ+nm1k5CFJkb5r7Hiqz8/rZ19o33jY6Zhebsnx82fZNRUHZbNnQOrazv1y4RhPI15auxw87y6C8ICez6zKAspmHTFV0RpNSbZnMri5F8yMfqHMAWYiQb+RCf9s89Dk3FP4QKlnWrgLCpJo98Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777748680; c=relaxed/simple;
	bh=WdQ3Nr2U+VNC5afEpQTOCp0x4OkJQsaKZYvvUkynjLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sTeCEDn5g6i00b6OWJ5t8h2mQ567nn1zQILQYQZy4shnNPdPj2Mgql5pti1icJGQFgd7S9ap/a/bGycnCPux/RnSviq8wvVk2qGq4tJsH1QXrDjdXaXTmfq+xEUYpzhdkZi6GsUwk0L5yo6fxG6AvZDmaeMonFLGYA11PC6CpB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=RnZhE4dn; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="RnZhE4dn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777748659; x=1778353459;
	i=markus.stockhausen@gmx.de;
	bh=u+O1USHjwMYfe/5ouFQD6+4tjfMgp5F9dfGcbi+51EY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RnZhE4dnT9lqP74EK+It7RssMnlVTMamgvAfBKa38b7j6DpqT53H8Rh7nZPZKqWn
	 c83Qd//6hOdMVHS7UrqDuwgX35taJqbD5yEs9T7WuVGsmqxye1ks7HNi0Y5XgLe0r
	 vlPI1PXbX6OUFEzhL/fd/C/vdb3McxTNIfDg9a1zi+GM+G9X8vkd0X1v++kJv8IGY
	 /6oRFcUAef+GlhIlocbxjyUW9sUH78Evoxk3OiU95dkmMZTqOiC5OHPcn1/xewEnl
	 jnWHuh/2yTRItYsgQhHUz14AtBOnwhdXW5PYU6POJKc/Hxyy6Rdn4URj2ClKYMVWM
	 cKwOCrZSRT7kzmK3yw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpDJX-1vXrWG29yZ-00aQB7; Sat, 02
 May 2026 21:04:19 +0200
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
Date: Sat,  2 May 2026 21:04:08 +0200
Message-ID: <20260502190408.3577731-3-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502190408.3577731-1-markus.stockhausen@gmx.de>
References: <20260502190408.3577731-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0IAcZNEwfR1XvFGbeP5aCsROcYNIKHptouHZt+st5gO45r2uX/F
 M08s0P/ajTCjNjTPMEf6VuDqbLJF90CZj1xuGmxmpJTVlGOKxVzfIS67EGG6QIcTSCLK6iO
 HKd8Q6hOYBKf4iuZikPa0TNwQUVCjTJDgShjKWUgMJvbqhE4Q6UOTOpzcTQ8dw3e4EJ3BFq
 Q+8xK5rJZIbbgzLazga/A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bRFObc3cpu0=;S47RJwMS6LB9di2NXn/eOagfPvu
 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
 chYp9kNwEpt8NOIlTzE+kTt+5+Ke3Vzqe7Ss=

LM75 devices supported by this driver support configurable active-high
alert polarity. This is already documented in the devicetree description.
Add support for it to the driver.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--
 drivers/hwmon/lm75.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 8b74cc314196..9542f04e215e 100644
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
+	if (of_property_read_bool(dev->of_node, "ti,alert-polarity-active-high")=
) {
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

