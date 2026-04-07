Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C633B4E8F
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Apr 2026 13:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775569917; cv=none; b=CXZ0o3el/nmy/PGMO3Gy8azGsZXSbDqO4WKbRmFoAQO3Ve2NQCNF/F9vtOpzBUpNWyaFz0oDHN0iozrmYemvOOrMGxvd6CZX/Ahoa2O7ZfedLK9kGh/VytF+lWLAHUX1MGjChTr2gApjnp2ccvpj9axniefnqWlZhcuPsgiFzwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775569917; c=relaxed/simple;
	bh=uxCkBWBZk6x3Noreikg6H+EjsqLOSHx4aZLeUKSjiZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lk3MI+8ooDmqoFe+nHA93X7fxKfAZkdVMzIDKdH0YXm1NnLJyvD06SgyAaHzV9EfzkOWqH6a16smqmHEyszqn//YGNrIvs9DV5FQSfawfdOueAW9eKE4ljIqIf6YEBA3PCUbGwpPQ7CkItQJuIgPa1E9Pa0foSURQpCOEPPjvRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hejsuXzZ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hejsuXzZ"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c70c112cb61so3030237a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Apr 2026 06:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775569915; x=1776174715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=z9tj1iPK7zeh+Lkbu5W+DBxicjO2K0YPoI7XAzBqW2Q=;
        b=hejsuXzZGifCve4sRO+1BHoGYQh+dXh5UvzVCLurZizyBiHD0H+WTXO2EIy/RWKhxE
         tGPeBw3CU8dqrHON0GKvArwBj02yoVvGNUrl7b/u36NjxYMcpKB+u5kq6nebQRejvDCe
         vrgoW3LuJx4tGbI4n2g0PX85/abdONmUT2uTtsTNSWf1QbwP2f5Zs6gCUFEZS8pIzVwN
         4+5Uev8NeZZyQr/Y1Y/Tfy08FwdJJfwsi+ub4Y2iTFtWop89cWDRltlFIAotbWbGPwrX
         HfJ8Mx0cGY93kPhfSW7Lij1chifDvjtHZ2H3ctuE63XajxE2u7MdwAHbp5Pgz6dfYVjO
         7alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775569915; x=1776174715;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9tj1iPK7zeh+Lkbu5W+DBxicjO2K0YPoI7XAzBqW2Q=;
        b=dDDoRdLCuPOsPAC8PubJskgxJkPvW98psUjKR9k04ilMOfmxXoIbs+Fj1ezu+b7MIi
         9CcLr2EiabyKBOrKJfY9nq7rTcHLmDJp7AAmZ63lOVmaKoJRFymbla+i+aBwSRTBo50+
         KzTemHciZukbNFHE+DmP/3/NnzjsFjD4O8CkJw/3syXyyG/dsFB8d9LXO9wnIhVVfn78
         UyuN7cSHAmYfGF/NypMXaqTUZchUM3dL3lCg9WtorVv6zC+KkbPzRQ2epJt59Mey62sB
         oB4iA+dfRKXcJ8tboB40G26U4e6T6FXrbUczcScUF+G+CLJbxesDziVncruKealIdr8Q
         CqBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrzFoNkdgdlYHicCFsbOScpmXxg3j/G38h+96JxIpLteSV3QJL6MZSKymaTE9HriRtRk51OINRyWqAEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBEfIpwzUVzHJthZerF6qmsCk/dsVr5nKW9ktdzAbvk3W2WRpy
	OBbdaYPS3HVeYpuV46xlcVW7YRH0fVJ1YqDeAdHIO/sN8dfc3LX0WGrp
X-Gm-Gg: AeBDieuMfMspLhjapm6lw4m+shUzWDaY6dXeXnamjdGsB3C/CgzzTfj8nrcIbqaUAbo
	WQvdhGC5g3C5NevSxpVfobMsxhK+b353po3Br7yTi0JvqWUW5kKHfkNJKIVySABK+If/bb2cRFw
	dj4EIIlDrADLzntV30ZAyTWfxQeWd+SN4aRQn41FRiLF2EzA0ForL7ZbMYzrtcnMVT6rTlIFJsV
	plhmN4WSenxQtRShvq3LLpw0MlQ5EUUrbH1Z9pzoFhlSlRSj6rn49iAELlUt6czK29aJQYoP2WJ
	y5lENbpjlEW9jQJwbPkuZ21Vn4QJKOl1warWPUmwKGYc1MWkcNSOU33Q5ySTVwVC2ginuu6uB0B
	6KF9/vdA3s2lMjrmE6j7dYTHzsJ/j9xUvtT6J1eZtqRrfhiBbjAmpufyDF2dZsZ+V/5XdQVydGw
	NJ/TEHwGKlVwReWeAAYO8bAEJB9rvfDodCbYLZrmRlBpH8Oah51u4+oMScHmCfnFm6BRIYi0vM
X-Received: by 2002:a05:6a00:4193:b0:82c:dd02:8b88 with SMTP id d2e1a72fcca58-82d0da517cbmr16288101b3a.6.1775569915535;
        Tue, 07 Apr 2026 06:51:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca4efesm18254982b3a.61.2026.04.07.06.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 06:51:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b2ba9c46-97c0-4ba3-b152-802718923c8c@roeck-us.net>
Date: Tue, 7 Apr 2026 06:51:52 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (yogafan) various markup improvements
To: Sergio Melas <sergiomelas@gmail.com>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org
References: <20260407052317.2097791-1-rdunlap@infradead.org>
 <CAP8e=sLQ9HTy1Wu7TMcrae8w9MD7-eC8Wu-4rLSe1hoLF3buBA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAP8e=sLQ9HTy1Wu7TMcrae8w9MD7-eC8Wu-4rLSe1hoLF3buBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/7/26 04:04, Sergio Melas wrote:
> Thank you, Randy.
>   I will incorporate these markup improvements into the next version of
> the patch set.
> 

Why would that make sense ? I'll just apply the patch.

Guenter

