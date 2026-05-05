Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5731747DF84
	for <linux-hwmon@vger.kernel.org>; Tue,  5 May 2026 13:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987718; cv=none; b=qc+7ehAME08G9VHv8GQFQ/BfoFx/5/k6G+6xtjsTbnMojcVojQ8TsunNcaK+mL6nq9uUtZPVr3i8auREKVtgUTrAMbS2XG3m2ndxckRzsR6CuVqWUnkHukOhO2rEvbSgO60waTdMIjSVFSlAcLM2kk+hTtVBgxrqZp11wkw4z/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987718; c=relaxed/simple;
	bh=6He75TAJp9Hcu4IIjyK1GRYq9E56HZmoCCIg+seQieI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8+skSNfX65etYzhXwKdKKOxmvmatRj00fkRjOSG5we0LooKhfSEgtLdAb4w0I9aXpC9iJj/5WRe8+5M0euog0EhgbqXPCsiTKr5FyObIonq6Rpivf3LNc1O0TUo5H7MFzfkasTktq0TW0HtZVRdZmvlVx8xngY3Fe4vEgg7FAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fR9rgjA3; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fR9rgjA3"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2f30a4601bbso2011326eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 05 May 2026 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777987716; x=1778592516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JES9etGQXOz9eg3l5S9Lg4daNqVnd6je1qDOz6kBCvg=;
        b=fR9rgjA3eHKpfCyM176Bu68JulEDZ6lTEAZnmmaPcJI+gJupJqg1gRmuqG79P7B1mP
         SJDtf6u1rLS67Zt4pMzbrvnC4P9rzbEej0w5yMvGXbktRc2MnL247n3BK4oEhFPwvtbU
         mH/M3YUnBFCwze+r5zNoUSdCk7py3MKB97b2xtw9QOnsfytjHj+ZSH8RW+gQomLlijXt
         AdzcXrlp3BJwWM6SDILt8IMkw+AQ2o4Ns6CsJKm55ErVhCicKajJC1kjpfiTe5aYglPl
         GR8xZSwUsgbOGmrC5opTtzBtdxg4aBbTlVqSdFnFv582ARaiPgQ0RpZz6gtdcEQvM0Fv
         u/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987716; x=1778592516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JES9etGQXOz9eg3l5S9Lg4daNqVnd6je1qDOz6kBCvg=;
        b=o8M/QiHVgAOoiEsUsUHRfHPJgMI10RuWYvIF6b2xG0tHKEzGKDn2VMSjyWP/p2Rjc9
         pVwQoy5mlSZdO+/gIdbBNPArjJHs1RK3HtQybpukagQEUAwWn3v18gKEm6X1LvqDlYJG
         k+c7ezfE7SNzVD6OmvZv7SFAHbYgowR3kys4cd1clZS5i1UhBhODT51f68C8QvVKhf0z
         Mp2SVt5+lzZEcxJYdvrdDOdI+dbWSsuXpP6h85Q2Y3kBkdjGgWQIuIRhRE1p71h6Hg42
         gTXaX4pnaOwEmzHrolpQc6pq5tVuJyeG7W+ZHdGs1VAmYmC+nIfU8oWwxnRkADEIB4JX
         iolA==
X-Forwarded-Encrypted: i=1; AFNElJ+4piTXaZkZCS+Mbkzj5kZ/JOgz2CiOFb2OOLGuSzV8vbmgW5rBuO2k+s93b6gYw8Cb0h4t23FslxZCxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdQWABF6u+nnGik2l4ybQc1d8IeTHThgIcGPzsrE36DjRPtbWk
	lNBXbhra5l1i0EvF+4vunrSk7/1RvdDCQBBdHC+aQ2RUxP4KMWhZWs1w
X-Gm-Gg: AeBDiet+W4qXhBFSFmu2Se45bfecmB6L662nHeZ2MMfqUobortFXNMp0+uhTt57BJmx
	zSCrjknOpWyVg+3S0yiE0Q+HNYB/3VKUX3zqi3f2jZlvNgo/kTVRTotcgqN9iZpL4gU2C/XoKIT
	w9auCDa1gsfCFbYQviSE0RexH9cWbQ/eY/VMSeVpw5/ELOPihs873oETEPSV2zCCR0ZHEJCGvf6
	bcq/FtbXAm7ji3Hs27uPlkYgu5falYbwQ31sNOUGIAD2YurbQbrWU8F8RXflrkRRpLx/GsG/ayO
	wbIWRxLcfMbGZ5YbAAlfo3OlskpWDikpV8Iq8hVhu1w7mblFm+VSl4wUfUMxbS825ZXbDF2kJZw
	gXxZEpbwgqyM4MJx3G8I1Jc3NH//A1tNpJZzVNCzPXPRuF6ZgDGxaco9yUw+dn28gqb6qOagUBm
	cmrti404gCGiDQhGuFFJdxZhKrbyhUJiwBe8YEXEYg/i4JaOw=
X-Received: by 2002:a05:7300:a49a:b0:2d2:129a:1694 with SMTP id 5a478bee46e88-2efb9e7bb88mr6319386eec.18.1777987716410;
        Tue, 05 May 2026 06:28:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3889d634sm24404388eec.3.2026.05.05.06.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:28:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 5 May 2026 06:28:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/max20830) add driver for max20830
Message-ID: <6a48d684-a71a-44b1-86d8-8a5836efd6cd@roeck-us.net>
References: <20260505-dev_max20830-v4-0-4343dcbfd7d7@analog.com>
 <20260505-dev_max20830-v4-2-4343dcbfd7d7@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-dev_max20830-v4-2-4343dcbfd7d7@analog.com>

On Tue, May 05, 2026 at 05:25:06PM +0800, Alexis Czezar Torreno wrote:
> Add support for MAX20830 step-down DC-DC switching regulator with
> PMBus interface. It allows monitoring of input/output voltage,
> output current and temperature through the PMBus serial interface.
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied, after fixing the formatting issues found by checkpatch.

Thanks,
Guenter
