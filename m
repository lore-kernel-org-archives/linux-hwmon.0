Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469DB1E04A8
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Oct 2024 20:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728504217; cv=none; b=qpF5DVFb8hMPp7S6DcofsQ/kOfyAIrzgoNkCTSMM+RmuiV24Wvhh4PY3A7aS8t00khNwoCvvNDg76UFS60ZxW1MnttSIUfi3gOvF0xgE6Qm1fTax4I4lV5wmo9skWrMrzsptGNDen42BfxdcGITIhHXlyB7kdZkxvCsAPKoLGxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728504217; c=relaxed/simple;
	bh=6g+QNjhOrdb8sfdNgFtUCBbMsVcro8HZhnq0tUHugcA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=eWG+ubypkAFKGTmJRQVC2mDtydtH+40Moj7ProYye3gaUD3mquJMx8FN6OH7hqYlmYPESvslXjxo1pN+zdvFolivkDbyRdl6n8mHhmw/Zar6dO+DjULnd5MtydYAE41WAmdu/OfAfaVpzgw+YCUoqh2Fx6OGbIfOLkyAP+Og5ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfJ5VARB; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfJ5VARB"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fac3f20f1dso1597941fa.3
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Oct 2024 13:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728504214; x=1729109014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i+uVHUOU9deIeIerpwAIew5ByM1hiuI7rc50ZxBHn0c=;
        b=NfJ5VARBs67evtT5Gm6cFDLWuDle3ddSTt3sCRZkmh5ZzTvBnlnHFUIhjgzmS4uIHy
         QbUNpSF6h02Cg2/1F69S2lESrQWPxdlWADC/icHMFYyh5WmSUzzYdCiT3vipQvCf+hQt
         6cBsOCaEwdZYC6zNopbjJrKNvDi7niZWxgXdEEZjRGZoHFAZrL90jfgTppmxbi6R0fI3
         PDGor9TM7XeX9aXVA2rf2OETniE8/n0OjUYHlo3MrmK//KiYOENjPZqDUMCF2kBn6G4C
         7+XQfgI09wsC6SMn/M6CmxGDRcUIK5UiRKu0F4W04w1w1K+No2BOKTk4+71rWnPbTPbp
         P0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728504214; x=1729109014;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+uVHUOU9deIeIerpwAIew5ByM1hiuI7rc50ZxBHn0c=;
        b=eXgZCf4bLRbBAQQH/AUqTAkWJV6hfl9aF+XuUebEC0H3zVKWJhNk6CjFekWq0rdykt
         pNbZ+18biMlF4R6Pm257TJxNJdJqRtr2MVwKmvDRp/nE8wmq8hSb0gOCIMOekthZa7my
         LDAXRloUORDOUb0AjprFWFNaCxniH3qTYg7wvwkQJJaFveuJMQ3l//KFmxyepVx6OtUZ
         LfOsz05Q/+qdQNNZsb3ZPXPM437jWdQ1YoWNpGwsn5pjyxJEdCThph84uKJMtbppQK+I
         cGaP4FkiKQIQj3XVDqaWiMW+8L930GcDqaFit/ull4AWVEw9xNuAJKfK3gh4fnokD4XM
         Mixg==
X-Forwarded-Encrypted: i=1; AJvYcCVChU6xZxg8FRmXtQrIm4qLb6UyRelyHB/JpiUt4rxXsGAsRFyZgr+8n+hlKalLEQucaE/1llyfd5vM3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC+gRaE/2yCqSo45/JVCKDjTed54N8MJ98RV6oHVlGtd1QYOFT
	5bqbvKIPEUNECZuI196yNMzMZFeQShudETVJMocbNnH7b1fZQbdJ
X-Google-Smtp-Source: AGHT+IG4FfWa1XAC4GwW+YDRKpAvCsQhmAUQ1ilaZ0qG2t3YZf0j7u8PGdhBydz9ejeeZiHNICnlmg==
X-Received: by 2002:a05:6512:31cc:b0:533:42ae:c985 with SMTP id 2adb3069b0e04-539c48e7bfbmr2603871e87.25.1728504214056;
        Wed, 09 Oct 2024 13:03:34 -0700 (PDT)
Received: from ?IPV6:2a02:3100:b338:6300:ac71:eea5:34f6:504b? (dynamic-2a02-3100-b338-6300-ac71-eea5-34f6-504b.310.pool.telefonica.de. [2a02:3100:b338:6300:ac71:eea5:34f6:504b])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a993a3a1badsm656335466b.161.2024.10.09.13.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 13:03:33 -0700 (PDT)
Message-ID: <8583cf5a-5495-476c-a309-169a83013aa9@gmail.com>
Date: Wed, 9 Oct 2024 22:03:32 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/9] hwmon: Add helper hwmon_visible_0444
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Tim Harvey <tharvey@gateworks.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Jonas Malaco <jonas@protocubo.io>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Michael Walle <mwalle@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>,
 Ivor Wanders <ivor@iwanders.net>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 linux-rpi-kernel@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <3aecbfc5-e11b-4425-9c6b-88dac2d32945@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <3aecbfc5-e11b-4425-9c6b-88dac2d32945@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Several drivers simply return 0444 in their is_visible callback.
Add a helper in hwmon core for this use case to avoid code duplication.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/hwmon/hwmon.c | 7 +++++++
 include/linux/hwmon.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 9c35c4d03..7c26e241e 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -108,6 +108,13 @@ static const struct attribute_group hwmon_dev_attr_group = {
 	.is_visible	= hwmon_dev_attr_is_visible,
 };
 
+umode_t hwmon_visible_0444(const void *drvdata, enum hwmon_sensor_types type,
+			   u32 attr, int channel)
+{
+	return 0444;
+}
+EXPORT_SYMBOL_GPL(hwmon_visible_0444);
+
 static const struct attribute_group *hwmon_dev_attr_groups[] = {
 	&hwmon_dev_attr_group,
 	NULL
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 5c6a421ad..ce38051b6 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -422,6 +422,8 @@ struct hwmon_ops {
 		     u32 attr, int channel, long val);
 };
 
+umode_t hwmon_visible_0444(const void *drvdata, enum hwmon_sensor_types type,
+			   u32 attr, int channel);
 /**
  * struct hwmon_channel_info - Channel information
  * @type:	Channel type.
-- 
2.47.0


