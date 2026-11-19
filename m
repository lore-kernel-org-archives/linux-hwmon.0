Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115091;
	b=ajklk6DohV2j7iPNTKsO6jWcont9JNqAUXv3a/w2lwN7MP5P6oPCl+OWFMLMxQ4EwQYy
	 r+q1h7KJzbR4E5zhTr9YrQ1kFMtnOUomjhvcDDdzKhaVeC4M99yKontr2NAO8I/T5KJ/T
	 Qr5uXas16B6APXWNUbPMTZTHQ1GHunAFDwWovu6vmJjAH4GuiT6EdGrFz9cLcQnlTk6tO
	 ITbuy6O4jLJMjkM8Ot1zgpK2qv0WTW3LvC1Aw74xbi1Qr1HhNzlROMF0SW0tXTgl6JGd5
	 tZtp/hDPlMkG3897ReV2jj2qgpItoBzSwonRqioXMzRF9fXXK7HzmbL/M61gQNL/R8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
	b=TJSmSjqGtSDlKWoFW6lsz5sPpC9kDFAZzG5j96Qa2MbeRgs0fcj5IbvXBmUJJz/uJxHs
	 YP+vsVCG+fi0JKn3LpsCGeIY5C+GXhrg/CQHHE5CKzTLEvyqZXu9bNpw/13NH0LGVX6CL
	 XaukQJ5T3tlc65qznGEHlsqvI+bgVhNWkimTtHnAnG/mcdCQOmF+1B0ePI5EaNQhxdi4v
	 jLNsOz0VMDN4MNwB5QS+pfNpco7VHJ/dcfSpfSkUnPu/3iTMcgVDVSOYtfz/fNzh8+nv+
	 tAjnK7V9iymsvATv3fR8NjCmfteSC5ILIf9ktojJ2yOPWh7Q6G+P1LUjYlIpS+wt4DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tDcgawAM;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2314860A2607
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 19:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2314860A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tDcgawAM
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso255205e9.3
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 11:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795115088; x=1795719888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=tDcgawAM81feFVf4ZkuBppMquyf88Zs67t1lVp9wL2A+gFtc1LnNYr1QR5JTORZb72
         jgSyxoBZUqutM2zUH8ieWTMWXMAQj+0I09eYJ8I3nAKoUHPibF1rS9gAG8KOcQCrp1hz
         sqBGyTKxiUacbyZvGaeFnGYBkFTvrGd8hblMsEkjwIRJ331ZgF7/1zjc1iBjMaoQWVS/
         9wIzaA7GNZcmNw+mQd99xbchLxJlJBPkitduNqKoRqKuOzSJfyDgNT5KxZtajVcOLkqv
         B9Tevl/fOJ4C4QnPAM/FvRYRth/uRFhRSCDjheABTGdiFfWYxau7BAh3YYJ4V9L88MuN
         wQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115088; x=1795719888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=r1ylk8SooyhLZHe0NVxm37CSZFFsLVyrR/VKvuelIIcxrSijyBA6nq5fLNz4dNaHm3
         SyriiionO/mJkp8eY5kIVDuxcAbSXONuISamdSy4qSEeojMy/7ECX9PK6ZE7+jIYsgJ5
         299VfYMaVf0A8zBpEypSuvEbI9D9LMOUerCMega5aIeCmihb6YCLpW5IJqGZwYWi7HXv
         bu3aUyUZoxs6M6nV56tiumgFOh/71EfTbQnMRrVGJfOVFOtFWNtySdX/H98/BqAO8hBt
         nThRweryEOorDYgmtB+vidsewl9GsXTLXNypzADudsl0WguWFo+Xk9hoeu4pi70kX98V
         uOgQ==
X-Forwarded-Encrypted: i=1; AL+hErFmjK6gN/yUoOCnvYc+XBtNQhq5OQl0mtG19d4Shj5m7qZ1SQQGv6529pWiXk5w5WpQ9UO89WOU1rtJeA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/8gBsiUBxDsenQslatiRobrZEg9X1B3JFu/CikkN01BjJMjh1m
	jb0oHXTm6khWF4a8Ch3dBwRHYvm04Gth5HrswSamnxkvqmxFCGHn4a7r
