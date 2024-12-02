Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6681C6F56
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Dec 2024 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733140738; cv=none; b=dzpBxf/uRnOvjCuDW39IEgVRdLMDc/zal6JzxA3xC6lRWrObZn9KIkPAokc6GsJvld/vq7FHnITinHNH2w5yTWz9vXp4N6h0/a1Gmi8rKoY3TOI79XbZeQOc0P6sjje3sDdjBfjuJbJbkLN/065d+LGgbu6TUXR4vVYXXIDMQZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733140738; c=relaxed/simple;
	bh=Y1wnQbejQQ/6YmqlfIpR2bl+Mr9SccFHgD+psW+kwLI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OvChMKVkNtLL9beb3L0F2nNZ88y+rlkfUSSJ+tbxLXSyAQ0KRlNXYJgZhKHcKO9EQ5fI8sjOF9LikVjz8V4nKUDrLXmer6Tt8BvAETwxSIh8H+kPYlO0M2HbyxPRDY1aiUYXW+kZqJOhQmPbVV3diocFAKpd/sAtxbWpG3jjeo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=hM2wP2YC; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="hM2wP2YC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1733140716; x=1733745516; i=wahrenst@gmx.net;
	bh=E6Vj0hCbBvBxMgPqXY6HmGEIry+Qf9KZ1ErjboCvYyM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hM2wP2YCS9ZzJAm6iiqC2tpsWb/Nt5ZJoWFBwYs1wvFax0jfelLxVZcrOH4e1w76
	 e7Z6crOPqQhE/RO4x6nUfs1y/gCbhTT/I1hAFTFuNnjnrDU2C6/XuDEz4XdH4HYRT
	 E+SHbddYh4ECT/GTPI6n22/OG2yNjh1qUzo+L224QaY22rTE40mRSPvxYPr1v7a7y
	 A7+pRDLM89nR60eJq04EFm4Q7/auOAOktBKnChlQIr1NSYrnYPNdHuUzipfeg6E1y
	 aVOUT7pfbb0uX+IbcSPXahKY9mEd7i9paZC86qEZGOsgbLveWsWY3Z7bl+AGZK9PX
	 0Cjy26QosPN0nJYw2w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4b1o-1tHXNC2Nyo-00ERHx; Mon, 02
 Dec 2024 12:58:36 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-hwmon@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] hwmon: raspberrypi: add PM suspend/resume support
Date: Mon,  2 Dec 2024 12:58:32 +0100
Message-Id: <20241202115832.33628-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4rcELiEtzF/R0LBcJKhDhLIB6nDD43PeR6s7NT2YUxnyohPiISn
 okAAPJ512tDaRSIWkz3EYvcohXjXQ7wI/9fVCtzapwlRKvWvrN/v9MH0gX2YfsYyFCMeBFf
 Ab7jwQ7XztCDW/xmWglu/Vac+8dytBshaP5T/0RVNEOil1e4m5TuDs+VArORtG2bFlnZBtG
 La0js/SfHZMw/b6qtljxg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:i4alPr9HwcA=;V0F5HEyJvk6bRqy7s8ING59aUTI
 JwItXAQ8LzeEQ3/AOzx34X7DMz9bW9LmrNePCsYJw5zupgAUg5uo5ldOQYZTUcElFhTptL3Ip
 h+lmf281F68lF1yMpNJ5G+3+wByRVvdDeqPXm9xc0qJfobdG53JqoFfwY2B32nQvzWDJL1+6r
 3rW96nyt67OQPugJUOoH8uZiov/x/gJTZ7ilqyGB3yfbQAY9gF3DYvMSFQypVwCBRQ122fz7l
 h8DypcsaGC968uRYcet3Op7ADe0Zrs4Ya99NyflGIwMQLqJnSx4FWzI9y7iolJ5Hh33tWA/fU
 44seauBuae2HqdDv0ZbsdSgFeQiegdMnhzOMonTWwdjo/cAV+kZBQgiTabgfF68gklq1a9eBD
 jkGiL5KLztknxutjTxrwdItClt/H5PprZ0rHAZewNiB/Ehn7QoSeBl/HPEMAZLvLrwZTjF9IU
 9xrIAcFwA26jDAbk9AoLdYE/EhWsYlSNq5I5KjejyzmXazlbd0nooQ4Ys+PGnd82OVPSdZ3I7
 RM8wSev/loQd1iZGVtFwRgoKRlHDjiiNhnL4Rg4c8YtTc297mV2XjlzQ3bbOHsDVnV9PCFiZG
 KBw4ZsKxkbcn5h34nXT845XwV9Yrn3iINgI0aWpiOEK29aw5JfENCQIXfcoVK8KhOI61OCnMZ
 s0NS6DfeaWUczLZ4WAqDn5irZnbcSrm2XC63hI1O9DGZy8n2+NzBgrLswOZ9j/r9zEY5J7KX3
 DQkYei21wf+OGIeNKmfNN8ZdKkQ5lJbkHiYNGzLnsj7+ZpPQDq0wpJve8fEWVr5VIX0am9yJm
 z3NSLYeg1HBAq2zhHUsCxpzO8JYDMcTxGzSh75WTiS4OgQZzNnxRCMjXoyVcLIMQnVuLgT5U3
 qZD9yGC+iJh+Tu+TrYA2do0yiKiflX/+soE/+XzYIsGQOUUehQKRykdu+3i4JCjV6e4CfuH39
 gUjbrJS4e7Ss2+KJn+LMmxbl5UQ4TwlvdyFyKu5A8qidh9yq2LSM6MbmrEPrSTRWlueg21/U7
 5HKpFzDsgt6Gp+G+sqXuIudZ7llW1ydPpODID0TBYmb9WpkftQr2klqSCE59/vu+vQCEPDIFH
 yXiQrTKUpN7aC3vrfO0MIvloW4TqgP

Add suspend/resume handler in order to stop firmware polling
during s2idle. This was just waking-up the system without a real
benefit.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/hwmon/raspberrypi-hwmon.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi=
-hwmon.c
index 10ef1e1f9458..a2938881ccd2 100644
=2D-- a/drivers/hwmon/raspberrypi-hwmon.c
+++ b/drivers/hwmon/raspberrypi-hwmon.c
@@ -128,10 +128,32 @@ static int rpi_hwmon_probe(struct platform_device *p=
dev)
 	return 0;
 }

+static int rpi_hwmon_suspend(struct device *dev)
+{
+	struct rpi_hwmon_data *data =3D dev_get_drvdata(dev);
+
+	cancel_delayed_work_sync(&data->get_values_poll_work);
+
+	return 0;
+}
+
+static int rpi_hwmon_resume(struct device *dev)
+{
+	struct rpi_hwmon_data *data =3D dev_get_drvdata(dev);
+
+	get_values_poll(&data->get_values_poll_work.work);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(rpi_hwmon_pm_ops, rpi_hwmon_suspend,
+				rpi_hwmon_resume);
+
 static struct platform_driver rpi_hwmon_driver =3D {
 	.probe =3D rpi_hwmon_probe,
 	.driver =3D {
 		.name =3D "raspberrypi-hwmon",
+		.pm =3D pm_ptr(&rpi_hwmon_pm_ops),
 	},
 };
 module_platform_driver(rpi_hwmon_driver);
=2D-
2.34.1

