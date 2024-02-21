Received: from doubleyoutf.uk (doubleyoutf.uk [109.228.47.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF0512836D
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Feb 2024 21:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.228.47.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708552642; cv=none; b=c1dBLQcMSnzdqIC+U7vqWJ3FpIHbBZzavpKwTyUZfbgrUy8ofT52LUjRNZ/gT6NrUyyUlz3vPxDwdngcukCELY3c5lcP4ai6cqc+kU915cZ0yOWD4x/HzTKzt38iA+eLOIPVBbytp8qRZzHQubwSmenYXnhogEr4gz0Cn6ti8P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708552642; c=relaxed/simple;
	bh=wdGo9+uGX2b8Qv3p3N8aQyjJ/6kK79UrpDrE+lXiRl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/aiW74is1u4K9hQ37hGm8p0YQnURXyqjsqmVVJKM5CRAaVm9m0uT0ZVnDNX4RXW74seWrCttfygSjdkWzrurE7wIstAao5jNHT224TcCKGjJdCfOlii4m0O4Zlq/3oCTri/yDO3DmxELNwTcM0RrkY1vwbv8I+VlNRnFyHCdDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khalifa.ws; spf=pass smtp.mailfrom=khalifa.ws; arc=none smtp.client-ip=109.228.47.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khalifa.ws
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khalifa.ws
Received: from [2a00:23cc:d202:6033::b56]
	by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <ahmad@khalifa.ws>)
	id 1rcuAw-00Fuoy-27; Wed, 21 Feb 2024 21:31:46 +0000
Message-ID: <bb7eab62-6f83-49af-8ac4-516a991b99bd@khalifa.ws>
Date: Wed, 21 Feb 2024 21:31:46 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nct6775: Fix access to temperature configuration
 registers
Content-Language: en-GB
To: Guenter Roeck <linux@roeck-us.net>,
 Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Erhard Furtner <erhard_f@mailbox.org>
References: <20240221141345.2231350-1-linux@roeck-us.net>
From: Ahmad Khalifa <ahmad@khalifa.ws>
In-Reply-To: <20240221141345.2231350-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/02/2024 14:13, Guenter Roeck wrote:
> The number of temperature configuration registers does
> not always match the total number of temperature registers.
> This can result in access errors reported if KASAN is enabled.
> 
> BUG: KASAN: global-out-of-bounds in nct6775_probe+0x5654/0x6fe9 nct6775_core
> 
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Closes: https://lore.kernel.org/linux-hwmon/d51181d1-d26b-42b2-b002-3f5a4037721f@roeck-us.net/
> Fixes: 578ab5f0e4b1 ("hwmon: (nct6775) Add support for NCT6791D")
> Fixes: b7f1f7b2523a ("hwmon: (nct6775) Additional TEMP registers for nct6799")
> Cc: Ahmad Khalifa <ahmad@khalifa.ws>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

Tested-by: Ahmad Khalifa <ahmad@khalifa.ws>


Tested on nct6799D-R without KASAN - nothing to report.

Tiny note, i is in the range of 0..7 on nct6798/nct6799 if I
follow correctly? Still 8 > 2, well caught.


-- 
Regards,
Ahmad
