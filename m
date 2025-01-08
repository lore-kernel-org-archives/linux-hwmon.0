Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF00147C9B;
	Wed,  8 Jan 2025 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736346147; cv=none; b=bhDT0yqpL3Ry28qQhlAm8i5xgQzqsfvnQNhuMwljnJe9cldoaunbaXfZN/FHVdJ1Xp8ogj0URIbVxV6oi0kh/ZrB8MGxg0M8D7M1oGwEs5PR+FOZpWpa6cm4+kg3wly9zJw7UtIPJFT30u5ZFVoDonJlL53pLIg4FPTdC5wKF0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736346147; c=relaxed/simple;
	bh=eF9Pym/tODFqKpb433Up9DYkiRYZOdm59NB1sCqYLr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fPpO4MiuqKEwSi0WmQfpeFQA3uHLiS9Qke7sHvSzJwCxXAS/0pKMQD4W5ssNbkduP84GP1+nDZ6gZ/IBorL0t+uTYuaf6dpuHyd48z/uKASJKEE3im0xl40RUoixFablrpTYu+yNgyJA6+X7eq1ZHEO//HB8+t0C7PsEUHoI84Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ioRnJfNY; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ioRnJfNY"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21675fd60feso61183285ad.2;
        Wed, 08 Jan 2025 06:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736346144; x=1736950944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=44SFIExHKGXbvtcMfiOlWy7utSb3tAmZxaK580avNWg=;
        b=ioRnJfNYEE+eC9R8PtevYGameHFAWvhu6vmIdUDhDYyQmc7ETURlduKd7IUcKzVF0e
         K/kEZAJiuGiE0rWpAVlbebTORsu06WaIs4grOvNHlbJSAF6xhdmK+5OypeV30hRN//aR
         Oo+xZNAkuVOq7VaFwTqWmOBHnmgSVpvIDJjIrDeLjpos8sCB+kjnzxQYRM4hOiu1+VQU
         GPlk0c09yChXxW/lP4FLraMmW5vVvuubYklm+5v+J32kuabXLVhqTkwCnCV82lP1sKyb
         OsLoG6Ay7jR7Ui0mAYTvWSNnQsTRqv+VnZeEuTsbq0s0MzUCMnLJOKW8m95Y+fgVkLDG
         7cYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346144; x=1736950944;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44SFIExHKGXbvtcMfiOlWy7utSb3tAmZxaK580avNWg=;
        b=l3jf5IwfuHzacdYrfhAJlkZsqLDe7mv3LYDMXaMvqWZSk8a++8BYciXEOVXVWvv7NS
         UKiFp2Ry/YJ0CP6pCxBLOsgYcPLa9X50nC6o4dhVe9pXMEgGZeB8NUN/+I/m30kUwtJA
         YtLae4jmbimFK08z9sU2wpqNvj7VLJz866qzv76g0ov2OgoFQT2+zIzknX5sD+nc8ja1
         96yj+Sx8iRDxy5+XyEyuY6Dx+LM87f6CTl/068sdi8Bp3lwC58dVzhD3E+n4TATmLQWb
         lLm33KwN5cxqrPGvjCH+MlRYwKtMKmnlOVzwJ4oU0YINkv12u/yb9d0eW0Xo3X12nkLy
         GdRA==
X-Forwarded-Encrypted: i=1; AJvYcCVfkEtmn3eveZb/AUEK9TwrXdTlZgLPMu/mi578RIYXAemBPwt7l1RuATdg6qEPdHotMNjI2e6RVXcu399O@vger.kernel.org, AJvYcCW0sqInjPL9rRq2PWFySBdfhGrmUTj4SH1jjFqBx35C6BJLuyll/h17QUraMi+QxyBsA9fuPhmFJaMW@vger.kernel.org, AJvYcCWs3slDAPx9PR0BTKp9uvgj7h29lH3AH9+5nxkmoGd+1V6yMlyLMpheUxhGA+6jJVtrbAZF6IVG/4y7tiw=@vger.kernel.org, AJvYcCX1fGsn7snAr54UMuBuv4iFWWamSoeUwcjHJ973aOQo9eE5/3CpwMg8278CyiqdMLc4V3IM++yQW9Tq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+mbGCU8dhSukiw6adzZKoITSJKMUWc11ahm7ey8O6/dn9sIjA
	+oJne3Jk8OboJBLO5hAL9aCCHRypA9LCEO42ZxhRc9ltmjqiQtHz
