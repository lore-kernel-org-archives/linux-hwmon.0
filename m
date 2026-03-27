Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FE92853F7
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Mar 2026 18:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774634498; cv=none; b=oLyqDjZgGMl+OJPUAixhXqO9yjNVddwV8rpUiAndmLusZoPq/4rpaf9Bk4UG825lSbWZoEO5KsJup36DRhBl8HoqYSyUtUTc5RHhzypyDBm7QV3jmhvftf3zezhv2QxCcoUqSIjCOA8cBjHf533+Djiohv2/jFpz4w2kdhvL3D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774634498; c=relaxed/simple;
	bh=o3kf/NU6ggA+96hxJ6s6qUz0gKvF8dPlLa9wtBo3yVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TctK6QONzULd4jHLazi30x2cq6v4uldeEaH643ZqGReqZJ+HZfNZ9fGfWw5By8fN8GpgAp4YmJLj0HMxM9FYHKRmQZRfU0IUdI7ZSMMpqtnU9JyWewvuKMO3sbpanlregnRkel+hWAwAzzwgUErmnNkxxwxogdVpXjZ7v+/LmD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqwO9QjB; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqwO9QjB"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1271257ae53so2701801c88.1
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Mar 2026 11:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774634496; x=1775239296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/K7jFoykzGfK1EXSC26RouoI0qFu1tFlLRSZanIFZiI=;
        b=IqwO9QjBc4f9eNLny9XWLcRkn2NXBWTkC3oPe1Khl0BhkFAYuciTbj5ihvtxpNQGHf
         Sg2xJ/2oF3iohkeLMx8gDPG4sOgnEU2MrqGHhD/qAmZw8MbRCrH7dG+LmiaPK9V2X1Zs
         2uNimzKGBcN8auf+A2jtjOV7Vdl0Zkgj40wD3rCKG4oRJkw9Ha6VG/eXWCsnD6H8CwcN
         3LiNY+dz0LdukZS33S7QyESQU7FuGLrqPEP67u98Q30yssbJsrNg6mGy71nBEd2Ml0UU
         5SsMpTS+G3iX4f1Aa6KQPFWbcSFSE7vY2qxhoY9WmOohLmd34LcuLylJNN9Jlgs090zx
         Rdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774634496; x=1775239296;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/K7jFoykzGfK1EXSC26RouoI0qFu1tFlLRSZanIFZiI=;
        b=m5ahkMHPXCKyWG1NnbzwPmOuhcbr1qq42FAhXZiJrwm/tA6cAMeKGLRRIgilBjVyy5
         J6oNXQTizmSGKwQWmu7At2UgETBxNSkPWiUuI61eQ7AH0+p+/rpFAvIhi62jaky82cr4
         tDZPcpzvAtNd7fBfItIDmS3vIsUaAVMasO4TdM5cWVmNJrydXikTvPTIXqP7CGIVSv0D
         g8RlpllB652hnApGnrqL4iSjb+ht3im0ZtJdpsgiPqumZJKx6Dt59hSIRWOp/vY7ITIQ
         4WgtQR4vMcm9Ja43JQaoSnzPoy1HN/VrXcID8n05GdYCJGh/kcx8PaS5rRuNDIXrQdHW
         7E1w==
X-Forwarded-Encrypted: i=1; AJvYcCVG/ZJZ1SN5zOEbA8/JplNDGzPPfiowKuKj4ccutfFq+d9oCSwJPWkzvCNLgXF9V4oBS9K0m+LkxYwvrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWCpo1p2NKyfrVqn/kaItczsWyE2GD87tIDjB+MRbnGkJ6wtTU
	VeG8Ls5Ns5HZdhxKgaTpqkYK4YME+WOI1nJJSrtmcLDKA5Yg86lMsOFI
X-Gm-Gg: ATEYQzyGweTSOfsYM9ntxxN+NuDv8UkhhUC/evKV3m0kE4HqaKxiiQk/rjK7wN6BoQM
	x2kqikRIY45H2otIV7wbaWsrLcFeCmfslaXu4P7rF/8O+VTvY2aG2zC2PrRFMgVB1GrwR8nwI5x
	uZX4HEtLZuBXsVcqoZmh+qkS6OQ3OlSv9nf8EZs4TJDv0ub1d4JCw/UypS1sh7+MnBRLogMjDUk
	Wpi2cIiIw7LuthEuL05IfaWxmqn/JE8xILVOc58FhnvAWsFSnpnan/vx6DcZrj8uvx246OhuHxF
	+btbt9onYLErBAnNKl67u/Nzy9MJnMl6UmKAFuSNakgeLw2oA5Mm0puerKFYt//QTG70e2DnMJD
	3WBhuygES7aWS/DLVNbOqceu8Iku5Vi911PlJNANQ56SFFRPQXEsmx6WXelbH12r6pMlOIxG/ix
	anBdo+nxq+uoWKsdQtnH7B/MNiIrLr5dfBJtsXwBpmDaiCTwR4wCuQ6Sknw8JZCO7wU/LQ7ke0
