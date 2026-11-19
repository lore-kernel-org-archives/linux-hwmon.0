Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117311;
	b=3rHGPosu6CUBTxYZVOCbSWeCTBlhV/5S9+9bmTzuG29Wt8eaasKlOcPwxDHqxcSqLnGi
	 zqb0kNpLMBcPEZMIE5/6ttqUPkJa5c/Ckx2wzyqT8In2fzlTDaULNO/R8f4zJP0qhQIaF
	 JHewDZbOusyGL4OPLPVfVuqjjvQ7rRNqWtjiP+xVSFY3XEiijM8oqoF2a0zoTQ7Y01j8T
	 3Km8wNzCOEFwOnrLIJfpqzOqJLRliN1wkaHtKn9Wn6K3/10FnSsIG5dOuScSE7TI2f2OW
	 V97JBSrDjE5d1uAe5wk0MXlrug5KD2qnGiCRwK6S2f2Kac673EK/ac5ko+jx0mkr0IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
	b=RT20nElB3cF/9RzatZoFSkDJ671bqC15Rfj76VrF2GNAvTPUOTcqkA4CcLvX7U/53uKQ
	 v1syk5CcuCQV592antNttn4/1tqqZFLg4vX1ozkxL5E2NdIRAJrl7b6cZvALsZDoNCETJ
	 PYkUbbpzxbhuLd/pqMZt6VO6v4lo360EJrY+8wAL6ca3m+bDM3Yfmqbd+c2RF+9Q99/o+
	 FcXGp4WMDpS+lEMMEmXlWCOT/GZn/jwoWiIVtkReE4uQ9qnNq4IBqczWtSgMbX2m7SX4L
	 KnxbQpes8KDAYmUQ7jGGb+BtGJbDbuKaQBhWmqkogPzetoh2OcdkmsP6QBosskJ/dWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pggkvc43;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943AE606A336
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 19:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 943AE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pggkvc43
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so34516f8f.2
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 11:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795117310; x=1795722110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=Pggkvc43bdzFxBdBLrMha7tax1IJw4WFhDv8r0c2/fSngg5OX8dXy6DEu1LNip3Mm9
         O+izM5BTYiR0AzgXkE+3awXmyVbTCw1sjE+YBsrqs2SPPwsdQi6RJVHtcnQdddl5UH8h
         E4YLX1BLrt/QNfK4yGvBWucm8SaueRx6/dGUnnEJhQZHudqKA0j05EWDgcwR+dIJPXhH
         1eCmhXHCPSxIiYibany++bRdE4Vn846DoxCzaf5JjUrp93hBAVA9h/IeHOcgz4Yg58t7
         oJiJ5b7PvGg41avCu+yP2KmXjlFqmmCJiX7py/PNAArqDI26mgMFEAoyO4bssiADKP8c
         UQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795117310; x=1795722110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=xnN0wk63cVrZRpkCwDaCJ/Gkh73ENpPYf69jYT82sKvJCWN3d+Be9JJibyKELbVGr4
         cVNRVaq5CnGoYT64xUvOnJpKdcUsfDsYp7QAAuTKIPEGqNCVgV/bkElPLa4SWv48C0uH
         G8ZiGWmaKrVJjeahAQGw5inlGUpH26GAQ3Xf/sOkCFcTmq2p82W80G5bRn30rCwT1Ge7
         6Jjj7aZOg7Tqjw1n/8E2GJEhreoyrwse3+/9osDs/5XAKH+gYIx1Nhprhw+Jbtyfno6h
         L3GSUBGL8OAsOkX04QButyGSMgh/1QfN9KvnO0Hllwp468yQYDSiWyzSxmKWpf7N1Hgz
         G95Q==
X-Forwarded-Encrypted: i=1; AL+hErFyZE4A+CKrdZy1X3oZC6jI5q6EeYpl9Vl3C3KSssAExo7xfQCGbpFyQdr+hMhJZqHFvm1MfaQRS+/LCQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z97V7jqq7cTdbW6YReh+HOJrDzvFE9DDJIpZ9OSyvrliBiSsLlM
	Ts0lmJwGz4j+JDNKTpjpgfU1WpPu1hmHqXGYRi++MRNAgnBnvvqnJRmk
