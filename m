Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B49930674C;
	Sun, 30 Aug 2026 23:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788131451; cv=none; b=ksszBCUhw7r+h99aH658OW5a0W1Y2CfNcPH34/BEXrCoToyIdKar6PU4OV71wWdbAfG3a2xWE9NbpJXXfhSRML+zXOvo4vpIwisFaHSYdiQkL57zX/ELMmQfu/TmToix2r6ggpThvHrgpjlgzxbJdph2ROfrq8MKHc+eaMjewpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788131451; c=relaxed/simple;
	bh=OaSoxd7hPhZfCMoQILKtVbQ9kvLNoIpDYbHoBrV7hkU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gs532Sf3dvJGPvVqynDk5JAmnPQOJhaflxGg2cCaqkMXLrNPMuQ6WT10bHeJbWwyTPbilVRE1eGdiLPFdFsrfekRIYf+L+aPXR5exwsHJI+z8quV220h8aswnNJVdfW0tc5q9t/IZquXlPLROBS7mHyjBecLmwY1nbJh0KwFock=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=algW4sx0; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="algW4sx0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788131447; x=1788736247; i=w_armin@gmx.de;
	bh=TX6ryr4d4G1v5Am+vQW/E1zqQ/9vx30LUjP509ndCR4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=algW4sx0ukTpBftDlrx8cVmyhSYLGITE1R4eI1iDXfgY8hePAeg6p2YCMAIqFxj1
	 vb6XSE1QIu4JEHdLtF1RrEjpdWYacbW4zKTDzBlfcnFYGWFyQ3Bvs0lUtMioBJLHT
	 opHR3GH5pP1oAKWHaw5XIR/OScPUVkyMpanIU+oy+OieP0J3oMq6cychVBToMg9Ik
	 ObwhxmKVDb5sts0gJzYmJ+i+A9eVuSTHhdbMtVwGmDm2E5CFKXHUPV6xvPADOur2s
	 0PhNQFqPFtePhF1bXwvTJTODXtIGNvRdXms1iUQZgnvMg9JnebV49o7wo/yMAFupl
	 nWhkHaW+6DEVJpWjnw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZktZ-1xMZ2O0T8J-00UFEB; Mon, 31
 Aug 2026 01:10:47 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ggirouard@bungeetaco.com
Subject: [PATCH] hwmon: (spd5118) Select page 0 unconditionally during probe
Date: Mon, 31 Aug 2026 01:10:36 +0200
Message-Id: <20260830231036.203719-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uGIPr4jmQn/SFlg/IvqLpEmEwAEbr6yNvw6pn2myqkCcdDe2n6f
 zDQ5OMmPMJr52Y43yszKbBmo0WK2eDNQnvY4DVnweAmG7kuBg1UF80y1MT1wL6p7bTpoPnw
 YHr99xDx1RUNJo56j9b5WsG3ZIaoU4TUwiKJbBBSeX77QHDkmIefpV3oDpX6CYdFsVjpfrw
 4+myjPVEOcjUb0PyLkz6g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rIkiv2O/h+Q=;gx870ocYLkB6xWvfZfux7yxOgxM
 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
 ZhZ8sbKVB2Q=

Some Intel i2c controllers can be configured by the BIOS to reject
writes to the SPD device. This often causes problems when the register
page needs to be changed, usually during resume.

Avoid probing on affected devices by unconditionally selecting page 0
by writing the SPD5118_REG_I2C_LEGACY_MODE register during probe.
This will fail on affected controllers and thus prevent the driver
from probing.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/spd5118.c | 57 ++++++++++++++++-------------------------
 1 file changed, 22 insertions(+), 35 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 9724cf70b61d..65a0d5852ce8 100644
=2D-- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -637,45 +637,32 @@ static int spd5118_i2c_init(struct i2c_client *clien=
t)
 				     I2C_FUNC_SMBUS_WORD_DATA))
 		return -ENODEV;
=20
-	regval =3D i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
-	if (regval < 0 || (regval && regval !=3D 0x5118))
-		return -ENODEV;
-
 	/*
-	 * If the device type registers return 0, it is possible that the chip
-	 * has a non-zero page selected and takes the specification literally,
+	 * We must first select page 0 to ensure that we can reliably read
+	 * the volatile registers on chips that take the specification literally=
,
 	 * i.e. disables access to volatile registers besides the page register
 	 * if the page is not 0. The Renesas/ITD SPD5118 Hub Controller is known
-	 * to show this behavior. Try to identify such chips.
+	 * to show this behavior.
+	 *
+	 * We must also perform an unconditional register write to detect if
+	 * the i2c controller blocks write accesses to the SPD device. Some Inte=
l
+	 * controllers might be configured by the BIOS to do this.
 	 */
-	if (!regval) {
-		/* Vendor ID registers must also be 0 */
-		regval =3D i2c_smbus_read_word_data(client, SPD5118_REG_VENDOR);
-		if (regval)
-			return -ENODEV;
-
-		/* The selected page in MR11 must not be 0 */
-		mode =3D i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
-		if (mode < 0 || (mode & ~SPD5118_LEGACY_MODE_MASK) ||
-		    !(mode & SPD5118_LEGACY_PAGE_MASK))
-			return -ENODEV;
-
-		err =3D i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE,
-						mode & SPD5118_LEGACY_MODE_ADDR);
-		if (err)
-			return -ENODEV;
-
-		/*
-		 * If the device type registers are still bad after selecting
-		 * page 0, this is not a SPD5118 device. Restore original
-		 * legacy mode register value and abort.
-		 */
-		regval =3D i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
-		if (regval !=3D 0x5118) {
-			i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, mode);
-			return -ENODEV;
-		}
-	}
+	mode =3D i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
+	if (mode < 0)
+		return mode;
+
+	err =3D i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE,
+					mode & SPD5118_LEGACY_MODE_ADDR);
+	if (err < 0)
+		return err;
+
+	regval =3D i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
+	if (regval < 0)
+		return regval;
+
+	if (regval !=3D 0x5118)
+		return -ENODEV;
=20
 	/* We are reasonably sure that this is really a SPD5118 hub controller *=
/
 	return 0;
=2D-=20
2.39.5

