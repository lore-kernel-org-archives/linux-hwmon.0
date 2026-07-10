Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8379175A72
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 04:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783659494; cv=none; b=ml83XFBT2kWcItA0T1Wg4A0e581QgAT3l0RlE5VyLdsPj2sKFDv2oU3PRkjkl0ULwVx3ZjkcaRoNUEkbZGPFWJSWIVZgF9Q939yazx+DDU4LFhSkw62B2MHPQc7OW1PC+xUzOc4Wr3v0H3CbOAe7Ucj7bin1GxnQ3Pw50DALYpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783659494; c=relaxed/simple;
	bh=LUynLEduW3laju1Xz0i/v65BBYrDCWum2n8qCjZYck8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OANWgDfUvSVBMuSqE6pixj8OGE8+7q3l5V6A0Cs2vh3It4J+3k3tcA0MrctI6hxCm0LZ0kPpsrytJ/Cqu7B97foCwyR5OLyURjSpO/UtR3Z5WyrpoxWruQVZvqBJLgGba2X+iRS/2iB95L2gydSZNwLcVbXe+1UZPPSHhmWKilg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTCRg2SA; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTCRg2SA"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so523174b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jul 2026 21:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659492; x=1784264292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iuU2QgnxHPYvDZ8jXVupPy6ABXAejH4GkcjfMc/9RZ8=;
        b=UTCRg2SA9BFcTUrk0jrSGSksRRRNhffITqQV0THxscgyhzdYdL+UKvDLLVYiniJG36
         Y+pYpl3VcNygpo+Tw4MIJR9/x3ngChTuP4Jqm1avWE6ck0gFSmK2HO3/d3Bw/+fp54XK
         xZsiX2FrTNJFg3dvzKGbeYzKAw9O+hi4fSunvQOLuoQm1brXj0i6DghD3XUEUl/UhtMp
         phyOs5K4y2k5GN6N5Ogcm3fhbE9etAg8wRGwplLuTuyjrIVkZ7/pdlTqrKL4PthtwhCo
         Wy3tRjOQuqL2LfbC6duPgGl11ki7B1KR57cZA7QD2tUCztIu1SE7PWbWn9uubxxnYY4E
         MMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659492; x=1784264292;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iuU2QgnxHPYvDZ8jXVupPy6ABXAejH4GkcjfMc/9RZ8=;
        b=Rrwz/f/ZuOOIcM1XXk9r+FsHMA4zzsxTvMZ3mleu2rmu5hPb5dSycm60UgvrznVUVY
         xec/JwisKnzwaxAeX1feS3yQgUl3jVJXn1wPimkpXYFYJgpQreultjyLc3YRDQIJ1/Ym
         ckOwexnbFp5TTLmzMEobqozlXVZEhspbBp8pj7xSXgHDLwPudC/yMbCaHCegf6TG4zm+
         FEXHjAiVvGJkaF+O/44Yf1RLbxGT3Cdsd5wfGrFB9faPmTB1n5bn1G+JMLUF0ae/D75G
         H+16/q4jtk1JnlVJDq75Oi8QLUpldFwEqnhghcUsD6uJ4fE9GQ2jVFY0MKyrIhaaO3m8
         74XA==
X-Forwarded-Encrypted: i=1; AHgh+RovLoVXtjdXkqLw3pwv84KZuaIU8e0QSNIsuSIUuDu9rcogTyBoa4DemyfbA4xv7ZBBgh9Nzd0YSPIXBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4RWmfQJKdbQMo8AveaKl2e8cRddRBSMBLoEpUsfgdyqKjrCMu
	xbnw2vhZF44jJs2c+BMdYh72Jij6EdGPqzafnRwUTRxnUOM2XyGl//Tb
X-Gm-Gg: AfdE7cmYzi5OnJnBClqPVYclTpZlPLLyv2nnumDJhR81jX5cI4riN4mxmnZ13OF7cGp
	7mM/ghXLcb9Kz7Goi+xLpmJ0fWDp284l8f0I82bezejF7Ztcrx3WMpFtCNbtwSwSjguTlvRkaKV
	T8uIofMQbPH/w9MyUurBQerrRci2UrmZnb0vAi+wh8SkW+5GM1Qd+tr8q9Fc4OfYjyEFxHaY051
	yZJ6JNuXGz2Yt7bR26Whj4o6V8y1Yl8mWDnfEFt0kELLxPPYK3iqowXtkJZStTrmd2JgYVRTiBm
	CUuV3UAyqkk6D99vppVi85tQpvrooMgj8lyyXf/S7DP40aSoDDCln4MzY4edwHVNj9+1e/S4PRl
	VDnwRiGVMvpQZPFwH5wPxwjluYlHkZsw2mfAZGMwDlw6dsBaWrlkUTunA3gg1DO4FP1zk9TxTPc
	JiJZJTOF93dPajALwGGR3CXa3q98i7n34EX9GDTFfYiPhf80FM/e2mzn0Vkv93xn/C1hbCdmha
X-Received: by 2002:a05:6a00:998:b0:842:50fd:4c13 with SMTP id d2e1a72fcca58-84870a53825mr1902268b3a.4.1783659492094;
        Thu, 09 Jul 2026 21:58:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d44d53sm9633097b3a.38.2026.07.09.21.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 21:58:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ce6bca91-ca18-4764-a268-1429b41fb918@roeck-us.net>
Date: Thu, 9 Jul 2026 21:58:05 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (asus-ec-sensors) add T_Sensor for ROG STRIX
 X870E-E GAMING WIFI
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Vishaal Saraiya <vishaal.saraiya@gmail.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260709204037.1998433-1-eugene.shalygin@gmail.com>
 <20260709204037.1998433-2-eugene.shalygin@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260709204037.1998433-2-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/26 13:38, Eugene Shalygin wrote:
> From: Vishaal Saraiya <vishaal.saraiya@gmail.com>
> 
> Enable T_Sensor for ROG STRIX X870E-E GAMING WIFI. Board specs list the
> sensor, reading return -62, which is one of the blank values for
> temperature sensors in the ASUS EC.
> 

Just like Sashiko, I don't really understand this patch or, rather,
its description. What is the point of adding a sensor which is expected
to return -62 ?

Guenter

> Signed-off-by: Vishaal Saraiya <vishaal.saraiya@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
> ---
>   drivers/hwmon/asus-ec-sensors.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
> index 29a23484cbe7..742520c485ca 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -743,7 +743,7 @@ static const struct ec_board_info board_info_strix_x870_i_gaming_wifi = {
>   
>   static const struct ec_board_info board_info_strix_x870e_e_gaming_wifi = {
>   	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
> -		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
> +		SENSOR_TEMP_MB | SENSOR_TEMP_VRM | SENSOR_TEMP_T_SENSOR |
>   		SENSOR_FAN_CPU_OPT,
>   	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
>   	.family = family_amd_800_series,

