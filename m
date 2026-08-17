Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9BE64AA4
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Aug 2026 16:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786985928; cv=none; b=UFz92Q47pjGFjKnXXGzgk1X4fyPRuRpYN60eb/46ok09bJuqppDBM9/T8COgRQBNSqYpnCY1Bc0HpmJx5R9GE7+QgLRE4VImepPvVWet942WWhzTRMC38CE2HVIl1uq2YqutJdtbRs7eDSK0zi/Z6n9ftrCNduEZoT72PRmBhLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786985928; c=relaxed/simple;
	bh=UX26VzOY+i/k4L++LqR/aJt+dWw34+rdd5nIZ1I/V2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DeZwyjL+TABhXNX4asqimSoBiE6M1duQkn5U+6XpjhHIoVKAvW8z0rNS0lbSyzS7CHVwxFRS7aJkNWCZZSVyEbXnsPUY6yy3HG8C1r3jPknLnANNfE4jRtqW+ZmlL+03gROqNY+M24ySf7uOdUwp7/fYlixI2anLHR//RegbHL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6niKWq+; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6niKWq+"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so2511317a91.1
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Aug 2026 09:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786985927; x=1787590727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WMgWgdKHOztAr8WfOxixbORkblJgUTehTLN3/sG1xZA=;
        b=H6niKWq+HSVHexU5t05aLiBMXgZFRgTsGHvHyz0HyhQUFvc1iqsHiewKQPsEy1BBGX
         /p8b3g6+jWSxGX/Tsb1nsv8IxDdsOT1QNXTf/yZNQDh2zOl7UkQ6ZDKnr6MLZLgaedPf
         KvrbfbDLOPch/jLgmXX2Q8H1K1wxXoK3WYYjPn5D6pABw3mpMjhTmNyxlB3MR0jWJluE
         oOxITYrrzrNUNfP3UXzTlJNjVKJIUQETm3C7YTQnt/jp0NassgUyI4lUiCaGxCr4JXZL
         3tMT64w2wHrI28nVGwpRESunS0hZmbQ7YN7SB9JkGHIvuEqYruXsXFLgRrxl5m+hbYpw
         m7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786985927; x=1787590727;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WMgWgdKHOztAr8WfOxixbORkblJgUTehTLN3/sG1xZA=;
        b=CpdUwxGN7/QYx1FP1a/l76DFu0bPkb24M7TZ8ofHNSBWzCGEZPvWwZnhHd0TJAJ/yJ
         hJv4R3YvFDX8j3XFX/FU7C/cWoAIPogdwVHkIGbWBGHAABgV2g4x3BR1RnErHzcrdH4k
         PGmp4T1XdXXi2FGK4ZyLAOjie3ZKAeKHcT5vAJiB4QzxOsHQLGvTB7k4MTr3DBptZBTg
         lTnFnUU7hlpfW1BpN0ACAvk9WEo4igSHq8WJnHyqAvmaMQLQ5VYdWoUrDEFRG6ExA9m9
         VZZ0BHnrjPQZvFVH4/RU9iafm9xHtrPBW7dwXhAZIx3sm60JJvxWgBzp3M+RZyhmJEjk
         AJ7w==
X-Gm-Message-State: AOJu0Yx6LmIEwzSaEx0U223zRYQI4E3Ay9ZkvFmD7WS0IartSmfemnUq
	N9H0UBJGgV7lT/VcsaDF0HZujCBEomBW3gQgQlaEYvobGxkMgwtiMcmM
X-Gm-Gg: AR+sD115IKGQi8hZFDNfzt89TFbllTETXHcYIQ0WZrRs8ZYhKbKyFTDNyFR8tAcnNM9
	xmfwJu4rOiVhEIMHCSqBJKE+hlYjfDVbruwkLpopRsRj9TXEs4o4SaMTdkLLTmmk05S2jH3ry+N
	OfM1+ELVv1KgL60d64kCjXF87bWXQwAtlk+t4VblW7J3r/aRMbsSnHIdmG47eKlR2UgJ79+R+oy
	MFJfSdjllmHU17jFu94an8PbjEI5aSmRBDx4ogoI/tuajdzc9jl0C9CJTwpXKHUKGlB9/C0x1xI
	4jiX9loRIgM9wrVC9PBKBUkv9L2vLDXdPBkCMtAnJDZ9P/TpB23DvxqpG2dblZqQyzYMJP+P2a7
	Iu/PIyigkng7yIYlX1LBejgh5lTpU+31P1AhhmbkdtYwD0BVKeyQV8G5BlofZBCecLcVDLxkVvd
	5ovnH/V3fiM95nNW8pFqZt6Jx8lmoq12m4Fy7iWjCThROP3NLY1EH0OULNl2sNkpHM9lwGa6GDl
	LkfoGrzNAuDYZXuo614L7aiVpGx+2lLyN2jrw==
X-Received: by 2002:a17:90b:28ce:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-3933b891cc4mr28026568a91.10.1786985926936;
        Mon, 17 Aug 2026 09:58:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531cc6a3dsm5755836a91.0.2026.08.17.09.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 09:58:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1050e9b0-ef6a-4bdb-9510-572c2a93b485@roeck-us.net>
Date: Mon, 17 Aug 2026 09:58:45 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] hwmon: (spd5118) resume fails -ENXIO on write protected
 hubs
To: GG <ggirouard@bungeetaco.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <-r61PJXRNuWsDjnDETHSh2v7ASrtpweJe8hLjf7CbNH8-rQMiDXscPp7F_K2wLsYg0gvrl9gt7M5vyV-rPLIPSuHIKjIUr4ipRD_2jeCsmI=@bungeetaco.com>
 <vPlYOTmuxKCPw1cRvxIWJfqFl7p8endHIMWS9DZwINEUCPql8VLF7GBkmEBMokDKtHop6K5TAPUAlk-17CFWlA8extBUV7XGnuVx1KJK3iU=@bungeetaco.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <vPlYOTmuxKCPw1cRvxIWJfqFl7p8endHIMWS9DZwINEUCPql8VLF7GBkmEBMokDKtHop6K5TAPUAlk-17CFWlA8extBUV7XGnuVx1KJK3iU=@bungeetaco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/17/26 09:42, GG wrote:
> Sorry - I should have searched the archives before sending my last email. I've since
> found this from February, which is the same problem:
> 
>    https://lore.kernel.org/linux-hwmon/20260205102942.28745-1-tinsaetadesse2015@gmail.com/
> 
> And I missed the obvious clue sitting in my own boot log:
> 
>    i801_smbus 0000:00:1f.4: SPD Write Disable is set
> 
> So my kernel already knew. Apologies for the noise.
> 

Unfortunately that knowledge is not passed on to the spd5118 driver.

> One thing I'll mention in case it's useful: that series above has spd5118 refuse to
> probe when writes are disabled. On my machine that would lose me two working
> temperature sensors. Reads are completely fine here, I get correct temps,
> and my temperature limits read back properly. It's only writing that fails.
> 
> Happy to test anything on my hardware if it would help.
> 

That can not be done, as I mentioned in my other e-mail.

Problem is that accessing temperature sensor data on spd5118 compatible chips
requires a write to select the correct chip page. If writes are disabled, and
the BIOS selected a page other than page 0, temperature sensor data is not
accessible. Since the BIOS can do whatever it wants and may have selected a
different page after a suspend/resume sequence, one simply can not trust
the status when the driver is loaded initially.

Guenter

