Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB9135E953
	for <linux-hwmon@vger.kernel.org>; Sun,  6 Sep 2026 17:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788714211; cv=none; b=U9TUVRPGf7v40wvwvMxDmzd8s0ZCnFcp8T/TEBhcGUTw3zsF2HnuEDZIe7+CmldzbYN+xd0HMvAN5fw/5KR+r7XSCAuFD0OInnwOA9KUAgJ+MzIxj/KilJUTDHNpndzyaLBS9H2EZfR9fbbnMGS+STyYSNxLpT0XpMxKT/bIHXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788714211; c=relaxed/simple;
	bh=3nQdtxw/p3KehznPyVdjNN8kTVqQcOVVInmE6Fspmvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubZQ3AtFSX8hd/R15WtnRihFNEDy9EAfbhfo2bnxcwNJSnqdiQl5EK6ACXMeD7Uw7Fx7opw8JE07GaQDl+lYkNwdWuLZZm/751P+x+jbyrdIVm/+zqmxMJug7h67eV/4RAWZ0ouK1GA2K2zt8SGrHzj0NkhmImBqnR2FR7XLjCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=islALXcM; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="islALXcM"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso3270990a91.3
        for <linux-hwmon@vger.kernel.org>; Sun, 06 Sep 2026 10:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788714210; x=1789319010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WbyKgxmi/08EG4pWqu0vnWSWMfKp3Bgy++/kX1RtY/8=;
        b=islALXcMkeE19kDYnyctCkZOazjAyEgafus2D+wqdD2hFX4Cet8ObCIBUIQwTdHc7K
         frBUckQTayhunRYMV8xFGbZj3h0yFFqo3K0OIKeVMt6ikKqi4R9ZF9N0MfZC5rM7JBSz
         c4STraOypxKYcH66L6XHWhw97FWfeHG1K7aUs2+9MHPOGXZfNWM4XwAfSi+5f8JJ6o39
         FFsLRAYMX0SPz47WkTJrYmL5uN/1yntMWFaaxXo79EdEw9u7UCMEuHboT7127AG3PqmQ
         K3zmFM4xwanJgEbEZVKZ1WjNGx9+73RbCixIGeg+wUcs1DzSkQnBsam9gvNzKSHtdkPU
         xP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788714210; x=1789319010;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbyKgxmi/08EG4pWqu0vnWSWMfKp3Bgy++/kX1RtY/8=;
        b=RfqvBWvufC/8MY1e7jtthjXT4DSkOQeGYSKn1+2xPUqcRa5q8BqSsqFTRH/UNYm1Ey
         Z0Zz8C/+6U75Khbc6o9c3UIA10i2hvKi1FT5GE8b/F9U6oGwkVwtlpA0gVfMCwqVS5oo
         xXWw6ZPYykO+4PbSfYdhnXaK1HF3j/atu4QOGlGynje6mAD2E29Uo4weA6mSrSCGfk7d
         3PKC8H9iCWv5HOI7c8KmfCw+L+8Ih3lMJRfWjcTvu7/lThvmkLHJry7r1MDYOhvksCvF
         fAk2C92Uy3/B8OGsGN1zXxnm6dXKdO+9jjKF70TXy7/m7Tc/pHfakmu4HeNBcnHIk+o3
         hPyg==
X-Forwarded-Encrypted: i=1; AKwUvBz+/jRVjfDDEFDt8m29zSAHv4gIZrDSBTCQ8+jf/6ODRTG9qM5oAqc13QLftclpMiVyJh+zbQXdWmoSAA==@vger.kernel.org
X-Gm-Message-State: AFuF++l5KQlVjKCfuINlzCiiS5Sn+wUNkqiNlcIGw6X+mvUNDpqLAhVN
	zpeLmp+30pwfyquZ98BYTvr+MmpudkG9pXwVi7pml8+qBfgh0KAVqPQQ
X-Gm-Gg: AYBFou2CYH9b/AWjEemG6pVYNmySvDhNRgFCBT8r+I1riIFB/pTY0LjRuCh7LBDD43l
	sadcZXPX09tZjjYaDxEtM76nO1PGoNcrFqybC6W0tTZC2hiy+/zTmTdfM5lX6xedNYUstLxtSZy
	6M6S0tu2i1jMu9dIUbKTeZdpDnlg1R8b2clyVL6RkLVo8nxYRQalE8Vgt+DNw6+8+0rnwP3V/Zu
	iQpkj7kvEEY9QEiqE6cfBHxl9dw/to//+475zrmimwkhC9W/O19F2v6ipfJNn76P+HmtpanfBzy
	HVrwDp09/SjbjkryMn/GEJo4V6OIpBFeOLNbP3IezZcFhLkmqrgMHJE4eUxD+ylf5MXnmbuZG9+
	+75RSWLkfqGD9pZCktFVKdS+08w7B4o79esSYuy3YDoL7d2HqHyEHlEVZ3sbAry8ROFhBE7+frQ
	A6/RMPgQYJRa448afhriYKglTn7rDfV6CfWi2El3hLWKb3WF40soL1autBx9Kfifc25+M+jihHR
	BU=
X-Received: by 2002:a17:90a:da8f:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39b26208e7amr26267464a91.12.1788714209868;
        Sun, 06 Sep 2026 10:03:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae60891b2sm9330813a91.0.2026.09.06.10.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 10:03:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 6 Sep 2026 10:03:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Mario Nuevo <marionuevo@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX Z490-A GAMING
Message-ID: <ec1e36dd-3128-42e0-be0b-dcb7c7aff303@roeck-us.net>
References: <20260905080346.1957380-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905080346.1957380-1-eugene.shalygin@gmail.com>

On Sat, Sep 05, 2026 at 10:03:36AM +0200, Eugene Shalygin wrote:
> From: Mario Nuevo <marionuevo@gmail.com>
> 
> The ROG STRIX Z490-A GAMING and Z490-F GAMING are essentially the same
> board apart from the F's onboard WiFi module, which isn't wired through
> the EC, so they share the same EC sensor layout. The Z490-A exposes the
> same EC sensor set as the Z490-F (chipset, CPU, motherboard, T_Sensor
> and VRM temperatures plus CPU_OPT and VRM HS fans) at the same EC
> registers, so reuse the Z490-F board_info for it.
> 
> Signed-off-by: Mario Nuevo <marionuevo@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
