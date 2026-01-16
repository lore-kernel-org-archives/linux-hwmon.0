Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ED128B40E
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Jan 2026 14:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768573441; cv=none; b=Lmr+1pDYyBef/+JvbEEk+UiRIU+PSItfCptJSWCzhk9JDHZnDaPqm/FKH5zqRFPXnlQSG/XeERmistAChS0fdFj5pkrs3eDvPiZ3AClV04JnQinYhwtp/M+h0g9TgGm+u4cSyau/LjOzaJ1CmLQpNYhXw8sGoEpQ7ywaf2JmqFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768573441; c=relaxed/simple;
	bh=AJ5ilNTXCmFbN1sZhiRyoXMZdR4/AegoKc+oZ70VIQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJTqQZOLhtUIKciJSx/zLGizddUOOQK43DfFRT36xFBkjs/THcSLM/kDzkMdEVVordjkcxBrUkLnE/nsR5KsdxJZ5YX+2tM5vo2OldETCm/PWQOxN8oD6fuliVvNoNFlE0MffzH7csYyGj0xKlrlYG/Fn56Q6+fgOWAiKA/A3/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpGPc+NC; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpGPc+NC"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-81ecbdfdcebso1254225b3a.1
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Jan 2026 06:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768573440; x=1769178240; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HPArp3drtMpT9gYIdrY05DfxOakcVV49Lx9C4/UTM/k=;
        b=fpGPc+NCCcfBJMAJ+5hSdA8ocPZ+qAuhrZDGxa+3cUri3CHvs5bvNPAa0uT8O5LIoM
         nDj9NXmdaTeEs1YoC+Zr6IftsQR79MGmKFasP832ltVuFi/qnjzqqOcJZYKIvoUJSsCP
         u4PeX/dX1hqjHwZJYX3umzHJ2Dm7DHMIM/ztM53DlywqQYblZrdndr/zVVxXQ8GQvpdf
         GK26WoJQGPBHMkRSkoNtKHbdKfLPF49tdf/vf1KMi4PpfS3dSPP1brRSltylhXysxawb
         L9vSz44CcQ1gcWN9mSg5thv+5f+NpuvHdIbChcrlYP2UXjgsA2bUrMncrYMeOq6/Aasd
         N+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768573440; x=1769178240;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HPArp3drtMpT9gYIdrY05DfxOakcVV49Lx9C4/UTM/k=;
        b=BpvvA4WdsLdoTVy428RbSjpZfTBXjXofi38uwj2oJK6dLdMXMxRdM7qkf1joGRDPf9
         9Ju5a6b6TQklmrMSCUl4m84II31aRO7aetUBd0NiRrAOBM8+2RhiVA53mWEQc5uSlsWV
         kpdxUMD2y5/LWz0LFhqAAviZOMlcolO7muJJeU+TpyHdxo3qmsyhqtEetwwh7YKTV9tn
         zsnoT8ajB3rx60RNo5Z7miPJlvtfguEcPPvQWJAh20cdpNNZAzVe0sbYYmUb1f3aEvZy
         xWhw2qE0OS0LaHFvr5ApOrLDKEj5ex8WzTOut4M/O42AC+IyDulHv57xm9AqZ5i6niPu
         82ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWRNeONKqWbmGhWypX3ps1ZcalxCOyy7gfPCoirjIov2ADSgl8HIlp3mcDNQLlx3HLUjxatgvZkPK3Fwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIUDj86cca0bwnRh+lRaWILzHoGnDom6jfIXK9yuDtwbAsmMm5
	fZ8kd9XPAV+9ikprjWw4gm7Rq1bdwjHHGkV0xdA27/4UM/sDnBKYEqqV
X-Gm-Gg: AY/fxX7GFTOaP2dpHgemt63waKXbyEi+UG18Z0XD6UGmQrtx77OwBTf8a9ulgK3oRRc
	JHohktdueTt0W4fB98PbYraeZsdMIrb2lQe8WTmTO6ANY8eQJazBqF2WyZNe/5X/W8rcW54DRfQ
	DvXj0pJ3LGwgqOfy8OmGaeD4MC2/4NLfUFzk2hV93qRuqF0LR4rNvtg7X5YM/Y+vm2o+exsw7PB
	Z24ksgGkIjHM2DBQwHWq/CIK0C8KUYa9YZsv+8dWyyxAlwczvC1l1wqgcJhDw5RKdf6Dp06oh3J
	0zQBC879JSFmyRcTsNZyHFVfcEuUkIrHtSvGQAJHd178KSAAo6sTBbtpBaNrRLcUrCakR1GrfXL
	kU/iBZuiJCFVBOY+wZm6PcxIDelDP3VXYuQMbvg4rwvfslvOwx7sOXPX56PXq+JJnFEKO4eRh69
	PvjMKGzTxRT4kChKTBev0=
X-Received: by 2002:a05:6a20:2203:b0:366:14b0:4b09 with SMTP id adf61e73a8af0-38e00d7bd9dmr3180311637.69.1768573440025;
        Fri, 16 Jan 2026 06:24:00 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf32d68asm2228914a12.18.2026.01.16.06.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 06:23:59 -0800 (PST)
Date: Fri, 16 Jan 2026 19:53:53 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, hansg@kernel.org, linux@roeck-us.net
Subject: Re: [PATCH v3 0/3] platform/x86: hp-wmi: Add manual fan support for
 Victus S laptops
Message-ID: <aWpJcv5MOlxjb7A2@archlinux>
References: <20251230145053.516196-1-krishna.chomal108@gmail.com>
 <20260113123738.222244-1-krishna.chomal108@gmail.com>
 <176848473669.15451.499475802697727364.b4-ty@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176848473669.15451.499475802697727364.b4-ty@linux.intel.com>

On Thu, Jan 15, 2026 at 03:45:36PM +0200, Ilpo Järvinen wrote:
>On Tue, 13 Jan 2026 18:07:35 +0530, Krishna Chomal wrote:
>
>> This series adds support for manual fan speed control and PWM reporting
>> for HP Victus S-style laptops.
>>
>> The first patch is a trivial fix for ordering the include headers.
>>
>> The second patch refactors the hwmon implementation to use a per-device
>> private context for state tracking. It implements RPM-to-PWM conversion
>> using linear interpolation based on the laptop's internal fan tables
>> retrieved via WMI. It also introduces PWM_MODE_MANUAL, allowing users
>> to set specific fan speeds.
>>
>> [...]
>
>
>Thank you for your contribution, it has been applied to my local
>review-ilpo-next branch. Note it will show up in the public
>platform-drivers-x86/review-ilpo-next branch only once I've pushed my
>local branch there, which might take a while.
>
>The list of commits applied:
>[1/3] platform/x86: hp-wmi: order include headers
>      commit: 60f2d5d0f04365c41ad4f9eddf48c80dcd0b01c9
>[2/3] platform/x86: hp-wmi: add manual fan control for Victus S models
>      commit: 46be1453e6e61884b4840a768d1e8ffaf01a4c1c
>[3/3] platform/x86: hp-wmi: implement fan keep-alive
>      commit: c203c59fb5de1b1b8947d61176e868da1130cbeb
>
>--
> i.
>

Thank you
