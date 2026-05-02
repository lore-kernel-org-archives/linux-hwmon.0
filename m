Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90B7353ED9
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 16:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777737961; cv=none; b=e2u6PyQMk5do6NaCsV1FkMytpeZCVzpKjx/LwQzYcedthcOCdR4Q/rmupwRimsK56kmz6JyaYsZ9VBR+sSo6d2iVgAW/i1X0lFgZVs1Ckp23hwsKmsfDBm/OtXtqrGmIziJTW3/K5fxPxot63p/R5nbOti4poawS2M50jtM6AyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777737961; c=relaxed/simple;
	bh=kz0o5Hg1jd/EcbRff+UPuFU8nRkkNW/vqLvA+Obry+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KDwhXr94rc/jXqaBY7m/MLaJZ8MbPKELsx4Y9DHf9L+tNUUXOx0xh+Fd6oD7hIWA+nWwwekMGxaeyOBZLi5jnXLKjdds/M4eoR3QPQb0D/Uh5FnORmoVYI/BCgF864OX7QqXxDRZnIRoLWXYWEUkhWCiIT4f2OpuoKTyQCIWHSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=kcEiApMQ; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="kcEiApMQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777737943; x=1778342743;
	i=markus.stockhausen@gmx.de;
	bh=o9jV84UFJP1amyG0BZeB1LpQg4+zYRHdpF/O2u42Y94=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kcEiApMQImCpdkEgMUCLnPJuq9IGcba98WDSTJcNRa5/nAyCt8RGnm0hqZNkcsMm
	 tR6ub7LKBQxgD/Tff81pb1PJxuVkqCbKOvsQ5XBGPCI4OYwfxRv/57OKywbZojWkP
	 IXNlEbsDajQOy0VzvSEiUmlhBQxqoIUBDro81AVI6NAlvr1vieQN/fULjY0vPFKOr
	 ERy7n5qFFBbma8/GCjYub9i41KoTq8SVqCskOb6tH2tuw3LVQbq/rLUxT5bmxSX8M
	 UqCjFHwd0ZObTt1hlQpmA5nUzuLczp9w0vZoi3ktz/fdkgHwF7rCIT6J5nj/yMdpc
	 EZz5MWH7oB6tNjDHDg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M59GG-1wI6ux3UuK-00HXOr; Sat, 02
 May 2026 18:05:43 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	wsa+renesas@sang-engineering.com,
	alkuor@gmail.com
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v2 2/2] hwmon: (lm75) Fix configuration register writes.
Date: Sat,  2 May 2026 18:05:33 +0200
Message-ID: <20260502160533.3527619-3-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502160533.3527619-1-markus.stockhausen@gmx.de>
References: <20260502160533.3527619-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sDBWu1acXCpD1yc+pW3LyVIp62NPDS5nbrVDputIzzVZTX/T4mt
 6QhhidKR/mTIk0w01VTyCAHQgidEy3Zl6GFW0jhN9SGxTjVRr/BF0qbHZQHrR3vmmLpmWIa
 aLHrb7/SbdWUFuxtt4tuRmXiQeEEUAKQEdwlslGDYGSPqXGPAjNwUWhSbAj6smUnhuhA8Qu
 3wm6osBX8/DRch1lVmESg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xjJGFB+2fN0=;BA6RisYsCbtJlRWlce2E1o1+UzR
 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
 ytG59JtToMr3MWLn8Nmcnzb0mEPjXnuS85cQ=

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
index 724efc0e820a..b8d67a9b58ec 100644
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

