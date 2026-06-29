Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633A9425CE6
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 15:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745534; cv=none; b=OUsZMAidrKG17mT82Nt4npKZS8waD4pvbeYcD26niAPrz4ZssPQf5/YVerd8Od4923rtZMb6HBw3gMomTAb8Q86pFyZ0qlbmYpAkol5vhM88w7B1R3AaxmsGgD0v4YriRD5ryWMT+fu6GuhXOa6MSm5paIxD+zr9U/fflEW57NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745534; c=relaxed/simple;
	bh=R5yESF37uyiJLMIqeCkmW+Szda+HXq94RJQkE8KMVdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O1umkaX1PvzAYYbHDy6eTZBYmslMWBxTvecVTqXkJaH/baswK+jiUCEIFiHlPpGLNVTt8Jgi9uamfFidzfkHVa6LHU7lHQttrw+Y3rrvfPPN2ieQGO80V5lXRuPAp+95WaLtO+NbBHEF6luiDFwdpBNTOW3veiks18vYaKhEkMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wq2QpSFi; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wq2QpSFi"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3078e0dcd67so6000167eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 08:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782745532; x=1783350332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=QYvP9PAw8UYGTVLrD+rBWIPpUa7RTaFHp2HUYWLIfQc=;
        b=Wq2QpSFiWulIAFEPp4apzDoU7SW5uF1oWFV1g8PPrY9yYZcF9yN6ZDrv1HmpjcXstg
         65GI216/vuTKindPNlwIOa5CjYBdgTJRGXiWi1o+CwHSB3ric4d/b+ygTrH53veEZBqu
         tg0hvjN8xGhGWtt5RQ+DnwCV/5rYE2NR69/e7ca47JMVA/cX3xgNfl5Jos6MZOkSiRQX
         DN59vWieN7i2mMS0iWMKSbRMKZurqkH0ykh4tatY+YINsBHiQE/REIuBMQ4PXmhrGCq7
         QiVaptbCiO7/nYdIR1GKeAQiZwAhwI3/U5mK02xPmR/m3FlOKFoPE8DnMyJHSRc495VK
         54+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745532; x=1783350332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QYvP9PAw8UYGTVLrD+rBWIPpUa7RTaFHp2HUYWLIfQc=;
        b=Bkbo2agq+0qwy7wOBRA+w1b1Lerh1IdX0dwOMi6eFFz7O/mP4fikWJ8w1e5wmcosEC
         DpQelHPaVMSWFJlkc5lTvSdGZ1C/TE216nQOYhNFZxDy6FK1PODnbKJAbltakHTnSwms
         bVU74GrRtYSEbZeVkbFaOicCTJUbCxLjEiY+mX6uY+0aj2lbVWcOziI+Yy3ZtedlBDah
         yZwnzxCLalQz+OaKKxIPwp9FocP/CGtWSvX40gK4EQ3PPiY+J94P3RF5Vn6J+gB+BUcv
         WsBpqkb1OpPrbAGGLdktT4irD7F1BuInrJlKvGELdeB66ijeTJXVU5+x6xvS9pdhRvpz
         50Yg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2TVrjuu2cfgMW7gRNiWthNw1ddbFRQSpSnGw3EOxrhxPLRKXGg0PmuvRwN6ERHUIXZoExGeT6/N7sFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm1rYIXa26uI+9orxEcCKG9p/E9rgEb2ewbvPN5ofAMpExHUdP
	rZfX4HOjkCqtg/rbsT7XK6I7fIs/1ZL+ipDbxP57a5edJUF5o7bVekjQRWwZrw==
X-Gm-Gg: AfdE7ckp4BOJqymqylIBzXzmNfOi+8xXFSVsWQetCLHGCTZTkHR+uyR76vWUUXcR2eG
	YJCPsNXXFialBISNQVncYHYzAoNDR9D7AcMRmdMjbMbA0tejz+RiXVUMl2C4gIFGrqk88cfAbDu
	4Q+PWz++7H6rXOqW8f7YQsz5UPauEkajdNXcXFIwmrBgtCTj4XNRWJ6Wo7W6RBDsItCOVgKldg2
	M6htPrCmKcCqG8hfwwdvfEhdqqqRrlwOEmbBTXGnCdpDUkamRZTo/P9+RXUwfvKetlD5wqn133f
	8w/0ryPPkrcH7FDYW4QFL7b/+gOtZKoU0gg3dKM23Idn7WCdHwnmQk0c4Ed3MqMjcsghzmowXcm
	N0SEt9XHo26qv20WJG5iOcEQiGjPOhfvYipkJCR2lRmfhHauQ8mzbcSefPamqIoqj8GL5LjGkpF
	VTEax1UntlPvgyzpO1J9rhIm06hEhS0YBjGdwxMOnEUhWlVCdkyzJSi+sIpp8cDw==
X-Received: by 2002:a05:7301:3d17:b0:30c:ab4d:381f with SMTP id 5a478bee46e88-30cab4d3f58mr8954863eec.43.1782745532243;
        Mon, 29 Jun 2026 08:05:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ed34b4146sm8530856eec.12.2026.06.29.08.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 08:05:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7eadfb2b-8667-4fb0-80c3-4047bcf05de7@roeck-us.net>
Date: Mon, 29 Jun 2026 08:05:30 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/32] hwmon: Stop using 32-bit MSR interfaces
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20260629060526.3638272-1-jgross@suse.com>
 <20260629060526.3638272-30-jgross@suse.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260629060526.3638272-30-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/28/26 23:05, Juergen Gross wrote:
> The 32-bit MSR interface rdmsr() is planned to be removed. Use the
> related 64-bit variant instead.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

