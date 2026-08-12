Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D6725CC57
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 02:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786500037; cv=none; b=UKzVwZjfNe3TfUTcfqx8p1jLXPLyvZRnGMOugOGHxj2ol2Aec4KiLD1iHaukQg6SQFpTvXD8lSaTLQx0cqYF93Nr+tnuKkeO+Va3E6tHv6l/IXrJnfbCtcSpEWtyVcDqi9FOpLWqfmoF8DVrdd/xDXSUrBJBfhaSHw/l1oJPPQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786500037; c=relaxed/simple;
	bh=GPBXTlW7SOQPH+uK0CElub8qyGn/QnLiQvlxJQ01+d4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WS6d47oXIc0bh2z/dVqJ5hAxFgN7buCbIkfVp1AzSE58AKlZM06IcBLzAWMxdcJYHJb0DYGXOwKXDSEa8XmuhJO/eXxv7x1Pv6RhBZsRSS++m3ppfMH3IXU3F0RzcbiMbc1Er+Fb9lC1rorM5LLMVOmcDY7ULGe96dAUvXvmMl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHecSaxh; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHecSaxh"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbb7926836eso334971a12.3
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 19:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786500035; x=1787104835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZACcf7exRcjrCk5fDPwTzXOv8TaK/AP9oot+ii6/ds=;
        b=mHecSaxhTB2dm2zsBZ9O4+xhnF7zEbNNE1Tm2OAVCTGo4myXRWLSNOfVcIn4h2dBfE
         /v8vDlzEsmZbelUFaMtORGio6XnaHVh07Zy4HaGb29kQYteAbUYalNde+qc+7Yitqkqb
         8i8pHs4emPWjn7eve3QC8OUa84hVLKeW/mD29uH0aPlra1R+mCcs17BnMiItlIYduZIh
         UUm9KOiTPrERqJrRCXlUS7T+xZpHwqOqSCES4XswcMOFsBFrARa92D7qUXl7s81/HYeq
         gEuKy+ibSnEu7oIUce+XRrDHPXiXN9V6OjGAGYLcza+k62o4EizJlG1Jr/aTpM7NG7Mm
         lHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786500035; x=1787104835;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bZACcf7exRcjrCk5fDPwTzXOv8TaK/AP9oot+ii6/ds=;
        b=P5cnPwp2oSzFRM1Kyrrl4WAstpdC9l+T2Ua/qKiznwYj+ingVYpjZPSm2O69/PD2Sh
         /v+AahZEB91MB0mVrYhwnINXOK5h7cPwC0224HLpAF6jeutJ9jCQg5zneztsojehfoBW
         hKPln/w/e3n7o615cjWCJptFrHbPG/f2jssBLJ7wODzkBoJKjBGKv3Ail7e37rLY6tMd
         9a20QtKq4F9I3XRlDpCEnrtb/gwPesFwhrNnnKd3rPd1U2d0PqopmEKadt/ZHKnQ59VQ
         bl4NPJUgEMGaziQlzJQwgB5+sixuOppM21uFzZAK7c3tqENlG4qr+f1tmU53iTeCt0XK
         BHGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEf3azPwNO0a41ON6xYZ2sXZpK4KBf1VYCchtGKzt5cbeQs6tkcEMDeu1donsH6MgknmbKEUVHsW1JvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf3ZJVoPcQ+l7/oRbfHp97rI8TxKEa06CeFEYDbECqoVRQokq2
	x4cAw+94OfbhVi108rZoaQxgtySXh8fLUSRIKaXVbT71KdyQT2ABlCTN
X-Gm-Gg: AR+sD13JBWTSKOxGWrgpC9UuD/PN3NaESPCiYfIhCU4d/NjhvCxZu4YIsnQ1TrvcRZ8
	L4fj7RlK0L+Wz4SKjw9d8YsxFJQlUWrRVoZe8TbGzObDl9OynQyAc8Y/noL3H067QBud64mltSA
	JzpCqmi5PmMQn+5GVeg1fsujwtRQED7vuWQjcQXQ45sF9Gu9W8BJBgTtrssrjgZvZgjwmNqlvAe
	0klexcwRs8zKMpDx4OprMEtxPnWkHT52drkasepRZBus2XT3DEd5QZTIGDzuE75kLVH5wwJcmXk
	tVzYN07aKN/fi0TkvCvkzEEwMNy87k2TdxR+SPnhjsT3teSrN1ZxQZdMoky+TfWsmf2a8/EyYE0
	EqcncBmEOPTBHmt9nmY90pR7xziiQO8T7D0oOXEQBDim6wnfXh8/teDhH/APd7ENwoekfrzCjG3
	1Q+/DANmPkzB1SP3ueoxnUePRdiRvpr888fLBEUxid6Kt6oYb7cZYZUIKaL37j8PBkU3NMYmsAO
	TSy2T9xq1FJ/sA+RRw9ClyWSCy65GvBJfBJwQ==
X-Received: by 2002:a05:6a20:e212:b0:3cc:3eb3:1b23 with SMTP id adf61e73a8af0-3cc3f729e25mr1190000637.23.1786500035214;
        Tue, 11 Aug 2026 19:00:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141245a9f70sm5397248c88.15.2026.08.11.19.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 19:00:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <81611a61-95d1-4144-a697-8bace4fa6ea5@roeck-us.net>
Date: Tue, 11 Aug 2026 19:00:33 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] hwmon: (asus_rog_ryujin) Handle missing driver
 data
To: Arie Miller <renari@arimil.com>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
 Will Smith <github@notthatwillsmith.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811233943.319729-1-renari@arimil.com>
 <20260811233943.319729-5-renari@arimil.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260811233943.319729-5-renari@arimil.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/11/26 16:39, Arie Miller wrote:
> Handles an issue reported by Sashiko where an id could
> be missing driver_data.
> 
> Link: https://lore.kernel.org/r/5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net
> Assisted-by: Codex:gpt-5.6-sol sparse
> Signed-off-by: Arie Miller <renari@arimil.com>
> ---
>   drivers/hwmon/asus_rog_ryujin.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
> index 9b34c6e06bf7..702edb831394 100644
> --- a/drivers/hwmon/asus_rog_ryujin.c
> +++ b/drivers/hwmon/asus_rog_ryujin.c
> @@ -506,6 +506,9 @@ static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
>   	struct rog_ryujin_data *priv;
>   	int ret;
>   
> +	if (!id->driver_data)
> +		return -EINVAL;
> +

This will need to be part of the first patch of the series.

Guenter

>   	priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
>   		return -ENOMEM;