X-Gm-Gg: AYBFou3V+HPbGwBlYj5ly70+T8x6QFlbNtTPgsOZXFCC7tYQaAdxh8c2DffQUd5llRj
	LULjKT4HovVUgRj/KTnlVbPiPZcEu3BwUXkblAy/ZJHlVYLn1jB0DzEMaGqroTWLmU7MfpvtoCf
	RvCi1iHcyMRb4hWSIeMTKSDbH/3ItjusQYtxB8D8ajJKS1fPypSVXgpNR4pyu/d5vS7cIP87Pt7
	6wAS1tGXBrgtisdBLSgwtqA3QwYdu+jdTTHLLmE1XTIpWbiBpRtdZJfOBa3LCqmcabIzjTPOObI
	WSofMZ2G2Sewkf/ZLD6c/n3LplwOg2uSYuSifzGj8aB6TlC1oXaF4RYWMTkw6jpAdwqU28gM14x
	llQPHM9YnME+8HJRDOjxBW4GMERAddyQgEmTpvgYDIpem/xYrTZTvUx8iYFoAhMCtBamVonOFaU
	RAhmTEFgk+wp7O4pkk6tfEpCeWXSWYxK3kmgwgZrHkUcJ5sPy34ZkIa316Dp5FyoBVZk3n+FIBc
	Tul3i58Klc7L79kLm0K4ceQU/L3EXZslJxsaJEJ0+lqPt7+mqOs+qSRSXdtUnPSd6mEX51MhL9O
	9e2h+XS1RS0Pv0iwIP0J1fGAouLvY6K50uNrO8HkTquqh3XKMeFEy43QHAogndtdtHg/E5KW1aP
	ogt06Ltyr66sZN2+O
X-Received: by 2002:a05:600c:4753:b0:4a1:cfa7:e968 with SMTP id 5b1f17b1804b1-4bb8880c73emr10830495e9.21.1795115088520;
        Thu, 19 Nov 2026 11:04:48 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm19124775e9.7.2026.11.19.11.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:04:48 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 19 Nov 2026 20:02:24 +0100
Subject: [PATCH v2 2/2] firmware: raspberrypi: Register PMIC hwmon driver
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
Message-Id: <20261119-hwmon-da9091-v2-2-d6c624272a9e@gmail.com>
References: <20261119-hwmon-da9091-v2-0-d6c624272a9e@gmail.com>
In-Reply-To: <20261119-hwmon-da9091-v2-0-d6c624272a9e@gmail.com>
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
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/0hNFIRxvZnpewtzaaGCmAxJlbTZ6ygiQm+SX
 WvHc3zLIs+JAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9ITQAKCRB4zXhFDAXI
 Z8CxD/9zPkW9kooLjhMMGYwX7WilKkmvysEL+aq8pfEOAhKuRFVnSBxa+QC7SjCaQCs961fQb3Z
 Znuf37UxAT5ksO6Rsoh64QiWTiwL0f1eapWtUhRDVwLQo73vyvLeuV7FiIQahf/krRPcGSPOVE3
 wehAFpieJouLoKHHJHMIwORsCsMOH7624mc1BTx13GzNjw7CUzyKkIOMr4e/mfMJva8B+x9FdU0
 x4K5KWVIhNsH+DjKsdF9YDTDWJxA3AuCJ8gnNfjCCb16CD1XkCArt1EUkuBZsOjNgB4zI3jEKqw
 wgovByXjbUnePgIHHmb/K4GH6e+E6xrRmZhOu6XqnJOvY6lR/1K8JIN0x7KSLhXOfhSRcxknyk2
 JdaaSTl6ByUw5Gc9YeuoHA7c2Rve5RhBXaciU7lrLKr6tuBtF6FTgpZyFmidH3lJ6Mhyi0/88tP
 Ewf7vYpdK9s9z9jGfXtpvvoHDk0tZNqKl3Y7d6FTyFCvnDLRqZiNV4R382NIinhx5/DUkvxdAoi
 adRIjvRCoRm9xwkGeQhA8iaXrVsv2fFiyuSsNtXSj+huwhzCzVpl7AL8hrXG3anUuenoXqU1NAF
 RVPKMZz2spn8g1UzWS/PZ/DuQBV6v6UNQqu7CT9k7V6j92yE2VNua1SXcgmuv2gmjZRLCeCfMQu
 IQoaWdvM6rc3PnA==
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

