Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A092D47EF
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Nov 2025 19:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763752809; cv=none; b=iZrCqmpPFjI/Z4Eh9ASWxi5vAIgZr26byj8/l1xBJziSuybCk46hvmg4gbiBRNSKeqTT1vaOK32tpnwWA3ryTtlRSsXENu9mttlyJwqaK/+OIrFXwlFnFVA9ezVtKroAu+HSHQ/aWBZ/Nhms+/d+VcGtoA0SkQvFRa58NlB/9v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763752809; c=relaxed/simple;
	bh=5MkXxp75T4wI6824c7jRYyeAyFcn8b3IqOFY71ocHIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjZ2jDNOQTWYYIehaOLnFKp6ZioJxx5aU4yCSr+ii69Qrmfx/UysjHMzb9cajPM2pqERtJVFUVy6EsmcGeULW5xlxWA7ylQVr6fOCA0A2lOvZBLHRwTUCYrGJXCTa/3eaRUmalDZuzKi31NmnehaNO6ujWkl2mXjGJ28u3Sw7n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcdFsba4; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcdFsba4"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-299d40b0845so37691815ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Nov 2025 11:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763752807; x=1764357607; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CHyKYWUqCjF9zY9ztAr0IkWgGM7xfZxd5GVl+b8kni4=;
        b=DcdFsba4fmW/XYHR3jtfcpp1NIX0JSwFbECzN6IdPZ5ZNe3HoIXTrQ22JQmPP5gEzu
         FwDn8+TjUH/p9nbxnB0sEDWZRexoJPN41rLccnhKpK8NJjgkBW5JX20ncOEjLjpxOeAi
         uHXUH7msRni0Devn7B3WEVhOTzVtnKB7+x8a/2Hf/wADE+8nOoc7NW7yXRFT/JDHpyyp
         QrfaI/cclwDBeHy76OQj+ThipkLO2Sek4LmyuG0bPSlyqoJH+1ufj2GROos0BCdhdrfq
         ppSL/ctpiBZgzM/uihGD6C/8NIfdifS3qBbOKnX4jzjSO2N93XevxEdv943mTEo6yv0W
         BzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763752807; x=1764357607;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHyKYWUqCjF9zY9ztAr0IkWgGM7xfZxd5GVl+b8kni4=;
        b=v/3ZVcxVCHyR+IfsnLXm2HhRP5rP0/u3UPl1JmFiFVfdm/6YrQYOeIjhPRE47Ur6S/
         wmYaGR5OItK34ESafUlA/k8cIGWmPzF3DIf4DxJl46UKCWEYnVl2HW6hP29pg2AZQ25B
         R/W2whJJvBHzUNs8vW+MAnEeLvQXkq/JaHHn++aoFsHwq1kH9jpGmVTLkq2TBQNcxVE+
         AxrRdgmnrZrSuvOzoqjc7zocAArej2Uar6O04bRlk8rq41eA7gBJETG0bEIie1DdTlaC
         blnWg8TUDA6ICxGOBxoVaKM6gPMRc2g+3ocLKWKaoFaa2624tkAuh2jSrPT4tdQc2jkn
         3PnQ==
X-Gm-Message-State: AOJu0Yz/O5Fr0KweVwzGyEcBJselWKjYSIy5mo1+di5dlg97f45LEInr
	xZx0zoiq1OUiDdOECZ6n+o6oKRpuM69PGru6ppQmhdbLOZU5jadbVS2H
X-Gm-Gg: ASbGnctLB3R9ONxvvYiUDS/N9teARhN2ZIbc9yr+K2AcZbrPmuB+ZY8dWkjYcgC5axv
	tZ7W2mgZikuEbcy8/bJNn3WBetyi3kqijLB7L1xIWrHc+JFOI/ATD4tf/KDfBMuKXlKXNX8rgnI
	s/mtof4YaeMnSWd0Oj/3dtFMwGcw8/2AAJwp0retmGGJg1WN3pfVOt9kngf7+sog2l2+2zoGHXy
	Ot3Gs+X4TQnI9G3mPnOvQMaUjVduEzBEGX7ZQwcSBJcG1IDYk7FAQlDVFgMH+Lx7TqhuXPunCHo
	BTbGddkTx32Z0sW0FMzfLXa6aNWg2KWdln3N/mxOIfWkHjQ0VCQYvwTenr+xC9EqfrWj6y0OwBb
	/iIA+pOAE83HG/ZIYMNPhtTmfFADkjtXEWRTsPRofd7zWfqGeQV/do5fx5h7DPJ8vEfMURAwvve
	R73bU4eoODODX+h6e8F4UyLjg=
X-Google-Smtp-Source: AGHT+IEv6H8B74ekClHDj6DNEBOkL82anZjOZ38YugxJsM7a4q9FasuMWoOTXPCw6LG9jy9+2eSDHA==
X-Received: by 2002:a05:7022:f50d:b0:11b:9386:7ed3 with SMTP id a92af1059eb24-11c9d872348mr955360c88.48.1763752806713;
        Fri, 21 Nov 2025 11:20:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93de6d5csm18597902c88.4.2025.11.21.11.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 11:20:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 21 Nov 2025 11:20:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
Cc: linux-hwmon@vger.kernel.org,
	Eugene Shalygin <eugene.shalygin@gmail.com>
Subject: Re: [PATCH V2] hwmon: (asus-ec-sensors) add ROG STRIX X470-I GAMING
Message-ID: <cc8e819a-8232-4b14-a0a5-1e5980cd454f@roeck-us.net>
References: <20251120.140009.210830394703243387.rene@exactco.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120.140009.210830394703243387.rene@exactco.de>

On Thu, Nov 20, 2025 at 02:00:09PM +0100, René Rebe wrote:
> Add support for ROG STRIX X470-I GAMING
> 
> Signed-off-by: René Rebe <rene@exactco.de>
> Reviewed-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
