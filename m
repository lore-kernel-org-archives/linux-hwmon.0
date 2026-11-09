Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239514;
	b=GTYpM97jRv/uT3UXxK+qXM6dL/0D5xyI6cmhG0U2YRJE0V0KO4pSnQkgG5A0uen4qQce
	 DzDs8L+njUK5VbeMFWXJyGHH9/6RFuWug3fCE26U0LqgRYIsw8g7a6u+VbL+4i27jHi/4
	 fwlRc0wfe0vN3FmPJ3sztP9UfKAm4FD6EN9eTkyLMMZMWhDcJ5/ALlqpeW5WkWycbb3GI
	 NAbZuu7QJF/QuQKmXXkSQlD3letAX7aqA249zl1QkLvFB9QVdLsPeTv+6scB2hOW0esWY
	 iYRPevapdc7KFHyMfg4NeaqHWV+OGAa643IvHmezmD+PTGVsoPryLf2dQYRyYs9OFrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Cc:References:
	 Content-Language:To:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=GqcUVOE8YZm1FPDzDze4+rCKgn8rK0xiBVztztTok30=;
	b=hAwhLT7cG/vx/ih7jgWkby7BYJC13DvBw13q5912OGxmNvbtHceYRQUk5/aLtOV7eYym
	 hOnubeJ9PFzezaaAPy9tpdfrPekcnn7+WYu62/VSVB9IDXtENFYWVCPimqK5lzuOccjup
	 brap2HWTEi8H1PrDaxTxH3hzWwCfUzZ2pG8MrOdxkv8OEJsn2HASkTgf92j1tt/YwZ3tj
	 QHtAx27aVFpFAUrWbyL+HPyS3ds44pOQmsHOzmToqVmA9oNQHKBEUTgpv40BKruwcagNb
	 Ir1F2t6HQ6fhjgIKO7psu6kB4On90AjOHZIjnOtKrS6pnzOWJnSHNFXYOmE5R5wi6bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I6Gf+TJ+;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB968606A332
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 15:51:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB968606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=I6Gf+TJ+
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e3b22e971so563434f8f.0
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Nov 2026 07:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794239511; x=1794844311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:to
         :content-language:references:cc:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqcUVOE8YZm1FPDzDze4+rCKgn8rK0xiBVztztTok30=;
        b=I6Gf+TJ+xx28C6M6wGa7IriJIxP64CATq5xKa5KY4/dVEF70L68u8oNbC3qDhkhEI7
         7ia14iP5TbkPq0pUWtgTMNnR57unFzAtVelBZ6VlJdQ4CrgVYgxw4RobiXpnUn7hkB+D
         nzTyACD0+MFjBaqWPAWXlFUgKFrj/LJmZ6fQQvFA0wYX9Z+YdDx7xP/wSzXM8J7jhI3Y
         cnv1opUi8bNDC5CGiUC5RyhE5sufSwg94ps4g0+w/MIT3GHEM+nHtCTD6yBD+zcjVMzC
         KM6SnUFC/LBhWAJoh5/3RAr1pEMN+dTTDdPPEWzL92kIaF0QNP3pX9QYFDhi6xIlcLq5
         xWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239511; x=1794844311;
        h=content-transfer-encoding:content-type:in-reply-to:from:to
         :content-language:references:cc:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqcUVOE8YZm1FPDzDze4+rCKgn8rK0xiBVztztTok30=;
        b=sI1QUBxdJ074DdKCViJH4kGHi0toWhb4z3Ll5LKWEC/VcEgtnsNptwSLVNmVgd472H
         l2dgfI91CRmTCfzcqI+D4ivgfJ+WJ+tixqLnaNmnFvd9Un0O8H2aFVzgMJ62DTlq0jy2
         +PUn1NM3mlOOWnkWL8tCaXdM89C5aoXWa6GtTljHIqz+Q7LnS816UpES/vte7wMCQ5+6
         PRH15+za5UVWHnPYzd8p1/qBpWOenXpTGT67EiiO/6cknuOtqVlJ6sgieZXXDEqPpxdV
         BlMIdO13pMD6wP+yMiZkJ033c4GLglDStst0irawM315x36XIBuVnXcY5NacGQBtHPpg
         JsmA==
