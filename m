Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A8F3CA4A3
	for <linux-hwmon@vger.kernel.org>; Fri, 24 Apr 2026 15:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777045067; cv=none; b=TGX5GmYXIKuWqz2KpBgTUFQU05o9vXenITvNoJsm5JLctaer7AgZo5N6jRMd7VqrQ6fEZGxq5PvWK26MQC5q1QkXAfQo/1ijfEMfemcQXOI0L0nAfIOkoKhgo53OoWylpGDbSKV+htoQrsTQBvqtcsY08qPHGp9c4LZV2XXmlgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777045067; c=relaxed/simple;
	bh=joTQCSisSejxx5EDr/8wY+lbu5NUvCu/58i9SlUJgeI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m9aEazNhJVXElUKyCYm2HiYCQdTYxsa6REwVu3CiVxkqLRJJ4WNqkWjngkBNY3y8YglOfUvihy+E+sswCmt1+GZmsQJciM4+35Q/D9L+eHpTs6GBC51dq0iYFI5hBR8k38UUJ8r3w4Bj5NWF6owZ0QtHzO3fF0JWizrDNd9w9zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=OCnJ8hH2; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="OCnJ8hH2"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 4ACE4240101
	for <linux-hwmon@vger.kernel.org>; Fri, 24 Apr 2026 17:37:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1777045056; bh=/+koihDAy0q08mblule0I/lAVVbNH3IkitxS0KiKHEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=OCnJ8hH2Bqmja4Q5VAU/ET8Jl7NLoLn89RM1jQQU9gLBMGdQ/H9G4JG23Mt/S/khU
	 n2eZeouMFUel2brNvzNHrRbLDZBwxe6valRX1gFfHyfZ4b8RInc8aQuITEK609MKzH
	 WvQSkRG6qAdZjFXi5fhxv9bqtLNQVWnE1e35DAGnHk5JR4fsDG6B6dCNvh8HgMbKRW
	 a/s4i2wZIXMG9gArW5OmjC3pUXBWhGoqGJI3qWdoiDjrSbA3+MHnnD6q/m9Ej4gB+R
	 oMlgbfQCpmQ/mBzksy607xmR5+1atVvMGfDkvzXGco2vqoo66M3MEI2b+4NxegrVc5
	 kOcQ+1q8CBF9g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4g2HCM0KR9z6tsf;
	Fri, 24 Apr 2026 17:37:35 +0200 (CEST)
Date: Fri, 24 Apr 2026 15:37:35 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) Close HID device on probe errors
Message-ID: <20260424173734.4ab5765f@posteo.net>
In-Reply-To: <20260424135107.13720-1-mhun512@gmail.com>
References: <20260424135107.13720-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 24 Apr 2026 22:50:51 +0900
Myeonghun Pak <mhun512@gmail.com> wrote:

> corsairpsu_probe() opens the HID device before sending the device init
> and firmware-info commands. If either command fails, the error path jumps
> directly to fail_and_stop and skips hid_hw_close().
> 
> Use the existing fail_and_close label for those post-open failures so the
> open count and low-level close callback are balanced before hid_hw_stop().
> 
> Fixes: d115b51e0e56 ("hwmon: add Corsair PSU HID controller driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  drivers/hwmon/corsair-psu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index dddbd2463f..76f3e1da68 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -796,13 +796,13 @@ static int corsairpsu_probe(struct hid_device *hdev, const struct
> hid_device_id ret = corsairpsu_init(priv);
>  	if (ret < 0) {
>  		dev_err(&hdev->dev, "unable to initialize device (%d)\n", ret);
> -		goto fail_and_stop;
> +		goto fail_and_close;
>  	}
>  
>  	ret = corsairpsu_fwinfo(priv);
>  	if (ret < 0) {
>  		dev_err(&hdev->dev, "unable to query firmware (%d)\n", ret);
> -		goto fail_and_stop;
> +		goto fail_and_close;
>  	}
>  
>  	corsairpsu_get_criticals(priv);

I really had to go back to the initial commit to check, if I introduced that
issue later. But nope, I had it that way from the start. Good catch, I totally
missed that. Thank you.

greetings,
Wilken

Reviewed-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
