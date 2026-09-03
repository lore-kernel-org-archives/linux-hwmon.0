Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5034EC65A;
	Thu,  3 Sep 2026 16:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788453047; cv=none; b=L3aqFz0i7F0gt9UpWKhXeskRBnWAT13feo8dr88JOUpLqOJ9CH56xNpuRxDFa76ixA0CpfWrgNJBTrPtUkZ00gju4csNi9XLuGI4UqoKUnawxxplKT9rwsNN8ek+qzz+d4zYzmjSesMQ5rrQ0sPvKmqAKAJmVOlg5CsRDhHxmEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788453047; c=relaxed/simple;
	bh=UiCheDARnKCI8xw2+dJakBmfbsl/wpri2oQgJ2kElTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AKHsFkP48OrWLodN1tvbGPiRNCnBuNL6jMWM1nwQBDcSoSFQmL1eK6U30IprZ/AmVa/4gU67UsEA/jHSnvV9F2bJrSE/39bc+G3bwXeTl9Ty3qfCP3alOALYMQksiB4tyNYEZl2Rz4mz+b3DdMN6NfrLJXV2w6/XYvJB0zyAD7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HWpx2Bd6; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HWpx2Bd6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=xaEEHQ1BUNZREtnsfwQo0FuvZfEQBGqzpKlB97rC5do=; b=HWpx2Bd63QkCWzrGCD3cYFZYbQ
	HaM78Aw0Hytv42/V+wfjUMRttOs1VKxNTGaXnxUKyBmZn67Q2+PlQSDPcwyezVhBo5uMVWFx1zrs3
	gzN/UdT1kh81kMoT1QFDN4q2iaw948ITSKJB9CWuafArHlGtUDrl/iYpzXO7DP5sCR5MvngRHjDh/
	af9GU92r9LD3LOG95JNO91EL6o7PpmP+Lln6wmYkzY+bU826iDTmp66lKkQFHbpW14p7k0KnuiAlE
	xV508j1BOmiNh+t4Trxl5ndg5EI2xopEOUVYgjM1qHPPuiJhk8pMTLyqEzzjhW8Oophznu9kIWxoY
	HrSB57rQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AKq-00000000Anh-31Vi;
	Thu, 03 Sep 2026 16:30:44 +0000
Message-ID: <626e7372-352e-4339-8e3d-022bdb1b2625@infradead.org>
Date: Thu, 3 Sep 2026 09:30:42 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: hwmon: sysfs-interface: Fix bracket
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260903161204.735276-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260903161204.735276-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/3/26 9:12 AM, Manuel Ebner wrote:
> Add missing ')'.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/hwmon/sysfs-interface.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/sysfs-interface.rst b/Documentation/hwmon/sysfs-interface.rst
> index 94e1bbce1..7cf4178c3 100644
> --- a/Documentation/hwmon/sysfs-interface.rst
> +++ b/Documentation/hwmon/sysfs-interface.rst
> @@ -47,7 +47,7 @@ There is only one value per file, unlike the older /proc specification.
>  The common scheme for files naming is: <type><number>_<item>. Usual
>  types for sensor chips are "in" (voltage), "temp" (temperature) and
>  "fan" (fan). Usual items are "input" (measured value), "max" (high
> -threshold, "min" (low threshold). Numbering usually starts from 1,
> +threshold), "min" (low threshold). Numbering usually starts from 1,
>  except for voltages which start from 0 (because most data sheets use
>  this). A number is always used for elements that can be present more
>  than once, even if there is a single element of the given type on the

-- 
~Randy