X-Forwarded-Encrypted: i=1; AL+hErE9sv3HfOwk88HGoEDEpnIb2mb4+DN+B3eAfBIMtmSwjEUP5E4pQWKxh1PUnGme4ti8VHUz6bmAxNl0Ew==@vger.kernel.org
X-Gm-Message-State: APuU4Z8pvQjV0ITBvq1nhM6oPX5hWWj+jP0qKDzd+flPKYeRu4tQQbj5
	3CXzu8zgKmYF3/QhriVTSEBQz3dKXtaFf7WeQx6Jv2Zb0BDJZfxuZw86F6u4j1d7Qq4=
X-Gm-Gg: AYBFou2a2Sma3C3eEDe+dHo40kNMdNTqTtwU/x75ucS2fqloenjEl3ZOM9K9bxr3uA2
	ue87L2+B8LtS91dUoBVb0Ve4unBiItNgF5edSLgLho5y6YgBV2m9TkKebEJCUEGH8MuBBdRXaUp
	JVscRdLlW/50gABlw6t9lx5FCFJVJH8PQDDcG2XrE0wUyUJaznkA/xZGOKR4hY1St27ISczdiv4
	T37MK3TJRloD16Kcx5LLm24vUeebIbG5d3thoYNKPpGk0E509iZxsj6R0Kux33QiPPy5RhBf2nW
	HQEB041dbmrs5jhr3x67nZAxbrcYqtAhlBiSnGGyH6lDdXo7y04BUFkeH0QjbTxE3Qp1mWdBxoj
	zw6nBPLLCjuLIvCt+Yxb+XsKwIiJJaSuVS8Bl22SizaG8uUt5U8vEzhLg5eABVaosNW36wThaSe
	392fELtxdXUzO91/H4PCURuApL/XBeO7LAJBcz1jtVGnfXZgJTNcRRep533pZaRoFQrCXm3EueW
	LKH9h7EnhrrGjr5dYZ3iofAeeexpBav7dZLqQN/BvQ+p3Itq004aYqe8Mwe/fimp/p0U9yVnAxz
	/wCW2GipC5ChpC0Ey6jCK1+Jd4qWeNc9FUvQh/xgBMI8/ScBxMYs/2qiR6hamyGC
X-Received: by 2002:a05:6000:25f5:b0:492:e1a6:90eb with SMTP id ffacd0b85a97d-49582e8e516mr8245452f8f.10.1794239511204;
        Mon, 09 Nov 2026 07:51:51 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597186eb9sm10435718f8f.35.2026.11.09.07.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:51:50 -0800 (PST)
Message-ID: <a190f981-d668-4208-8148-f4e50adb31a6@suse.com>
Date: Mon, 9 Nov 2026 16:51:48 +0100
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Remove obsolete __MODULE_STRING()
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Ian Abbott <abbotti@mev.co.uk>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rudolf Marek <r.marek@assembler.cz>, Andi Shyti <andi.shyti@kernel.org>,
 Chris Snook <chris.snook@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Duncan Sands <duncan.sands@free.fr>,
 Chas Williams <3chas3@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-watchdog@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261002-module-string-v2-0-fc7438acaf4d@suse.com>
 <2e88806e-57dd-47e0-a9ef-a8507d22aa3e@suse.com>
Content-Language: en-US
To: Petr Pavlu <petr.pavlu@suse.com>
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <2e88806e-57dd-47e0-a9ef-a8507d22aa3e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/26 11:36 AM, Petr Pavlu wrote:
> On 10/2/26 10:31 AM, Petr Pavlu wrote:
>> __MODULE_STRING() has been an alias for __stringify() since "[PATCH]
>> MODULE_PARM support for older modules" [1] in 2002-12. That change also
>> moved it to the graveyard section at the end of linux/module.h
>>
>> Replace the remaining uses of __MODULE_STRING() with __stringify() and
>> remove the macro.
>>
>> Apologies for the wide distribution. Acked-bys are appreciated.
>>
>> [1] https://git.kernel.org/tglx/history/c/136839a1b4
> 
> I've queued the second patch ("drivers: Replace __MODULE_STRING() with
> __stringify()") on modules-next for v7.4-rc1. Thanks for the Acked-byes
> and reviews.
> 
> The first patch ("hwmon: Replace __MODULE_STRING() with __stringify()")
> should go through the hwmon tree. Once these changes are in mainline,
> I plan to pick up the final patch ("module: Remove obsolete
> __MODULE_STRING()").

v7.4-rc1 no longer contains any __MODULE_STRING() calls, so I've queued
the final removal in patch 3 on modules-next for 7.5-rc1.

-- Petr
