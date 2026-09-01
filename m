Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D1149B20C
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 18:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287050; cv=none; b=bwiPtDmwmeQmMURHmVZZMVZfZXkYqRzidcW5srb8JUOOQtlnysd5PY6arhaXgXlatCUVqWzKjpmQ7fUWxzUm2HfrfR9BY/uMBMCyN7I2slDCY45SJmrArir9nzU6lM5X0mpnNjx+yp5W5g2ytUGEkGHgFPDYTyMa1ESrqybQ0W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287050; c=relaxed/simple;
	bh=gTUWiR5VTJ8w/OOAFnC6tiKQEwNgsZyGLwtJMFQxMkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DnFPSuJuiUwmIr1556O8h73+HBCVl75hFjXNs4WtoiXrZ0+DoESNWQRA+66PdtsTHgck7G4BewvkoqGEIP9CSz3WAfA22EkeqbEVkVIMG87VbM33NurBz7bLYgsiAqAOXRcVX3EVyyQH2xE8ApPNYQcXlhioG9CWzRREnEbwMZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2E/3p8J; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2E/3p8J"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-382ef647e20so184941a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 11:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788287049; x=1788891849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vi3RXIQaIvC+Ri0ofJm7If1tHUYP3Tau+8yQZvuwIZY=;
        b=N2E/3p8JtYK83hi+GTRhJH+rKUUIkOPJoy1U5oHLZIBaUF1B6ZEiu49bu5W0XF04Kp
         ylDfAC1PTAUEbuBRsbgXM0zyeLIWaJ3s7ARxYMtRJM2K7vTnz1+EkqBdizqFeOg4gxOA
         Xh8gRsUJOI5l82nVJybJ9YclNJBlgO4VKjT/LBIfrB0I+jFekK+xmxgUh1cCaanqppO7
         BBLiM0iRZQ3Tl480xq1moTOeAnQmnlZO4kHQiP+IgXGI8r9HwcC8vpzOS9ObxxIzTswm
         0JK9Z0DoR+0u7FNaugf1RN6IcNXeIPJ0ia7LDJNmb3+oShfq4k63rEVQnJfv9KJRBFmG
         QVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788287049; x=1788891849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vi3RXIQaIvC+Ri0ofJm7If1tHUYP3Tau+8yQZvuwIZY=;
        b=N0ABMbGXkZg3b7HDRBoW4e6mjySHIvCm1xQtLFvcnG/WqkZPMdos6/NZjHoHiHzz6x
         2vNevdzUk51yzgpvMHOE5+KYhunok5bChJcqP64P/uJtP98KtNwKdVn9U1H1s50drUs+
         Vo4u1tFje04eIqWPVaB7DPLmZdvRWicJYBLQ8uz2FScDZfn2Bou0+aeuoO8pwDFGNiTD
         CV3zj0snHMamSApLL//aA/KpkpyI83xUVz9Tb97/YUINrGnl5EmhBt+PEVrIv20Lsflt
         BRPw3FWwC/iiKPoBRJd0Yu/bOw5zz7d7hlfc6ai49Kmdu/6ILgJuh8x5SvrukOfLrDzK
         2bRA==
X-Forwarded-Encrypted: i=1; AKwUvBwuJHxXHq/pTzHWyYByxuJG+voGZIlHabSW6NGFm+tTlYIjClFsjWmFU8NzmCYJz6c1D1ZDIeIMqaFvJA==@vger.kernel.org
X-Gm-Message-State: AFuF++mDa6uF1StHUL7JXwMEKaEtHW/SNA3J+DWGxo8lKGhP7NL2f96H
	ABfpNo9pi6OHEj7lwetkuYEP6sYlobfQrv/7hi2bCtji78M2nNFHF9FP
X-Gm-Gg: AYBFou2sUKHtoEUH9NVBmar6PRmiGtkvwg3LUqGcWeMxUtIJIIlP45YDycxZrKwllbX
	uVwn+4EIwY1XRHY8ameiKYUFfb1AHFUVZg9/D9z/Oq9DckaZ9ci3pLUEQ+H76kG7paHbjbnsmjx
	G8j53GwO/O2JQabpdgPYJ8eso30Do14k7kZSHVhVy3REpOjnsWGbX5Dwy4cZBkxUmNil9p2073q
	4qvD/axTMY9XBU6sXlIuc5ycUei9q9gcWa2dcbpwGoO2ySrApixVtgBk9A2AFy12PVjQ3S92Jas
	AK4b7eoEcieziZpJ0tczOaSM0iw3hvrJ0L94/Nlu1488yy6WQJJQLM015xYdO2ah1wdSq2JUlB1
	gNswqQ+LVE+85xvGUxIN19+fpOn3cfL3TYWMxpc4tTIZ/+EVFuuLkanJD+nAfSgDrm9S9TnczB/
	ZACvdO9TpuLE3KJPmVYNCvI0pjGeqeDOqfga165lZCFZrIaToJJteZI4om64zaGUh3uYnqtBhX3
	g==
X-Received: by 2002:a17:90b:4a8a:b0:399:e97:8d5a with SMTP id 98e67ed59e1d1-3990e97a0a4mr11272779a91.25.1788287048611;
        Tue, 01 Sep 2026 11:24:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0dfcd65sm864498a91.3.2026.09.01.11.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 11:24:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 1 Sep 2026 11:24:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pali@kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, pp12313124124@gmail.com
Subject: Re: [PATCH 1/2] hwmon: (dell-smm) Add Dell OptiPlex 7090 to fan
 control whitelist
Message-ID: <1a0d87b1-0606-4bfd-983c-94be05cc8141@roeck-us.net>
References: <20260901181849.241776-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901181849.241776-1-W_Armin@gmx.de>

On Tue, Sep 01, 2026 at 08:18:48PM +0200, Armin Wolf wrote:
> A user reported that the Dell OptiPlex 7090 needs to be whitelisted
> for the special SMM calls necessary for globally enabling/disabling
> BIOS fan control.
> 
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/18
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Thanks,
Guenter
