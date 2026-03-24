Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD863EDAD9
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 11:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352368; cv=none; b=HrspgSMR3uuOGMDzTDR/rios2/1E0QfVfddSbTXMGJR3CROsP8EpsTHOcF4ZwGgn9UReVlaIH/oXungllHLWtddZxnuKxun3pdSt6un4VJJZOTMj/WVUHUCeWfcTdZP4eMv88yYILFji+K3RshFCy+hHFyv+VHkzEjmico4jFXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352368; c=relaxed/simple;
	bh=PDFPeDWBXH0OF27IClRhT/UuqvQMIEeVEFwye8VKhQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBNjdgIe+1b7OeAUoaE1qmzWjr8c0wVyNjRZpljX0Sdo27Wjdo2QV+Y9m7UzOZno4KTEN1h06PyDZlD2Ifw+UQlNAZTO6/rqh4mmVeag93ijWoSB9xQ9Oran0MV9c8wBg2pJkrLMTLApvHfMnmEDbK4G1Qmj5d5KB4jsQMjShtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bj9TsJqM; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bj9TsJqM"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c0e3a2605fso101666eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Mar 2026 04:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352364; x=1774957164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9oy4ye8U5X50eKcjgSsbe9Ht5UDnG6Y/yDd1Q2SO2EQ=;
        b=Bj9TsJqMaEnR0blXMZdSSib7emsrmUYJYVaspFHbFVGB9HO5vrp9p72aZ9ojqA/D72
         DFY95m/PM84jP6dU5VKYrp3Eg5pcj3nvqq5hR5QmljoFOuZGmCshCKRVjw1H7JrD1vwV
         UlAl6F7zFhxgP96tYkiD6fxmTcMck5d9sXTfEK9A8cfXo4gLy7Wv/10a2r+bY2k2TNYu
         xoe74GjoAngyTgmugPdgaYpgyNDTUcznnpR9O4+yTxrD6PXn/UCeq3qrSYb7lwW9dGAc
         zebRGDNbMAP0bQ3Falz2fJ4W+e0cJVzpg2WzYMD8YXbCE9ODDZ01YFta7X302pHMIYLl
         amag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352364; x=1774957164;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9oy4ye8U5X50eKcjgSsbe9Ht5UDnG6Y/yDd1Q2SO2EQ=;
        b=XRYiJHz/XJ9aD4OrQizCBISYves6ax0a1saia32GNV2AayvS2BM0anUZCCM0rLV9hV
         lhczAENv8ZIWLHpheF+tCDa5KfMuEd6QtFABuyV+Q/aVel+s2jh06IcmJIHuRTt987IL
         G+3Y8dmcxR5PH63YMVCnMh7wzoQlUKv5cNYLONiENBDyouujVwGfbDT2YujwE6VoWhKh
         CbxTvX2AGaCQJTTV0j9Ulu3Ni+fOq3xxATsDjVzc9SDR7ekIlO1owS8BQauYZ/pKTpMQ
         cOXuY4Sj+CnnLBDX4FdEd4MEhIYaHYDYcuPGemUUnXtKzW4zFNslNIekT0C3Yshrzw+E
         kBqw==
X-Forwarded-Encrypted: i=1; AJvYcCW9LUZepPwkmE7J0w+ZQu/8AMf8yJ/BLIbcD++T1aKhzjL/T9SRMxJcwoxTsdrUyCOaZxp8SVLQ28HAhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIJDem5JasXGoweYXLuH3hfbYQLJ9G6piujz3U6t/fTtAb1uJM
	XWFIZP537s2fFU3hhdElUqp0tlH5BrfjKNAFWaBQH0hU0wHIIDhCKOE+
X-Gm-Gg: ATEYQzyjPLT1qrl2eJfP4jc31+Y3P8EJOQ5KYsVugaIZGLFsLE3sj9arDzGQB+ipTPV
	YnXx1fmNQnt2wWEuqLPU+wVzZrrmfJV2lrX14Jae5aH0gWlzyb5JZXPccLpqFA7ZuR5vNoAtXCw
	mGAL9b6P8OyQPmmn/3KA79vkLMAcegnJk6wllvgulHGT7GLimZ83TbPBwHo//SxgdZ/peZers1p
	0vZUoQqJcCtzHZc0sXFna4WZJuUCRydx/LUBIMRGCZTBQmObJgm4K7G6TXwONn+WC8fMLimByrp
	WDHv+r9pT+psBFsOH4oYPePELi3R/BzcChgFtPX5yAdEYAxmxnGRQ8SeO0C/n6UgF3hGhnOQxCF
	QsYUtXH0W/0WN8/8LJmBDYexGlkEV78KLrC8LIp6oyP+yvmscEZkl+Voyvn5xNHLcY2tl//e9hA
	TpKySiVr5JKQTU58r+bQ+96zc6I4SszSvHxMk3Dua3uMLaPMRuA9KuziBGoJiO9ZLoMitYSDB3
X-Received: by 2002:a05:7301:9f06:b0:2c0:da6f:55e0 with SMTP id 5a478bee46e88-2c1097c084cmr8550193eec.27.1774352364093;
        Tue, 24 Mar 2026 04:39:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b29c74bsm15315133eec.17.2026.03.24.04.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 04:39:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f3915b73-0ad9-427d-b89e-5e4e88453a82@roeck-us.net>
Date: Tue, 24 Mar 2026 04:39:21 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] docs: hwmon: Update TMP108 documentation for NXP
 P3T1084UK support
To: Anshika Gupta <guptaanshika.ag@gmail.com>, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: lakshaypiplani77@gmail.com
References: <20260323162252.15508-1-guptaanshika.ag@gmail.com>
 <20260323162252.15508-2-guptaanshika.ag@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260323162252.15508-2-guptaanshika.ag@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/23/26 09:22, Anshika Gupta wrote:
> Add references to the NXP P3T1084UK temperature sensor in the TMP108
> hardware monitoring documentation. The P3T1084UK is compatible with
> the TMP108 register interface and protocol, and the hwmon driver now
> supports it. Update the .rst document accordingly to reflect the new
> compatible device and its expected behavior.
> 
> Signed-off-by: Lakshay Piplani <lakshaypiplani77@gmail.com>
> Signed-off-by: Anshika Gupta <guptaanshika.ag@gmail.com>
> ---
>   Documentation/hwmon/tmp108.rst | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/hwmon/tmp108.rst b/Documentation/hwmon/tmp108.rst
> index c218ea333dd6..cda280032710 100644
> --- a/Documentation/hwmon/tmp108.rst
> +++ b/Documentation/hwmon/tmp108.rst
> @@ -11,6 +11,13 @@ Supported chips:
>   
>       Datasheet: https://www.nxp.com/docs/en/data-sheet/P3T1035XUK_P3T2030XUK.pdf
>   
> + * NXP P3T1084

Sashiko:

This isn't a bug, but the new bullet point uses a single leading space,
whereas the surrounding list items use two leading spaces. This inconsistent
indentation might cause parsing issues when generating the reStructuredText
documentation.

> +
> +    Prefix: 'p3t1045'
> +

P3T1084 or p3t1045 ?

> +    Addresses scanned: none
> +
> +    Datasheet: https://www.nxp.com/docs/en/data-sheet/P3T1084UK.pdf
>   
>     * NXP P3T1085
>   

Guenter

