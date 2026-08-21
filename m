Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A417234994
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 14:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321064; cv=none; b=VCDgJflsXNxi9Qz+4d+kMTByDjDp6c33bra4Oi1kIc1wCYAnKo7kRHBT4vDLc7iJshHK/zHPlf4TLDf5M3OQkkhbf8YQEn3nN30VJ0CTh1PrgT8SyGyiY0OnMr9SWu1dYUITwTTLblmx1d5t22igtKhWFSDn2FFB3J5+HR/yqOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321064; c=relaxed/simple;
	bh=mde6kwIQH9eBuavPwrrHYjtA81t65YLHx56biyLyV74=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LF6fEEwTrUy8aeWi4Je4RwLk3IS00mg7EEHDAkz16dw9Wvxz5owMxIZwGzZ99dcmwKcopA57UGcDCKFOMfQIToYsatKH2V7wndl1kUvQn6TtNJzwCzK3knjJ8nZVU9IDDjd/E0ay4y4Jj5ZIjICpOL+m6RMN42cDPALkRPp5A4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s5KX6nfL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s5KX6nfL"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ccf2360620so8667055ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 07:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787321062; x=1787925862; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7eJF3uwTEHdZBt3/CpE0AGWvcEuZ7Kk93cUus7Vmxc0=;
        b=s5KX6nfL8EOZoSbnW2jDh1yIroRAbxYSw6pwY2ay78YG8gMdBD4xnNUmVRiQ6SySEC
         g5f0t3yjbwDAlT+Ou8PUCKmF9NzBuSWO2bwta0Abgi917mCvPMgf1kDb1In8S/8ZANXk
         ADMzQ4GQo4Smv6WBSbIc3rBKv8KywbeUjiJcpArEy9el4CFJa8Op5KJW9X+pfWYBuEo0
         H93fiDZydOJNi/iathbKfBz3KJ3KCJd9VI1O4KpV06Qfhgb8oSeRY81KFlyLkT/WpHdD
         Pb5tFDRWEvJBvzoLaL9xJ9SHdolrdbhJhd9N3iGOD4bxZY2WbD8vjKTlf5l1OgaJAfnx
         VADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787321062; x=1787925862;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7eJF3uwTEHdZBt3/CpE0AGWvcEuZ7Kk93cUus7Vmxc0=;
        b=KIP/bINaIUF6iJFuzGHaZscTyCwDKz90R14TOLOULHcTuJNdcUHDHwjJx0y7ZC8ChI
         ctMlYgw3KcC2TKzLOM3ON+I426mw8XF+RZbGV3mZ+DlYa804OCdJXAmm/zhimT25Olsc
         ISnYrWFGQWm1qjaFYyVJTL7nKaPh3LQzsAiIIE+qORyemp4GJ6OZx4FK2vt4JcTNsmrD
         Ex4oH6NQDqy4TsilWxWTVjzN4Me/lzn+FxhaSsjzedi8OY5y2Qmsghs7jFLZnthkFl6j
         rP/H3U1xzrMGCq4+9K841ArpgKZxU2xXEDvu4r2mdTrhirux7UF5SUpY7XFcK63jI0l5
         wGww==
X-Gm-Message-State: AFuF++kU/lWRqN4jmr8ABEXLRjqOW+gI+K2HNFRCan1l/Mpnrur5n8qF
	KgjDQOmUk23s7gWhUqlrp/kktptiFkJavMSks1kmawfLLzavAAHxJmbnbaDK2mHojRY=
X-Gm-Gg: AR+sD103Cf7IYrSPcWcbyhvP1etYeBpI97iXQKYl5ih3zpCjnzb5zNpDz5I0sOanye8
	891y+lspl8E0YZvPKr6rJ/37J1rSfMEVmKk889wjvM/9cYjggOHLV9G1OApjSIWQjrGoQvYkqly
	51K2uiX6/pS/Wgtp1rceOC4FlNvprgh0MFcmwl5tUs9X5Al8KnMTX1D7Q3AaOSyW99ODG5iyJo3
	As+QBrAyaT1XrQPd3HahiOk4O08KBg7iS1uiRhlTzrN6+9vFMsAJe0obEZITAL52dHY3Xe88+xL
	mb4/5v9wK/zSJEqx6lH2OFJ2oOmPWQkIOJFv8+o8gURk7Fi6fUvMTyv/YC3AEAddUZO5UUhUXK1
	Ikswyef3/kfb9oVb/8XGUwqwHGWAVFwYgN1PeOw+1u7HkOixtQBOH39idgADLBjpWDVTAY3EotZ
	UThsK3cJB+eFjpcwCnhnAIywdVd/LJmKDUNzHwWC+5JcIaOzZuLJjpa47/x52wq64FRoT5Q/uxc
	6W3xvDVtKCH5f1DXf56dv6L4xKYMog+ZN/HoIncU5oIOoR0JtnjKg==
X-Received: by 2002:a17:902:d544:b0:2d3:a6db:299 with SMTP id d9443c01a7336-2d64adec78fmr135645095ad.6.1787321062263;
        Fri, 21 Aug 2026 07:04:22 -0700 (PDT)
Received: from [127.0.1.1] (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e16asm19974185ad.49.2026.08.21.07.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:04:21 -0700 (PDT)
Message-ID: <6a885ae5.94ba4530.3447b0.3469@mx.google.com>
Date: Fri, 21 Aug 2026 07:04:21 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/ibm-cffps) fix format-truncation warning
In-Reply-To: <00ee05d9-1a7c-47b3-8961-e1b63f7bf3fa@roeck-us.net>
References: <20260821115703.2017414-1-hanzhijian1991@gmail.com>
 <00ee05d9-1a7c-47b3-8961-e1b63f7bf3fa@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On 8/21/26 06:59, Guenter Roeck wrote:
> So the perceived overflow never happens, and the patch would be
> purely to make the compiler happy. I am not going to apply such patches.

Understood, thanks for the review.  I'll drop it.

hanzhijian
