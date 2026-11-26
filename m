Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698230;
	b=V6pzjpLMQKZZkBK0fcAmL070LwJ1dtARycC0OZlVnw6OTs929UW0zPVlbfRvOov6S4L/
	 A8PHl3SJNX+YbKO8mi1wZyIxyQpzZO1BsF/YmuCIMWzYCK2ZTBJ4+H9dblvgHQxf946Wy
	 F0HSTchtXJwKOdcbYwCFi//KH2mnO+EINp/dcr9LM5gA9xqdueQwBOv2gT/nw7S+FJJ4o
	 9QNi9k0suMYenzsI37frM0I2nqRwXTEFIwOsVMlyHWDFwngQRLAWQStHwGUaPjAJ8F2cN
	 IksDU505Iw/1QvWGF1hsEZMZO1YNB89G6/ZNavPsqVOFmdfOpbFuu+GimABBTqx3WTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
	b=BlWKjuBYtlOQ6s7fZs/Id5wAKwlc1iNS1xp6DdCdqQO7TSqNGpTgQ72JS7O9PnSbs2co
	 3/pi2J4/AjAtiAlP3gG3w4L7KmlsbjvM/al07zDQbuLrdBA8y1qp3H5LEutEuhlOyNPT6
	 AZ2NMMjJP9dBSyOhWJbPGdVH8ymViQfgOdHNS0sn76H6ydbx2DuWt/JAUUWyRBLWt/PCX
	 AtGKblYQCXR4xzETHkHnsIV56drKBCiQUCFxH0cmK4u1P/4B7tHObRiptu635ePhhAiFz
	 YC/m5fDZj8EoWVY9/hUFE7NDZN0RG71kS6mmvRXXfngh49ajtg/YeewEmsidBCHfuPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oc+4uOFH;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47993606A327
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 13:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47993606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oc+4uOFH
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491971ac844so6226325f8f.2
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 05:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795698228; x=1796303028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=Oc+4uOFH7gxgWYT7IEWvRP9q9C/nc8WHA3KgPi9lcFkiqDMog+1534PSwq0wiYe7pK
         vqlRdDRnjFdqYFpwvNritESF/2HA9WYmFdjNWmTPXQn4TyE6VsNedJ8wyt04fkcpC7eR
         8H9tslSzbX4tZqyXYLBEQ7tDEAnxQcOxjPoyq1LlhtB8JX1GRb3vGmeMJZkgLokfrjve
         vZwH88zSww3JYFdkmO23Pw/tKUfVHAhTNTB/Sbl3Gt3PLfnofwB0gKpaJKamTULPxXUa
         NjzP4FFFKa72mdQE/hT14yHnoxXMLXo1VS1kgv3HR0NnYgraYviWv4dfrjFuP+J8KZxV
         fgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698228; x=1796303028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TkSQkMemxAC+Z4MDsNep+8WjC8qCTW9Z0nTYgNEgXU=;
        b=0H+c0RNABihiVVIrM5dvaf4wuk/zQlet8VhVPI0089KBXGsfLkW5vv6fA/FXbvW12i
         /NqH3Td6JT9Fm7PNV2P+dg2Wba2Nfx3kGIjjbWsP+iLSJotvVJprO8tF86/RUOAgTaDs
         V1zzMe6tn0LfKL6uhreZJnqivaK6zV7wTEHbgoOmk0Ek9ULa4nvMdFEJxHtDy9Tqn69r
         Iopt3tbXianyBz1mJSmJmFSMWUj0UfMP0aXmOIkLnzLy6kDM7u18CsegXzwPo/Wctw5g
         yP+kF+BudA6R2YlMBYmQCpKR3iDtoGtOEjhmTJqEQu+S4iY1Or0Ffzb3Gs2LbXl3iCfa
         0Cjg==
X-Forwarded-Encrypted: i=1; AL+hErHmhqArERJHQ0JpGBpqCj8XufEsGpZ8Uiu0D4sC4xgA+gQ+9mWBJTXj/Ra6MUbhSI9VD0iL7xxQQZn7sw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8WSuMHkZ3M07Qnf1dto0EOvJBtdslhadr75dtu0/rl5cZ3sT+X
	J00xOgiqoJR11SSv9/l+djrLHaN0a8LmlXxeNhiQNuV1WmPnGvdKcKKF
