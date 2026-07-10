Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9373233B6D3
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 14:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693728; cv=none; b=dE2MEjMObII3espE4Ov6RCwv8sGH52zCe7mPylr23xa8WXsMqT6QMswmJ4TS2CKKhhSPMfB06o7LRvXznAsnUStczGgTewrju8gc3UCUEfWVzrelTbAal/abvmPJ1WLpzm4C0iGzQB3AgKQ67TpOLk2QtmcOrSoknITQk9B6AxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693728; c=relaxed/simple;
	bh=YqsthvRuRGyFzu06YL4H2mAJvpJFPU65v/ndXdSDu1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mm439BvCQHtsqcKHHiPFhZnI85RE32Bkqgg/w0uemnF0zGaTVp6GM3vP5nOWexw5r9RIC/VfH6jN98YregPg70lbLZznZTBpr9245A5QSPYMekLypepXzC3D6ZC5yO1B+fYBVhh9jjZo+j4kR/1ul0ooTaMDEuMUAAJnXc6rzbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaNBzMYK; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaNBzMYK"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84783bce476so1070686b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 07:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783693727; x=1784298527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1ksdIEPMKoxqR8mRgNtH7NsEhKoyOrJ954FAv5Yb8o=;
        b=VaNBzMYKrzfVIVbmxC2p7GpuX+zSiAg1xnO4IFankAwncAJ5FqdRAZplEBf01iCxPz
         PluvCUas0PLCUmAleNwb1mN6Pqe7anGhwq9meluLvJ9C9LWTUqRhSsZYWPbrnQeHDKHV
         dMfTWfn1OZpUlquEyGAZHzckDbw/dA5YubPLmqE3LuLj5LoJgLBiNuGeyh1Hsqi7kBWR
         LjH6dItyA1m+tDOh1lMmYSIxScaBBGQtWtLhLQTMjRx56f0Nfmw7m61JQ0LzjC52YJQL
         FjwlEIbBs+yOs9EeNUL3c+sbfwBXLkWp2vfj+Xd5VT7Z9qWlIXUyQ1ingNZIc1EguGW8
         05Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783693727; x=1784298527;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c1ksdIEPMKoxqR8mRgNtH7NsEhKoyOrJ954FAv5Yb8o=;
        b=YndvcKWweh1ZU+zTYS6TnXZFvTX8Xq2S5sNPMOaK3SYSmsX6yg3i6wEZ1r8gv2VStt
         uQNTLPkZLByISVOnbM5hDwtx3pwvTWo8VsauaVTN9QmnCfWhv5dFvL/2JRLtltdk6H0E
         3/kTWuVi7ClVLKvUT1yLXZcdmQljFviy457x/E0xUr4zlmxSwvHbJpAOIXz6vN3rsO64
         2+jjmOH3Z48MCbJqd9q8LiTKJjg7VTCQKFSHuoPW5Kl7yHMPAGcxjbEi1FfEjvLBPDXX
         5LoiTpRzals9WARzHs6tYBq3Cj45jHpibNVQzt7e7oH9/cJF16s5erR2oTP/Mr3z1saX
         io8A==
X-Forwarded-Encrypted: i=1; AHgh+RqOPHN/DQ63Rk2UxE3VwKlYwE6MHskCYf2I46WslLQQYYFCtLq3uCjWVJSCuXNRNjF13weL6+Jw9+Y8IQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJx8I5MZ5Xv6yxukv3LmfXHN1+2fqchfTk5tYXuKocOj02j2bB
	e0OFR5SFQWqAnilqFxiyOM4ruIfQBMyk2zx9WrwSErYEN8rFCMs2ytSP
X-Gm-Gg: AfdE7cngm2DB5PdDNaNglFnPVjzKelibuE+36SOXy+dzjQHZ3pFJjkh/xwtGN5LruQ0
	oic9AZRPh/aReSa6iR38esCOew9tXjzohbpqCD9sRqpKORcSiU5f0BJFprq6cmVF/eg1yfQKzXM
	B0txRDrnD9Aa3CxLfVG4D/vuJYnfHWBBD2G+qe9WTc6zznFGwVb1LAScmpOT3dCJ7bty+Ogetaa
	LjOv3Fkv9lyCJCLRRZMux1mvYnYQWQpPA8aRfPNIIMcRbeezY4p5UlqWbSGyUDy1rlFBRQG0QHM
	t2XKO0qp95gv8S8DEcYdJoSgit7+jKl16HBHoGBt2jImPTNmwoxS8Fh4J4E+f1uMTgq1FGlQBIa
	uZxgMmfhdF/bUjAi0jRT3ySqx5tE639B/MSQvd/UtNRDalNPM9F4Rxwf/F8y8HhPait9bw1POGa
	CBSSyXnLTnIQsZaRkT+IiZ6nK+P3q/VRqxNQmMfAF/iaoW3FUMblMQpKESf/JUoQ==
X-Received: by 2002:a05:6a00:18a6:b0:848:2f84:f42d with SMTP id d2e1a72fcca58-84843295dbfmr11552748b3a.70.1783693726717;
        Fri, 10 Jul 2026 07:28:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db0eaasm10350096b3a.52.2026.07.10.07.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 07:28:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d97397e4-08ce-4692-90cb-33fcdb3d3824@roeck-us.net>
Date: Fri, 10 Jul 2026 07:28:45 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] hwmon: Add mutex protecting for sbtsi read/write
 through hwmon
To: Akshay Gupta <Akshay.Gupta@amd.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, NaveenKrishna.Chatradhi@amd.com,
 Anand.Umarji@amd.com, Prathima.Lk@amd.com
References: <20260710111642.850022-1-Akshay.Gupta@amd.com>
 <20260710111642.850022-8-Akshay.Gupta@amd.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260710111642.850022-8-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/26 04:16, Akshay Gupta wrote:
> From: Prathima <Prathima.Lk@amd.com>
> 
> Add a mutex and take it around SBTSI read/write paths so that only
> one transaction runs at a time. The lock is held only for the
> duration of the bus transfer and associated driver bookkeeping, not
> across blocking work unrelated to SBTSI.
> 
> This is a concurrency hardening fix.
> 
> Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Prathima <Prathima.Lk@amd.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

