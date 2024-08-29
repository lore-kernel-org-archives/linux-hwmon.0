Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943291B81D5
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 16:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724950659; cv=none; b=gHIxCfNHTS9ArsKUfMOYNzpG0Doogio4z3vxLlGSlvrYFJC94go6GaIjCqHOQ9XKrH2RBWz3Cm0H+Wl8sDI/+DpXBh15hHW6dEVI/kA+MH7tG67qoUocNKVarT6jrItMf6N/jUS1k1y1KpC77FJ4xWib1WiTJQDvfUFZS/njioQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724950659; c=relaxed/simple;
	bh=3Y7gkmxga90+xyDDkMSygFu+vPOR7mCPtvsfw7rDfQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Js86+lV0zFBAcVg0vVHOo9iwdTmBhvMwsXvxcJyzyuXBKp0p2npvcYi7pOIWBhsHWTSfji2jJRhJYMJo7WLVcL8rwfYOqSRShuVHDj+vfeutYhryypxJ1D/xLMhp8ajDVfV10PdeMDR7I1LYqhuuHS/dkTD0mMIeb+NqwhOIuug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKByKKXI; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKByKKXI"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70cec4aa1e4so622499b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 09:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724950657; x=1725555457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+2VVQvCGLNpMvC19gLP4LS6rPvPVznjqFbExANQHORA=;
        b=SKByKKXIv6rztzayu5qGduuXctTIFOH1FMoffj7kqxR7VBPtdnXQWbVxtgWMsbSb3N
         cljfSjakW1iZfBN3fqlABDvrIKrFOD6qpahZ3yd+3R7IMz1wqK1rt9q9rbV/QKTNr063
         E+eD8gPVyRLFjjLqGZO1tmqQvyoiU7Pfl6FGUc6IWBSkeRi5zxJ+allThIotfj+ow+wT
         EDnM3iEdYuczvrL0I8GsvUgt9fS3hq1iuiHXXP5iKwaTomeIpxw8IHtoOdGa2JUdAW+Y
         hQ+BU4upkN147kECemlYQXSFaXfjHDAanR/8PgDkKT/tVID27OwWvUCFNrrMxZE3/o9b
         Szaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724950657; x=1725555457;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2VVQvCGLNpMvC19gLP4LS6rPvPVznjqFbExANQHORA=;
        b=S4XbuTphyWmZv0Qq1ieirI+Y99vAeYOLGYIVa7qblGmJ2xafYi0Vm35SQvrV56y394
         RywJVAS2NRf+iRn/J/ontbhJAuwb0NGsOnFgeM/cFppWyiF/2vm5+/X5BzBNBSpiVM0C
         4uCJKuO9eM+wTy3uGU+rRCOCThd1UV4Qe8blIcnI2Jy+MH87dISymjZpRpgb05cAyHQ1
         S4kpIFc4uM4lyqlheLDqiookB/9TiIOV18cM6YvJ3NwRzpfnILl1fWYtr1b92i/xVOBp
         BWClk1mfR5NkqqXb6J7dCpPWLb36LRrS+ynUXZ7fDf3YMQWBxS63codS5HTiqj8eiQUG
         vsJQ==
X-Gm-Message-State: AOJu0YznB3+7BIpV2Y9XoI2GYJn3/U0l8IpwzgYKVGyhK/cMlkU87hy4
	uaEmJuVmkbTF47uVy0hY4U+cdBq1H/tHm1oxufRS7bmkwfIcbTOU5nTHmg==
X-Google-Smtp-Source: AGHT+IH1oEjx0laMxoSZ0AyzSh0Dl+NocSF//3trddXRBg6R44doK01XGUJGOQMte6Vf9PZZfjt6MQ==
X-Received: by 2002:a05:6a00:9444:b0:70d:2a88:a486 with SMTP id d2e1a72fcca58-715dfcf40a7mr3784961b3a.29.1724950656684;
        Thu, 29 Aug 2024 09:57:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e569e993sm1347633b3a.110.2024.08.29.09.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 09:57:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <aeb05fc6-c070-484a-8b75-4f72a8a1bb2f@roeck-us.net>
Date: Thu, 29 Aug 2024 09:57:35 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] hwmon: (ina2xx) Consolidate chip initialization
 code
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240827153455.1344529-1-linux@roeck-us.net>
 <20240827153455.1344529-10-linux@roeck-us.net>
 <ZtCL2DaoC-Am1F2e@tzungbi-laptop>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZtCL2DaoC-Am1F2e@tzungbi-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/24 07:55, Tzung-Bi Shih wrote:
> On Tue, Aug 27, 2024 at 08:34:53AM -0700, Guenter Roeck wrote:
>> +static int ina2xx_init(struct device *dev, struct ina2xx_data *data)
>> +{
>> +	u16 config = data->config->config_default;
>> +	struct regmap *regmap = data->regmap;
>> +	u32 shunt;
>> +	int ret;
> [...]
>> +	if (data->chip == ina226 &&
>> +	    device_property_read_bool(dev, "ti,alert-polarity-active-high"))
>> +		config |= INA226_ALERT_POLARITY;
> 
> This looks wrong to me.  The polarity setting should be in INA226_MASK_ENABLE
> instead of INA2XX_CONFIG.
> 

Yes, I fixed that already. Thanks for noticing!

Guenter

