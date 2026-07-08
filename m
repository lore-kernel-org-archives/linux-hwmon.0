Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A562E367B97
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 03:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783479914; cv=none; b=ouEJY5bHRK7vMWWN7HwPQjJq4aWE5tAxz6ScO7/LXjP+LL7syxYu0iWfWv3WAOx40Be1QdZK8/BKYyef7l87smePw91P/TYX/ZEsOUJwXaUJfsnXhQAmbb/pGqX/85iT+TAubkT1uW71VNJyH3CWXA2cmPmKjDVQIdVejTA4lXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783479914; c=relaxed/simple;
	bh=ot4Kbv4vIC1o6ojuu08pd0fVNmnSyOetvMxjlHyE0fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJuyjlI9MuWp0wVXkeFEzJGn6aJuyXS1lD4b8uVVfLUoWQdlUYrApjqcTx+gI3Hq2j6SBore8+uLJuCrhByoxa3kxs3GWw3+3QjWGBLujls4HR2yo9xFFRJ7c1XyZHb5fX9xoN9ED31fXqdb9ulDDyl2OIA2hTDbR6Iqd2dV5DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjKwLVwd; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjKwLVwd"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c89636920a3so72696a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 20:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783479913; x=1784084713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbXA2WXhJZRrip7d5VsJ7gj4xT+pYGY6ObBTqrAIpAw=;
        b=LjKwLVwd44qwxsJXqph8UR8pNcnoITQz/BhJKfSH75OdV0kIBRLGBFptSxUJxQjZMe
         ahSYBWuk9df8fw37sjZOMIT2ILMCgVdKLKx9dl6zDfkUhRPGSNOsrM2mBGICUaaR+mIf
         qMPrcqBvEafAp+03akM5teQun9DoVGVCt5+0q/UJsai9AqtYbsKot3+GcTKFp+lEEAuH
         Fr2Zg1z/AO395hVmvTJ766cSBgigP1uvDuOjqA/VZbaOzj0egnBchisONciuE1wUVQ4F
         lfyIsQFvAUw8Fr8tTMMNoMzy3N6w6wtzy02rqtBRbzbBRw222zEVs3YEWLFyV3kSrjXL
         GjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783479913; x=1784084713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbXA2WXhJZRrip7d5VsJ7gj4xT+pYGY6ObBTqrAIpAw=;
        b=mqD0IHHHDVEDYODCZs8vyKm8x+RcAdJEMAA61Ua2TSIDcEoJ+7tIqrstykigNB7OK8
         25P3b5+FyofE6FZmiSzAKYAYhpoSklpVSMLJq/KHJLX8FtNzBLeSXzA66MEAXGU4JMiS
         drY/Ue2nd0zroC1yMqRZzLi8ROpo2cbVU43diczec/6tuQJnS9vASCLR6glHAVtedeHa
         gtmy4rxp5V29WKp3s96r/P2behQ86RlL2vUCKKogGqvhXbMh3w3PrQBIyVE5p3+ITzr7
         nHtmxuurp1Xcsu0d1Iyj/hrKuMb70dcxpTlncawB5tpmhNiLWnnDmP06dBY629xQh0a/
         dYZA==
X-Gm-Message-State: AOJu0YwmFOfcL34NuvT/3idLVzSQNx7IIKodOSHhsSnrh5bCClcGt5wS
	s6LiEP75yoc+ZC2NvftkI4GO0XrSmIkiiyBSon3gGq/y8bb4zJ63kFbM5w3now==
X-Gm-Gg: AfdE7cnOCZkNDSy96uAjeyKASYG/qa2K9B+9xcBPXQld4Xj5sn1vd17ap1GVabQTkZ9
	4/kPX6Ik/LbNjxrZhX6cuPd6jal2x6xmlRj0/jEmqJHq9FaQj1Xa1IBY/4ySKlnLndrHLewPAjQ
	U0ADyosP2KMB2QliFTR99TTX9GW7+lW6wRvpTF34gpYZXSqpGNfnGkfdGQOdd5VZmj/LEu7IPrb
	lVtO4/eJqvBfoytJJcn4JBEEphCFMwFuaf5+PWNbgpbDQOfllbh2NwAYAEdKDdZNruwd0ctL9CO
	ztkd7lxtzfT70OPcD40Wm7bRKNb0SNIVbhWYnY0vXsSzic7ZO6X/sAuYFWgXCnwbBIXFx1+pbNw
	UJUMI0QgOTXs9sWBZ74Jq1VNRO9SNdNnXjRCFKX0YSnuXQKS2MZ06sazfU2p9Tc3SyFANPTpcMw
	Yoi3nBPqeUfLsxyo9R95wxk3WTfA==
X-Received: by 2002:a05:6300:91:b0:3bf:6c08:2b34 with SMTP id adf61e73a8af0-3c0bcc23c15mr533976637.60.1783479912797;
        Tue, 07 Jul 2026 20:05:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5975sm13252437eec.4.2026.07.07.20.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:05:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 1/4] hwmon: (corsair-cpro) Stop device IO before calling hid_hw_stop
Date: Tue,  7 Jul 2026 20:05:04 -0700
Message-ID: <20260708030507.227193-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260708030507.227193-1-linux@roeck-us.net>
References: <20260708030507.227193-1-linux@roeck-us.net>
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
Fixes: 40c3a44542257 ("hwmon: add Corsair Commander Pro driver")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Call hid_device_io_stop() only if hid_device_io_start() has been called

 drivers/hwmon/corsair-cpro.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
index b6e508e43fa1..8354a002f4c5 100644
--- a/drivers/hwmon/corsair-cpro.c
+++ b/drivers/hwmon/corsair-cpro.c
@@ -645,6 +645,7 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 out_hw_close:
 	hid_hw_close(hdev);
+	hid_device_io_stop(hdev);
 out_hw_stop:
 	hid_hw_stop(hdev);
 	return ret;
-- 
2.45.2