X-Gm-Gg: AZFdTZfvV6DgTLBJhPMx2KXW4WrZFMrh9vF1C1ducyoa1SLTrbNJoRuuK5hycF35CNR
	wt8XicKp3AWNbfM8P3qfaC94mpm5wjF7Jz3UAVM7dXOxBJ3FOL1xMuuWRBDAUwJg2lLWOmVvE9p
	nwsINEmGrWGdfzCm1Rq4iDXlXYuBM9qKdAGnk+okjMll6nocPbWorxYk/mefK5BmOj5i6MhY/c7
	ziflYJNyk2n1MC6B0K58kBGAfnA5/jeWqjkQECAESsxD05mUcQ+QKt8ozBwi02jMzHdIgd2qVbP
	HgEwRTcxAthjQLpDQ3k86cmjaf/MnL18j6wopzFxCnbIqfzh6Ffk7ZORwoVF5qqC4qXqJPAqxd8
	Faoh6u8tmjEC1NfxhiC55pix+qNiU4ddoAZpZ1ggTuYyEyvnbdBeNzlWTpCdr780OhZubV/1QPY
	pjpbl7gSvbp72G3IFAn9HKj9k6jIrFIUG5ZXjBPLMOJ5ogYlfn5YtRoYNnamFJZgyflF+bPVsJU
	W8zq//L7Bk5KDYJhYF+1eR1l6bpMXO8L98kOn9dzDLQE3qMYPYv3+a7gQebDTlHPI+j/pyC5yTV
	Zw+1inDyApptEv1c8WVsWLx+a3POZLEIFXp9k0KGK891qHJgw/MQT2qxYXV2x23Dl/+d4n6J8YE
	uZ3AztoWqypYGotw=
X-Received: by 2002:a05:6000:298e:20b0:488:7496:15b5 with SMTP id ffacd0b85a97d-4abb4c7ab74mr623352f8f.47.1795117310023;
        Thu, 19 Nov 2026 11:41:50 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm1375537f8f.40.2026.11.19.11.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:41:49 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 19 Nov 2026 20:41:47 +0100
Subject: [PATCH v3 2/2] firmware: raspberrypi: Register PMIC hwmon driver
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
Message-Id: <20261119-hwmon-da9091-v3-2-15956035d7b5@gmail.com>
References: <20261119-hwmon-da9091-v3-0-15956035d7b5@gmail.com>
In-Reply-To: <20261119-hwmon-da9091-v3-0-15956035d7b5@gmail.com>
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
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/1D8hT49gcrO0owQ6GAVVxBPc9dALdWiwmeBh
 7wzQUpOUs2JAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9Q/AAKCRB4zXhFDAXI
 Z3F1D/41fT/30zUKBoREaKGpQ6CcwTaTKbaai06qAahviHvMfc1xgx7/Vvi8BZnNW46KjEDjbKJ
 XpK7WKd3to5oCMOOpSotgCU7nSghiSXrsb7res+QxchabwX9sLdnrMU/HqQO/EXcBgaHw6Vf47u
 Ehz/jcyxmiyws6JcpkJ7eiyZvmKtYCzlK22MJ2lBFnEXcC6xEtbyNUOUs2ZcoM/RTjdVNSI62Tn
 UhQ7H9dJZ8O7lBIahrri0MMvoG4RgO0weyHV6CZzsV3+ZvJ+2xSlCq8p+K9R5WMJN05iN/5Pb/w
 EDOEDc/L0zVKbo9/aOMykkBkEngHrnWOxk/V9rcETZ/ijDSdEo7GlOqXzsvV1bBaz1uqkf9shmY
 R+clSeni1rzCcaYATDChIVTeQ0Z8OvsGkSR25Wz4+xW+asFR8gy5pNY+f50vuh6ITQZHSiJ0sQ8
 5bGCFBkfuwBupgwc+ImE2VynI1rvcNcjjrPP5xk5IjRjjSlrcrtl5Y6mX1vm5h8KJO3TysUCRUK
 H5FN971m85rU6Jras20aTRL+OR2gv9mPNee17i8wYIJM2Y3I/BFstsNV/BckMA0yyn/qBKUobjc
 5FUEpfG5R9a6/+wFLeY3vbG9D/ZDWmgWi7gNj2z+87Fv1qObomrOVZq7scAcC8X+6DB5iMtBLfE
 9rMSTdBO3nht9MA==
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

