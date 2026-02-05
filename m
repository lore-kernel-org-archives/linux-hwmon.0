Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CC93F23C1
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770301923; cv=none; b=nVFGRKsXG9WZyI7JUvZbBQdMfTB8hkTCZ420iftqiNvJPOvr3mCLbyht2YkSjR7IaWhge4wACi3sZRo1jgpdbf5uT8FYrUKHy2HtBk9B9eZHbcFq/2iBn3+64kREgkpELEndnJS1vQJeh6m8ur+3aMzulHHLs8k0E/TqmQnYrfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770301923; c=relaxed/simple;
	bh=KrpVq21uAPBgvMwD5bVVvOvj4m0oV3UgX1RtALao//I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCai3GnyUvtOjxf0GT2Tk9lPx+mxSH+m9CwcaTUpqxgzR+itm70+eu7+6K5JqimY0YX5II+FzFiTrrcAwS+uIYJs+ArjRUWOVW7ncD9NZBe+bp9HBjSJIdTvX4vpUUwyZUT5Yf5a/YRIWGPyj9ALflJUZtjoDF9JNUWF/W7VlJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtsXkg+s; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtsXkg+s"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3530e7b3dc2so827428a91.3
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 06:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770301922; x=1770906722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWMAbfW1h3czFpPAr6dxtSn9+/tMTdi7V3empbBhtRA=;
        b=FtsXkg+sNa0qzWzZpm3Ti8pleS/bqFWS+IWo+QERjEk+ellcBkOmpZT3CmEWmGA4HT
         nraZDIVCPqt3Il/Hw0IVbkDiH7xXGQdEEW6z71JFI9GqRevVcTRWBgTQLtWbK1MS5OwZ
         MkDoJA1UD0DB+t8uuUA49Gv4nyo43xe1gunGUhVqqEYMaZfyKYezqNBDLr+wZZH4naHi
         PNnrbwFLSGlfqu0Yv7RWc7oILrjeEtdvfNEZbf/GXCx5VEmnd+vTVa6PvnFpAgsdmp9m
         FcD1EIGWqvQ8RR+M40gTKOSzEnZpiyvK1ONCV/ZzFOL8B6Z8sjk+6glKDqpGwGlA9zSa
         YQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770301922; x=1770906722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PWMAbfW1h3czFpPAr6dxtSn9+/tMTdi7V3empbBhtRA=;
        b=K11YHPwU1JA7IAt5oKj85//WjINL1I3aepjxfA6gle7/0ZJp13z9MLOsehiV4IPdbw
         69OrK37cnPIGOZT8y2ti49rBwcOk6Tq5899nLUZsfagMUQ1TPzbBcFkvKVFbVDAa919b
         1yMNTPMPLv4btmqOUaxu13i5wFAP9QqSa8PPccAW2mrUuS7y9sQwHeShywLMrB73ZH3f
         F7wC++LcvlB8ivDG7eu057sOgxSkeT5lFB+9NoArzRxaK8tZw0VsDCr6I7000XJMaQ0B
         W0FHrxByrYLozQIZJR4/yppZ3oo2ZoIan8I2n1jTO/pkE0doEKC1arIt4/+hEkMyxhu6
         Ykuw==
X-Forwarded-Encrypted: i=1; AJvYcCXiIaXdnwYpVIVuElN4omz9lHsgT8VFKVfInVbl7etCYLZzJEko/TM8PFaXI8kbb23Tfk1q6bVmNoLQGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEpFhcdzQfB+lLnNwxhMAUdXm9f+ccE5pvwG1C87Jf4pTSkwQW
	6+hjVaxl/nyfx7FLBTGiX8hjttYD0wQwbB0cFFUgAIR4aUo0xEZ5k5E520lczAnC
X-Gm-Gg: AZuq6aLDF/iyC4s+GH1zIlsium+R4nrsjWNw6s8UIx+zcERzG3EoT2ROdnsA7tMSVsj
	ytXzzjwTIYFk49jxOd7CenLYRO3jpP8tn0JIQz3MXO4PDz6h49O6UZNZ5oIq4E30lmzYaKLCsiE
	QS85AB8AFaHIPeoP0kUdsoU1bnrMiw1JIAaPj1Zpa2wistuq+tyu8N4RKJ6OvwNLPz6POf0ZGay
	7pQgSwFTVkzfLxby9bmDU+ey+EJcQAbScevNKE6ABPgZwtn9/RWdA8A9a1a59caibg3yP9MnaEz
	2n/Dl8HGRmOSD+inkBVnbD1SePiyb/z3kZy8Z0vLqftz6CM6+PGqvH2v4p1UnORTF1vNeJaSoCx
	Q+7ylxgIL2Lbt1FwEf8AtL9YeidAqkONh8OzB4OD6OAW6j1t748RCOUu7jGMBQsk/ZUALHyHJvu
	4e8kBhR74JO78L/GlshbQ9LeodBoogj8aD9tQ=
X-Received: by 2002:a17:90b:5870:b0:353:5595:3247 with SMTP id 98e67ed59e1d1-354870dd823mr6355651a91.12.1770301922346;
        Thu, 05 Feb 2026 06:32:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35487726e6bsm2092960a91.6.2026.02.05.06.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 06:32:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Feb 2026 06:32:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Colin.Huang2@amd.com, Carl.Lee@amd.com,
	Peter.Shen@amd.com
Subject: Re: [PATCH 3/3] docs: hwmon: Add Q54SN120A1 and Q54SW120A7 to index
Message-ID: <a3094382-087d-4167-900d-1f2c587aaa18@roeck-us.net>
References: <20260205-add-q54sn120a1-q54q54sw120a7-v1-0-09061ecacfc7@gmail.com>
 <20260205-add-q54sn120a1-q54q54sw120a7-v1-3-09061ecacfc7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-add-q54sn120a1-q54q54sw120a7-v1-3-09061ecacfc7@gmail.com>

On Thu, Feb 05, 2026 at 09:34:37PM +0800, Colin Huang wrote:
> Add the Delta Q54SN120A1 and Q54SW120A7 PMBus modules to the hwmon
> driver index.
> 
> Signed-off-by: Colin Huang <u8813345@gmail.com>
> ---
>  Documentation/hwmon/index.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 85d7a686883e..62d6fc0817eb 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -216,6 +216,8 @@ Hardware Monitoring Kernel Drivers
>     pxe1610
>     pwm-fan
>     q54sj108a2
> +   q54sn120a1
> +   q54sw120a7

Documentations are for drivers, not for chips. There are no such documentation files.
Add q54sn120a1 and q54sw120a7 to the documentation of the q54sj108a2 driver instead
and drop this patch.

Thanks,
Guenter

>     qnap-mcu-hwmon
>     raspberrypi-hwmon
>     sa67
> 
> -- 
> 2.34.1
> 
