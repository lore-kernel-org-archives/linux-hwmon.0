Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14811D0492
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 19:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728676771; cv=none; b=n+/OIArRRzr+GwDBb46uY6EYP+XPMUnNdo1l4jCoqtZXeNR3ZXNWoa0ApEJE8BQL90EdZevskA2p6iFyop3WkkNbeQfuF10l6nVi7pFLRxrHt1fu1/vwWZlevkehY/2lPFIHwMcVF+ayMJeROY7SWlobJ3ai6haquaSTepJn+X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728676771; c=relaxed/simple;
	bh=mjyC2vO9uUIhZQ4BcZzrxbv2ZqrPE5y0RCB92sV77M0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=iF9U4AqgmWLnQdvBDZeN+2njGmFkq3AOA1BjOHczMlLKeQgr8mUzm5NZthIO/3pnodPKb2NaCKYYlxTYFLJmBz39q7inJJi8FGuvvTiI2mW3kW02wn27RgQfXbpxZpyC+pQKzb9wukXip1rMM+++AnIvp4KZs0Jw7ugy+4+3Y8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nkp4Lab0; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nkp4Lab0"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a99ebb390a5so1836966b.1
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Oct 2024 12:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728676768; x=1729281568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DGqUx1ZsGPa8h1ot7WWpB/ncHsJ25w3V37H/bTcFPBw=;
        b=Nkp4Lab0m/OkdR0v2udSW6RkOA6tois4h0XMvKk3MYZwFKBhI2AbXrgMTAoJlubYv7
         23IQkuoAlkTjyXpR2OhiJ1kBBF9y0qN78XHzzOKsyV5KWND8Uy4tW331F1jm3m3VpkKT
         MA6uVxXsXHuZyIHTvpsB4OSlRTwVgVNHaAIdB1mPyb6dk6a2IfPw2qAYRyLhXsuvRkva
         wqu9L308OgXyKg/v9aTH2H7CNnUfSE+CO/W7l0znyaOLCjTUJeRk+HwqNZbMpe/zX+ib
         4/K1qZItPzq/AQJhILttWRDXMayiSmB5puij3LJ1tK4YyeiUeARGrHaEBpSaAGPpjFoH
         3tbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676768; x=1729281568;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DGqUx1ZsGPa8h1ot7WWpB/ncHsJ25w3V37H/bTcFPBw=;
        b=O3iEiXdHtlX00l0THQitgo1qY8h+hU+JNzGFs0JELnhZw7rUH37ATJWkwilvymokWP
         yXVxZnf1d5bFCm9tw2XmORfFo8CZ9jxUTxEFpde0fbeHnT/oBo5iyG4iicQwXETlJ/6Y
         6m90Uzn9NpWZGCjHsUaKr+CQwQ3L2oAzyRJ3AICcGXTQbw5QoP2Q7di9YndAeaHFdvvu
         u64in7lIuYpmL8M5bpOKn3z4Qv4wTX4rDGP2R134TQIk/xbS0Jip/Bvb7LNZTYzmIxAM
         6fy3R+ZrJ+DRCJwHre6sViwIUMI1w8h7UFLlJq4k9t0cOVE6HcjZVAkeeczRs0ZYcQh1
         a6Ig==
X-Gm-Message-State: AOJu0YxasZ3w3Qq5z3TClnuJM238bx2icgatQd+Z/9NK/PhmiwidM6Hy
	vP0wTS4vPuWssfjcbHgcWwJnwEuDj9JJ0BRmQTdob6oc8adSfez5
X-Google-Smtp-Source: AGHT+IFDeKMFr42Y9e/eqs9hbH5mcsthuH7Lx+mtXSPPy61YsjdDaj4OlO48VKL9TFOEJPNWip6ClA==
X-Received: by 2002:a17:907:7da5:b0:a99:6265:ed35 with SMTP id a640c23a62f3a-a99b87f0becmr296813866b.10.1728676767798;
        Fri, 11 Oct 2024 12:59:27 -0700 (PDT)
Received: from ?IPV6:2a02:3100:afd7:9a00:94ac:542a:1cd2:c9ce? (dynamic-2a02-3100-afd7-9a00-94ac-542a-1cd2-c9ce.310.pool.telefonica.de. [2a02:3100:afd7:9a00:94ac:542a:1cd2:c9ce])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a99a80c02b9sm245718866b.138.2024.10.11.12.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 12:59:27 -0700 (PDT)
Message-ID: <bd909a2c-23ee-437d-9bd4-858119f6f266@gmail.com>
Date: Fri, 11 Oct 2024 21:59:27 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/8] hwmon: gsc: Simplify specifying static visibility
 attribute
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Tim Harvey <tharvey@gateworks.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <6f43a3e1-3622-4595-a1ec-2b3ad94bdf5b@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <6f43a3e1-3622-4595-a1ec-2b3ad94bdf5b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use new member visible of struct hwmon_ops to simplify specifying
the static attribute visibility.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/hwmon/gsc-hwmon.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/hwmon/gsc-hwmon.c b/drivers/hwmon/gsc-hwmon.c
index 4514f3ed9..34aa17a23 100644
--- a/drivers/hwmon/gsc-hwmon.c
+++ b/drivers/hwmon/gsc-hwmon.c
@@ -231,15 +231,8 @@ gsc_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
 	return 0;
 }
 
-static umode_t
-gsc_hwmon_is_visible(const void *_data, enum hwmon_sensor_types type, u32 attr,
-		     int ch)
-{
-	return 0444;
-}
-
 static const struct hwmon_ops gsc_hwmon_ops = {
-	.is_visible = gsc_hwmon_is_visible,
+	.visible = 0444,
 	.read = gsc_hwmon_read,
 	.read_string = gsc_hwmon_read_string,
 };
-- 
2.47.0


