Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C38A3FD96B
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922897; cv=none; b=ABUVZiJxpCwHpeTpEVV2c/Udv9F1wTLEDi0FyYJHkyobwZSbRMBEj8l3p4bNNEJSmKMQAfuu/DJSASCcX6znedUe4EHfZPKu6fekHB+XOhhm6fX+vlsTGzh+bt8aJGMZDXfEqjOXdcQw0kDH+9QiulhQEdBR/rYQm0A+nSQ4PyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922897; c=relaxed/simple;
	bh=yyrFSFdf47pfG7cqAlOGwmGGoUHKRom2gh1K0ykqm2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DgSvorvdeNSSn42UrV5l+AOJ0AzoXqKq2RCaz/IVso4gvrSrzv2UWPafPYfIJhxXFNbV0NGomiNFYSaLYFHJcZtsZXHFoYhuvRGLNHfOyMtsDX0J8nYBprQSHeQtUv0T9a1m+dN01ggg+y5AifF/okRIEWNSn9joZYTlyc38//I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRBBzBMg; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRBBzBMg"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38f620399a0so1013724a91.2
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787922895; x=1788527695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amFbxCkArEcBe8hSFjUDtB37mBSbIy+Fx0l703+Zfi8=;
        b=BRBBzBMguts7bRIpLrudwnoBeA0Pbd1DJMsphXAHn/fGrsIAzBFUpbRzp+MYOhbOEa
         vBkollbj7U1pNHU/DsRGK3rijeQY60mq3Rp8vXz8DfafaEmPngOMIJs5GvOi59ikfXaz
         KgZpRac35nlcwt0t72xXPUDx/psSNruA7AlTHMzTmYip/YIJXXYd96SyX7opUY7Y37Yb
         ntnQCL1MIkMhBMqAVXcEGdItNgmSXWWh1LcQeizK6zkYp3KBUsbHhheCkUjfK9Y0G0gJ
         f2GFz3Yd83K3qhmNHAtv/S9xq5mVWGtvZ7YHneUAYXF5IHz62M8bytHKyKyqXmMz0nQS
         zO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787922895; x=1788527695;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=amFbxCkArEcBe8hSFjUDtB37mBSbIy+Fx0l703+Zfi8=;
        b=YLKLK+uaKrEHP5gWY5DMmWz04ryFhdy9wjflTFr1HQVYjj/tmcvIRdDVEJGp4pQRrc
         xtBtMogOb44Qvf+J0uWcxOCDDfOWbDzqU593NfAqoWaAaM/1AzogM1g0V1litfYBqn5j
         v+96/lS/H5i6NIsAcPjWo4I/LQRSp2eyJ2a/pvh15/YGG01i5KSbW9FBk3sx4wNyMqgM
         lO8ZY7XlMMQPioBGP3iCNoPTN2ciTyRsqxEJ12vRM9YYVqw+qeTKXUxDyyN7mI3pNv5X
         tjmZyP1YYO3fPLh2yjWfr/YC19GOTLqrrfhEZAW6dWxMkTj/xn92JDaKPjMw9nLdNqoh
         YLBg==
X-Gm-Message-State: AFuF++m6JGbzLSwVgehRLX0yYafix2JF/1mEH5KuuyfD/wor7uc1Pgz4
	2wcFlD178WfX0da+pOtjfPaQC5bw2SvS/ubkYrR3ysZuqemglGM47HUz
X-Gm-Gg: AR+sD10fY5BnBKxZazQU/yeZ9oGvjbBCAsP+uBW8r3+lV0TXRbdkSwfYzqdaSvNYCAE
	rNtYMUHG3ty44Esh/gpE8CcQvOqjsoYl6zSm7NheSTYWVyDvwKkU+VAWZWdvW0f0aJHxwS4oAei
	SVTTzSNJNS4QJ+IgCoXOWknKGB0R2o+b97ClY2h6mcsG0RBq0SUQTLv1F2ul4MEyYV4W5pYR9iO
	Uyq3bFMxKcao6flnKtD07s+fbF5jG19VF4IBkFOa5N5Np1BuzCdJygyrhd9VZIWswIDcCUb7qQ6
	Br9BpJibp3u69K28MGVKxHJvlV1up+OHwFWyWS/ekFZCGi9Q0totQOrvA8Ky1HOfVMMILSgB3rX
	am4ClkFpcmM2Q/L0NR5eprPL16+qfl9Kz4FD317/iLy6ORjSgysn4hIuWCZ9uOaYKA9vRXnzTsX
	e8I24Tnqr2QIYLZqDV5vHh9oGupbepLC9UtxPgUOwSFvrMItqCdjDWS52HEKW0snCNjcVEHnImp
	3sejLZTR5mYlS2dxyKtrNLGQmdYNWmhX6j7IA==
X-Received: by 2002:a17:90b:2e0e:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-396d0e34e0amr15595531a91.2.1787922895320;
        Fri, 28 Aug 2026 06:14:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc555b0sm2464132a91.13.2026.08.28.06.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:14:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fcb78e74-df8b-47f0-831b-3a1d62238792@roeck-us.net>
Date: Fri, 28 Aug 2026 06:14:53 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (corsair-cpro) Remove debugfs entries when probe
 fails
To: Linmao Li <lilinmao@kylinos.cn>, Marius Zachmann <mail@mariuszachmann.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sashiko <sashiko-bot@kernel.org>
References: <20260828061949.3151191-1-lilinmao@kylinos.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260828061949.3151191-1-lilinmao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/27/26 23:19, Linmao Li wrote:
> ccp_debugfs_init() registers debugfs files whose private data is the devm
> allocated ccp.  If hwmon_device_register_with_info() fails right after it,
> ccp_probe() returns without removing them: the HID core then frees ccp,
> and ccp_remove() is not called for a failed probe, so the files stay
> behind.  Reading one of them dereferences the freed pointer.
> 
> Remove the debugfs entries on that error path.  debugfs_remove_recursive()
> waits for readers already inside the show callbacks, so ccp is no longer
> reachable through debugfs by the time probe returns.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-hwmon/20260708031612.BD7E61F000E9@smtp.kernel.org/
> Fixes: 5997eb60f896 ("hwmon: (corsair-cpro) Add firmware and bootloader information")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> ---
>   drivers/hwmon/corsair-cpro.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
> index 8354a002f4c5..30fe5d8e724c 100644
> --- a/drivers/hwmon/corsair-cpro.c
> +++ b/drivers/hwmon/corsair-cpro.c
> @@ -638,11 +638,13 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   							 ccp, &ccp_chip_info, NULL);
>   	if (IS_ERR(ccp->hwmon_dev)) {
>   		ret = PTR_ERR(ccp->hwmon_dev);
> -		goto out_hw_close;
> +		goto out_debugfs_remove;
>   	}
>   

Any reason to not move the call to ccp_debugfs_init() instead ?

Thanks,
Guenter

>   	return 0;
>   
> +out_debugfs_remove:
> +	debugfs_remove_recursive(ccp->debugfs);
>   out_hw_close:
>   	hid_hw_close(hdev);
>   	hid_device_io_stop(hdev);
> 
> base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f

