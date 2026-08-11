Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47056448B82
	for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 15:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786464000; cv=none; b=GTOMHNPM8SjV8m4ahgftydQBBXxDbZoEyB1Wt2XOSJe1MGhP9omfR1wacC0bMsYc0BoRRQDwub6nhqwS8OSEHsn6TK7Sddhdbp1eWHa2/G7B2uEc7jSk1vdM6tH/Ttn5jU0RqkWoOCxR77JDmhdPeKdx8bhOPXcvyrEvpZnvmhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786464000; c=relaxed/simple;
	bh=MsEH0nUk7OKSP2W9hFoUnozfWIpLF4W3fbFhtHE8iIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiu8FOMr6qSZPyafLUmgqDKWcIRUj3f7jGsPae/BxfsUTFtmA7U6V43yroT9IWel4tcnkIO1SNfSwxAd2WYJ5eyZRC8RyLz/eZY1QAFqwQihJP9bBsL34QKieGFuzGlXIR+/JIhvd/BD6RtfN9r0Oyaw13h3597l/ML1E54oOD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSk93sF2; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSk93sF2"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e88b60121so21270a91.3
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Aug 2026 08:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786463990; x=1787068790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/AmhSU08AEa+gfzIQB/8vwupLfNruvePfVzPl5vxYOE=;
        b=ZSk93sF2begD+fWekf00eOBlqGfsT5QnoOyDdR6lmNGFLDKS8GlHQiNh4EaRpTd8Vr
         F6OkHNkjJ9q7N4VZ8zIzQzARKUTIJDZbo9XjZyVYRBZrlVluTDZme19tp0uTlTuhk0J3
         JRN9S0TvofBFWsCTJI4QVa/3sC8gBqW2ne1mYi9Fcaq0+189Gtv9+879ITfRdLs2I8T4
         mBGXJPLtt9wgxUUOCnsJZL4TwOhjdK5+ttB4UQjCs2J17y4p0KUmw2cqqwO/9+0kePne
         8VtZeA7Dd4jYdlHzpWZrQ1eIIA3kdlK7fKI8WZmz3fyNu1+GlyzyMWyoBwg+FYn/0VMe
         PwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463990; x=1787068790;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AmhSU08AEa+gfzIQB/8vwupLfNruvePfVzPl5vxYOE=;
        b=AzMye/UTOkthUqhNy579NwIZeopRbDNiK5THIBtGBQiN8udmB3zUxA/4VgGTYskSDz
         uhFNjbWsQue0QGmoTdX8Oiq45LhsM84il6UK6GWb200pThNoN1XbmXfeUnmr/q6GWDKf
         +gia4W06x9T7fCL+TXIZokXNsgMXCMB2b+GsEGzmBqZl3lmY54O2asB0Mnz5Sj8XmtqN
         dKB9C8AXTvp9xf+p+2wEMYpOvFaB55fP42Fx9GDeBya+OeKGIqneTyQjG16AqWxRqoOA
         NWr8VQlWoDSv8nSMBVUvwc1h1EiQDhr7giU3Q2afk/1tAeKBeqNAR0LQGsxmPKzXu9M/
         ZIyA==
X-Gm-Message-State: AOJu0YyZlFofEZjdtshSxDMsaXPx9jk0N2RYV0DWjzaf6ezwczjBlqsq
	jaI9Z+M8mCZkjAvKw8DmhsER8oUHxL3GijiOqPIBj8fk8G8gHYAi9j64
X-Gm-Gg: AR+sD13M+4esUcfQ8Vpr2XryUsjyvkZAXEcZulYXqLRQ+q6jCRXx80daO/BQIVQkzjf
	iZQ2lfq5NbSzICeQN+1Gq5S5sB4ZE1UhVpEReetizlKypukY3VpyD+YzjnEjA44nFBbWiykc2CP
	fgy+gGYCIOIT4NJ1x4kzh3mc/vy0OzW3bAk3PbDoTWCXuMwa/VMt5EIcTtlrRHJTUVYJ7TNLFgP
	IbBq+czWRzc+zPygbP1FYUFskX9JuUM8Edk/l0GPLKAPlB7TxW/hFhSXTS1mD8SBZB7qoEjAIVP
	xevuR61noT0XB6zSZG0l327MtTpeiDxGc8C4YRLDCoLzWSOO6BYBxvxSMRdaBR2nJX7josJk8R5
	KPkAKIm4Iew5UZrLqcLxOCqsPlgj3t2Kw0fdU2/fehJdJCury6sNfIs1Dr+PGcdDPrVQOA5o6+8
	ASwnFmA8ROMc92x96IAo9Ppza70CBXIjp1sCh3EhbqlKJuTxuSM2UnvR9b52qWQbE1mR671WEBN
	A==
X-Received: by 2002:a17:90b:17c7:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-392ec5c1d0emr4160450a91.10.1786463989941;
        Tue, 11 Aug 2026 08:59:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392e5650731sm1261742a91.1.2026.08.11.08.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:59:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 11 Aug 2026 08:59:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: huangjia2hi@163.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: hwmon: (nct6775) Add missing NCT6797D
 and NCT6798D
Message-ID: <55dc2868-130c-4c04-9abd-785889419066@roeck-us.net>
References: <20260811093744.12199-1-huangjia2hi@163.com>
 <20260811093744.12199-2-huangjia2hi@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811093744.12199-2-huangjia2hi@163.com>

On Tue, Aug 11, 2026 at 05:37:43PM +0800, huangjia2hi@163.com wrote:
> From: Jiazhi Huang <huangjia2hi@163.com>
> 
> The NCT6797D and NCT6798D chips are already supported by the driver
> but were missing from the documentation.
> 
> Signed-off-by: Jiazhi Huang <huangjia2hi@163.com>

Applied.

Thanks,
Guenter