X-Gm-Gg: ASbGnct1hBg9zsI5uwWCWbzQUGK1/m/NC3PNR2hiPqEhn3LGkPlSmja/whu59V671wx
	geNG0BVw19ADPywvVvOfkXIdtO/kAPN2w0Q0ufa7/rhTxWH+uEKlmu9qQ0raMX8iCynfb5Yh7T4
	14oQKvdZAedYg+p0wlz7k/G41HHKYu6EhSozj8HBZDfYtrBczbA1RIqQL9fEn9Lb8ickquwhghs
	YUvkQ8OgMRhIU1codhcqXDcGwVTZbEHHjJf9JmyWx978iZEyM0c1ASahYBpIa5mgPdCtkYda9SY
	iWKlMQexjHxRxi45jJ6XF4tXlm5ALA==
X-Google-Smtp-Source: AGHT+IHRpmtSFmL1boqwXcWT0FYWZ4oSPRtGVrcepNNLNbf7kJ6pRP9nkan0Ymhg59pgE4+0+9nYIA==
X-Received: by 2002:a17:902:ea08:b0:216:6ef9:621 with SMTP id d9443c01a7336-21a83f765famr43723745ad.31.1736346144565;
        Wed, 08 Jan 2025 06:22:24 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cde50sm326105865ad.154.2025.01.08.06.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 06:22:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <71bc00d1-217a-485a-a238-f057d2aa112b@roeck-us.net>
Date: Wed, 8 Jan 2025 06:22:22 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: (max31827) refactor enum chips to chip info
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
References: <20250108082531.15467-1-johnerasmusmari.geronimo@analog.com>
 <20250108082531.15467-2-johnerasmusmari.geronimo@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250108082531.15467-2-johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/25 00:25, John Erasmus Mari Geronimo wrote:
> Utilized chip info to replace enum chips to cater similar devices with
> different configurations.
> 
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
> ---
>   drivers/hwmon/max31827.c | 86 ++++++++++++++++++++--------------------
>   1 file changed, 43 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/hwmon/max31827.c b/drivers/hwmon/max31827.c
> index 48e8f8ba4..5d319d401 100644
> --- a/drivers/hwmon/max31827.c
> +++ b/drivers/hwmon/max31827.c
> @@ -47,12 +47,6 @@
>   #define MAX31827_M_DGR_TO_16_BIT(x)	(((x) << 4) / 1000)
>   #define MAX31827_DEVICE_ENABLE(x)	((x) ? 0xA : 0x0)
>   
> -/*
> - * The enum passed in the .data pointer of struct of_device_id must
> - * start with a value != 0 since that is a requirement for using
> - * device_get_match_data().
> - */
> -enum chips { max31827 = 1, max31828, max31829 };
>   
>   enum max31827_cnv {
>   	MAX31827_CNV_1_DIV_64_HZ = 1,
> @@ -95,6 +89,17 @@ static const u16 max31827_conv_times[] = {
>   	[MAX31827_RES_12_BIT] = MAX31827_12_BIT_CNV_TIME,
>   };
>   
> +struct max31827_state;
> +static const struct max31827_chip_info max31827;
> +static const struct max31827_chip_info max31828;
> +static const struct max31827_chip_info max31829;
> +static const struct max31827_chip_info max31875;
> +

 From Documentation/hwmon/submitting-patches.rst:

* Avoid forward declarations if you can. Rearrange the code if necessary.

Please follow that guidance.

Thanks,
Guenter

