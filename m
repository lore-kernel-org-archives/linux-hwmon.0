Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8525D2EEE7E;
	Sun, 30 Aug 2026 23:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788132636; cv=none; b=aZ8WwKBRPOaX9KxbdqgjgA+xzpJtcfyZRRSI9Jr0pRPMTIaO5oWZ2kgzE44B5fQnGRQRUwfmYXRVtLeQQeRGN4kX7S07S5PTZ4CVRXeWNsxOOJowXf0/rMXbAjw1QMwTNdu9kSaXBpLZGNvyNEHQAK5YcYaDwwmZx13H4Xp0NjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788132636; c=relaxed/simple;
	bh=nl/C3vJNIMwjl32CzBMjcUuT1enNy0W9uICTQLti610=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nFOzKLyUX0GHGpcaS3tXierQ7B7aKgYF2rEpy63oTx/VSJ4zScVIFy1FafZWveJ+WlTO6+AB0+LNgRIOZn+20ou36qOkiZ946I5Fmp2ETJZc5jkYnUxa0Q7LDWoFFDmfNV9ApY6XKo/GwpEv2oGt3Dob6YpNqGAkPq/C3645MUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ku5h+6B9; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ku5h+6B9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788132615; x=1788737415; i=w_armin@gmx.de;
	bh=YEECwBRv8fS2aHVveVOGNgmVZGlzZYhkcVC5/ihPPKE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ku5h+6B96Ksw7PGmPN/tprWAFHpnPvu3PshWipmq4rT9WR1vny0uvymC5GlwONCK
	 ggcjMCbF4WZpVX0vR8eCkLjmPPMiFZeiq6sv61sXSIrnUK3re4tbqlDdqE+yCQF1a
	 F5qqsFV2pY8zv38N04ZvwmgMRmMQecomcyGd/tgIQ2aLxxP08Ru+quYLPpqwiV+fG
	 tSe0JmVJ3BERY3+dv/kieYxPVGEBlpi3yPngoN14WuW2NdtOHl7XL4yd52biseJJM
	 6SaR88Z8AABR3dByWJs2jrmzpv3z1iMBXf/xuPGQAc5CEWFyYTRXxdqsD4faCtLJu
	 eeRX5nl2SS3xMxrFkQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpDNl-1wXkQy0bwV-00jQcY; Mon, 31
 Aug 2026 01:30:15 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ggirouard@bungeetaco.com
Subject: [PATCH v2] hwmon: (spd5118) Select page 0 unconditionally during probe
Date: Mon, 31 Aug 2026 01:30:09 +0200
Message-Id: <20260830233009.322206-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6yMRq/oelM6SJH4AHXYOPTCal8y1EgIl6mDmU2CTFGIJxy1BNug
 Rco9WwdUYDkYxpKBHfYimUnfyirconNb8pSFPzuKXUmm7ID81yXwVKLpPLDOz499xGjelzw
 u/mhBu01IpiOjzl5fwL7f0ILOevJnpkCxz3HL3pXdN+1JjBJfxRBX+QYIuYHADi10MTn8aK
 kXn/s98sV68NitHPeeBUg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:29JQlO0jiIs=;2nXlYsH5VFhbW3D5D6CSlgBHIJ8
 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

Some Intel i2c controllers can be configured by the BIOS to reject
writes to the SPD device. This often causes problems when the register
page needs to be changed, usually during resume.

Avoid probing on affected devices by unconditionally selecting page 0
by writing the SPD5118_REG_I2C_LEGACY_MODE register during probe.
This will fail on affected controllers and thus prevent the driver
from probing.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
Changes since v1:
- Avoid zeroing reserved bits inside SPD5118_REG_I2C_LEGACY_MODE
=2D--
 drivers/hwmon/spd5118.c | 58 ++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 35 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 9724cf70b61d..95b7cbd2f111 100644
=2D-- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -14,6 +14,7 @@
  * memory modules.
  */
=20
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/bits.h>
 #include <linux/err.h>
@@ -637,45 +638,32 @@ static int spd5118_i2c_init(struct i2c_client *clien=
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
+	FIELD_MODIFY(SPD5118_LEGACY_PAGE_MASK, &mode, 0);
+	err =3D i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, m=
ode);
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

