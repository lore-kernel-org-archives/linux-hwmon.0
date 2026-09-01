Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDFB389105;
	Tue,  1 Sep 2026 20:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292915; cv=none; b=tHWvQ3NoZDD6Socu6UjXzd/OqkmIm+1GT59DN/TCmdvRn6dpwNXHwnnAIqj+qXhaPufMV7LDoCyVYVlJSDlf/PnulhfyyEDal/Mf/DAiwBIzwocoyFfqIgJPZWn8dx6mwlIAroBuukQlB9Smnzqjbfrp5yU2gUPEDL/MjK73nuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292915; c=relaxed/simple;
	bh=IrNTVuc3Xwm73ye9AbwQZcUHIOjUve/Z0ZXt13ujt/w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i2krkOnO986P5Zvcg3Sc0MK9v9NWIZzGwMFMNc8Ynej2j0GXooj2KgsbTpXhoP5kEvQR1BDkaEnR/y1dBtu9JtnrKZWDkpr9xsPpgkU841YFn8wmatSzuEQ1N7VLLVYWemRjlpMB+cFXSEyIkA2EQKqvvTKiU8FOq3qj0gyclUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=kLz32B+q; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="kLz32B+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788292906; x=1788897706; i=w_armin@gmx.de;
	bh=rcfoyWYocKrcnC2FVy3PXmN3moyhfnZ2G/YluKgc7zc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kLz32B+qAGZwvofgkQva1iOFQ15wXQjge5Vl8tIgOU6b6K/qMwGdBxTBFxoBec1X
	 GIXCU3fp8bZOn+0YL59H4h+Zfq1q4mGy3F+UCVshD/ckbjoovyu+Vod11DPXOWg2f
	 bED4XPbvaJNcTdt/5GFKzamhyJKipRae1eqEgXJCWfXb4uHpknxBJh0nTEnEMrAqM
	 9ntuIelCgF44u1upkhBF7A8Q+UfVuENHyA3/5XUYrlEIeLaxtJ7j731lbrfJtPV+9
	 FUTzgbc73q9SlSQN9Wzrb0TYXwEQxZqimJiGDisJZYlstzEoaVbTbgQP8HqwCiYFv
	 bitoz2lSfMOFgcPJ5g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N95e9-1wmYHt2Z1z-012qIP; Tue, 01
 Sep 2026 22:01:46 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ggirouard@bungeetaco.com
Subject: [PATCH v4 1/2] hwmon: (spd5118) Select page 0 unconditionally during probe
Date: Tue,  1 Sep 2026 22:01:41 +0200
Message-Id: <20260901200142.495319-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o7rsZvIKAf1+eufZbEoRvtvjvHKe5XcxHcYOiB5qKQQeNlE0AzA
 0EozdW9Xmm2NgJhxdeXro2IBGqFPTVWmEJJFfAQCzXhLJM3F26TMGQVqQZKjEuRqqe9Wzzq
 Nu9kvXItwGYFIFlKr2EaPYmSy4LtmKLeCICh0feU0FsPC85HO9xpP49NDyGVdWZn0ZAP4+c
 1DnHslK82ZZyUbQYh83Cg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3dkni/BFhUc=;6hqR47N93/JpdrQSqQXLaGYPclc
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
Changes since v3:
- return early on obviously unsupported devices

Changes since v2:
- restore original register content if i2c init fails

Changes since v1:
- Avoid zeroing reserved bits inside SPD5118_REG_I2C_LEGACY_MODE
=2D--
 drivers/hwmon/spd5118.c | 65 +++++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 31 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 9724cf70b61d..f79b46085ecc 100644
=2D-- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -637,44 +637,47 @@ static int spd5118_i2c_init(struct i2c_client *clien=
t)
 				     I2C_FUNC_SMBUS_WORD_DATA))
 		return -ENODEV;
=20
+	/* Early check to avoid obviously unsupported I2C devices */
 	regval =3D i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
-	if (regval < 0 || (regval && regval !=3D 0x5118))
+	if (regval < 0)
+		return regval;
+
+	/*
+	 * Some SPD5118 devices report 0x0 when page 0 is not selected,
+	 * so we only fail here if the register value is not 0x0 or 0x5118.
+	 */
+	if (regval && regval !=3D 0x5118)
 		return -ENODEV;
=20
 	/*
-	 * If the device type registers return 0, it is possible that the chip
-	 * has a non-zero page selected and takes the specification literally,
+	 * We must select page 0 to ensure that we can reliably read the volatil=
e
+	 * registers on chips that take the specification literally,
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
+	mode =3D i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
+	if (mode < 0)
+		return mode;
+
+	err =3D i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE,
+					mode & ~SPD5118_LEGACY_PAGE_MASK);
+	if (err < 0)
+		return err;
+
+	/* We only need to access SPD5118_REG_TYPE again if regval was 0x0 */
+	if (regval =3D=3D 0x5118)
+		return 0;
+
+	regval =3D i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
+	if (regval !=3D 0x5118) {
+		/* Restore original register content */
+		i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, mode);
+		return -ENODEV;
 	}
=20
 	/* We are reasonably sure that this is really a SPD5118 hub controller *=
/
=2D-=20
2.39.5

