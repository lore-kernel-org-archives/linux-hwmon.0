Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795118137;
	b=dSO5TA0xQeBXuKh4+eWEI+8Mt+51Fe8mpGcq8cn5Vm3jwK98dyNMm50JpNwh/I7NUGtn
	 8eTyhWxJAdDKsCvoX4sMhT5Y/N/MdYobP4buQ+a66mrUluJyRg+cNdU04am/aNjz5x2D+
	 dSfd75rGHVXMmcizZII3+0stmq4M1pSX3AIZJ3i8TAbz26u5UMSs5i6tA05m067aVQxQY
	 IfZqB+1lYhx282c6um9je16JU2C4GjB0yJX3SQKINwXmyFR10hwFTublaNM1uKTJy0OyS
	 VHH2R9iM26Wd0zobn2f3YdicyHCvtULIZS08sBUzHrxIV9e9qBGOSTDaqL/8GAj7y7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
	b=GQqEZCwiTcnvdJLhn890hmWNn+9dwrBAVEDLyAZU+fEsL4JobDiEwF1nV5y6vw5OBW/m
	 BZHm+Q6nMuPd9Ny+oIs+QrRjRyApOJOLfTxFd25O976qSXGDTw/yMG8HA/qAld7aYLsAu
	 Piv3UB08FCs9g31l9OMSfJEwFYHxWQhMfa6F5gJjDyyi8v0K/VwIfEMKIahy1kOKPt1gJ
	 sAy3zwc+lVIbNABQFRdttWGgL5n9qOyfDyOGGd2Ql+zgC7Mkxeig59wmDM0SpnSvXzvhw
	 T+m3v3kuy56pARbQ3cVUhuuoOr8Im515jnt1hIck6nObnurrNad9r/PhgLLZi6c7YrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=awL9SL51;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4132606A330
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 19:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4132606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=awL9SL51
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so40170f8f.3
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 11:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795118135; x=1795722935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=awL9SL51GAF94ZkXOA2QXOfkl6D8oBwv43SYFqN1vMM9CcQo1zA27EcNnQ8ErXm+9b
         +KvbYSFDOwcqKPJFgpTZNqqXGuEEGXh0tuQhtRw2YR8xJBgYFN2m2Vn/k23U0NP6F5ou
         GZXMdZ+X/OrhPq5aCgrMoQlZ/NPbOsoYN/ap1Pq+c7OZgT8bVOG26Tm3cum2LM9s/833
         HyxRevCtklZWrHfuOYhpJIa0Qaw1TIj2yQMkFHBD0vo0t8EGtnGyqxMDRO8JbUemq/Cc
         j2OT3Wqu2twsZrgYKy9Ae6dGak8BtQ+gbGvplCriw5mpLSYrFweu7LW6hnFsPemfytzM
         ICSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795118135; x=1795722935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=O0qLi60XSgKZ/xPlNfyskcinuiQJHAr7/kjQ6gczk95oDXvf0JpbAoO4iGK8wOvzwb
         LO1ZCVi38jEYVZbGjO6vIJNxl2V38jyI5trOzy9x/WihtDp3TZAyfoXQXH7H0tBKdneN
         NGnXtJ6r8i6ygsre0eeyaQkh8+QR/nH9O9Q3ytlXmSA9UcdZJ22iVqYivCaLmzU8ud+S
         BezbKC8R/RnSyLi6HH7Zcs8JzIX5a59AvO5cvXCPyoXjnayf15ETgewolBfvNoyIiD9a
         Xl8nidYB4X6vzoDLifrY+Tc1F+5s7dY9cQ92cyMnTQ8EZGqmwNDOhFThi3znmU9HBLM/
         or+Q==
X-Forwarded-Encrypted: i=1; AL+hErGscFko8HpbIrSv6p6dGoLnLpvWr0boKKBXnH6LbqZVMf7mPLrwn2p93pNhADJp8ajTziMXAhOicMcuYw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8hLcRarY9NjAk1eWycdc6NlN5lvsXTYJS0/9HNJwCkcf5S0h1M
	tGn3EHS4ixqo7RjbqPnVD4/uNIETsktDGN1lAnEQgZZF2yWbD10HApK/9va9Z2RV9Hk=
X-Gm-Gg: AZFdTZeXWhCIwnR5IId21VhwiOi8PcPk3klTtDbJkNcDc8xxfw/cv/2M1Y1wtY2y8Ka
	XyJ4ondS+Ynl8pOSznVq6sbiHYTGRSH9HtuGN+/O3C72Izz+3n6ACDiTvIXcgl9qs2VtoUlGxr1
	WGgt2iXQo52CQnKQdTM6BAW+VoGBKWFN2PWJBTlxHOfMPOA/RWBItzOwCQBVVEE5h7xIso90ifR
	KmQPXnPK6WHPXNQI0pRNpkPrueaEMuMFdTaaDjxk9LaeKxt7XqR2eZaIX9WYa2R/WhkC+cvFRNL
	J0HlreAYts1ajr7w3fvFFz3a2pPXz5IvVNwkfnw3tI0ziPxhdRV3R2n/j9nps1uCu2sTOo6nGz9
	2v/iFHU4MwRuDlIeX0kHnzaj+EwenvnqV5J0xku9/b3i/9umcSoqAnKOEGc7cBBh0sEfwqH31fG
	Sifz//eVq0MBG98Q62edPGk/tOp9c2dzzs49FsLIzV6U+nvG3jw7KbbR9ZKQPeBb5yu00m+cu10
	YUOHrWJ03xaqfGL2H032s0nxIVxf6nf4BpaEleTLDSgv6u/7g/pGMNR7anzRR7huD4r7oYBO6D1
	xJWT6utz1MC4dPmHqR73qlIX6qC6MEwvGH5LWch3oizLop+IGSdkzx/gxprK3Kpl8WcVjrvsN+W
	7FCvMO9MeoSHk1og=
