Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8FA2EA732
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 03:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785898842; cv=none; b=AajtvlX3oaw+l044ABBMZ1HTjyqTvU0ON13GE3zh3ldW3NNbZVhM9xe3+WBum2u03Abzjp7HHEScjOja87xEkAG9k+APOBuNZ4FPRYZH+9ZbiN2aO+g8Y/oGi5Nv6q6XjZMeCMbvHvMFBP81rP14B0DN8/9HLvaSI1sFsjeKO+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785898842; c=relaxed/simple;
	bh=+VuQhcSer8nWg4SZeZ0n/RjT/bBZXVsj/z9GVDtu0dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mDmbZ2cDthEp0Vog+2+ED9xa0AjW3RFjcwzYNBJsK+V4eOkgXsUppSjPf78LSXpxXSmJPuycRj8dby5k/aY13ic9Lo9QGEkjJ950rVzDagSLHBijrgg1sijOPl5fvgdCxckPha8PT3CZBcW+upSXkGqvycyteiimvLkmrwa6L/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMJ2fwjg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMJ2fwjg"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d02b4c3601so6067255ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 20:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785898841; x=1786503641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4040ksGrhA9/cRKrc6XpBcuZBsxi1FmWIRVWqRAOF0=;
        b=UMJ2fwjgtmWnvOdjMjlDxlfIuSnCsQ2cpGEEK5vn9fwWaiW55U/6YYtu4h1jguoSCb
         tKO69slaIIgx3WwBFXlktFTetqeFsERtjR7TlCd3BL/sTiwbZDJ9XquPaWtxc/GS9Oj2
         ERuvBri8AVIXDAMQVXwbGd3pgX/WIL95fd1VFrAuJd7aAzeOhvZk828waWnYA1yGh//S
         B5MtVJ+gB0bfOQseBfV7yN8mqOdVVxk2TCMfnyhblB3jbOk/A51v+uNvIRdEbn6CUFaH
         Mp62UyfEBs88LuASicsKMgkYbdk8KllVTHMjpSkmFnhaqR4eWWRA4Yh7XIkijPh92URE
         WJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785898841; x=1786503641;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n4040ksGrhA9/cRKrc6XpBcuZBsxi1FmWIRVWqRAOF0=;
        b=ZB+6Zo2l+492Y5N6ofd1rmYIWgMs8E0M6xJ98DpzxizD79PojP0Y1DRE0iWQGwiihH
         hhMleEv6MUhjSUhp1tBvvv1hez/vcsEsu1VqVgWWR3MAAsgkssarTdHgEGnZYlzQP3e+
         bqvxJk0zLnDKi5DBYWB9NWMC6K9keuIwKdp6MzmF5R0VUhtNGJiZALbcKYGwFWDaxVX6
         TNAjNLPxUuVL7d6/HVfqkeR8CfWQQadRzGUmGA1SpkQf2floxvAvcJyDZYYs1x3LjBkR
         rxI/Kd9pfDMDy+HGfaWQfs+nEbvFs8z6bIKMD8SHPfPHJgHkcI9o7vm2cQd16x5YtaYF
         tT1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpezOi/hToaNARCb2MxH+Rqf/sTVRmnA7UcF3ZT524seBzC3i7+sW+VT6brxyh7Fo6OWS8UxsDI5DGXaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFnREkiL/sEIXBbxrw+J9KvhQTQ+/2K42HjWYhOvYIQX1HofEG
	HCqBJuzchKp1tGBI6H6oYwiAtIKIG7yyqFu4IXCjiv7Ho2LlyCHL18jE
X-Gm-Gg: AR+sD11hk7tu1MKKQhzw84qrgPANGjxjZki5MSguZb5HMMv0ZSZ7k4Q0AnUphvbMfFP
	v18Aa+OY6qQx+eyyewqmATDkM3MAoqzY9HKIqRdjnhEjAqMuyJuuh1SHCgl4oZL37nxiIgqa+zE
	Gd3HPHFfeoM1lTZFwET4WEDwnxyM8v/JQfTcf6YsMntrNnhPsEbpfPnRP5Irffw7wTkQkq9SCJ7
	nwbXz88qjvsBZVFNiYdNGqsLutyxUZEh1wFCGuRokNn4svxE+xnh1gfVCXPFOpps2z844NkPPup
	GbBSOcPkT+B4ELyM3pdQFQC27S2g/iPG+rbc3aHmZy/muzxBEHQidkO8pMVGJ8tnJ2h9gyv8W/V
	IhQHS41PPaQ/uh+0h8/GFffL21i/cwXYEZrZiN02ue7cJ7GyMnUk+lQGq73g6tPRJyPppBWCx5/
	MYKTlz7kI3NnjW2AWBD/swzUAzrhouSS24dBZfz6Pfk0AhJ9Q+leiKJQ/QS3V5sSsSYk9x/fTqP
	3c5vyPpzT/MxREpju0QoiqRhf/d3FHPe5xGLw==
X-Received: by 2002:a17:90b:264c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-3903c598e8amr3509484a91.4.1785898840828;
        Tue, 04 Aug 2026 20:00:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38feda512fesm2887722a91.9.2026.08.04.20.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 20:00:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <04a58bd8-df9e-4c66-ae19-8473d6ab9c41@roeck-us.net>
Date: Tue, 4 Aug 2026 20:00:39 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: wm8350: propagate ADC read timeout instead of
 returning 0
To: Ivy Lopez <skunkolee@gmail.com>, lee@kernel.org, sre@kernel.org
Cc: patches@opensource.cirrus.com, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20260805014221.16412-1-skunkolee@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260805014221.16412-1-skunkolee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/26 18:42, Ivy Lopez wrote:
> wm8350_read_auxadc() logs an error via dev_err() when the AUX ADC
> read times out, but then falls through to return the masked value
> of `result`, which was left at its initial value of 0. Callers have
> no way to distinguish a genuine 0V reading from a failed read.
> 
> Return -ETIMEDOUT on timeout instead, and update the wm8350 hwmon
> and power_supply drivers, which call this function directly, to
> check for a negative return and propagate the error rather than
> using it as a voltage value.
> 

I am not sure if this warrants fixing in a 17+ year old driver,
unless it is observed to be a real problem. It appears to me that the
error handling was likely not implemented on purpose.

On top of that, as is seen a lot lately, this fixes a rare issue
that is likely never going to be seen in the real world while not
addressing the many real problems in the driver (as reported by Sashiko).

Guenter

