Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4F8290BA6
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Apr 2025 20:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744318376; cv=none; b=TuEh7oFU6ceNfUPH1+kkGbLDMnf/o5IbfJAxjdrh6rEqEQeRM13AL/1yMPsbdfCrtKWJZJPYSlFyQZlK3EThg0JyMhTmIiY6LUv/rvqH733tE9dPnvoaKof3r/Oo8XfAhvbpN3z9wznUAI57IPe6+V0Ic2grXGMibBZ6Nrp7yJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744318376; c=relaxed/simple;
	bh=02S6qYqKyu7NgQpahycOC/ngzTXwbJou+TAE7nef2CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pc4brorIAP3teefTqEcHWfl1SZ+3yojlxjzXLfUMR4hhbexDnl+kyXdeBn1fZTe2cLMxbCK7eCUZrCyNrT9YjtJ471qqK79aAZTKdO1OGhQSFWnwJv/C7grQURzeVUxZZtSrObqT5WYzL4AU3372S2TQDe6WiS0DVX94rr2jkTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NA6f9aoy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NA6f9aoy"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-227c7e57da2so12686005ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Apr 2025 13:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744318374; x=1744923174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YA2MxkaSY1j6yHK2UqCqbmgU5GeWV5bWQi26PBgBNc4=;
        b=NA6f9aoyVqq0d9eRo4xpr8g7D++aqzA1rKzUvvyTQ0j/5aVjkjNaLOdP2hCtQPZY+T
         tfeZzFX5Gx+ZBDg2Y3Eh1RBYN2tcAgaf28hRN4adZxsh/DAlcYWlGmCnMKvogtKDQUwE
         3Q0Gbe89OvqhDzpNHTaHrswCjfSrEYKukg9OP26dDiMRCvtVgZCYW/RqnN2D5+zhxvSn
         JN5wjh+KXb0uNkRTr8rjqCiJ5E+1kHbA2CMdM25SdBjK7vByQ69nZAarcVWFW/gNS3BB
         4Yepmgjle5e4NKhxgD/s5hhremV/bmJuKqHFcICzV9x6Mmm2p1805XbOzLtvY2pNJtuy
         vzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744318374; x=1744923174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YA2MxkaSY1j6yHK2UqCqbmgU5GeWV5bWQi26PBgBNc4=;
        b=EiKZh9zgV2d+ImYrF7huUryNKREE6GUht0Vt0GHlpvcLCbeJgcfRacAiR/ygk7vtJs
         b+5KzisBWp7LuaVmB0zlBnShIGe5Q/ijF52tNiC7txLK/Ymc2jq8Vap6b445Tg2ymYan
         8LZAELLw3llFbilZIZgoLnJN1nGKPfKOBib/yv27Fkbsmz6juIWdGfss1bps2lLGXXKE
         MlLGWt8cBR1BZ9UeGhxv6f/an2riSC62OvutfELaK/jwFg7rUMiwVk+qJdsLodCWnwqd
         /C5oPIXRjOgL61NhC+nb83TlNl5xv0CVicOEm2iCabIdCSucn2Kxoadn7jy+92Tx071d
         vdAQ==
X-Gm-Message-State: AOJu0Yx+wRRjcpfph5IJfYd1/DYZ06vjgsg6I55U6xVQz+Tr/cDkoImU
	Tu9Uaa+sxCsXK2JRY/3/7fGOIrcGRtNfeg9Q5Ws/iXX5vijtWChM
X-Gm-Gg: ASbGnctXjq7llEjtEq5GTPadsgCUAUvzthEGhHpEgM/NAmMTxaO+CcOaitmkLX59l+0
	jK1kz49bpaIO0c3qwaUV0D8VowkUVHcfVkxS571YDXbwCK90Xzi04L6ZMLjFG9RN8mCb1k9I5yw
	mdyzECg9EYtNLyEiY0e9nILdqLUQL1IAOr5aqNvQYLDEH7bL6TFRz+I/rOP3Q7ENDZSUo8It0fE
	8W2BGR8A28Szuy/6K9iTWgevrzf5Z1m/lq+ugZeFa80dF8oVJeC3Yj0TlvA/CQDhISRqwduVUtb
	7KUs5uvNps2CZHdszjl98Zx6H1J78udVHnQXdPwuOmc5LMUM8bIg3lPM0hgWe2zP
X-Google-Smtp-Source: AGHT+IGDNTyr9db1DGzsdG3KyYkkf8XI2Gg2Cx62xEUbqJudRHUGmLgaKgxR1TXi1goT7m7uiJuWqw==
X-Received: by 2002:a17:902:f688:b0:215:b473:1dc9 with SMTP id d9443c01a7336-22bea502637mr2941125ad.46.1744318374194;
        Thu, 10 Apr 2025 13:52:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b6288asm35285105ad.9.2025.04.10.13.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:52:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Apr 2025 13:52:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, linux@weissschuh.net,
	Gerhard Engleder <eg@keba.com>
Subject: Re: [PATCH v2] hwmon: Add KEBA battery monitoring controller support
Message-ID: <10c43757-4fea-4eb8-9fcc-f2c25ff256e8@roeck-us.net>
References: <20250409190830.60489-1-gerhard@engleder-embedded.com>
 <651ce8b5-4257-4d38-aa18-285698ab7856@roeck-us.net>
 <c1a67d09-a23a-4ba8-bf8b-19f3f6d2eb34@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1a67d09-a23a-4ba8-bf8b-19f3f6d2eb34@engleder-embedded.com>

On Thu, Apr 10, 2025 at 09:24:57PM +0200, Gerhard Engleder wrote:
> > would have been equivalent and a bit simpler. Also, kbatt_is_visible()
> > could have just returned 0444 without any checks since there is only one
> > attribute and it is always present. However, I am tired of arguing today,
> > so applied.
> 
> Thanks for applying! I will try to make you less tired next time.
> 

Wasn't you :-)

Guenter
