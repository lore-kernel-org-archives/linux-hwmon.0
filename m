Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D44E3B2FCE
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 01:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783475897; cv=none; b=pxqcVhOzv1RG6Rh7CuI7Q95gHbnIaz8dTZS05xCoS5Ny1SrOMpqJQzmog2zn0lUbzMiCJT7ataeOxlPSxmVp/JJFOR1yULjjuqJ/fTnB1dKR1DdM8LW6oDebCnoLOuipb+7zdmxMSgvfbscWSbpK3C8sTkMZgDTKldGVceX//BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783475897; c=relaxed/simple;
	bh=yupnQIIPyeJcV/C3XBTwjDMNUZYYKFCh6ulFAb6wfjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nxhnzfBLkjrAzdWD6sObvDRY1JhX1LsX4o84fjIvZtASOzUIIk2+KR3rDNZDMcRxvXhLppMMJESBcL+gtR0ji/MZz+FS+Yb91qIEEcazA4rFYjA82RbS7ZIDhSQq7sKFnU+KKhfRWjDUYRjBCaKQ4YNA/W3b3Uywv+FFXqrDv0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSP67Hq/; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSP67Hq/"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso924340a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 18:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783475896; x=1784080696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPKlsUY8ZAU8LEvKy1aMzzClLVhddKor/Fyr5mDf6kU=;
        b=XSP67Hq/WE/CYziZxncN/HW9hPoKXp76Ayz5wc2uauYvFEqGVRRiRPWiC9xRuEEKPs
         P+jUYMaJq4LFyPe5REj0yJ8OeZdYFZap7Zoz/E1IHmQklx6u7Qgyk8Tg22Ixe54kz1Ca
         yWptvL6a+NHkKA3Gguvs6TOVQUJSXTjosMi1H3Xm+hBFUWVBwHpH4cFA58UB/Nui1Hnp
         a0SZcINj0+ZjHymU3/4cBYj0nOgSbHHhZdaugX1YyIH27TPCMhVGAY4xUWBxZdq7cJtU
         9Tj85ViP/QZwq9i8cy/7+11puidDp5nQvHcC9KfUQoIESEWgtQW0tKi5NQox7VhMo9cz
         OLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783475896; x=1784080696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dPKlsUY8ZAU8LEvKy1aMzzClLVhddKor/Fyr5mDf6kU=;
        b=XWaRoROBR3TIsPAMsOyIqt5j7vC/IjyOt4R0wssFGiTOJ18KAJfy169TJy3fY3qs/g
         b9uzeyYnE/CWNvydLcm0cHsQfVi2Z8g5s0ZBnAMCYyjMPAdcpqmqoeUcLM3JK8N/TSYM
         LzHMnWNeQza6DcyyHPNVty5o4TXcZ5P95Kn8NOzsxnMKtT4+nvp0qGx9eYEmIeq9MxMx
         MCxmZeEdwjys0OTN2u5Zn8gtJVWG4w3wdpX3rcRzIeEAlW1Vooir97b9yauf8y67qVXI
         M5WhadUbYv7DA4fJ+JTFJjyxD6HtFTL91RBGLDk2I4nxrIlZpTNht+ViR6EjP+6e5WP0
         6dOQ==
X-Gm-Message-State: AOJu0YxeneJGU8LqrLlBkk49zFMjuLRNIINhWr8ZfJYbS5axwe7976Jy
	/atZGjViYFkH3vuAsGAPeo2nGtFqphGpX/+o3XYzjzJbQglYKefgo+8L5b43nw==
X-Gm-Gg: AfdE7clBanTB3Ava/jR0bCPDe4zAsncJCnDuOJIUBzdkSZdF9v+rACgT6eQ/rP4Kleb
	pKx98t88YKyHT6rWc/rSxkEtU2QCqzyLYwZLtSJ+w2ifm8MuJy8Ycoy6AynrebidHM7FPFVc4xe
	MH3vsECvBndoVMpPFWoZL5EG2Q+duhL9D3bmW/aQ6DUewGeVz730Gvta9Wu7YaYX0jq8jKfMFiN
	n+qU0Hio9dC8tAdPi3YklkuutcnY049hsIkFDMVRlZYZEgSvTEighiC6hZDJqXymSU2uBLPa/4w
	HPFlevXo5t+T+Fl8dS98d8N8s7zBVoZU5AlIEHk09kqLoHVul52bFmaE7rPOmwz++zNO2rQ1NXp
	+7ptzA7i1lingVoN02jrZplsRBZsBGxrvKrbtxrG04xO09w0xk0FG23Js8YN1VXOfO7kqcjff2Q
	QUocTRrn0yQGBEft8LvnG/w8jBuw==
X-Received: by 2002:a05:6a20:6a0e:b0:3bf:6763:f0d0 with SMTP id adf61e73a8af0-3c09af93fcdmr6222781637.4.1783475895827;
        Tue, 07 Jul 2026 18:58:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c4ddsm15057287c88.1.2026.07.07.18.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 18:58:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 3/4] hwmon: (nzxt-smart2) Stop device IO before calling hid_hw_stop
Date: Tue,  7 Jul 2026 18:58:05 -0700
Message-ID: <20260708015806.213790-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260708015806.213790-1-linux@roeck-us.net>
References: <20260708015806.213790-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calling hid_hw_stop() does not stop the device IO.
This results in a race condition between hid_input_report() and the point
immediately following the execution of hid_device_io_start() within
the driver probe function. If the probe operation fails after "io start"
has been initiated, this race condition will result in a UAF vulnerability.

Fix the problem by calling hid_device_io_stop() before calling
hid_hw_stop().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 53e68c20aeb1e ("hwmon: add driver for NZXT RGB&Fan Controller/Smart Device v2")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nzxt-smart2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
index 58ef9fa0184b..286de15cedc7 100644
--- a/drivers/hwmon/nzxt-smart2.c
+++ b/drivers/hwmon/nzxt-smart2.c
@@ -770,6 +770,7 @@ static int nzxt_smart2_hid_probe(struct hid_device *hdev,
 	hid_hw_close(hdev);
 
 out_hw_stop:
+	hid_device_io_stop(hdev);
 	hid_hw_stop(hdev);
 	return ret;
 }
-- 
2.45.2

