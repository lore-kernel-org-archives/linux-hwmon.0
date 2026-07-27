Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07517380FF2;
	Mon, 27 Jul 2026 17:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171742; cv=none; b=snPZ5CguwqQBpS2/Xp/x+bPy+xWV6fwddcOUus9OLYRpEgR/BffiUGpSy7XpdBFDd6XfbSc0UbM3k4LZFIz4rwJSoEi2etNqH9GIMX6NhHcV7syjhicRKegjSPBJDPYQoe03Xub3Lustvc3fXiU4NK4JH4EM3IH+N5DlHZjO4eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171742; c=relaxed/simple;
	bh=jUxLziuMhEw5IkBBQtMJ0hH8qT+hvNBDzT2Na1bPUdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mt1QXLTxTgA5DiX2UXjPmuPBlp0ZFznH/lt9MBs0NSKnWpYXj1zgJtQxxAQQUTvKW9sVpT6SQ12yPY4svL4rSPh7h7DTUZ4GRqtjz6txNfCvq5/Oy5X1rY0EDBtxk5saQE/wDhvxT0UL1q/h6PMBz74/tuBvcru3IEejG5XQxY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3LwTNPV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3LwTNPV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD7D1F000E9;
	Mon, 27 Jul 2026 17:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785171740;
	bh=envDW01iaG4pKKDhR3yG+/K9RbiDakyseB2cdEOZn20=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=j3LwTNPVNmHeotZURh6MafnSvm/fwir2Kcl/0k6Np039DbnnD5JdEURC6kY17E9AJ
	 bB2A59hUDedkypLiJW/raC2yWpauqtTsAxzSOMdK65B8DPuz6YLbhjyW6Yr/XWfoyJ
	 7hBf6dmmLvGLtXT3Jon44DAVPXxMMdVmO1FytDnpXRpONiydx4xzqJ4DfeYGr/H1JJ
	 sPeQUMnh5wgBlDLtNj40llKFi+iMrxBWwSbrKn017ZZB5rJuoihOW/GoLQ31R97j+Z
	 /+wtd4CeZnNefsPowZqmCgr6haQrBFz9cnn6I7SHLHac7F02oBcdT7VhA20v4fgxls
	 osGt63BUJAs8Q==
Message-ID: <f49363e9-2f48-410a-9e77-9ad14bece7d4@kernel.org>
Date: Mon, 27 Jul 2026 12:02:19 -0500
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] firmware: stratix10-svc: add async HWMON read
 commands and register socfpga-hwmon device
Content-Language: en-US
To: tze.yee.ng@altera.com, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <cover.1784785709.git.tze.yee.ng@altera.com>
 <a79aee37be7067691fd02a3a9cfd134c995e5a95.1784785709.git.tze.yee.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <a79aee37be7067691fd02a3a9cfd134c995e5a95.1784785709.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Guenter,

On 7/23/26 01:02, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> Add asynchronous Stratix 10 service layer support for hardware monitor
> temperature and voltage read commands in stratix10_svc_async_send() and
> stratix10_svc_async_prepare_response().
> 
> Register a socfpga-hwmon platform device from the service layer driver
> when hardware monitor support is enabled, similar to the RSU device.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> ---
I've been taking these patches through Greg KH's char-misc tree. I'll 
wait on your feedback on patch 2 to take this patch.

Thanks,
Dinh
