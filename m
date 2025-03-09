Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0FC19E999
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Mar 2025 14:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741531826; cv=none; b=jg68NTur4n2Us87MZAWRHl9XPM68r7x9jJGOiqleu0hZXOfQXau4kuKkjtNVQxqjfWbqPKPihZ7oMDKvE24XazKuEgjEsSTknHb3X4f3whICtm5IL+b3tOTWhf/7yV0SCdShkKuVL3r4GRrSVsOoEr1NqfgqEFpTbwsmEpw5FmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741531826; c=relaxed/simple;
	bh=/2k4zmANrLa8o9Rpk891pjMnQao4XTsgz32zRhaRDJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nAdjIKfM761frx/xcgHSu1ivxgIZUNNUP4LB9y0OKwWc+L8iQ6GD/npHaPcA6r3oKOv6pwkXYmRsVRZq9k9n1cnK/T5SSxYiRGb0EoZRxpE4nZ80Q1EyouU7R+1rZN8DkfH1ZIv/UJamuAjNcLNbPCRLGkBjitDn8Aip+JrUlHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfX7o4bf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfX7o4bf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22403cbb47fso62489465ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Mar 2025 07:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741531824; x=1742136624; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pAnHFNBFYEKBV0D3j8Ek4czZB9M0vXU6URlX2ybdFN8=;
        b=DfX7o4bf5BP/Ogz9mazK0COAnBEWxi+rmFtK4Ur2UHK8KhHgEqocpl/mln1qTdNCDN
         zBa+YXWfy+/7qYAqFksNh7XDVoWyZd8uaO44BU2U59j3HJ1T0MAppfrz0Im7clRqqbaO
         kMxMetfs48VN5mY4wcUnHGHgO7RATM9JHkVZG+4OXkqtXrgZKm8foxtEbpf27Wz/Ul+Q
         xYtnIfuglkrtDT3llSSSYqcUi2p+clkrw5WM+OH9tKpgqEkqtlnB5+3TwODJ9i6z/nXs
         Cwrr0dGRCSiCgtAMczacvhGHH9tevkBszUApfF6cHfMCS5auNYnSa0umTrkLweYDAFE4
         mSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741531824; x=1742136624;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAnHFNBFYEKBV0D3j8Ek4czZB9M0vXU6URlX2ybdFN8=;
        b=SmYhYntMOTCZQVb3ywogP+XrKLiYNt7VGR8sAEBjPCxwI3nVGq74XXXlaTwDOuXPjI
         LEBe3WgSMuxCpP58Lu8coPBGNTilWt4MYyApgFYsHKQ0Eht556jOFT4K36Rf9fDv6tS5
         fXH/W6Z15MAWR5OeHE0rlDU0yu0hkehbswuATdl453TfcCoeK8OyRoz/Xt+NfhTeu8jO
         QArcyfzIaXr/K3JPd/5MTo19TXZOmMMGt86lC2UI8nhMJVF5bVcuGJDr9Hzqa7OOvzcL
         UlimSGkAaFi43+jaiOtTarA716NjpECe+GRt4VK8ULEZWeZVPbjB3BZpLa8R3YUtoF8T
         m26g==
X-Gm-Message-State: AOJu0YzEYCyCQJElVpD/RRx8oGgNceG7SxiexBI6gyX7ZYyBMs1sq9Jy
	+2SQGtmZaTU/ZzWJwchv0B/omxCr/HCUJK361zlqrWonLw469Ov3
X-Gm-Gg: ASbGncshlqdlAH7h5A4KGxw7acRT2VDeg9S6E1FzstNJr0eLrMjxfSQ+aBd6O9/V1cd
	6Grl4Yi2j6l0XmCCK86e6m2Zm66yTuA8V6A4EHzULEmTO6Hew55pnYumxjFjQqPDI+zQe7EIqwH
	doGGHCrRIvltiQTfS0Hx8Uy3z5ceGBEYx/4nOaCptofkyE/qXR7SOUAwkcUK/co91CctprDG8kB
	QXOIs5NsFCStK9wV6PtrbRDQLcwThmgd9gphjJPMhx6q1LUcGKWvHqO2kguV3OiOAeO4Z4CFSjR
	TsK0mFuTDxrXeGd9YGPrVM/Z4yx5Hz1yPyTMhBQdo/Te0oT9+BCcDO1zj931bO+zeYx9yPCGLyo
	ywABkvCKCpbCPBr2n7g==
X-Google-Smtp-Source: AGHT+IG2k2JYIbClQGbmt4hEzTUFxtqLMPohzYuVKDm5srjry8/SnELa1o8AKsEFDnnLTZnW2bDX5A==
X-Received: by 2002:a05:6a00:3e29:b0:736:5ee3:64d5 with SMTP id d2e1a72fcca58-736aaaed79amr14320130b3a.23.1741531824040;
        Sun, 09 Mar 2025 07:50:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736bb5fcd68sm3337422b3a.135.2025.03.09.07.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Mar 2025 07:50:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <59e6ea7e-eb9a-49c4-9b43-4c6be4586530@roeck-us.net>
Date: Sun, 9 Mar 2025 07:50:22 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Add KEBA battery monitoring controller support
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 Gerhard Engleder <eg@keba.com>
References: <20250308212346.51316-1-gerhard@engleder-embedded.com>
 <f684a381-2eab-4c7b-8173-f8d8634bd237@t-8ch.de>
 <f534db33-3464-4d75-ae73-c1a3a63e3c3c@engleder-embedded.com>
 <054c5313-8b54-4afd-9457-26b89a4a7bab@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <054c5313-8b54-4afd-9457-26b89a4a7bab@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/9/25 00:23, Thomas Weißschuh wrote:

>>>> +static const struct hwmon_channel_info *kbatt_info[] = {
>>>> +	HWMON_CHANNEL_INFO(in,
>>>> +			   /* 0: dummy, skipped in is_visible */
>>>
>>> Why?
>>
>> For compatibility reasons, as the out of tree version of the driver did
>> start with index 1 and there is software which rely on that fact. But
>> I'm unsure if this is a valid argument for mainline code. Guenter Roeck
>> also commented that, so will discuss this in the other thread.
> 
> Ack, lets' discuss with Guenter.
> However I don't think it's going to fly.

This kind of argument is often used by those who want to implement non-standard
code. Implement it out-of-tree first and then say "sorry, we have to do it,
the out-of-tree code does it and our userspace depends on it". That is completely
unacceptable. If that is what you want, and you are not willing to adjust your
userspace code, keep your code out of tree.

On top of that, I don't even know what the attribute means. An alarm attribute
is supposed to indicate that a value is out of range. The implementation suggests
that this is is not the case. What is "battery ok" ? Voltage out of range ?
Battery failed ? The term itself suggests that it may reflect a failure.
It might be a "fault" attribute, and even that would not be a good match.
I'll need to see the actual description to determine what if anything is
acceptable. It will most definitely not be in1_alarm.

Guenter

