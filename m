Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223AF1EB45
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 17:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714325765; cv=none; b=gif6O8qJSM0iANqdBTIz9w2Ay0BAd5y/KYZJoGG7fQoofcbBhe+ZdyBdoWsg9AvDq539pwa/Wjr0OqW2d6VUizUnSBg4iDFX50Oy8zr8tKOeOYxKK67nS6fYAjr1W/I6Sinh9bTAoppriN/0enJBCwqJFDT4xhfyRcrhOrlO65g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714325765; c=relaxed/simple;
	bh=mgxpokY+lxK/FE7KuPwcwmqzx2q0iRhAv1ZLDLBgEYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvwpDYiw5sEPV3MiKcuJbe+zOp42U9MndbiiW46FaqmddhvNkzr5BdJVL3gl/xeuouyMbjPDp+Qa++6d++Tk/IvH8G5GSS65Nb9Bhgo8/aAuwovJDNgkXiET0O+h10RjqT7pbWahEudNtdoqoWDtCTyAsCCWXk5b01ggLDBo4RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKwTMH7D; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKwTMH7D"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6edc61d0ff6so3791731b3a.2
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 10:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714325763; x=1714930563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxR/XKjFayC1JBBBVfNSgpFN1j5gX3pX9eI3Rl9+rl8=;
        b=BKwTMH7DMGkM/Qb4d7+aLN0+Z0MCHtOkgZsGrfvHV8VpCPX6xl3HvNOGwqE8mCIA0e
         2DZkT+c61aF6pJWp82uF84qOpLyKc4HBQ+GBV7XA4e4Mv/FK7/8Tfsq9SgM3QNHD7F1f
         qdT1m0w/lRzP0nR8uSVVTpuMrZcHa17Ipf30H5ekf9d4zDH+3k8NQau4EvkZUJKTUmiW
         pD5UT2WfP0IIRJQinFbfCWlvKGMWXcYDa9Z2nNlk2l/bVQKQf2XnoiRr2xc7bNTdWyXP
         tNZioF2D61YthM0QtZfLKfLtCT3HL5jSlFacBbAWBGtO1WwYWOdveSJKlL/tFM4c4p7R
         sMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714325763; x=1714930563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lxR/XKjFayC1JBBBVfNSgpFN1j5gX3pX9eI3Rl9+rl8=;
        b=QXRNNtoJYAeYtXYRO09KxHOrh5FOpDKoR+au5vXnwHK2uNce7Gw1iYehx+/FW9h40C
         9Ee9v7Ts6NB7Oku3OYaQK/rnKJDjusvptr4aB5kkyFNNOmTvaBkK5kvfUL8C1ErU0XBD
         A8V5PqVV+f9BqdV2UkkoeL/nwPHYsnokxUoZX7t/vIKQrnf5QE+D47OcxIxMcMGznsxl
         TIsLo4au8EpeOvagrh2qj3yW/QIXaFFqQF+/PuSVq70H/dmz3EuuEYZX1Yn4Iat6Ncty
         wnQKPqR//8i4ws+4iYgH2sWv6yeuXAGXffDHzdRR1rhSGoB17MWA+Wgag7XAd0GpL6JA
         hzUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVREH1YRlKMAqVMYq5YDsCxpeHV/ho0nOz4Af4/QqQ5wI2YCm1/wOpWN7j+TM8kAeYBRIhr0xAR+nC7lq5UraMt+inZZH1WGmXp5GU=
X-Gm-Message-State: AOJu0Ywuu37XXHNdh8D0XWrkdCCOa4DAKnVSJMHUyClJ5Ym9Ubd6/47E
	OI3NUpGQQMLDaTLvOm0RPkOSseoeHQLZDY/vN5xc0EHs0umFQwT8
X-Google-Smtp-Source: AGHT+IHSvI9su4/jjr33uMuJMA2hN9qg0eSdicYrJQoHNLrj7WZ9h81gs9wqTbfZklrFwcugPuc4pA==
X-Received: by 2002:a05:6a20:970b:b0:1a7:549e:ab80 with SMTP id hr11-20020a056a20970b00b001a7549eab80mr7958397pzc.47.1714325763411;
        Sun, 28 Apr 2024 10:36:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m191-20020a633fc8000000b005f751c18d0esm17640936pga.86.2024.04.28.10.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 10:36:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 28 Apr 2024 10:36:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Crawford <frank@crawford.emu.id.au>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 4/4] hwmon (it87): Remove tests nolonger required
Message-ID: <3a3a7bff-8b17-49f5-80fd-d17a3ee961ec@roeck-us.net>
References: <20240428060653.2425296-1-frank@crawford.emu.id.au>
 <20240428060653.2425296-5-frank@crawford.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240428060653.2425296-5-frank@crawford.emu.id.au>

On Sun, Apr 28, 2024 at 04:06:36PM +1000, Frank Crawford wrote:
> Remove DMI tests for boards that are known to have issues with entering
> configuration mode, as now we are testing the chips directly and no
> longer need to rely on matching the board.
> 
> Leave the DMI table in place, for the nVIDIA board, and any future
> expansions.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Applied.

Thanks,
Guenter