X-Received: by 2002:a05:6000:186e:b0:487:6f2:1a4c with SMTP id ffacd0b85a97d-4abb225ebacmr959607f8f.25.1795118135348;
        Thu, 19 Nov 2026 11:55:35 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm1442434f8f.33.2026.11.19.11.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:55:35 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 19 Nov 2026 20:55:31 +0100
Subject: [PATCH v4 2/2] firmware: raspberrypi: Register PMIC hwmon driver
 on Pi 5
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-hwmon-da9091-v4-2-0d6e345c3666@gmail.com>
References: <20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com>
In-Reply-To: <20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=QX7uRGP2jWG84enlhwxfyWe+s9o7Z32PX6pW6x1r3aU=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/1Q1hSNXDBZPA8BDKMuebBK+XYMMCVqHzsEva
 /o+P2IReHGJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9UNQAKCRB4zXhFDAXI
 Z9geD/0X0ve2bjnBdQk+E5KD5v8e5ClnFtyUX0zNo1Vy1ASx7d+hZGYSZl3S6mrafmpH8PZ9i9c
 ZOnN+f12gku/0Rhd71Acwatt582FJh3m05WnP1WheUOYRvoK0i9dnq/DwqxQluxQ+DxmVaVA7ok
 /xwTa7RTWR5CsphiAWErORUkwGoBqCI17ehfS93G93VV4sk29ikcTh6Ln7S5kBvmY0jyA7k38DR
 160GuhLuZeRwstADN0uNRc94EUUp5mJ6083fCJtYYKiFg+LCdq+6c05J4+u64i9Tbi51cWCVU+9
 3eaGym/X9MjkJGwamT/D51h2vhZsu1Jg2yxUwtZqr2s7J2qbAoE5qij/LahYeeg5EgoQZatQEL4
 j4vneI9qwgBLbmJfT6j4+z7B/Dt4elLYNFYkpUxCkxucmP4J9lnRNNYVJ7jodpnVTB0t5vg/hzk
 QVCz5pBZE2n2K90VyJqqrdue55VXYvEiCTkefeeJmTl1khz118oH9hDUo7fkMuNuFA5oQG6/guf
 qnbmdeumiaS0qyGylJeHOCylE8qgbLy3CZTn3KBHFeUEpRxQ1oYLLxlsx3uQp+2nfVjcFUQzOVI
 9TGMT1Rdf2yRzmW0lFm4ilpppSv4AOwcMUmpLyydPLQkLjKyQdzoKMEIQQwol2ZbH2nYpHiGVWz
 rBTXExGi0YTV0VQ==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Register the raspberrypi-pmic-hwmon platform device
on BCM2712-based Raspberry Pi 5 systems,
including the BCM2712 D0 revision.

Store the registered device in the firmware state
and unregister it during driver removal
to ensure proper resource cleanup.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 68512224e3ce..a694ecc18f9c 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -34,6 +34,7 @@ struct rpi_firmware {
 
 	struct platform_device *hwmon_dev;
 	struct platform_device *clk_dev;
+	struct platform_device *pmic_dev;
 	struct platform_device *rtc_dev;
 };
 
@@ -249,6 +250,23 @@ static void rpi_register_clk_driver(struct device *dev, struct rpi_firmware *fw)
 	fw->clk_dev = pdev;
 }
 
+static void rpi_register_pmic_driver(struct device *dev, struct rpi_firmware *fw)
+{
+	struct platform_device *pdev;
+
+	/* Only present on Pi 5 (bcm2712) */
+	if (!(of_machine_is_compatible("brcm,bcm2712") ||
+	      of_machine_is_compatible("brcm,bcm2712-d0")))
+		return;
+
+	pdev = platform_device_register_data(dev, "raspberrypi-pmic-hwmon",
+					     -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return;
+
+	fw->pmic_dev = pdev;
+}
+
 static void rpi_register_rtc_driver(struct device *dev, struct rpi_firmware *fw)
 {
 	struct platform_device *pdev;
@@ -371,6 +389,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
 	rpi_register_clk_driver(dev, fw);
+	rpi_register_pmic_driver(dev, fw);
 	rpi_register_rtc_driver(dev, fw);
 	rpi_register_reboot_mode(dev, fw);
 
@@ -395,6 +414,8 @@ static void rpi_firmware_remove(struct platform_device *pdev)
 	fw->hwmon_dev = NULL;
 	platform_device_unregister(fw->clk_dev);
 	fw->clk_dev = NULL;
+	platform_device_unregister(fw->pmic_dev);
+	fw->pmic_dev = NULL;
 	platform_device_unregister(fw->rtc_dev);
 	fw->rtc_dev = NULL;
 

-- 
2.56.1

