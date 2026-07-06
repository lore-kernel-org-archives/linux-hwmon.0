Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B483C3128DF
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 13:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345986; cv=none; b=ujBLOYPEqI/XSKd68/sFQnUzrZ/PWTawjC8jP1XpqtqxNGZWO9SJvgFBvecnONsoU4LFTdR9zYN8LMlyXJL48tyS53+fiLkfEWxfQgstlU3Bpx+txqfSrjfEXqWCF5wcHl2Xq11k+K2/rXD30KodfshfK0dSNybdog/IvLTGUQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345986; c=relaxed/simple;
	bh=4hYqJ3Qe+MnZYGOcb4FpjhjR0eE+Boo935vFoc6wSBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMPOpTCNVHSmrotgUv5ec1vnPFhEcmBtKje7rBOtTVkeDURVFuMrCTUewFwQBkxNnz0J45qbXAinwltFwfc2ZjMNwneAfMZ9ZPoNY9GGzGpMTD7Ij21ERtXYGcscG+f22FcXJfnpLwG1XM+iBOCzyYpsC5IArVnRttSuZ9jnjGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rk8cdrcu; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rk8cdrcu"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-845ea8924a2so2987894b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 06:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783345984; x=1783950784; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wHBgfjBFTj4C/n35etUmmhpLGl9jUrDg3QkdSTay+Ho=;
        b=Rk8cdrcuZWv+8iZPcd5PZ93wP0JOZtuh8opYNYQOofPnEDM0gAlDGEP9wWg0Zhyzev
         quJgeeVkp4VaEZgB7aFTI5S6+QIP/f5PVwcNBFaXMldpaB2Zw9xlwim1d2+2pdYGLTgO
         9yNhf2H0wtM0qniH0oNEdTBmnZATUdyvTf2nIFGQAgL+3ALIw+x2q/srJxgw7Q9IHfrt
         heFYU38Rv1sjswFK+oX7tg+1K5gNkkwz/zZ0mIT9WyqrKExoVtbNNRmHgHFAhuaRlL/G
         eB4PQqcgCeB4erQ9p+3SjuXLUM7EYlud9P7QlEZ5WCXGmiWtePzpscUBF2nUAW71LLZN
         gIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345984; x=1783950784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHBgfjBFTj4C/n35etUmmhpLGl9jUrDg3QkdSTay+Ho=;
        b=YtxWCzfU74YBX+pNtYsYe3FjxvsWI5D0RCO/f/z6uWR5wjC3xoZLgw4RaHObuiRxNd
         2bYyLHyD+S3Sl/MolQ09xMsQAntkG2EXyV8HQfevusfWcIQoVud7NUhbN4sXjIgVwc5F
         RCjUfo6YPOfZGuOrlsjqzzUIKRbPFyd7Z4+ZEHaS2mXn7CnLOSl20a7AYtTUWRTnHefC
         Wb6wC6vrJ6spuvzTDmzN777F+kgwq2FM7A0/En2Yb5NVZ+qIgdy6swEZq0P8Dpte8GCW
         K9t71RFw9ZyuGnj+ibZ26HJrcqgvkOrI+gy2xkLjy4Tz8QrQyCQnxS5oqIUppDYvk/oo
         j5vA==
X-Forwarded-Encrypted: i=1; AHgh+Rolf0sqnCAIULe7Ciw1SHSA7e40nEDZXAGLfuwMrsqAleOnTf5b0E8kJeHJ8J4HOB/jihJIHBVXRXaRRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgriZMVWTvSyCnnWm4hJva0M4R9IIXd4BJfBXwuQipHKm2bCH2
	PGkQ4Jfga55bfPPyzcSupLqIKmICZJ7tLfRn1uwFcVi0zJJvGr3Lv1Jn
X-Gm-Gg: AfdE7cnoealpBo8cAWXx/LHVmTywWHd5TTSvM5yzN8djqOr/RFi501VwzeHZE2zjZ5+
	oekjUMMfQ7q4uetm8/yqR/VmjKAzebopaVti8iwFCQohAlxrOX2FLTbzVBHuUhYFlwmqIfy9Na5
	Y9OwbZUOOCkuOK+iimN5WtC24HD9ItwlpV4RsxmQeB8Ss5SfHkJXQIJFknOaL+UYXUCPHweeSKA
	1CSQmtw3NP6qDHMq+/3gd/ydv4DbSycW5xrbqnQ2xHh+iun9NFOlGg2QCU6TOg+wqUzTmj2/ejt
	y/4zu0cDYpJBOlq+aNUyi+7CwZnqOidphTb9W03zSXrJgL6VdB2B6r1aQwWTLxCVF5uvKJfwCVc
	PL1ZPL+x+dIba/8guW4iGHBJhn1lh8R68B7Y9dMUHvg7539+EKwZ5pZiiMrbKm7swFvfWXUiOpQ
	YwYsxkyrebfRnXpbauaXvbBqKjCw==
X-Received: by 2002:a05:6a00:4b13:b0:845:ebbf:e7be with SMTP id d2e1a72fcca58-84826c30d0cmr675757b3a.23.1783345984102;
        Mon, 06 Jul 2026 06:53:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d85bd9sm3688462b3a.51.2026.07.06.06.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:53:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 6 Jul 2026 06:53:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Miska =?iso-8859-1?Q?H=E4m=E4l=E4inen?= <miska.hamalainen@hotmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG CROSSHAIR X870E HERO
Message-ID: <2f0af6df-ed24-49be-bcb4-6c30b7e68cb1@roeck-us.net>
References: <20260705113246.812500-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260705113246.812500-1-eugene.shalygin@gmail.com>

On Sun, Jul 05, 2026 at 01:32:36PM +0200, Eugene Shalygin wrote:
> From: Miska Hämäläinen <miska.hamalainen@hotmail.com>
> 
> Add support for ROG CROSSHAIR X870E HERO
> 
> Signed-off-by: Miska Hämäläinen <miska.hamalainen@hotmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
