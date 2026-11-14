Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673751;
	b=pZrh1JK98oMROyvCmBDrxV0opXB4dDg18a84Pl5tuezuQiUnpD7jFcbor/ShgxV5cwj5
	 CeUbxu6FJ8LH4zbkXYJFkBXqZvfnspQfqq68lR1EgIxxwsLcgiNMralBac/Z76MLKq2w0
	 QgOv1XKzAAOW2pXPGvF9Mj+gac2KbndHk9ZHXPL37YuPsCcUS/IMLkD4SSzVfsWdYP+ip
	 z/1DFo9FhUiU8k8O8tACA0PKY7/EfbpFamFfaFiY3QXESXJQOspgi2vMt9BuwaiXGk6Em
	 zOvTyNNEa7ZW7DOmelThFMm+7lmUohjo3Vp5j+uJco2KfDm3CRtGtrukkJvavlMzzjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673751;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Content-Language:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=AcPZdHRdSNsPahoZF47dsbH78l7FWuZxfz//QqM7BiE=;
	b=XJzejuGgtIvSqLDOUo4zHXuCARi4pOFwunABLKwmx1GVTf1d3pbfxa+VFzfglIiyWqMD
	 fmvQD2DWaZIs9yH1vdfXwLY50tcyBJeWPhRB2qOP36zcvCsGZNxmgkd4GOY3vRbApYDTq
	 5SaHKjUIqtit/uW+Cu0tdL5uOLf7WbMxE3wJGtks3xCFtiz49oTiVkDJMT2yMFqjp83aJ
	 6Ov/KNLXnOFJkU6xPa6a9QdBgZTyLUQLoB5MWh+oZ8W24xyz3lVtcVb0m3MxPxhe+5YHz
	 uXBReGIPs2vv3NXlh3JpdtBjZ70k4dkOQmSy/D2z7l8h4mA0I8ClMCrH92tYvelK2YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=bBafYCOL;
	arc=none smtp.remote-ip=212.227.17.11
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7218606A323
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 16:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7218606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=bBafYCOL
DKIM2-Signature:  i=1; m=1; t=1794673749;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZz4=;
 d=web.de;
 s=s29768273:rsa-sha256:TnlE7oz0wrcLEAFl63NpI0Kd5DKB
   2dHhllcJjbhXwWrjxP1Ap4dxgs6zLR3Y59kurJa/JlEGRIOkIeoRuKD9asZ6KyUxYaceyYv2OgJ
   n+p9GtElRpYFoqW+ZA/wuGYPW6u8agO9ipYjrIxliU7EsOCNfy3vHG8tPkYbhN/DCbhcWSBbcqE
   o0P/kLp2pRAm/kUnDOBnzFxBpkGbQzwIzAJq5TGqqGwhfTwxQn4ajQp5RasHvoDarqr5vHF373i
   RLfE3cL4ZtjddY/u0NlL74eDw7I4dUKmrwC7VESrVQn0nSOpaXF0bqtAt611wEQcVYg5emHz/gy
   IRih1/oIpjA1wA==;
Message-Instance:  m=1;
 h=sha256:
   LmZJPrMpy+1Cb3iUbcjNwR52GKcJtrcYdk/mcngl/nU=:
   PDy4DKtgXQr5TwZ4DuYRHtSIuKhXnqHzeanv1sSzNBc=,
  sha512:
   qlMBq08OZ4oYBm3K0p2TnZDUgY5iO/Vb+sHZiwh3Yyvto2Z92Bu7HQxdFf1TXTViTl9dJBeaf4JoVPWix/QGMg==:
   x4vAremxFZ9qbjCjk0gISaOW+iyt5r9vFTdeGjVlfoqTPzYa85LQuC2UMUnSoFJ953Vdb3J/QnnTBxv2FlarZQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1794673705; x=1795278505; i=markus.elfring@web.de;
	bh=AcPZdHRdSNsPahoZF47dsbH78l7FWuZxfz//QqM7BiE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bBafYCOLWc7Ht3/Ds6IebAlG70CcFwcoqu1ghf8A0+B4ofAmmhAiXYzyO3838mUy
	 wgG/MaFqvFsW73gSg62CVqqXYeWxUjD16JWdbwabUReK6NwjF5EM7aHZSnMywUsEA
	 YyaaMYMq50e1aq8SITJ2kXJEkXeTpCIuw6Z85KQj93UZ6M1iAZB1FRtvDbEmvtrCl
	 vaUO9bM9b+y2+CJ3STVThuasSoATHeakDMxryFyqIfWr+0nMwGoLEcndRMG8q0l6e
	 bhM/J9rf0ueFr/uiMvFrh50b25G0HFQMWFD1s2zAZut+/fuh1cqXE4Jsl+n74n2M/
	 4JlufIjQyPcmBsajog==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MdwNg-1wua1X0ab0-00aMcG; Sat, 14
 Nov 2026 17:28:25 +0100
