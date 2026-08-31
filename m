Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5186A376BEF;
	Mon, 31 Aug 2026 19:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788204875; cv=none; b=H1LRIPH5rfGmhquBcWW1Tc14g7w0oZtWdvLmfG75kXgzw/lXenKMkPCUP9vf+4SYbm/0/Id5GHbzLgMRIX847R+w0PS2docKtuyubRsKkzn87xzfydXN8otskxNAQXS6ngXPknBlk5k2g/50KGjevBblDjntefmEfMWrOodAJaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788204875; c=relaxed/simple;
	bh=f6YdncEWQeCtxRhv22tP6ddRK92uvLHL2HIWSmio7FI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A1x85IS8PhpLufYgqe62J0TZzFZVRNWJD3DiM4C7EBCLVnjIAmRVaKLKeu6hJ0jmrUjuVyh1fA5JHcoJKhnZbGT9T6tamObqnXyKMLYwammaSlfaPAEqb2XLoW6DaBmrjKF5orL+BnCKO9G5Rc7RXC19fxnB1LU6T02hqVUcpvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=PsIZVxrk; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="PsIZVxrk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788204869; x=1788809669; i=w_armin@gmx.de;
	bh=l+LFKCxTSIKa+XKfYNemQs7mju/HYZteQEkMv24PhIY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PsIZVxrkW9IJnXFvOkl3WpLY+1dP3tXx4n7GWUglrfdhIAc5/47J4RO3WK6AVvsw
	 UFCpHqg/cgGEIFtCllWSymenOQqUkuSMlZxB5+MZdLJsl6h/4UsTF/18S/dV+wjXb
	 1MMBTkwT1LsSXuHI3E1bnQZlvo0vwc14dQ8SeUG/LgMzcn9OkbvsTDZyS0HGHe4vE
	 y15pyhCmRF+GHDqzdXbtgASTCog1uqF5h4WlYqAZMxJczFP98kpDECU4KS5NOlPoR
	 OE92Kom456ooMDCZ+HwiYFVLv1h4waEmZdW2orDckqEAI8AeSDBy5ticrVXFDV31P
	 zm7C1wBvmh1ZLPweIg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgesG-1wOTdp0NY4-00iZBQ; Mon, 31
 Aug 2026 21:34:29 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ggirouard@bungeetaco.com
Subject: [PATCH v3] hwmon: (spd5118) Select page 0 unconditionally during probe
Date: Mon, 31 Aug 2026 21:34:24 +0200
Message-Id: <20260831193424.95135-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:X7ZWkYDrm/rVUMVbYORQl6kI3Tzi2yigzM2SKKCaKzfiap4AlMj
 Q3vBSv47bX9yh3VZVfBqpU8InCxcoetqDBlNxWduGHHDzBEwk64Hi2K4tnMV723pWK+fVyM
 yg8vYYtKxCoby482UebSQ+oluFTdXfSF+Iyuqz3CXan2PZor+eh/237eDXxzzOxQLFJ73CD
 8jDKre8OoRxWn1qjphN6Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DhrizHZRPMs=;NS5rHD2phCLYrCQrqAqOX4oN96M
 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
 EmKo8sc/Lzs=

Some Intel i2c controllers can be configured by the BIOS to reject
writes to the SPD device. This often causes problems when the register
page needs to be changed, usually during resume.

Avoid probing on affected devices by unconditionally selecting page 0
by writing the SPD5118_REG_I2C_LEGACY_MODE register during probe.
This will fail on affected controllers and thus prevent the driver
from probing.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
Changes since v2:
- restore original register content if i2c init fails

Changes since v1:
- Avoid zeroing reserved bits inside SPD5118_REG_I2C_LEGACY_MODE
=2D--
 drivers/hwmon/spd5118.c | 55 ++++++++++++++++-------------------------
 1 file changed, 21 insertions(+), 34 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 9724cf70b61d..038d9e6e6a73 100644
=2D-- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -637,44 +637,31 @@ static int spd5118_i2c_init(struct i2c_client *clien=
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
+	mode =3D i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
+	if (mode < 0)
+		return mode;
+
+	err =3D i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE,
+					mode & ~SPD5118_LEGACY_PAGE_MASK);
+	if (err < 0)
+		return err;
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

