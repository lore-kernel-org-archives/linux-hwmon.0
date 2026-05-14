Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272A91519B4
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 22:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778798225; cv=none; b=rTVQUOuOoXxrlEoymSl7mSDR9HSBKRM/tqSXIDytkkK0nzXkkwPQc/sFuhUu7rozvS3ePCmtM/YEVYgojEYutZKvzqGuqDIzqJIQ4Ps7JgZVHUFwuXs2SOorj8vdSx9N+s4d8amSJMudN2QAlVo0QGUDWrS60uUufCt404KEFDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778798225; c=relaxed/simple;
	bh=dFwgFPuzFxBUZeReAaLX8aBZFKtQA/VwSCGW8XQm7CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GIsZfU1YDvMjHr+5cnri+XFu9it5omyx+fnSvKjqSyA3HDKMyh5/Nj3/3QcgmZuZ9oE8N6tDYKMVjvQqrfszLCau6Zyb8h/C1RdXA23V5llX3mwjmPtoFGI7Zp2ZkiLEmKspQisaIwqMrr7cHH+jkrsvjxn6Tf7ijAB/X+eiSI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRPPx1jX; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRPPx1jX"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-134ac81c445so4526758c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 15:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778798223; x=1779403023; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MhaSN9ERrIyHjcMV+iPCLsSLUQdYptx69pkUzMqeyJ8=;
        b=XRPPx1jXJlRDABZJ3Onmof8S62f4QbyHjK774aYydiaXdqUoM8rKxR1Dsg7LG38Xco
         HXuQAF9PnR/GV9djF8sqPJxpzFCPP/Ioy/FT1zrEU8sNcnLVid4XTT67lXU6ccPAeVgK
         hXYx6uS6jwOQ6m++hrsaaYdDuF5QJwDRgLqPLKJzuRsMDbzR2yPAy1TndFviT7RtmdWm
         6HssU5ZE1W/FE6nqNcwLl0/dI0YVZa3LH1zuOZ3fUr5o5tns7EJD51CFggzWbliM0ghJ
         75rz/MW1DEBS8tgxmfAiWO35gAXuVYK6NSLswOZHCp/35W6m9Cbv0GY965wGLpGlj2Pz
         1gKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778798223; x=1779403023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MhaSN9ERrIyHjcMV+iPCLsSLUQdYptx69pkUzMqeyJ8=;
        b=EPrtJeib6jRZhieLlm2i5GF3j9dP4iGhpj1Fpx9EYB5Ayf7erMxO82nQmfQ6b5IDTy
         U8ZpU8LPm0rekvHtpTePU26nx0nr8evg/vxDTgl9zSudP29kFus46xvZ4pO//Yd6vXwc
         +WCjOsm9TObxduJxF2FlsLhBTsbA21EsMkvk9eGvV5kFbYgm5RNPTfzSbmolv8GzdvK1
         8rrjHAxi+xpbdxU51arfOnoXRLOxp7wklRrVwUrBx8KTwhMKf0yhjvYBjwwwoeXYswg/
         ypmHHez/nxlk8NAv/J1njFLerSpmb8oMk/pUXv5SheAXYKhFQ4WhDB3AQC1FtEBChKaA
         Lqgw==
X-Forwarded-Encrypted: i=1; AFNElJ+/0kkAximKItUM1My+A8Fny2BEaLZBx3eGWQBDNWF8aWu+MsIWvtRx5z7Zi/UuJOXm2EwV2XcjbC1cNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YztXws5kxW/Rw7khuxKBrf/4co4FiPgRu8NUguxfGbzJlJekbLQ
	zeYAUY4bNF8gSR/TgF5zBWtqqclbGjFuNRtOogesVrEWRydYaFNSDk62
X-Gm-Gg: Acq92OFfwwZlvbVHbo2rUW8ourD2+zugsv8T4F/JAR6CpiCT+LObvGSQKeYJVwpMtPg
	wHjJtzX21xVaz9gBQRl/sd7nI8Ke4jCTjTGsFlYFj4v7tZglMyorKQAhY2mQXCzNwLYJgLtxhCs
	k5Bg23DWnmKQebgVgLjM1j+xmAvwS7SbPdPJt7Y+aVJwtGi3o637yZ0hIWfJu9bHogwQL00fc59
	bMEAWn9DWw/uTvF0vBajzTZ8K7FzD1/s4N/hyETuFw8zzAyRzu1HwthkNMaek91NZG4BWZv0J+v
	NZyPTkp8ays0d+GSA1uuKE92xmOKmgkxPHSlCdVbBlYGBrOZwpEPZUJzCGSLeJR0Gyn2Y0Uv7J4
	35LkavqQaxHm8hrpmhv2XQRI+V8nOSmoGRE12vlYg/ELpIfX7eBNnTFJxR60RhAaAyfGB/jxGIV
	CaxoPt1ejXgsT1GDREz+tM30vFPZf6mYxatnq+
X-Received: by 2002:a05:7022:1e11:b0:12d:ff1b:92f5 with SMTP id a92af1059eb24-1350484ce0emr540377c88.28.1778798223299;
        Thu, 14 May 2026 15:37:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm6777201c88.3.2026.05.14.15.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:37:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 14 May 2026 15:37:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chen-Shi-Hong <eric039eric@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: hwmon: sy7636a: fix temperature sysfs attribute
 name
Message-ID: <896bd515-1a05-4204-851a-5285959803c6@roeck-us.net>
References: <20260514154108.1937-1-eric039eric@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514154108.1937-1-eric039eric@gmail.com>

On Thu, May 14, 2026 at 11:39:13PM +0800, Chen-Shi-Hong wrote:
> The hwmon sysfs naming convention uses
> temp[1-*]_input for temperature channels.
> 
> Documentation/hwmon/sy7636a-hwmon.rst currently documents
> temp0_input, while the driver uses the standard hwmon
> temperature channel interface.
> 
> Update the documentation to use temp1_input.
> 
> Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/sy7636a-hwmon.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/sy7636a-hwmon.rst b/Documentation/hwmon/sy7636a-hwmon.rst
> index 0143ce0e5db7..03d866aba6e8 100644
> --- a/Documentation/hwmon/sy7636a-hwmon.rst
> +++ b/Documentation/hwmon/sy7636a-hwmon.rst
> @@ -22,5 +22,5 @@ The following sensors are supported
>  sysfs-Interface
>  ---------------
>  
> -temp0_input
> +temp1_input
>  	- Temperature of external NTC (milli-degree C)
