Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1266D35200A
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 15:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932234; cv=none; b=OHZsE7JabfOi5ZVCE/bTU6FK1swtQQveQWOm/8cLqf1TouoCPYQ98OXLUo5UXWJxnMt1LumN6BjRfMcjmG1jhk/c9KDuf/87ENcdCMLFp8AuJcNJ9jjCq4PuZAR7l5fzsOGtkcKio6TAwO2uQXBDZwgLPi+JXyVY3uWwqBptcAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932234; c=relaxed/simple;
	bh=QdY4j0bcS6bUVNBs+K2z0QQgC0HfMd3g7K9lfvE4hRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kOG4em3mKTcCBMfo1Y+FTvAxll/JrrBuOTTL3IzuPRzIKvcSKIIIO9tbsAQrwbpjJWDsyTd0ghQbvrnZnPzkmCVhug3Ec7lUVlyvuPIqle3PxKDBmHKoDoxwLouRuW7/sREDw4Gh/PUCtxjoGReguJQkMPICxSpZQz7vNf9Np2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AC5boXD2; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AC5boXD2"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso1352130a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 08:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787932230; x=1788537030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aR6XDpizZXhDYq7w3TTuPH2kKr6kffoaME60+AXzTS4=;
        b=AC5boXD2uO7VehsemrdzOBUO1O8b1OBnG7eoCVtKSDWMiVJqcWKNuS1c0bSeNpce/1
         /ih1JkhhyeQ9xGfK5AdL3NYSTh7cFtMwqEvlyOGcjiat+vBKCNp10DhRcwZ/JwIev5Jy
         RUCXjS/vpSehPxOLh3E2D2/0/Qslt8CIgBtfPoKMM6XgFmFBvwxQYlwVm0VnifQYyGaL
         IBU7oQJaoiJPMfco/XyCD06L/iKR/bCITNNHXsl5hpt+NfLL5QfA2n/AtXSoTljimdy8
         PpPAZ95pQqDQtzokIU8B1xhIAigNzEJUb3aloZHOECy3sAfhFs1AzOuJGAJwM4sns4ir
         4BDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932230; x=1788537030;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aR6XDpizZXhDYq7w3TTuPH2kKr6kffoaME60+AXzTS4=;
        b=Qf0b8Ll0JbgtxREWKE6JVcELa7YzKUQkiAmwLfO4lilntcjzCyX70epgv987ubZJ1T
         j5q8z52RleOFiXa8KWWMnO12WlSBGQaqsLLo6xyeKr8vjlQPUDT3uQAWT0CXYxEOmBm9
         DQMLnU2FCTrK/54/+W/u3/0vCF0yx1pF+9QTL2RoueiDAYW2ZD5NX2d2NceBtb2Ob5KQ
         Xj7FQ579VbVikYm+vJZ+s6v+znYJAWJDrwQDilAfrEJKpHE4gt5LCax0FmDtPG8SY9Lz
         Ybi+nESfJKcFej4d2xl+Ri/PWX6qcq25zl0PazE65Xg44kcyR1DI0oNhuwc26IN+I/Y6
         F9nQ==
X-Forwarded-Encrypted: i=1; AHgh+RriOwtnUCOMD/m8fL7tCg8aGIJI8dnEwP7lVeue61ZkYUTpgxgg8KbLIBPEH5EKWYMrAaIqYnWhhi4new==@vger.kernel.org
X-Gm-Message-State: AFuF++mUCCeawZHhp014YUqfDUC3HWFQvcmf4WwqDpQEl06x8M3x3jaW
	pGkc9/BxCv8/4b5MKxZFrafePwIXz4CbISPtrSB5EHfjR5XgzTLEf6Om
X-Gm-Gg: AR+sD11Ebcgit3uNa514lIURpwNuvUvDTQ9hXbkR9BGj+5kOsz/o3aDwwmXzLopFYHQ
	UkkF2lteKY1v8qv1HIIbznDGnLAi6XG1pz9iBTH3FxcB/PiL92qgeg6EtexE+jO/PjT3gg4EqnG
	ziTcIzIaBlD+WWy8y5bc7uSErGrOllVa701VZTYMspsioO/J9QZbCjTvwDr0kjOxmHVZNa7n2Hz
	WOAtqcpXNM3UKWttVaXT2fVadh0LmSb+VMLKBwBlmdSR23OhRFotdHtbx4VG2zEwodMN3uyjSQw
	DrBXCbGaSghBQEsgXrMV2k9J8pT9nuKJE5wl8PJo2fBXWxOoztgLH/vPuowGGgEYfuE7xeqHwz/
	nhZMWZnKGJ9PfeVCaPAY+KVoxQzSO2JQMqSNLt1CS8e9Hq+W6ke4iFE7whBmA3ITxNvrh2uzy38
	RVBJY7LQgL5rqy8vnpKKWzMvKGNyBkKD3be7gUlRQ4PvyRVFskeW7HDYKuI+HB/mMxXW4KFAlxl
	PD27TOvboln7IM8HiFc8dJlgenIVZt5PBkt2FA=
X-Received: by 2002:a17:90b:17c2:b0:396:b918:c2a with SMTP id 98e67ed59e1d1-396d0faa459mr14401709a91.12.1787932230181;
        Fri, 28 Aug 2026 08:50:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d6925e92sm1202960a91.2.2026.08.28.08.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 08:50:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cdcb9768-70f3-413c-baf4-02ca58e37337@roeck-us.net>
Date: Fri, 28 Aug 2026 08:50:28 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hwmon: (nct6775) Ignore 0xffff TSI temperature
 readings
To: =?UTF-8?B?6JShIOW+t+W9nQ==?= <Spector.Tsai@outlook.com>
Cc: Zev Weiss <zev@bewilderbeest.net>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260824184443.81887-1-Spector.Tsai@outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260824184443.81887-1-Spector.Tsai@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/24/26 11:44, 蔡 德彝 wrote:
> On an NCT6793D, unused TSI temperature channels can return 0xffff.
> 
> The driver currently treats every non-zero TSI register value as an
> active channel. This causes unused TSI channels to be exposed through
> hwmon and results in bogus temperature readings of 3892313987
> millidegrees Celsius.
> 
> Treat 0xffff as an inactive TSI channel.
> 
> With this change, the unused TSI channels are no longer exposed, while
> TSI0 continues to report normally.
> 

As pointed out by Sashiko, the fix is incomplete. The tsi_temp array should
be declared as u16. Also, at runtime, show_tsi_temp() should check if
data->tsi_temp[sattr->index] == 0xffff and return -ENODATA if that is the case.

Thanks,
Guenter

> Tested on an ASRock A320M-HDV R4.0 with an NCT6793D.
> 
> Fixes: b68437ace4b8 ("hwmon: (nct6775) add support for TSI temperature registers")
> Assisted-by: ChatGPT:GPT-5.6-Sol
> Signed-off-by: Spector Tsai <Spector.Tsai@outlook.com>
> ---
>   drivers/hwmon/nct6775-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index 759ea3d1286e..34e6a01aa4e4 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -4339,7 +4339,7 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
>   		err = nct6775_read_value(data, data->REG_TSI_TEMP[i], &tmp);
>   		if (err)
>   			return err;
> -		if (tmp)
> +		if (tmp && tmp != 0xffff)
>   			data->have_tsi_temp |= BIT(i);
>   	}
>   

