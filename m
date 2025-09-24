Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55138301477
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 14:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725456; cv=none; b=P6IY5zDleiUPZQkkI62LZ03v/ZasFKoG26JMlY5rxPRU/OzS0QCmBSlao/f9E3D8IfVO2fBis1MAPihs7Zo7V9lTzjfKsosGgBLtSfzC4zHSSCUWRCzZpJA/+XUIyqny6PyR23VsbhJaipJV5ov4/p16aNcnOktLNi+Iz1CrBzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725456; c=relaxed/simple;
	bh=E2doqv+YIgNeKi7RQMr6LDDR5lGT+rs7+hyGIA5M7A0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTIOhRtiaLqSMrhXFyzs0EMrceefokj9GXuQroynnY17I89DxJoXXy2jdSjhFem8C9QG43vpVvbyyamJawvqLHlLzfi7MYz9xyCFn9daWlGSWZH0OmK6BuTP/luDmmtCD8j1zj8CvhqzkGXejHOkEt8ZEyurbrlO4JW12TdO1Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0hVby1x; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0hVby1x"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-33255011eafso3349867a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 07:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758725454; x=1759330254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9q9CYpyGhg1hg4Blu/O8yok56ehpbIxkjUy+kvImGL0=;
        b=F0hVby1x5B8HURjUj+X4Ko7OqwnXWY49GSHtewi9K+tFjazUADYUJo5E1HQgMxnq+K
         B1lTyIJ5FF/pi6R9kobWMFJcdRo08HHoMjyLMJtpXsXkd67zfYvEutA92+0nniHZPAqx
         /ki1TMyfD2rIGKqK3E03kRwKz2u/iGYUICHyCD8nT/ilneBaTLxQXmUDcRVU98uU5mJq
         /ZypN6baRhw+V0DykAHYAhrldagE+mmxwz6jh6rL3rTIKq05cx49hfiqF2bpCP+dlBNt
         z52cyxh8V7tzqo2RUH6n0q0h7lxxk65HhwE4XXgdQ6GZnvS2v/iWoN9hKxKOBxK/ZvVf
         tFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725454; x=1759330254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9q9CYpyGhg1hg4Blu/O8yok56ehpbIxkjUy+kvImGL0=;
        b=JiSNALWbNf/mw+N4yakaA0Tj10xx3ld3GJ9vrcFENisKFLJRKE032aBgfoYL3ZMImG
         S2KliGbv+Q0WcORSLSaUP9XXe/AItsVP0FfbOFGPBX8FVtS6OcXHEiboOxAcP3cp7VbL
         vmEUWi7qaJCSMaQUTgNbzCu7b9vE6W7UxW0ZL1j8RRQbuQGUrZ83U3TpohKlibaD5esv
         HXhMq+5lKPpPw1hMEy3V90uppDXJQZ9sNKcRIIOXj8BmtMAUJyqsCVyi3tQSUVMILO/x
         FkJ4LDzW1sXxTBPhTxeDYNLZPlCKFzf4J36C69SK5vl8YDb3gdodDLqmfO1IgrH9MHMu
         yFPw==
X-Forwarded-Encrypted: i=1; AJvYcCWvgbHdsLtbBwOPqddxqsugDHzSSmdqm2Gk1tb2goHfGS55tTOZLlbA2X34SF0/lThnyMwX6abBZu8Y+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4SV8MByqC4Tj9atyhvasQcRhSeMu8J5eZMs35SuMEVzxJdAIQ
	RCyFWn7jBsdCN3St9JM6IP7kzXHMsFJR9Ip8zyshu9u2P+Kdr4/iY7iCMAf+z4bs
X-Gm-Gg: ASbGnctffC1Yinh2kQDwEch+l/rn8oevNHIqh4/q5LKtCFADZKFHXWIP6T/6PjdtRCq
	fSLTWz+Nhbqr0CeqghDUCO+6o3IVvxlrsHkcJoYkti83FwQrgRnhL3UhpMGb3qhYTivxEXbZhxv
	VsDriA7/ponCcTFLBV8DOaUx7xO5KDPBrJDaQwXOIm5CiDzZKHMaasA7j1vQEdcXcHGuaDmBjNF
	zLn/Ej9bGO4+5npE2ec1sID29GIf7ccbNkndYuuVJbUeC7T7oBQZxI2WHcN6YjzOREQSJYOsO0g
	ZT5r6BvQmLDWigGmu4fmQ5YmQ9vpKg+4mOwk2XicVPFT1lI/6tBA+qY7oNavGu2EgKaxew+1Fxj
	vSy67dj5Jm5b37+wtJQ2uaLPDrwprlXsjY2U=
X-Google-Smtp-Source: AGHT+IF25nrYcqagXxMo0BGNrEyit1eG8T7Se4hZVxOwI/3BMWGqvLNFos9okM7lRVtT08biWgqFAw==
X-Received: by 2002:a17:90b:3fcc:b0:32e:96b1:fb6e with SMTP id 98e67ed59e1d1-332a95be2fdmr6808900a91.18.1758725454426;
        Wed, 24 Sep 2025 07:50:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bd8b215sm2681128a91.1.2025.09.24.07.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:50:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:50:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: pali@kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] hwmon: (dell-smm) Add support for Dell OptiPlex 7040
Message-ID: <af614bc0-3907-4fe4-8a8f-756bcca99e44@roeck-us.net>
References: <20250917181036.10972-1-W_Armin@gmx.de>
 <20250917181036.10972-5-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917181036.10972-5-W_Armin@gmx.de>

On Wed, Sep 17, 2025 at 08:10:36PM +0200, Armin Wolf wrote:
> The Dell OptiPlex 7040 supports the legacy SMM interface for reading
> sensors and performing fan control. Whitelist this machine so that
> this driver loads automatically.
> 
> Closes: https://github.com/Wer-Wolf/i8kutils/issues/15
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Guenter