X-Gm-Gg: AZFdTZecjMX6yoPJYnntxYk65GcbarioaycJfIBKqUPpslSnLm/JdxWMmT3JQyTO05H
	h8Bg/pYHWp/5X/Pw2Yj9Exh0O4FdcJ2cS1XZXGGUGsbIqsBZXkRA7lxWIU6AOQkDO2Fu+qWZYwK
	VLZval1bXQtFaWOwZQSMEcSg4va4rSqITn2TM8DkfvHR8XkaBmRrSL89QfZdeTwL/wCeA3HpVZL
	P/Gvj23Qk+E/7NnBZ394GnSZ1aPZDLgUaG3y4CExPN5w4EhmGcZOLJ1r0S1JyjNWyub2FSSo6M2
	XxiZ90SEAHwKoskx03D3mU+YH09+Tu5v2KCyMl3jALgxERzyEJErDqkccUJTKH9jdNzZ7kx7trg
	dr4JB+c83xbjtOQNRVEE+I3WYYvY2bezo2vh5J9yXa+R0nyMHPvhhJ5xQAlEd5/QN++mNAMmfnb
	X1GrMRzu7T2KbwEDoIIkX5EHka7yr/m7pFuJ2xKQbjeawXZJKo26jlvnbB72OBNrkdCoP+n8JAX
	UcaqxhOElqOXxR1cWEC5xFKGLvk7l4jda/ET4e4/NwPLqYTfLID//qGqsIyVANeWMQNZNR4IGey
	rFHLlN+FA5FpgXeJ/+GL6x6q3RG/KpJPOCNRKLlj8PRnox9lP7TL3RhQne8c6fCsyJD+wOtJw65
	Kdi3um5DXHVdNQ/PvpGtKFh2wYWDuBiM5kvsn
X-Received: by 2002:a05:6000:2903:b0:49d:7e8c:e8a2 with SMTP id ffacd0b85a97d-4abb244870cmr45744040f8f.33.1795698227412;
        Thu, 26 Nov 2026 05:03:47 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm39331425f8f.30.2026.11.26.05.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:03:47 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 26 Nov 2026 14:03:30 +0100
Subject: [PATCH v5 2/3] firmware: raspberrypi: Register PMIC hwmon driver
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
Message-Id: <20261126-hwmon-da9091-v5-2-0c3570ba9133@gmail.com>
References: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
In-Reply-To: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Guenter Roeck <linux@roeck-us.net>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=QX7uRGP2jWG84enlhwxfyWe+s9o7Z32PX6pW6x1r3aU=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBrCC4xetf6hc9yk9GlDHpxKF8KJKG4DJ0Yfo95h
 tWd0n4aFUGJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCawguMQAKCRB4zXhFDAXI
 Z5jED/9aBU4WlCVfXB+PsNCOFLUJZl9506vsDabSXLzTn3Xk88xdDjnN99nkstV7sEG4+ju8PJz
 MPini3NNQSOyVjivSP3C8GkSHyvHGEnoCkNobYB6hAgiahT1SRmiC/lPjhkAfV0qOXZmUQGXA2S
 rEmZZ4rISFs2lGH3AsN9WxhclXZh179ylEls45Nzjai3fI3anY9e8qsahNWoGeMOqVhjaJdazRH
 as2xOwV74dZ8Lcy8KgwrkRYB6cHLJJie+hlGVbMeNO/Nq7Dvg4RUa0L+2hf+7M2w3ouKgKXmPo9
 D1c/dRYxI6AD3bWEGoACZEOehX2PoCIhg9ZWeYx1SPSBMSmogjFpc4D7DzKuzFf9dbGDR5GmEqk
 DGhs83Tj2a1HdvoC5bveLy20PnQ4S4T9IN1tOMhRs9qT0QyT9PPi90O5JQme6wksDvg+wGVjSLU
 w31LzGeMMBKRH9IYP/guUpzgekiozJNjWqfaMpfxeDljpihvnlrXTB3f5fzaXW1AhEQzxww0tE6
 SJXLVjGPMztHBkC4m8S5L9aJrceEi9k1RwBvcl8l91ZQ2F7Q/w/IA588nxFnbqnY0Jd29jWEZDt
 y8qO3oNV54o6VzlkJFqvr8hvR6VDO7EjQHe2HT66XoLRiH936a1i05StW4U48XehgRbjFJZLLGc
 JAJAA4zcbyAsM+g==
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

