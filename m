Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C1520D4FF
	for <linux-hwmon@vger.kernel.org>; Fri,  3 Apr 2026 17:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775238514; cv=none; b=KvNjJDGKBi4RnCqYEM70l3/aQfi/uGnlJpMMlueHTcamLGxEV7du8HZoboORvSVQRYjHbX+D8EU6FGI5nAoyJ/YkSqjlVUeSIhIYDfhIuzLKfJxAA2mFAEUGt89U6fe5VE2mnW3F/74Z9CvBb/ow86ofTBPyCrzG9iYnJGxVNQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775238514; c=relaxed/simple;
	bh=0ot2pWZ4yMhBqPz6opWYSMXsTG9296luPtmGKUqCORk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQntu8x8G1bmvLD/F8xJILPHHolSsEk6t2S5/t0hfL5ZhXJYz4rSRV+xu437LwYnF4QgDLE7HpG58AmiHufXazkyAHnWC2e3eOA+mmmBB/EtFXKxowN7CrTYD0mEafLBly6Je++dmDG8nr/fhijncqEizaPuu4zXN0jEz1ZUGpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvH3vLbm; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvH3vLbm"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso1930118eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Apr 2026 10:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775238513; x=1775843313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8Ax1rIhswH6Zy6+V5dlVjuClJhrdLhi8ZqO7Qh8M9Y=;
        b=ZvH3vLbmQ5qaokka016R+TM5/e9Bg6FJ5/APwBCccHmQarw+HNBSYl3x3u1WkwLuTm
         t20ekWyuNXGdVd5qow6jc3Zxqk7a+rfJRJyxjcPZ9XihSea0I13fLaWjSox0LnVFjeIq
         9x6Fc5MyV4+/Hcl6nZ6i5E9IJJv9gZfIQay/3J2uwWgCKSLqyIu3lKlCTeHIpQvdepXQ
         GRpWyKFZLN5sPJgvY1tjiemIOszs2iRY/EJnafrJxPXUs8DSEYadtVQFcWU9zpuMuYiB
         WvpT/Jd9Qk1N1RtVXNgtWwQBoq9d1GwYhMeibcKvKhUn71nTGtcdeDumH3ehU+QOqKW7
         nQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775238513; x=1775843313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J8Ax1rIhswH6Zy6+V5dlVjuClJhrdLhi8ZqO7Qh8M9Y=;
        b=b45u/6LMDHD9qJpGN/tzy+nMrzYP0D4PI/kzuhZ2uqSkEhU32kcJTKlEig806OVYmG
         8nzYOXPB8lggNR3+agKIZgzJr5t4L4QvX8ayPcKlWX/P9k7f1oH1sWeeRWjpL006Zmc8
         fvW9dQE7boLHwGG5kGyIJQ3+Q+3FYRX/FrHiyWjVj9gLIJN1ilwvK7pytNyZ+Hyb9zhX
         4SrVr1T4NBwgiOFclrkjHZATOE196azMf6VBULue17GUZonnKlPGOM+yqISQL66Rgtpt
         5yjMRHBzylOItVTnPHvzFQQH1xkGmsURIMXmxJmSlv9gbeuaHXnHf2WZJzu9JmMBsV5y
         NoAA==
X-Forwarded-Encrypted: i=1; AJvYcCXHkXjCx7EYQcRwc/Kq6ht0eVL5mPP/Y/RNuC3VUvpXtMamgzHhBvVBFQeQ12BY8QG1v2F/lc5uZXmgBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq6hjjo3rHpPWCsLY+Npe+uW/6p3ARpFeoOmsFShqhQwJCX+HT
	Pm9vSccge+Cs/T624pcgg9icB1RQ9ws8xlk2CkmJx29nUDFBcD2uYvnVywS6WQ==
X-Gm-Gg: AeBDiesQt+Rr5WEAaiN5WylqVQ/0h01rbrcXCycJSRnmCNKEkjHB9QR/e448BGQ2OkM
	hY6S1pzU8p+zReaWrvrTpkKkzRUqeJ7NLqUT3uvO0PC97UBHKY9HqJigz5D4WhZ4JhnMcYxBpjs
	9++TAQcKb3F81ag2ACxsO8L/cwFAdShp+5P1smKGKSPnhhUPfgqOPExDs3JBCiQpqcEybqRVhdk
	1u5ur2vVa9SvAEh4IyIAnpRNq15qi3EffEcYaEQmpWk37Rk21JwcURJ1RvRfFEpBFJjFhwPbQlk
	ve9PeYilFJ7ee1I5dFQt5yodxRITEmHUUm5DsUmTTfcyq5v/smhLYS9PiG7e+hFAOKr2gI+CFG1
	a31UfwItBTDQFlANwAO0s6wpz+nq4K0iq0WWq2NzI1U/Tli7HC+59ROHIihjygvZGokGuF3CMuQ
	H7hXW4Fu5R+mBWwstbMpkGu7V5h+h0enVl/8+mghnIMj2BcWc=
X-Received: by 2002:a05:693c:3009:b0:2c5:9b9d:4511 with SMTP id 5a478bee46e88-2cbfc461d41mr1940540eec.32.1775238512432;
        Fri, 03 Apr 2026 10:48:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df5ec7sm5563994eec.3.2026.04.03.10.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 10:48:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 3 Apr 2026 10:48:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (tmp102) add support for update interval
Message-ID: <01804da5-5079-4140-a1e8-659caf80716e@roeck-us.net>
References: <20260403140654.10368-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403140654.10368-1-flaviu.nistor@gmail.com>

On Fri, Apr 03, 2026 at 05:06:54PM +0300, Flaviu Nistor wrote:
> Since the sensor supports different sampling intervals via
> bits CR0 and CR1 from the CONFIG register, add support in
> order for the conversion rate to be changed from user space.
> Default is 4 conv/sec.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Applied.

Thanks,
Guenter
