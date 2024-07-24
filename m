Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98B01CA93
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Jul 2024 14:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721831136; cv=none; b=g95o/FSyc3W76gzHC38SU4dGCq8Yi3iMAXhY0AAs4yqG72i2jqVXYKbj3SE9mkv7tLP2E4vcuIcBTzTVnOyxesDb46VaJXpnYNicj7bm+judchFrTHGxLVvQogtWVbeM+9Ds1C+/kX+a84NNtX0PlZtIMKmJOs/tVDQU4kfRdaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721831136; c=relaxed/simple;
	bh=tkINk8813ciUh/Hah0pbhYhhaaaEw2/X87BY0TywWfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SnVVH7oQPPhCnWv6AC2Woak3Jfy392A4lQU4a7si7Gj/E8hZsEwZOmApLfQbwuBdGupvY05OGE31+twqwRl3Bc0lukcaSFJhGjRWrpw95q68qMJ01EcsS6hpm6io50s9G5TBJ/O46brkjtCB8ftnYpzsK8+sE1/8xKLIr4XuxG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drxPhZPh; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drxPhZPh"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fc49c1f3e5so9772995ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Jul 2024 07:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721831134; x=1722435934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=INJxRVQhvImc6Le3O0/25JlCOzo9i9tocuAP+sk2BAw=;
        b=drxPhZPh6sp4eociekd9M481PfL5AXjOV+RmsBts/enkoCmajqo0vVicXlNsoPQPJA
         2K0CbaSl1DK9n6xgTo8teJ0Hweu9OHz0e5LrqdSd0o3TSiyDF1iiiSh9eRlFoVUiKh7O
         /TPdTiesWesOgoKGlRh6Zqrns8mVAhZE9sH5Htt8Sy6JtiYi4giv/Ql49e8GR1ku8box
         1TjXFA18dO0rd/R5XEAO3CXkhEic2f3ajxb/8C5NtWS+e9lr2bA6Y2TE17TBTUq3nsDI
         HarjX0k+lV4Bz1LKPS7us9VKcR95hsqwcKSnQtSx6wT0/FuVEk5CCjQo4futcCqDZAK3
         pppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721831134; x=1722435934;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INJxRVQhvImc6Le3O0/25JlCOzo9i9tocuAP+sk2BAw=;
        b=dawB8yT74z0z9XYh+JRPOyISa4TpW5Yhfco0f0GdJkKyzlftZqID9fO9Z78DnqIzqv
         nIqT3mDXYmiqJL//LrYIKgIyGqkS3PqlfYmoJP2An5IlC/uM6ACdLwhP+G1/7TE+zufV
         Pk2p25v0H7w4sviYA5ZvzdR7csxhvnX79T7xZSHVXKFsiNTQADmXoe9mkEFI37DWkvmI
         KfKnlpP0LuzCWY2hMpYoRZeUVp6f+J2mPyl7WaJtpXtCbQHnJdsax90lsY1C8TkH3uAg
         IfbFa66Dy8HVnHhJJuhN0XLbuAwgwq/A4kbathDfppHRyiH5MavlkOPahC+4jgxmPXP1
         BABg==
X-Gm-Message-State: AOJu0YySnnTnTW9+jk1o1rcV/L9eXc66VNXJXVA0fvpBjRQNzfkbaAuN
	mv/p6RwktLejC8KB/aa3iD3WtsALRvtGbAIPgH15k3SwsLmagnUa/lvq2Q==
X-Google-Smtp-Source: AGHT+IHNhmqpVMxdER8byO39Pn2kGE1n0ze2qA7KNcoLm4AUM2y2g6/fpRVtmLeBsOgpbmlg1R3q0w==
X-Received: by 2002:a17:902:c94c:b0:1fb:6616:9cd4 with SMTP id d9443c01a7336-1fd745f7de0mr117497875ad.38.1721831133943;
        Wed, 24 Jul 2024 07:25:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f25aef3sm95225035ad.11.2024.07.24.07.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jul 2024 07:25:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5ffd1dae-cff3-4837-a178-540b5507ea64@roeck-us.net>
Date: Wed, 24 Jul 2024 07:25:31 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] hwmon: (max6697) Drop platform data support
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240723154447.2669995-1-linux@roeck-us.net>
 <20240723154447.2669995-3-linux@roeck-us.net>
 <ZqD7mNVlulOfeCYW@tzungbi-laptop>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZqD7mNVlulOfeCYW@tzungbi-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/24 06:03, Tzung-Bi Shih wrote:
> On Tue, Jul 23, 2024 at 08:44:43AM -0700, Guenter Roeck wrote:
>> +	if (data->type != max6581) {
>> +		if (of_property_read_bool(node, "resistance-cancellation") &&
>> +		    chip->valid_conf & MAX6697_CONF_RESISTANCE) {
>> +			confreg |= MAX6697_CONF_RESISTANCE;
>> +			factor = 1;
>> +		}
>> +	} else {
>> +		if (of_property_read_u32(node, "resistance-cancellation", &vals[0])) {
>> +			if (of_property_read_bool(node, "resistance-cancellation"))
>> +				vals[0] = 0xfe;
>> +			else
>> +				vals[0] = 0;
>> +		}
>> +
>> +		factor = hweight8(vals[0] & 0xfe);
> 
> It doesn't AND with 0xfe originally.
> 

Yes, but the original code uses the value in
	factor += hweight8(pdata->resistance_cancellation >> 1);
	ret = i2c_smbus_write_byte_data(client, MAX6581_REG_RESISTANCE,
                                         pdata->resistance_cancellation >> 1);
which is effectively the same. I can't just use
	factor = hweight8(vals[0] >> 1);
because, unlike resistance_cancellation, val[] is an u32 array which would
not auto-mask the upper bits.

Thanks,
Guenter

