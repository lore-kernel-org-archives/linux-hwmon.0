Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D066328601
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 18:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763404927; cv=none; b=AfXJ2o7J2e8zGv3ksO/VMutChWA1HqNgsyvDWvnJEedfEOD28h87lx5lgcejGdWWOZQ2cNEIsah7ai4hF4kip1nCwfmRNJViQoyda0IMXgYVpBFpdr4WZwj+Dk1NaQTM/6cpT6yWYT1EGS27jYduHnIQpFqPkJGoyDpBdFo+QQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763404927; c=relaxed/simple;
	bh=Fb0kiMk1db9b+C+BMa3b135reYb4u/6LTsUBFCQ4ihk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rImbiIpedldCLFrLusQnRE4I3RyWASVMKVUBNJv1K+xOYUFHQqJAAT4+R7C8GDu/+SAPIZvXGInXY1X1WRPZtiwiyF7QP0Fdv7tGUtEHD6YN7f8gyaFYP8Nn20UME6/Nw292w3tcW4ScInYWmvMRSD3vlH5QkS+5Y1dCDDhVs5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ahjd7h9B; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ahjd7h9B"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so4433420b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 10:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763404925; x=1764009725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Rj0U0J60qaUI6NPkPAzL6z8kEuL4a7NB+qCeooe3MHQ=;
        b=Ahjd7h9BCIUUyGVmUxCXZD2Aiyc2qFlHoQ/YozlqmuYQ28Kr1YZr5HagiEVGSuB+ks
         AL+ZGxjUxrAAqjj5mr7qCzJ978n45qqrrHhtBDY4hq2ebUT104FW3NM2IRqO9XWWCwhA
         DcuzFTvJ/Ms76GRDrhfZQT7g1jejyM1hORRPK/fMqNtxC5ZnYqg3K1XFcQ5QXfbI5+lp
         nxUBIbPubUfIfmaTCaYA1iImlEhS3cKr5gXILfuW55zStjnofadw24gShafAxhVgJY0i
         n5wE6PBXehQnfvafIM+Y/wKDVNK+DiOyK9DrK89ITHTatNmUw0n1P9Cj8fjdMH7cRB6h
         vWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763404925; x=1764009725;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rj0U0J60qaUI6NPkPAzL6z8kEuL4a7NB+qCeooe3MHQ=;
        b=svAS6qgiDOTcdwLMmVmZCNLodzCrPXIpYA4N50Pokja9r9EixhFQ3ODiVO0A1gF4mY
         mbhpjY2a6rMzZIUP3oULxVyre24Yc9zcI1zQ/scbVITCnwZzhdZ0EcXyVlP2czKm6rsb
         vKoIWBAzMtQuKzkpHcLtNuSpqmUl0Rkd9vSDDVNmavn2XBYoeJWmpDAb1tUEAF8pPsSn
         PfSaR+S3Yg4qmj8NDPqGZ7ArvVIbP3ZzK6RSZPKV+vuqCegNrM5vUeDZ0HmFne9m+BPz
         DwT47SxT9GiPxkEnBRT1+n5YCcB8LSaXk7ezXfi4JfVwMVv+FT73aSTEzz/ZfmfsX9kR
         bJww==
X-Forwarded-Encrypted: i=1; AJvYcCVo6h+237nBt8jbdtt4YeW2+xOrJwkLzQJKKTB74PjnjEcpNHehutsDZVicOWkf2eCvAS2xKtOlqPVLoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw052Bw8M+CTJWsmixlxeAmqDoa8XcYuSpyDu4OKmh0f8z1gQsX
	32VIShgmGxrBniTluxVfv1JuIoNWXYZsFi1dM+U9n8uyZu66Hf+kXfni
X-Gm-Gg: ASbGncu9/fPFcX3Y0I2AEM/ll8MQU+DkDNHtRncMB2jLPgjSFlmG+zC8TuKan3KnxRd
	qx/4MbNNR26mjtZtxCjy7ba7S82PwgrRglQChRN9V1NZdnw2Naaz5h3XseBi9astbLCoSXqNXYk
	0OnZJYPjUz9Qlp/1VLC0NQ0yBAs1wEXpK7wb5xjiPNNACmBch5tK1filcVGMk4pkyKryUaFYerb
	Ercu6PgNTaPE+kiNd9B0MUDLjA9DruwczmmK/MQO5YqP3sqjVI+yRwiSJa0QfjJNauAWAB/+3K1
	SCLFj8fkwUUJhIdOuNTAxucuK0eemoDF/pnfcwUx6c1QCeEzu2wBnZcBsYCTK/vdQyiuBeRFKyY
	m8hR+V+m8s5q7YJ8tyE4hWF3dphbRzq2DPfFLdSaSl3oYaa2Z8p1FiT32OVVd4IuRcQQtW0+s8p
	GWqeXCazzpYwEHQM7vj3UZuLHnzylAiK+6It7Ue6lOhX/oeVzC
X-Google-Smtp-Source: AGHT+IGB2tBV8Pid3WerYkAdV8WXMHuddOnn+SQiuSHhTpv+m17wp3OsYg5faNFGZfuEEnIHW4BzcQ==
X-Received: by 2002:a05:6a20:5493:b0:34f:b660:770d with SMTP id adf61e73a8af0-35ba259aad4mr15955942637.55.1763404924794;
        Mon, 17 Nov 2025 10:42:04 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc37731d21dsm12987352a12.34.2025.11.17.10.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 10:42:04 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3b28873f-e72a-4fba-854e-e1be4576a338@roeck-us.net>
Date: Mon, 17 Nov 2025 10:42:03 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (k10temp) Add AMD Steam Deck APU ID
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>,
 linux-hwmon@vger.kernel.org, linux-pci@vger.kernel.org
Cc: Clemens Ladisch <clemens@ladisch.de>, Bjorn Helgaas <bhelgaas@google.com>
References: <20251117.193725.1655587639439350088.rene@exactco.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251117.193725.1655587639439350088.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/17/25 10:37, René Rebe wrote:
> Add AMD Custom APU 0405 PCI ID as used in the Valve Steam Deck to
> k10temp.
> 
> Signed-off-by: René Rebe <rene@exactco.de>
> 
> ---
> Tested for nearly three years on my first gen Steam Deck.
> 
> index b98d5ec72c4f..1ab64adb63e9 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -553,6 +553,7 @@ static const struct pci_device_id k10temp_id_table[] = {
>   	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M40H_DF_F3) },
>   	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M60H_DF_F3) },
>   	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F3) },
> +	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M90H_DF_F3) },
>   	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_MA0H_DF_F3) },
>   	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_DF_F3) },
>   	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M10H_DF_F3) },
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 92ffc4373f6d..d86b203de1df 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -573,6 +573,7 @@
>   #define PCI_DEVICE_ID_AMD_17H_M40H_DF_F3 0x13f3
>   #define PCI_DEVICE_ID_AMD_17H_M60H_DF_F3 0x144b
>   #define PCI_DEVICE_ID_AMD_17H_M70H_DF_F3 0x1443
> +#define PCI_DEVICE_ID_AMD_17H_M90H_DF_F3 0x1663
>   #define PCI_DEVICE_ID_AMD_17H_MA0H_DF_F3 0x1727
>   #define PCI_DEVICE_ID_AMD_19H_DF_F3	0x1653
>   #define PCI_DEVICE_ID_AMD_19H_M10H_DF_F3 0x14b0
>   

Per guidance for PCI device IDs, this should be defined locally in the
k10temp driver, similar to PCI_DEVICE_ID_AMD_15H_M70H_NB_F3.

Thanks,
Guenter