Message-ID: <bbbc7228-cf98-437d-b240-ad29ee7fb4ac@web.de>
Date: Sat, 14 Nov 2026 17:28:19 +0100
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-aspeed@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Billy Tsai <billy_tsai@aspeedtech.com>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?=
 <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>, Ryan Chen
 <ryan_chen@aspeedtech.com>, Tan Siewert <tan.siewert@9elements.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Felix Gu <ustc.gu@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] hwmon: (aspeed-g6-pwm-tach) Use
 devm_reset_control_get_exclusive_deasserted() in aspeed_pwm_tach_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1pT97BuWi454FNKaCo2ZE4Bc56WgZ5gBMlF9gSjUzfe+zn4fDt/
 e2A7Xxvn5powU/en6gXeySeZEG2NmB/g42UDu6jUE+nVYsLteujMe5ET5ETNJkp/BVu9ZD/
 Vb9etjAtlILvUP/cD70xF+ZnU/a0NQYUXwHv8+kJJ6RQbZixWqKZriVLDhNZYyg42elOiiy
 BmpyAO3RXbYTSEYgnZkIQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uAtSn12W8Po=;Sk064MOoP4g3u8dTl3sxBouLnU0
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 14 Nov 2026 17:11:34 +0100

Use devm_reset_control_get_exclusive_deasserted() to replace the
explicit reset acquisition, deassertion, and cleanup action registered
with devm_add_action_or_reset().
Simplify reset handling and remove the custom reset assertion callback
while preserving reset assertion during cleanup.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/hwmon/aspeed-g6-pwm-tach.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/hwmon/aspeed-g6-pwm-tach.c b/drivers/hwmon/aspeed-g6-=
pwm-tach.c
index f07c9a036b69..a26a0d48dde7 100644
=2D-- a/drivers/hwmon/aspeed-g6-pwm-tach.c
+++ b/drivers/hwmon/aspeed-g6-pwm-tach.c
@@ -448,13 +448,6 @@ static int aspeed_create_fan_monitor(struct device *d=
ev,
 	return 0;
 }
=20
-static void aspeed_pwm_tach_reset_assert(void *data)
-{
-	struct reset_control *rst =3D data;
-
-	reset_control_assert(rst);
-}
-
 static int aspeed_pwm_tach_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev, *hwmon;
@@ -475,19 +468,10 @@ static int aspeed_pwm_tach_probe(struct platform_dev=
ice *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->clk),
 				     "Couldn't get clock\n");
 	priv->clk_rate =3D clk_get_rate(priv->clk);
-	priv->reset =3D devm_reset_control_get_exclusive(dev, NULL);
+	priv->reset =3D devm_reset_control_get_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(priv->reset))
 		return dev_err_probe(dev, PTR_ERR(priv->reset),
-				     "Couldn't get reset control\n");
-
-	ret =3D reset_control_deassert(priv->reset);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Couldn't deassert reset control\n");
-	ret =3D devm_add_action_or_reset(dev, aspeed_pwm_tach_reset_assert,
-				       priv->reset);
-	if (ret)
-		return ret;
+				     "failed to get and deassert reset\n");
=20
 	chip =3D devm_pwmchip_alloc(dev, PWM_ASPEED_NR_PWMS, 0);
 	if (IS_ERR(chip))
=2D-=20
2.56.0

