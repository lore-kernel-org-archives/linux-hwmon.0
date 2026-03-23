Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746963AEF53
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275357; cv=none; b=n4+4cb3ReDnyLJEAJNQ//9+EhJlckLQX1EPVDK/X+Z9l1dE4ZEqlVSmkVBuPX10viHyW3xq3HLXE2c+lJdLuviT6WWbOX4KzsCgYT+gC+xIY+gcCTTkhmJp28705kzwn1ZuphCyAN7MZP/eaFlLSPolGYZmM3IWQlUhsXzmUM5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275357; c=relaxed/simple;
	bh=htqL+8ZGV4xNe9uVip8GiIqy7pwKgpqp40A9l5kLmA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OAmiZ0I7FogPlOaX376uW4VWwIHR6qQMVc/0R8WsQEU/epgNtthBcdRBVEdnePdTJ7Drl/L02kl4hZ53X8yuX4rtBqizs27AMsafFINVM2nKq0CCcgxtwFbHNyfVw14dTq5KNxAilt4ULcn4Sf5HXJrT8Oulbzpxds/hRWJC0DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fL4bmE7N; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fL4bmE7N"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c742824e1d3so1369505a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 07:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774275356; x=1774880156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iefLiyxyiQGfXrTnw6sp+93st5Cs/wPL5mI4sK1c0Lc=;
        b=fL4bmE7N+cYkGG2QLqUOyZZsHRJZfGo6AvotakOMeZTTHaBeD6X8rPv84/tk8/Me5o
         LipVN+99R3V9mucotQrV4TXX+9GgCOsSzK5nBkJg/RAlsMfT8OAFGQUf4+v5UFotpU1i
         h0ShNqvsjREV5cprElWKk3/Kvj5NbUdPslTIiwjFyVG3CrPM/nurOqNVf70H1oBJ+9SY
         i+KbnY7TN5FzMmqDUjTTUiKFBidyJLg7dJTkC4gDMOxadHOGM6tJqJUPVJfu9VkdHN5R
         Z1JswUx/CS1vhSlulu+Lu5veiEPnE6FcHOYG3QNvKxSpBqmcTjuf4e/CQpxA7Dyj9xvH
         qFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774275356; x=1774880156;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iefLiyxyiQGfXrTnw6sp+93st5Cs/wPL5mI4sK1c0Lc=;
        b=lEy4RyayywB2Sxg6UoHb6MbdhvikauhmfQlBFXC351WhnuX0wJIk/XX/yV2Zd5lI03
         s/QXQjkEWuMp6XG9A1p6opRBvfKOO7EAldnYDXRdkVP3CivHqvHt2lq7FNfrtB8H0MMk
         hfCfRaa9CFn/LzAZXmFA6AXSoCp7Et1LgRhLIzJsU90RHtEPuW9Y1biVHZbTqkX9MCYb
         PWwkvsp1PuAxVDtZKbrEmglz+W9s8EgCcwv53QCS1HDywnmz8Ls0PtbGLZ4icTewfCCF
         muklmmrA/kQuJbWwE52oFLQnoG3TNUmnzFIcs+4TfsUX07Yf/VL/GNT9FAegGbJnOJjC
         r9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWMcPOHzx1JbAXdHmnMXCly7XkL4vZss/zPMlsxAiD5ZeUjFTTcmuCS/IyfCXI91lsqnWS9LvCfxrZUSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA+KHW/DKKikeTp92mbNZELoXIY8tvWzomaRRCYVe2tUUs9+DY
	AoHP2iafPgqxMidMprDT3vmYB0Mmb8ioT0BU4jvdNtAprmycmwMCSlPt
X-Gm-Gg: ATEYQzwG1vmeQPcaxVzn70DBl0nJLlSJm4a6rN0+KhutL++Cx89DlBORX1unB9cRzmh
	yT4yinpuq4NqpECGBreK4qOBHoB/JuHord70wJZojTMbYTfsjKYAE9LxzGyY8vdClRaLxrlm/Qa
	vHl1SUO10hBC2TEGZoXsd17BN/mRa3tc4ykmTeK/NC87vbeR7VBAq8VA5YgMw6MYaKB+f2ae7ch
	m7z5u50TRZfhy9d4IAD1Hn6ZG4wfENX69i6rLEwddZhqrVFlomm8cuPU2AIcTFOYzJcST7nIVWL
	qrLAU/s6XvVLGUOTgou/Kx+vdWMcMHtkF2ezI38RblZlzLupxvfi/aUW17WBCYfIl+jxbGAxFGt
	HM53R9jCD3QyyOOE4Joni5lFq8+xw0g+r0OrpHPJH0P2MLCXC8WRhwHhsufkILaq1taKT2YlXbJ
	r03HOneyh1gvGgf5QT8vxSSR8GkAzTxbHkXgGjPEy9QF2oJILvPERgmt0IMX/weLFMOx7jUVAkk
	JL5MXZ4ziM=
X-Received: by 2002:a17:902:e84b:b0:2ae:c7dc:95a4 with SMTP id d9443c01a7336-2b0827749f5mr115976435ad.20.1774275355708;
        Mon, 23 Mar 2026 07:15:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08368ea1bsm138336495ad.68.2026.03.23.07.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:15:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <86ec222b-d252-4586-a1cc-2a7a5674e1b4@roeck-us.net>
Date: Mon, 23 Mar 2026 07:15:53 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] hwmon/misc: amd-sbi: Move core SBTSI support from
 hwmon to misc
To: Akshay Gupta <Akshay.Gupta@amd.com>, linux-kernel@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, Prathima.Lk@amd.com,
 naveenkrishna.chatradhi@amd.com, Anand.Umarji@amd.com,
 linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org, kunyi@google.com
References: <20260323110811.2898997-1-Akshay.Gupta@amd.com>
 <20260323110811.2898997-2-Akshay.Gupta@amd.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260323110811.2898997-2-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/23/26 04:08, Akshay Gupta wrote:
> From: Prathima <Prathima.Lk@amd.com>
> 
> Move SBTSI core functionality out of the hwmon-only path and into
> drivers/misc/amd-sbi so it can be reused by non-hwmon consumers.
> 
> This split prepares the driver for additional interfaces while keeping
> hwmon support as an optional layer on top of common SBTSI core logic.
> 

This moves the driver out of hwmon space into misc/amd-sbi which,
in my opinion, is completely unnecessary to accomplish the stated goals.

I assume this is to be able to make changes which do not follow
the hwmon ABI and/or to bypass hwmon subsystem review, similar
to what has been done by others.

Obviously, I think this is a bad idea. I won't give it a NACK,
but I won't approve (nor review) it either.

Guenter

