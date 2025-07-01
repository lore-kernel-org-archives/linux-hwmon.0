Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CF8153598
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Jul 2025 03:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751342024; cv=none; b=CGoAQe3Rjpny0o2IJ/ZAvI7YksdlapmJSLDsS7aaFpv30yev+qQ5JBuwDFn5rcSAnEJIjCdFqW/n7AKEULH/w7B6OmPZ5K0YyqBJp13DLkx0XT+GC6Twc/SuKyIBN+t/Yrq1lps8v8/toqKfpdzdszFuk7d7ieSUZAW9EAL/W+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751342024; c=relaxed/simple;
	bh=hRMw5goHd2R9ZWy/shaXRFMy6w7bLIuOEcER/FaL26Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mPkaWiWQXmUiiVsmpV1rrG1dy5KQ3fu8FDd5f4sMmc4DZJDs/p+PAnkieKxOjhXgxhUKvdyDK0+FBnzX1w/jWU6KAFzuK6pFCf4uMRzPKY48xdvE1ie3JVqLVHG3UVzeugaEO3zgCus7fccJsWRZm5QV+IkL0FLqkVEKkOgrGEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b=cdimg3+L; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b="cdimg3+L"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 69128240101
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Jul 2025 05:53:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.ea087b; t=1751342019;
	bh=GKChTwDOa0QfvWSb3bXRKhN8g0T6ypO9iptzQrUFHg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=cdimg3+LQ4GpAuQ8p89YXNOlUSxLn1dwHtbpFd8msi9qxvr7tholhxx/xVRi2X/27
	 2qoF6/alKBdH5QorXl7sN4cWPcEbp8H4PIZCtA+zBzyJodKB3viCBqgLHHS/8fathE
	 5KVyHY8jHSQld69K5AVwijBJN7Cs9UhCWxZfgAb2O5vSV4zHi58e3s/QoceUaDkXyd
	 dR01hulg+nshL2DlgH53dkZF33cbYEmg09FdP7msz1grS3JVo+/px3rN5SigHDG/wp
	 LLr3iZa2wxh5aWHMLieTWgAgW48SqBCHnV3BnRWt4h8CvKh0pM3mhQGFD9Vx03xV4v
	 +RKuQx8kj7y0uVB/ui4FEPNN9KCTmQ05JQaBJ5OS98EcDHnMcf+FM6hlN6F3L8ozfv
	 OFoydo49XYq1Sc6rtdIe+z/k48cBJM4tUHe+IhPUF0rlZ8eUGgdafUVZewihumG4Oo
	 IpF/VvaeSAD09I8jP5weXOZuaii7c8WuW/o6bYgR6P35fwLLrzG
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bWTfB3sNQz9rxB;
	Tue,  1 Jul 2025 05:53:38 +0200 (CEST)
Date: Tue,  1 Jul 2025 03:53:37 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Shantanu Tushar <shantanu@kde.org>
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) add support for HX1200i Series
 2025
Message-ID: <20250701055337.14e2f5da@posteo.net>
In-Reply-To: <20250630201444.210420-1-shantanu@kde.org>
References: <20250630201444.210420-1-shantanu@kde.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Yeah, looks fine to me. And it looks like there is also a HXi 1500 Series
2025 now.

Reviewed-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>

On Mon, 30 Jun 2025 22:14:44 +0200
Shantanu Tushar <shantanu@kde.org> wrote:

> Add the USB ID of the Corsair HXi Series 2025 HX1200i PSU (CP-9020307).
> Update the documentation to mention this.
> 
> Signed-off-by: Shantanu Tushar <shantanu@kde.org>
> ---
>  Documentation/hwmon/corsair-psu.rst | 2 +-
>  drivers/hwmon/corsair-psu.c         | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/corsair-psu.rst b/Documentation/hwmon/corsair-psu.rst
> index 7ed794087f84..2e99cfd556a0 100644
> --- a/Documentation/hwmon/corsair-psu.rst
> +++ b/Documentation/hwmon/corsair-psu.rst
> @@ -17,7 +17,7 @@ Supported devices:
>  
>    Corsair HX1000i (Legacy and Series 2023)
>  
> -  Corsair HX1200i (Legacy and Series 2023)
> +  Corsair HX1200i (Legacy, Series 2023 and Series 2025)
>  
>    Corsair HX1500i (Legacy and Series 2023)
>  
> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index f8f22b8a67cd..6b5c8f200780 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -885,6 +885,7 @@ static const struct hid_device_id corsairpsu_idtable[] = {
>  	{ HID_USB_DEVICE(0x1b1c, 0x1c1e) }, /* Corsair HX1000i Series 2023 */
>  	{ HID_USB_DEVICE(0x1b1c, 0x1c1f) }, /* Corsair HX1500i Legacy and Series 2023 */
>  	{ HID_USB_DEVICE(0x1b1c, 0x1c23) }, /* Corsair HX1200i Series 2023 */
> +	{ HID_USB_DEVICE(0x1b1c, 0x1c27) }, /* Corsair HX1200i Series 2025 */
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(hid, corsairpsu_idtable);