X-Received: by 2002:a05:7301:6781:b0:2c0:cd9d:e024 with SMTP id 5a478bee46e88-2c185f37df1mr1902434eec.28.1774634496103;
        Fri, 27 Mar 2026 11:01:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b249fsm8141eec.19.2026.03.27.11.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 11:01:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <24b5d629-d980-43e4-960a-c7c1dbacb7b9@roeck-us.net>
Date: Fri, 27 Mar 2026 11:01:33 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] hwmon: (yogafan) Add support for Lenovo Yoga/Legion
 fan monitoring
To: Sergio Melas <sergiomelas@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <7ac0d696-327d-4dfe-8ee3-73242255ad32@roeck-us.net>
 <20260327012925.266336-1-sergiomelas@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260327012925.266336-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sergio,

On 3/26/26 18:29, Sergio Melas wrote:
> To address low-resolution sampling in the Lenovo EC firmware, the
> driver implements a Rate-Limited Lag (RLLag) filter using a passive
> discrete-time first-order model. This ensures physical consistency
> of the RPM signal regardless of userspace polling rates.
> 
> Concerning youd doubt:
> Sorry, you lost me a bit. Isn't that already implemented in v8 ?
> 
> V8 had the logic, but V9 adds the extensive database and documentation
> (see yogafan.rst) to guarantee all ACPI paths and 8/16-bit multipliers
> are correctly mapped.
> 
> Please disregard the previous v9 submission. It was incorrectly formatted
> as an incremental diff; this version (v9/v10) is a complete standalone
> patch for clean application.
> Apologies for the noise.
> 

I didn't realize, but the above is really not an appropriate patch description.
Please follow Documentation/process/submitting-patches.rst for a more
appropriate description.

Also, I noticed that you send new versions of your patch as reply to previous
versions. Please don't do that. Again, please see the guidelines for submitting
patches.

Additional comments below.

> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
> 
> ---
[...]
> +===============================================================================================
> +LENOVO FAN CONTROLLER: MASTER REFERENCE DATABASE (2026)
> +===============================================================================================
> +
> +MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
> +-----------------------------------------------------------------------------------------------

I think 0-day complains because the length of the underline string does not match
the length of the description.

> +82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
> +80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> +83E2 / 83DN    | Yoga Pro 7/9     | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
> +82A2 / 82A3    | Yoga Slim 7      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
> +81YM / 82FG    | IdeaPad 5        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> +82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
> +82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
> +82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
> +82WQ           | Legion 7i (Int)  | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FA2S (Fan2) | 16-bit | 1
> +82XV / 83DV    | LOQ 15/16        | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS /FA2S  | 16-bit | 1
> +83AK           | ThinkBook G6     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> +81X1           | Flex 5           | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> +*Legacy*       | Pre-2020 Models  | 0x06      | \_SB.PCI0.LPC.EC.FAN0          |  8-bit | 100

Since this is known based on the model,

[ ...]
> +static int yoga_fan_probe(struct platform_device *pdev)
> +{
> +	const struct dmi_system_id *dmi_id;
> +	const struct yogafan_config *cfg;
> +	struct yoga_fan_data *data;
> +	struct device *hwmon_dev;
> +	acpi_handle handle;
> +	int i;
> +	static const char * const fan_paths[] = {
> +		"\\_SB.PCI0.LPC0.EC0.FANS",  /* Primary Fan (Yoga) */
> +		"\\_SB.PCI0.LPC0.EC0.FA2S",  /* Secondary Fan (Legion / LOQ) */
> +		"\\_SB.PCI0.LPC0.EC0.FAN0",  /* IdeaPad / Slim / Flex */
> +		"\\_SB.PCI0.LPC.EC.FAN0",    /* Legacy (pre-2020 models) */
> +		"\\_SB.PCI0.LPC0.EC.FAN0",   /* Alternate (Certain Slim/Flex) */
> +	};

Is this table even necessary ? It should be possible to identify the supported ACPI
object path(s) from the DMI table entry.

Thanks,
Guenter

