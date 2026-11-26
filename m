Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698229;
	b=W8L3lrfX4p8qtrtP803kUU9X8A0ESO0aCGflqCasy1v0Tj1kndf6ZnN7OIHTWKwEtFBD
	 +yxJKQRAHQ7A3myaYVdxSlGlepGxTBWBB6CQHKsO+F+rPh6RwTL84i6EhH48zwsoloIO/
	 bBr3iyzRQgWa9XbwCaXalXUVcpDuL7K7SURQNCGP4oOaKEvMxEQnE2FC3Fy0+doi+dnzp
	 1otr/Qoxu0ruxKOPym8ifWtw4WW/XVNSIaedpr+TUQi2spmr4m6bzo53phzHYRv/LobxV
	 NwbArJ/KK19hO69/O7vuaILO+01qD7f6F+ftkVPmuK1jFJ7dVmWVfBS+u6I7/pOnxvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Pgy/LqViivjz+vBeamFRAxJjrlPLa2NnrUA8TY0Ipuo=;
	b=b31IQNM2iTig999eCnIbVSOEJgi/s0JInrz+aDHMHwrer+Enzm1s6FXAxe/nVjVQYaiR
	 I2JLSvwPF8cArwhnH9m+oqRW8D3U1O39Ej354NkYibKb9qwzc7HWgyqcBJiOZl9TRPYAo
	 G6SWTvoIGjKnUqgTuqZN+nL4AowUBUJ9ezGfwrs94AbPl07EgRlJmBwQjqomE/gJgd+xC
	 7mEzeAobYQ5Mf17osVX8NGNRmEw4vKIqq6vEr1F8kGdKZyfGYO80HPU7JgRb2tf1TnNDi
	 h0uf8nC3Kmunurhat+/C1kl+3c8kkDIc+vGa8nhNnQSkAQEPGe9BgbtkiJyYoyKWn4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x/peqbeB";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98206606A327
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 13:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98206606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x/peqbeB
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so5720914f8f.0
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 05:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795698227; x=1796303027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pgy/LqViivjz+vBeamFRAxJjrlPLa2NnrUA8TY0Ipuo=;
        b=x/peqbeB55gWorimKoGuMgAbuxLB1FWa7z+7d4eQogwmahuKJakcftf5bsdqvOo57W
         Wif8V+dxneKbL5i4KouqalEX27nZgNu89OYqK+98mECwaBB46a36REDDDfYjRJ7z6WPj
         TkcvJv8EjfXJmlvxD5iMIKZeDHwEDEIXdk0b+JAUDoYglwKmXwcYTGzPB+xtA/m5lKx0
         jDV+cgDOO9g/pCSzZHYvdw4Eo9toRZajnHXObw3eCrfV5jfJvAAmsVO+yNpd4Bgc2yUT
         HY6wIfaIhK1N3K6DRvSXWa2fK9IWJ9PmAN2G7lWLDF28Jh9IizYVKEABwbziyzvokTVA
         vn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698227; x=1796303027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pgy/LqViivjz+vBeamFRAxJjrlPLa2NnrUA8TY0Ipuo=;
        b=zO1zNz9OMkUNUmR4j4dfGFFJlPAG2rYa9U30YrdJXaniowHTNIwvmbMZaBInGtkzNX
         Zb62yf5BcBNgS0h+YODclNt2oZ9+BCqDN5fYjknhiW9tp3KeQbdF95V27nWXrIbdg7N/
         CcTcNbZcfMNG6z5VanjJP4s11Zyn33nS+yrBfh9WFvn8SnoLBltLviDdENmwlXr6vnyD
         2hrA0FBTgY/lzjV39ZiTWlzT/TyFASnG9QeKosB3nT1J0QhARfAh0z0PWJfSsJ31tvq3
         Z0yry7xG99HkrnJMwwOrKGdfD6MNfdH93jEpVLTzx/0xtfW5PWI6lYV39tEC7+Sv4bEB
         wQdQ==
X-Forwarded-Encrypted: i=1; AL+hErFEQzZZlVF35YHy6VVaF8N8IjdF69iYsOJVg8TXfE3S3x0eN4BRL5uZmd0h0oheyYeP7pKW6j4ilCOt/g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+In2owvXTHspRoDOPqgrKQ8tA9nZVv6OUuCyNOllLsN2St9dAV
	08p0EmhJC7bvRRKaxD8Tqg396PODFKZNjOzLTIOHju+d9u0xhV4SnAbj
