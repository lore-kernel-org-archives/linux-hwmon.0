Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E094562A1;
	Tue,  1 Sep 2026 20:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788292915; cv=none; b=aIXvqYW68lUHh2LJh1SFavpIFwfL37s210IKJTmszuk5qsSYs8Fg8k+dhEH8pI4QZWKh/cqHPNhTUhbMPzEf76psnwfaolsvTG9SHYWQJ3BMw6oxSsi9zS1Ouzz5DkghQk904rYwzVD88BoBteCtoAT/3sTzTngbKK26lbyIgxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788292915; c=relaxed/simple;
	bh=T5MpDNlKzENyz2i70Bw+rZ3Pq/wFlxGRyClzlJB4kCA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BK15ZB1fWubQwHGZJ2P1TakD38avmnhggAnH45sk+lhuSSxkiUV4sVCfZRftuYDD8cFx9MvJbvKx1ZXEOejnfeWr80MW6bVgIbd9jUvHadBAwoEab82u9ABBA7SMdKteJZozthK3jFKGx5P+ddKy9qaEbDLmdWudOYMJHRH+aDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=G5xGHRDc; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="G5xGHRDc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788292907; x=1788897707; i=w_armin@gmx.de;
	bh=gGp3NcslhyZ0CsKFHQpEiK4xdwx7NHLTG9R03WQyxaY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=G5xGHRDc+h68cZVsNMBWuuqEYTj/wmnB1oMPqnCR8hgfSnWtAKXVvjLfUemtTw0O
	 ICM2pNaQOWFX0T1WttTZFuSAhFKDCSZnWTHjdlzh3XSr5N/y8E7g4eWzfVXuTRQBA
	 w7x1LPFP0Ml6xlpiLE6dsfPpDe84US3bUcWWKIE7VPv9jo7IZQTIOz1hWVNF4Fyyi
	 bKsf9PIOCMuWI6716KTATDzIqiC7Pxmj4Rs6+kndtpzOIL7wktHZnulSPKeRmFjqJ
	 CWxOr3r6zwb/hvwDLe3UQj2qrkFBsMDvxzcIXfTyvBm3c9jagfZSjmuQ0cGQfU2l3
	 lsCxeQlALe0FD8cXng==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHXFr-1x5bH02Ye9-00EMaJ; Tue, 01
 Sep 2026 22:01:47 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ggirouard@bungeetaco.com
Subject: [PATCH v4 2/2] hwmon: (spd5118) Avoid probing when 16-bit addressing is enabled
Date: Tue,  1 Sep 2026 22:01:42 +0200
Message-Id: <20260901200142.495319-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260901200142.495319-1-W_Armin@gmx.de>
References: <20260901200142.495319-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:i7zJ2uH4irIQdu1truibcdEdrFVfNrbltmSDL1zH71EYcNLv1LN
 rVvsTMO8cECrSDRW0fnOBDRKBdJ7/MywgeRJZzZLBqKLaScsw/fL6eWX9aJlJbwzOXuT9tS
 VMpEub4cuc49ums9fCxuNifMvQusX4fycRvJhIswm8k+P7cy9n8tupYjFjqokHRrhpOhp1K
 L0XqEHkN0VUQsgzGOMlCA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TJ1MxKXv5sk=;Z56FYVv2dh4Z1lUWZ9megGWbXUn
 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

Support for 16-bit addressing was removed when support for i3c
was added to the driver. Switching between 8-bit and 16-bit addressing
might confuse the system firmware, so we are forced to bail out if
16-bit addressing was configured during boot.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
Changes since v3:
- new patch
=2D--
 drivers/hwmon/spd5118.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index f79b46085ecc..52f354489341 100644
=2D-- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -16,6 +16,7 @@
=20
 #include <linux/bitops.h>
 #include <linux/bits.h>
+#include <linux/dev_printk.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/i3c/device.h>
@@ -664,6 +665,13 @@ static int spd5118_i2c_init(struct i2c_client *client=
)
 	if (mode < 0)
 		return mode;
=20
+	/* 16-bit addressing is not supported */
+	if (mode & SPD5118_LEGACY_MODE_ADDR) {
+		dev_notice(&client->dev,
+			   "Unable to access device due to 16-bit addressing being enabled\n")=
;
+		return -ENODEV;
+	}
+
 	err =3D i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE,
 					mode & ~SPD5118_LEGACY_PAGE_MASK);
 	if (err < 0)
=2D-=20
2.39.5

