Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B34F307AF6
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 14:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758724735; cv=none; b=Xk1NLObklt3yDB+MnN3kpbZc0mOZ3xPulPgX8dQOXoP6xLgcaE/q4jGV+UvwHo4KO6QRy4uNk+05nJaeMmlP2KG0M9NQU1kG61sfX2LMKQ7C+bKPSgm5y9Fx5IhTQNz5wdGPx0Yu3QJViXGwbycvezbv5YUH3G/1ALZrjwKU7cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758724735; c=relaxed/simple;
	bh=rQERvq3LxAL3olY++7GUnxakKNlgdaqYdzu+Pq/Vls4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfg9CIM60ylKQXlH7IbBnN2uK4dkZkL1qrSaann9+RBqfDdaIfVfPxnygyfn87GVaNSAK2wcW5TCDegWi8lqoHQ1sdYeXWG1TwTJGYOKQV2BND3t46Qs4RNHi9n3uOaIaIekgIPjuy1In5k7hMamqByJMlesGfjRB62XunISmjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHbdYRLD; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHbdYRLD"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77f358c7b8fso811609b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 07:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758724733; x=1759329533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LHey/5DHcQEnqAp7YgPLfHFFCB1Ord5+8bM01gUQSRM=;
        b=VHbdYRLDHOfm1us49LXbS43lflElJmmEco7nFhDQ97YcLzuomZizwE+u/PMSnWbSQ0
         giTAhNFH9dcbN3ToW4qzskWF1KGmaWGbZko3OpN77V2oDGJ+iltkYvAsMnUWq3xIvcpm
         BHMA0qHvTj6ERTk2ARk+QnWLAN6q2IKp5qkmeNJWKHJMqEl0zRtHRvrdd3P+a3kMewY6
         MsaTp1Gfhnw+tS+vGyyNG1u7ggKfJQJ8Cck+qOnVgc08FvCKZ0pGe13XudQF7KCPZBn1
         0/pkZUu4qNfGhxlvwFNMivrrhCktAREIpi9w/kZy703ZLlXO02yiB133UdftpKV1zppH
         /o2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758724733; x=1759329533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHey/5DHcQEnqAp7YgPLfHFFCB1Ord5+8bM01gUQSRM=;
        b=AwVPELKP/L8Wxvvw4FNLRteQZSll7G5OT7jHpZv6n36ZH+Ih6kGX0oGJP6Zc78sRPp
         kaG/dWhzJ5Ap+FmLNSmSYGUDj2VQS+hMVtvrfz5kheJWruXZwQo/pdMlqtQMpz9ex68V
         j6OTepnq337h5za8cORV10fsQX9OBwlLlYvr+xAmgmXfVf1JdktfvKE78nakQv86IWcc
         UvG5A8usy7BW/sKlbf/HNbtS2FRMHnTryD9py1hYBq7VT3VOhH2+gmNmwHYyiz6bNB0+
         CNUPSGNoJnROhfAUCa4H2fxn4YldaFuajFrVsCqYCf84XzMTXRhS6eKTDJ8yeaGRkjUs
         dZLA==
X-Gm-Message-State: AOJu0YxfmVpP28Wp7rktwGCPjuOujnfPPpPGrG6akg3Bp3BYzP6ciHj6
	4sNnVb01S2s3zzNFjoIt8aXbtmS0+pJCNZEGQkebgyfXuueF3vsb/TL1
X-Gm-Gg: ASbGncvNZ2ICL1r/bv+6bL0nxHdqDKkTwM90uYlL9hbR83TP7iGhJ2thQR2fcPohuNb
	IQKnEXKKeJ/L6jHGaLrA+ywXhAJ+/gBvF5ieOpAFSq9zAALUCEJxDMozkmE1T1fFwZCUZl4o7TI
	N2KQlrLko837aozkbHW+ir7MWzcl//fvGMh3EzYxAEI2POKF6o3wjD9BQV1M+c2fYwhWo8a41fU
	K3TiT2bAdilqLZepABa4QwQ8orblxFn3tocM9PBL3c+rFE3udfIpBQBlm0q+h1bcB+ruM3KdjgV
	kLHPuXBG/Gdlsszg8zkAY4/RWj+4MmWtHp6iZo1PlxPkSTRlKho8rHJtNJtNyZVRThTrxYZZ5La
	4WGqs2XYejR0QXKHjsRPlzc1aYEdErcAmwXI=
X-Google-Smtp-Source: AGHT+IHSjKFW99tQBIV9uMHLuecEJfRlBOsf5ME3SjzE6fe7svS7Oz6A7dO7dcM33tP4xiTiSQEfsQ==
X-Received: by 2002:a17:90b:1dc9:b0:32b:a311:d1ae with SMTP id 98e67ed59e1d1-3341bfdc9b2mr3219424a91.10.1758724732781;
        Wed, 24 Sep 2025 07:38:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-332a9d48fa8sm2338760a91.11.2025.09.24.07.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:38:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 07:38:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cryolitia PukNgae <cryolitia@uniontech.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	niecheng1@uniontech.com, zhanjun@uniontech.com,
	Chenx Dust <chenx_dust@outlook.com>
Subject: Re: [PATCH] hwmon: (gpd-fan) Fix range check for pwm input
Message-ID: <c0364b38-bd9a-4ff4-ad31-4c75160e307f@roeck-us.net>
References: <20250919-hwmon-v1-1-2b69c8b9c062@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-hwmon-v1-1-2b69c8b9c062@uniontech.com>

On Fri, Sep 19, 2025 at 04:38:49PM +0800, Cryolitia PukNgae wrote:
> From: Cryolitia PukNgae <cryolitia@uniontech.com>
> 
> Fixed the maximum value in the PWM input range check, allowing the
> input to be set to 255.
> 
> Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
> Reported-by: Chenx Dust <chenx_dust@outlook.com>
> Link: https://github.com/Cryolitia/gpd-fan-driver/pull/18
> Co-developed-by: Chenx Dust <chenx_dust@outlook.com>
> Signed-off-by: Chenx Dust <chenx_dust@outlook.com>
> Signed-off-by: Cryolitia PukNgae <cryolitia@uniontech.com>

Applied.
Guenter
