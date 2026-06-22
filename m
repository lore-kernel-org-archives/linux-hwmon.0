Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E186133C19E;
	Mon, 22 Jun 2026 16:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782147429; cv=none; b=JHAXKoNIsztwoytK6G4cpsJhwQ7sDt5SlAMg59UdfX9oH8GI/oFYOry0cqN1PgwNKsT/hvyr5Kxoi6nFx37gGBaaytlsqxO5HJRMeSpqKqRCKIKKR5DoYX+yEFf3E1tFQXK4fMm1McaiipueZI6Krh1BywwfOQ6osMffvtPaL/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782147429; c=relaxed/simple;
	bh=rtkOS3wzz5t5JNfgvaBXMa2LClojRP4BcFTM7XFMAew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aucy7YFBuySXuXAXbU1CLewO+OtJrm3iu4kl5EoQoSDY6j78+c3vToFISCW0tTCgcNx9goxWZn8N3PNNNdbjMzWcn++6EEtjVJqpm7VBiF2oI1wEPnNCWcjcnxJAwEQS9kMUniS/ItnitfQ3IStXx7HoKASlNipvH59kip66U14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=h6vXaZg3; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="h6vXaZg3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=rsZ0a0no8Hi5G5pDevm2EXTGdOfCsKANMAV3RQE3hCg=; b=h6vXaZg3xO8rpw8c63zx/uTt/i
	BWjunKTvnr5Vk+IKXOExP/z1GsZxs74FSHk0bjXwh1xOT6i7d15Lqfz6kOaqM/VqTuSunBCKGpH9I
	E+peONIyea2otP3SV7Cf2rWYXbm7COo2pRrNzIHBIgsUKCR10z0u1OKr8oQa+UEMlM8lmismE0iEZ
	/EgAy/82lTBBbX0BNBmQ+7acMS7VKlv+PhP787Ey1daDtbrt5ScRsJSj3ziNlLhYo/rA68bjkLqhv
	pvTX2/68yx8je5xrzNqK8DcTcwO0o2D51fUKJjq/V81vlJQJ4p68U1y43zZvA5rGwwU442LN8Q8no
	oLTe5cOw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhxL-00000005DxQ-0HdR;
	Mon, 22 Jun 2026 16:57:07 +0000
Message-ID: <f1e4c8f7-b3d9-46a3-b42f-710dcbcf15c0@infradead.org>
Date: Mon, 22 Jun 2026 09:57:06 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] docs: misc: amd-sbi: Document SBTSI userspace
 interface
To: Akshay Gupta <Akshay.Gupta@amd.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux@roeck-us.net,
 arnd@arndb.de, gregkh@linuxfoundation.org, NaveenKrishna.Chatradhi@amd.com,
 Anand.Umarji@amd.com, Prathima.Lk@amd.com
References: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
 <20260622135821.2190260-9-Akshay.Gupta@amd.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260622135821.2190260-9-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/22/26 6:58 AM, Akshay Gupta wrote:
> From: Prathima <Prathima.Lk@amd.com>
> 
> - Document AMD sideband IOCTL description defined
>   for SBTSI and its usage.
>   User space C-APIs are made available by esmi_oob_library [1],
>   which is provided by the E-SMS project [2].
> 
>   Link: https://github.com/amd/esmi_oob_library [1]
>   Link: https://www.amd.com/en/developer/e-sms.html [2]
> 
> Include a user-space open example for /dev/sbtsi-* and list auxiliary
> bus sysfs paths.
> 
> Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Prathima <Prathima.Lk@amd.com>
> ---
> Changes since v2:
> - Update misc node names info as per socket
> 
> Changes since v1:
> - Elaborate the document
>  Documentation/misc-devices/amd-sbi.rst | 68 ++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/Documentation/misc-devices/amd-sbi.rst b/Documentation/misc-devices/amd-sbi.rst
> index f91ddadefe48..fbbbc504119f 100644
> --- a/Documentation/misc-devices/amd-sbi.rst
> +++ b/Documentation/misc-devices/amd-sbi.rst
> @@ -48,6 +48,60 @@ Access restrictions:
>   * APML Mailbox messages and Register xfer access are read-write,
>   * CPUID and MCA_MSR access is read-only.
>  
> +SBTSI device
> +============
> +
> +sbtsi driver under the drivers/misc/amd-sbi creates miscdevice

   The sbtsi driver in the drivers/misc/amd-sbi/ directory creates a miscdevice

> +/dev/sbtsi-* to let user space programs run APML TSI register xfer

                                                                 transfer
?

> +commands.
> +
> +The driver supports both I2C and I3C transports for SB-TSI targets.
> +The transport is selected by the bus where the device is enumerated.
> +
> +Misc device:
> + * In 1P socket 0: /dev/sbtsi-4c
> + * In 2P socket 0: /dev/sbtsi-4c, socket 1: /dev/sbtsi-48
> +
> +.. code-block:: bash
> +
> +   $ ls -al /dev/sbtsi-4c
> +   crw-------    1 root     root       10, 116 Apr  2 05:22 /dev/sbtsi-4c
> +
> +
> +Access restrictions:
> + * Only root user is allowed to open the file.
> + * APML TSI Register xfer access is read-write.

                        transfer
?

> +
> +SBTSI hwmon interface
> +=====================
[snip]

-- 
~Randy

