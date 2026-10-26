Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975053;
	b=UhXMNmdF9xEnJMGFkzFx38i1m9/AFmZIjvNSXo4LxXUBmkkBDQxH93YXdjPwkrow/QJX
	 KaWB7OogHX4msmg7JclrJVCZixIOzsLJRndSP/Ok5YkCahBe+3z5uJbrCtSYhvbmR/Y99
	 o2WV3iR68C+2E7PDWKw0XgOdSHX4oXHPbM4Zfh9zQxf7BgbGrv909LCE3/6wKktKwsIBP
	 fT8g6YboME2gPniPml1pK7guhfirWXjYGtNfg/esYMqG6++yVVEiSRgM6r/8NCaMn/hNS
	 Sku2PC+1cSft4pik+Y+yuZ1sEYul5KX0ag31qyCj22und0LSRWxKH8rYtSJZDzja93g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/r2wCtdnrDJsEXzwIAQNFz7BfQauVg6nVHFaCnIJdp0=;
	b=kkxR/fsnZhgalJCovXXaL/1xRA70/MFipx/zTJ5Jbm7LSeWBwP25CPl87sIXkwq5ZyDd
	 ZzUyA8+xuh5O+mrJOEQeMfic+ZSS82jxlSlqLrJHoEdntHD7KRmlYwDI88NwTxmiT9ONy
	 5E+WaVryN/o+tGIyLUqBrSz+bW1mRygQDcxtwkVsF8NZM/DiSz79u+gaqI5dPZoopT4/l
	 LGXpU9ebn9KQuLfCOh9Lhqpz82UcHYO4gdYFPfn/ROEav8FLnmcGlpPOZGtOeSiFZhlWL
	 wXGYLqjwFDCcGTqJpUPGMR6TOQgv5uU/iQ3pug8dg9hZ2MIumG9RJcZI1BtAaBDiJvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kQ4KO2JE;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723B7606A31D
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 723B7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kQ4KO2JE
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2253037a91.2
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975053; x=1793579853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/r2wCtdnrDJsEXzwIAQNFz7BfQauVg6nVHFaCnIJdp0=;
        b=kQ4KO2JEql3oihR/SCtBt1vJKCgrVRl25/fb2gLlEZFJPuafW+8/uX0PuylfUgsOeQ
         ZBiFgxQamRcLUW/InXMrst3KtjE4PFLNoUmTzwWab9UKnsDnwpjniuqfFR7LRGOSs54E
         NDBHGmnbJtXdkmD81sndY+WXvXwNHCUvdPBon1Iz5VJlwYL7PLSbJxnoLzmSJY72zX9u
         VDw+njuTy+YQhTtd3HZqwgQvEO0eQ6c4VExJt78JybsY6X3judkiVcwhlQCUBSLwGfSe
         jSauTJB8gN2PthrXekPk0v2YN0Trk3OUmhj9F0TzJyV4FcQl9D6vwG21LroJpTEuVOIT
         +0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975053; x=1793579853;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/r2wCtdnrDJsEXzwIAQNFz7BfQauVg6nVHFaCnIJdp0=;
        b=nn+rHNSZQMiTN9pTpPJKH08wVgwnm7W4j4YgWQiV/jSG4j/62hWtwSSS+bSKBpUvUa
         r16YWQcr03xMBJ65WN7GmhhWm/Jhc2WUV+EhKfyMzjGICNYA/BDELP5tNN/MHE0b9R7m
         /Vq7mNklPXskya/t1wSgU/WLWsKKpcCew0m29SlSDziIVbjesEC1f7nE+5yyHMTRFjkH
         iJUw764Jc5+T3t6KxvrozGgyiDhnRPBJQVhx+oPmpgfUZKY2RJZWa4lj6eJhDZiLwLWp
         dLNV85XUMKfhqnt4vwLnYNZ9JG1pXEFhX7TyAw8GTckTR5Q5NcPxXwr1JPJGMXOFekNG
         WeOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVheYZDM2VMlKakY5F3VYE7S4sazFrUzGi3lhxPflM4WadPVDijOBFEgxItJHWz/OM+wI2r2a1ao2riQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK0H8M5kUfiZk9afw/Z8jw3PcQAdBAwkM6NF8/9lg2jkvNkP/c1
	kFMUXZwVigg/NTwB5sVrhv4e2dKBWF9dwytdYewdumuwwERldTudM3g2
X-Gm-Gg: AYBFou0/DowkrQ9DRNoPx0uKVWkmPDSi0Pe4aUvOUOy4ufFR+d0JzhUwM89qjxCji83
	LruRAyU7zrt17GtSFidcNpRHZt9kueGxi5sYe7pCJ3VMHD476LOgZfSNH26Vk7jvPdmME9u9Gjg
	3W++wJ2tqrhb2VtUV+ustwseLCIC9aJDxaytl2fsH3B2QLvWuhpx1EqsbyQnwyQ0o2cPjQuTnYU
	MbToji7sZVA3uvHtniArber03HcSJm/DsDq96ps29EXh5n0E7p3wJb/DRxaT+SRF3b+7Zgk3Mil
	BpP4pitFTVMToILBjaVv1biEi7ob1ygaamEMTMiORXFIE794UjHoFWhMMQs3y5+kvijmEgAHFnx
	P2oxMUibSEHARM+HnCTbFUgQwBNfoU4wfZ2CBiucCPb2Yg7tPYlBQzhMD+zUG1skoDzmOx22Dfv
	sZiZzQxeK5oCjVizfm8+YMmXHwAKNTbkZemdE/Eemp/G/EXgu86NaurJ1U6STdEkbC/rWxM0Ref
	RmvJJYomwYv/s6yRw1mcXp+IHFJN+pc/14Rz2/JMfetfyWHl9GG9UUpNlpSzu9cUBgKTg==
X-Received: by 2002:a17:90b:17c9:b0:3ac:a139:1b14 with SMTP id 98e67ed59e1d1-3adeafc4fddmr4768147a91.57.1792975052754;
        Sun, 25 Oct 2026 17:37:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae29c7e756sm600001a91.16.2026.10.25.17.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:37:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:37:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lars Petter Mostad <lars.petter.mostad@appear.net>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
Message-ID: <30747603-76ac-4032-b3ce-4e24f1a5f55e@roeck-us.net>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-3-27ece4e43d04@nexthop.ai>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-3-27ece4e43d04@nexthop.ai>

On Tue, Oct 20, 2026 at 08:02:07PM -0700, Abdurrahman Hussain wrote:
> From: Lars Petter Mostad <lars.petter.mostad@appear.net>
> 
> PMBus 1.3 allows for relative encoding of voltages in certain output
> voltage related commands. These commands are encoded relative to
> VOUT_COMMAND. Support this when encoding/decoding commands.
> 
> Signed-off-by: Lars Petter Mostad <lars.petter.mostad@appear.net>
> [abdurrahman: rebased; check VOUT_MODE for 0xff before testing the
>  relative bit; use signed division and clamp the user value before
>  scaling; reject a VOUT_COMMAND that decodes to 0 or less, or above
>  INT_MAX mV, at probe and from the regulator, and scale the relative
>  limits by it without overflowing s64; update the cached VOUT_COMMAND
>  only after a successful write; decode the regulator margins with the
>  register they were read from, and in relative mode bound the output
>  voltage only by MFR_VOUT_MIN/MAX, since VOUT_MARGIN_LOW/HIGH move with
>  VOUT_COMMAND]
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Applied.

Thanks,
Guenter
