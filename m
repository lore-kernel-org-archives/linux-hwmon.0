Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C9B470E96
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 16:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339617; cv=none; b=Vdl2qLPWiuukNlESJ0D9mcFD3fFfdQiNqOMKGI3uiDMio3PAUHcQISzslUVvfe9X2GoLw7fKtFM+GQlKfkT7KecNaUmZReqgYycxneqdRdM/J60fX6n1NMcvmV5XuIuUtuFspbjdACAypDSFIsttdJ8DkzlRfbnoWrMRPUXzwZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339617; c=relaxed/simple;
	bh=KpS1mvfrzPVq+RJ1AUg0YioB5wJtbGxvYJVW8/sEbLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2rbZ6NzLoM9fBTACwRjP/Pay3JzmiWWSbOTAizr2+QiRa990j7/rATEOiL/fMr+fCW/pFyYHKiF/byPMidpYo2WpmQvKt6gZiY+/9fb3nDKABF3wYRNIeYchv3HAcgMoI9260JrefRT8ZtLYaENekIatGW+XXttI8hfwjzVRUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfJWBeDg; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfJWBeDg"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3550c917fd3so1564405eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 09:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792339613; x=1792944413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B3VIzdAotImucJ/CUyeIQ/bHJawLqtZx+sVJj8zJnmQ=;
        b=cfJWBeDgkw3BS0eoZk6Isbg6AtT8CYAIS2CrCwKAEbWZ5JdW8Cb7KhEYeav1bceNk/
         YzNUwS52+sWOT9gwl7IOKQP7OxzvLNYDjxR/lYEXl43b5kB/fM3FjhgbM1piAqWZLqFp
         nwVG8XYY5YozKi221qgBE5EDYvHgzsdng3rUVQZsia2taxh7+MCE1L27U0PHsJcEDTE3
         pf9RICJf7Y4OvFdfFFZRcfowfufOLrJvCmM6Qy2BRjWhWAcBUC+B/ZAw6T9Uv8HgbEMW
         sjhj1FRC7F/ojZMgcaCwkM2wuHYuzdsc3OLEufoXbPPTEhgFidVJj8vKXuMMvaEsc88V
         EtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792339613; x=1792944413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3VIzdAotImucJ/CUyeIQ/bHJawLqtZx+sVJj8zJnmQ=;
        b=JxYEkYDE5VALoTTJOUGPYwwjd0SCCvgq03t/cspHd6dEU5CmTV99s6VtX1BuskqbE9
         sVgCCe4kY2plHpEfMxYjhqoFK3d2kYyDueDG9/UxF8xzPN3CIgnQhSoSx8qQh2MxFNNW
         hCrPiqlH0TUgDka4HnvLXIgsal6RqVJfxuMxD9opb0WK4Qm1IwVB7tQckHuHNFq7oIar
         7xOS5CfMgtLSaWmQ1a0qOiusXpYAOgJmLWCDJJEc/yrobMI0YujmROZ8SPL/EiHblHKo
         kpQWl+tbD9gQWmzG4iwNQR33G7GYP3ugF3g3/ruAIzcGCSCVQmCSSz+njT06B1sARpNW
         MpNg==
X-Gm-Message-State: AFq9FYJl+n24u54ORTq3YORGb13kMMCSWR04D4GAPRTVPZGIj0O1hE0s
	KJATMhbTGrWy84ncfPynavWIPg43nBumXiNgvpNgRWhC5BA0lLHSaYb2
X-Gm-Gg: AYBFou0JtJtkwRu4MNI1/FzOp/Tz7DhfZQDGf3Ql6aLX1JLWkeglKPXZrgdU0Q5Jkvr
	+2rKPhhS0qi5cpNk79PUiyP33uV5yyYcjAdQCWei3NSIXOb0NVoTClTn/D5L0s+u9jjGU1pJNuJ
	RCzjVEEv7Df0PJiwPyqe504I6ttRSL3E1nBAwAQix67m5Sw6kHJevXgujndJYohTIDS4G/SuL00
	ip8FFYyFiDsW/aD0o8AfGTXIp+kOFStpuYbHZEXpSafmLcWj3xQh6ZfGRa4WJwWkPraXPALGl4e
	vSpryVzj8zwgqBhqLSew+ikn31hQnzAwkIc/HeUG2nOGsW4hyLFxMy2/DSmNZm9FQzoBhdPZJC6
	IAqHWLREuB67jREO6H+azMzqbSqLrMRcntacF7land/2QsW3+gc1b8v1Em4ReHb43YyKH/qa9yH
	Mtkqi+qrmmY14XYajlZCS6G/8jzQMVpiCpOK6ChqFJRKqP808RWWHd9qWdFFO52h1vDEXwCACiH
	A6lyL4KFTIM
X-Received: by 2002:a05:693c:6311:b0:361:308f:55eb with SMTP id 5a478bee46e88-361a264b569mr7771322eec.30.1792339612707;
        Sun, 18 Oct 2026 09:06:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm23948470eec.29.2026.10.18.09.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:06:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 18 Oct 2026 09:06:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jihong Min <hurryman2212@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] docs: hwmon: Document the uhwmon userspace interface
Message-ID: <e77719ee-c813-400e-b49a-9f8a3b0e2e91@roeck-us.net>
References: <cover.1791531025.git.hurryman2212@gmail.com>
 <c02aeee5b7e7a5d159d4df5baabe925e16814e94.1791559095.git.hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c02aeee5b7e7a5d159d4df5baabe925e16814e94.1791559095.git.hurryman2212@gmail.com>

On Sat, Oct 10, 2026 at 12:38:44AM +0900, Jihong Min wrote:
> Document the uhwmon UAPI for developers implementing userspace hwmon
> drivers. Cover device registration, request handling, notifications
> and device lifetime.
> 
> Assisted-by: Codex:gpt-6-astra
> Signed-off-by: Jihong Min <hurryman2212@gmail.com>

I am not going to review, much less apply, this series.
Exposing subsystem internals to userspace is a bad idea and would limit
future improvements of the hardware monitoring subsystem. User space file
systems are bad enough and cause all kinds of trouble. I don't want to have
to deal with the same kind of issues in the hardware monitoring subsystem.

Interested parties should implement kernel hardware monitoring
drivers instead.

Guenter
