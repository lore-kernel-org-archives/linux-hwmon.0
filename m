Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B47035BDBE
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 05:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773811441; cv=none; b=gGi+9Fquneco6/YQkNl5oLu49XeaCa7Kqyo1lNePCHRPLkwVvhT8ccRHqeeq8VY23UX0fJlQXMDcGTuormSl8PuhQHX0jizYlMrRqZd5oZ5hI9mstgaJDoX3ahQe/JbAfbYE2oV6PaamMIhhcdkC0wtiiG4yh4saa91D0VVw7/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773811441; c=relaxed/simple;
	bh=tk9WsIDUvZOCsL/oMCVgrg8Mmetwf6myaXfA2GHO1c8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dBJZY0zU+6SLjVWPZqCp7XchUiZC5ylfKbIru2SR9Us4iPoTVA/VPaN7+qT+vsqStlnxhFnTmBK0vLMTj20YBt9+cgVZ6PQgEwQDtEtmOSfneMQbq+6XBDT+3j+YYRHgxDRvrTakL0oKWNfhvruxefTxGUp/SBSMnWchQJ/rjhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LglRdkE/; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LglRdkE/"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-829759ca646so3928551b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 22:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773811440; x=1774416240; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=+8Dd9/H13XD1qdhrDIxw37zd+0Jq6VYqd8JCYnB8wqs=;
        b=LglRdkE/2scJvqupb2FMRi46oVa4GxIln6yzvarkqHeIx8JRNLlgkzePLXMHQqoWE7
         FBnhXnd1lsHvbdPOhHEr6pXb115/gAHXPP3jzqLmllh+f2VPcrTZpRy48pirGtAjVICX
         RVcvNkSOEoV5BUre7qKy2u3kBWf4FDOnuesbJJotnJYAoGLt145AGIkrSwGMrUV7pqik
         WQbnIjW0vGXzuiGIxITLw/hzxsVtqEaZ9yAuk5+bvFQIqeZioSkyHtzkkI4P6kLKebqB
         SvDcoXbqRIEaIHLhhwxOc8ho5cyybz+t97W3KwwJuwJABq7mG7UB6k5FVAc96x3ElYhq
         NnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773811440; x=1774416240;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8Dd9/H13XD1qdhrDIxw37zd+0Jq6VYqd8JCYnB8wqs=;
        b=gy9TqV6qaytr1TIxw4Qocyg7ulVNEMhFF8pvZBoOnjGZLngX/y19NoaEOaoKCP59VP
         SGQQAeNfFXm9oLOOVkN3p1uS7uyEniUid7WJScTAiLDgm8BeY+gMJvDYsvtOZ0OwI+j2
         o8VItBtllch7K4gzmwWpwtKAJg263IqRZx9PZtJFhoKbIBAn3hKMyUZpWPHvQPlcN0r8
         Y9/DQIhAlVFXTMzdEvXMBm+Kj0QoOt9kHAUAoQDeLZPAmIFmwKH1WLP+A70GdtpEtYUU
         F1+gmaWg6HC19Zj20IGmnFXnQVMAXk3wnRPHkWX2MURZRhO6J4rBmAbDexUkiGgaTVrq
         qL5g==
X-Gm-Message-State: AOJu0YzOjZAdyquwQ8omciZWExVfoxm6blKyt+Ywku5JTW80kfL/4+JK
	5RunJ9weKqYXM9iQNfzH1ipGJ/eUamRbEiBkAAr5kVGBNqyKNsP6S229yFsJXg==
X-Gm-Gg: ATEYQzzhcgZMIE9C/nIwksLx0ePHvCpxM/dDa79YmFs8h8w8WHB6dXToisF5piJU2f6
	GG2dxCBmxdGhVBxPlB3c/CPqS/zUyPTIbMCLuPNKYSm+WgC1eoQT96vJ5pddepKbNqgtcdAMiM1
	9/xxUNDWoF0aT1qaao9FPzGpNDvpYuRJEFpCm1m0+J6btGu5AArmX0kZk32qGMX7AxEax67Qup6
	7S/B1xbALs3IDZXUa2byRRSpu/ek/JfiNpZWzOGVSAq9byL2rQIkuMxB/GefU+1cF+zp/11LZYe
	p2KjvEFx3ne305wm6mBiRsnTYRuqvl0/IuA2oMO46BzIg4FLm26/D40k8uAroZAwew7H/wk7hMb
	Cnfepw4Mds6xu9oygAYq2UIeBodBFXTNKQ5nKYsJXxOLR7FuCE1AGnptlaHKKnGOg+UiI+CrMkO
	D4KDMLwf2E96vaoTsG9qYA2b+gaSjlvRv0BDDJoLlaizPgW0mdBuBbHUj2FOgW9pcMT2dKV9L9
X-Received: by 2002:a05:6a00:1386:b0:829:7efc:fe20 with SMTP id d2e1a72fcca58-82a6ae860e3mr1753370b3a.40.1773811439871;
        Tue, 17 Mar 2026 22:23:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b58f7f2sm1315994b3a.24.2026.03.17.22.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 22:23:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9ec35dce-5f6a-454a-9ab5-e61b22796325@roeck-us.net>
Date: Tue, 17 Mar 2026 22:23:57 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hwmon: (pmbus/isl68137) Add support for Renesas
 RAA228942 and RAA228943
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 geert+renesas@glider.be, magnus.damm@gmail.com,
 grant.peltier.jg@renesas.com, linda.xin.jg@renesas.com, tabreztalks@gmail.com
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-3-dawei.liu.jy@renesas.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260318021921.75-3-dawei.liu.jy@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/17/26 19:19, Dawei Liu wrote:
> Both RAA228942 and RAA228943 are digital dual-output 16-Phase
> (X+Y <= 16) PWM controllers. They are PMBus command compatible
> with the RAA228228/RAA228244/RAA228246 family and use the same
> 2-rail non-TC driver configuration.
> 
> Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Note that technically the devicetree patch should come first,
and I can not apply this and the next patch because you dropped
Krzysztof's Acked-by: tag from that patch.

Guenter

