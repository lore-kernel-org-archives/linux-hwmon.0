Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF27E349CC2
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 14:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693654; cv=none; b=bb0E63Yg7cA5PyASPgI7JfMkgtWfQHavYBxbsFqvQu07Vo13eHM7vmfbU/9UHjyby7iNyBgGKpRLoRC4nGwl7YLig7PBdF6WoU3hEysndQ8MHFX+yVIndWFsybBUFJJ4AAjp8L8Ys1uCIKuUaZdXZeawQJrMQb0xv1qTMd/ye5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693654; c=relaxed/simple;
	bh=VE+KzUKDvay1yOjpldzi5tBfXveXWDGcN9KwOkzbdOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nx/lpbELUglQ3XdJElMxScfzHh1iRmYkzIl72b13NQEsctjxc5cgRQNQhsR8bYMo59Qe9vVl910bhW6281gI3BjMW4UJ63stHcFiQ3O33s0hZoYPb8Xr/LeHq/eCFRew8j+XuISHve8R/UVfHJzNTAwCTZ8zQuD2BEYP/OfKxbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtlTzH6H; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtlTzH6H"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8485b358552so1050659b3a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 07:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783693652; x=1784298452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clgP6emYrlN2My2PM1O9US9f70y/B5sdJzZlKryoOfU=;
        b=YtlTzH6H16oCM7I71RhqhfJhQPx9crSzl9LIcTqIZfSu4L4XvbNelY6hzCIVxdMSSz
         +m4oqmo2taAgj0MJAZV2guWTgsT+fEgdY7Ez2ZdjLXzxtUlnS3SamQ+j8NJ8yh7gul50
         7Fv7F5AOi05bKpqDe7kNKMZjwwGnlXtBaPqthU8U/X6Yg4qubmLSk9nVspgvSmgj6P/x
         i5rPkFBZq1eiEo8mISJF6JaEY+0P6oOJFJrB5dtwVZD3Q8QvgO2I249+Lw15zxmHhSEg
         2/GSB3iXL+1O8+ex2Zb9lvF4zYaDkeL4keFRn53oto4GzmfOCWm8QUiMtjiQyOiKdqnf
         GEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783693652; x=1784298452;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=clgP6emYrlN2My2PM1O9US9f70y/B5sdJzZlKryoOfU=;
        b=puq1aYyq8zswUDril5S2C5Y6+A8xVa780o5TVyDLmAKIuOxC6aPpHjeQ8RixaP/xvk
         jFqLVlI8FD7iotEi5b7Xnel/lxrfi/MiCHQslKn3EZgM8LnSdfeAR3r69Dr85CKzqKPZ
         eZcWZan8kkm+019RZLRlMUv+/Hi6dUeOF09h8abslDLGPBn583+xvd2tUdFUZWuFCFDx
         oU+aUysa+Udp1b6/Bqi6ZZ3rvAj6vYkVXEaL2p4+buWSCEvJpYTcQ2N5dZCjhIyHFFqB
         4bifv2gqObhUeIJ2Uk/AKq+1nGdus844WKJt6uQjEIBplK2zeBIGtCbtlhSP8WJp28t6
         XICQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKQNTGGPjtbVAw5oE/bENrjIUr1OvcA0IqYnLagcB/bPkwwh6jAh77pxryNll1Jib2FI48NtyYpxHGLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR2pg684+a94Zj3pNoG2OXfnuFEou+2EIXxP/+dvg6zgTunTdk
	RQ3fGjYeewr+jWV9V3QeqSuCDssevENHlpxp36AJRl45cGz5+63moX//
X-Gm-Gg: AfdE7clc4I9/JRWHzgc+qSUcEZ6nlqlS+qhg91EDHivgyrqhesHKpn41hALIqGEY4eA
	LkaJFrcs/lxInOr1zf8EqDHD/PMgX8RvJ6hoXjINZsBB1fL23BjeMHOaNFtkIAFWVR+r5n7Y3uD
	NnVQdAMYxJCMAHATD2xsyNOY9qWemi3TVDnQwfkgHHaymmbKe3GYHr09Z97hBrru4XfQnd/XXYj
	+zMLwLPf0nEg3uv0ADSUeQ3tRCbTlid5BJTcdVAVggT5jb7okZ4sYpNQ12hV8U3bkOFjxOanB9b
	BZd0ucKECUMS6AsyetlihbM/88tM97zcDS1tGqy/n+Ohk5zGQuHsgCmt/hgYfHyNvmYbYe5iBTc
	4hn9LyBr7Fbr3OoZKSoBpR/TbwpPBXAL1quwFQrfLsulnk4GAxQcXn2ds/pBHIOkTy9Gb5H3xNQ
	eoI40vJqnAX1JkNCs9LgglGExrp3H4N6ZzlVNllSK6pzUz0vWsOBBd7Y5xnfdYpA==
X-Received: by 2002:a05:6a00:4191:b0:846:1698:6378 with SMTP id d2e1a72fcca58-84842ec537dmr10934205b3a.3.1783693652135;
        Fri, 10 Jul 2026 07:27:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8483262a17dsm5741881b3a.4.2026.07.10.07.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 07:27:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1a16769c-fe52-49f8-b785-81441b78bb89@roeck-us.net>
Date: Fri, 10 Jul 2026 07:27:30 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] hwmon: sbtsi_temp: Refactor temperature register
 access into helpers
To: Akshay Gupta <Akshay.Gupta@amd.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, NaveenKrishna.Chatradhi@amd.com,
 Anand.Umarji@amd.com, Prathima.Lk@amd.com
References: <20260710111642.850022-1-Akshay.Gupta@amd.com>
 <20260710111642.850022-3-Akshay.Gupta@amd.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260710111642.850022-3-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/26 04:16, Akshay Gupta wrote:
> From: Prathima <Prathima.Lk@amd.com>
> 
> Extract the paired integer/decimal register reads and writes from the
> hwmon read/write callbacks into sbtsi_temp_read() and sbtsi_temp_write()
> helpers. This consolidates error handling and respects the ReadOrder bit
> for atomic temperature latching.
> 
> This keeps register access independent while preserving existing hwmon
> functionality.
> 
> Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Prathima <Prathima.Lk@amd.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

The overflow problem raised by Sashiko should probably be addressed,
but that does not have to be done with this series.

Thanks,
Guenter