X-Gm-Gg: AZFdTZeUjW4OjDB9JmMneUNBng5Ol5VefDgnL7yfrTLylK4EwvB5ptcU1tRYhwCOSKJ
	zv+OhWhoHkMlviZjfbQiPkwFHALfSF9xqvXZeDyyx105dJYfIYS+uYTSGwA6XzxGAATCsy08HwF
	p0zexrwccx1DXCYb231ami15Wc51Y0KhjhRgMlWm7CWT7LbCM0VeT+3jORCmIJyCZRVjPZwJveV
	VwzhcXHuJ9JVQ9Xr8tL3cuRWSqT+PzwQbXs30BS/AjGas8Z5mktUWsJrUj5WHSiYMIhwDKtVq/1
	teyZHa2F0rAEk15nIAsk1aFKhIclQdgPyn+A+NkOE/n7ukcbDizqtIH49SjJQdGdYy16fbcKVJe
	8dBhDT7L68g50qaddwfaZjA48+ApHU4zu+m6+Pvq30gHl+z3Z2J4W9aMr05/iJXMd7Uw/zSOC6D
	TnPOPTLh7G6AWptYZ50ZwqVI9oGSNoodLiYHTf8J0b6nW7Py4NbcdKdTtNXQHEXjTdHB6gtG1Ec
	puHM48AnRKR9eRv0C1+gvS3eqreryXp4qzfbViLgRJrk+4vhu5WP5MF3UNAYK/YVvWMLmF8Oujs
	27u7YTem6u6C1Xtped/rJ4FOClyacp5JOEgK1zqn49DGXd4KFqZ7iQmnJUlOUXN3fMu9Mu10Lhf
	joz0dfzQUP7DdtCY=
X-Received: by 2002:a05:6000:990:b0:493:ec0:861c with SMTP id ffacd0b85a97d-4abb0c5d53fmr39049675f8f.16.1795698226719;
        Thu, 26 Nov 2026 05:03:46 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm39331425f8f.30.2026.11.26.05.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:03:46 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 26 Nov 2026 14:03:29 +0100
Subject: [PATCH v5 1/3] soc: bcm2835: raspberrypi-firmware: Add PMIC ADC
 property tag
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
Message-Id: <20261126-hwmon-da9091-v5-1-0c3570ba9133@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=/iUxca9FTu0bgiQQeq8SBVCAGFP6lu621MvCErbuE0Y=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBrCC4xNEx4B4+w47Y6KIxfaxL7O51qs8bnihmov
 1fup0sxu1eJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCawguMQAKCRB4zXhFDAXI
 Z+MiD/46w5hTMfyhn4m39PvQETjkM33y7fxz8RsI96szfIvy31g1+2HfYzpr/qavjjnOw75LoKd
 XlkZVtPWoZ2D0h6fQKjCxfAc4faI2Jcaw76XaZuJCT95fLzAFeXPHZHp/KawJaoNQcQj/av+zoE
 h7gQfnhRTLPYQIXFz6oazBY+MzPmBoUZ/MW/XPl9o8nIpveCXi5//Qu/iG7PE3B8KqDpGjBRrxT
 ulKKDu7ga5hj3gR+GFwGd4z9oJhVXsfXVM9TOjMrrx3LwHhZviUe5H+uIf6H6tcedKHbXGo9udo
 EI3dP3yFy0NFJjUy2zONdxKU01sec/XYelCLf8W+auYJZvSatkpnawQbYiF+wpQ40Av/tKZacVC
 te9+fmlU0kKwLq/6ASwljDjKomGFulcwaS/5CimW8G5jY8N0vVVMB41N9l2TrVkD+g+s0sOc2lo
 xqeb29TF7WbUZiaB77bWifC6k5NoT6MMnpTDPjyktDaKd4bK9fhOB59Mos7wVKSogOsdTx6+IVz
 cIn1KmqP1qtRmLueWZ+LmSSsnyguANaEaOjc71jOaur1sr+xZdtqxO6/+4gFEvuY9DSwPQelNaG
 oZuPQpRKiUAABqOS0Cbi8MtYXOWAYLnNqTJGPYRlg+CcynVEAU5dsjAryEun5MdFMdwnpmzsfJv
 DsbZ8j75xwgtE5g==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

Add RPI_FIRMWARE_GET_PMIC_ADC (0x0003009f) to the firmware property
tag enum.

Recent Raspberry Pi firmware exposes a structured mailbox property
that returns PMIC ADC readings (voltages, currents and temperatures)
in binary form[1]. This is required by the upcoming hwmon driver for the
DA9091 PMIC on Raspberry Pi 5.

[1] https://forums.raspberrypi.com/viewtopic.php?p=2391319
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 include/soc/bcm2835/raspberrypi-firmware.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 20141eb2cb67..90d7b66b96e3 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -84,6 +84,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_REBOOT_FLAGS =                       0x00030064,
 	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
 	RPI_FIRMWARE_GET_RTC_REG =                            0x00030087,
+	RPI_FIRMWARE_GET_PMIC_ADC =                           0x0003009f,
 	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
 	RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
 	RPI_FIRMWARE_SET_VOLTAGE =                            0x00038003,

-- 
2.56.1

