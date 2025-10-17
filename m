Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534E126B0B3
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 08:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760688767; cv=none; b=MR7ihSW8ml8cPCdNkqiFi3hy09PjiN95uw/Bmlbw8UgRLOMp08v5WoG3t5ONLA743uzIgsgxlz+K7T70fngwXTlnQg606GDEarep9V7FTcofBriCSjk1gt50hIQvV3Pnz3C6EZrVL1aFb9yaA7DtD4Hm5pK9ajmixkrapdUdRSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760688767; c=relaxed/simple;
	bh=dDd/qLxqBlbYRZpf/bwD7pPzOiBJCSHMnkHW7F1GpQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aYoKmAoS9A1fNXlawb+ADIcsS2KCK5x3ijODtLM0TeauUvCvzXAcaNJ7OLPWSAT1rINlhoWqOonL3QdIoqFALXY0ZY0vLG77YUaRwi2le6BwBDmsiE1S3E2PkKBScLeJ968ivBn5wEz86C1ouHGnvhEV+UWqjmy2xfW3rnLxks8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1DG/+IjA; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1DG/+IjA"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6DA671A1467
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 08:12:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44CCD606DB;
	Fri, 17 Oct 2025 08:12:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9612102F2335;
	Fri, 17 Oct 2025 10:12:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760688760; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=NJjT2JTC9ylxQljIJBrb2cQRLsiK/uJusVJtAAHk1zY=;
	b=1DG/+IjAL6/yKV9K0zdE5G4URgtsryYRLLBce/08EeYxxsAMVQ1qGZVipJ2hFonKdNGSVt
	yTX4PP/uUcVzPy1o6yfNBVICQ7+rs2X5ETODB+Rvb9sMAfFVPeM/UzlXrPOnNWSPqb8qXG
	IchD6FYxIx26bupVYtbXwl3D8bF1bW3r9e0NS8CemLmdKROd1rwBVWH0TzinhEgkQu8Yam
	/tbBvKY3Bl6BUs4yQqqPuVSWGkn//lke6K2cd0WkRJIYJDZwuIr4BII56/ReAXPfYnS8fl
	qYDUG3fu0lwRANqiZP5xru9cfcPk5siJOnTg82kI0K1N/ej3P0mH1BTaIzLMsA==
Message-ID: <7c2dd51f-a601-4c64-9295-0cf63ab8d749@bootlin.com>
Date: Fri, 17 Oct 2025 10:12:40 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: cgbc-hwmon: Add missing NULL check after
 devm_kzalloc()
To: Li Qiang <liqiang01@kylinos.cn>, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251017063414.1557447-1-liqiang01@kylinos.cn>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20251017063414.1557447-1-liqiang01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 10/17/25 8:34 AM, Li Qiang wrote:
> The driver allocates memory for sensor data using devm_kzalloc(), but
> did not check if the allocation succeeded. In case of memory allocation
> failure, dereferencing the NULL pointer would lead to a kernel crash.
> 
> Add a NULL pointer check and return -ENOMEM to handle allocation failure
> properly.
> 
> Signed-off-by: Li Qiang <liqiang01@kylinos.cn>
> ---
>  drivers/hwmon/cgbc-hwmon.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/cgbc-hwmon.c b/drivers/hwmon/cgbc-hwmon.c
> index 772f44d56ccf..3aff4e092132 100644
> --- a/drivers/hwmon/cgbc-hwmon.c
> +++ b/drivers/hwmon/cgbc-hwmon.c
> @@ -107,6 +107,9 @@ static int cgbc_hwmon_probe_sensors(struct device *dev, struct cgbc_hwmon_data *
>  	nb_sensors = data[0];
>  
>  	hwmon->sensors = devm_kzalloc(dev, sizeof(*hwmon->sensors) * nb_sensors, GFP_KERNEL);
> +	if (!hwmon->sensors)
> +		return -ENOMEM;
> +
Thanks for your patch.

Reviewed-by: Thomas Richard <thomas.richard@bootlin.com>

Best Regards,

Thomas
