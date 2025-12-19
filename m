Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F18D36654B
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Dec 2025 16:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766163003; cv=none; b=s1FE+NYtf/xcaYBStYL0wMtDcfuAWbNV1nL87bed6BT5MeXii/CfDqKO0RMrd8tHj4y6dxDB5QrQnzYRmtuORO0bRfZ+SANaTlQOF673L//NSxgkYc8Pe3kk6Ou+QA7GG3/h06yj8vCqXDGVNEZGxaORBs0RZMlQopjjmRpiIa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766163003; c=relaxed/simple;
	bh=ru9IJQE9+ww/dM/p7QsMOU8/dAarNmlOzOiHd02gp1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAH0rPf+XZjQY/5pneHwfY5Qz4IP1nUI/lZsugO1dzS4NiE5GlKYjYoExpsChIedbK/snztcCNxE7Bo4W7bolXk/CLQFqCLjkBiFre9iy9sMPIMa3olE3cVOfqWquSiaaeakW0PL2D0M3OAl+WYUpM3zo2WJG+EUypuA9hH8zlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nriwUDaa; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nriwUDaa"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ae24015dc0so2823109eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Dec 2025 08:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766163000; x=1766767800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abKin0XLy7cbeuJKUPVafCEbiJ8dnNbPxx208D/l2TI=;
        b=nriwUDaaQz9b6Qj/H/K5fDRGGMCX3Zh6NWk5nnqf81qFMPei9tO5tA9bggJ4V2YVKt
         VhFYykZc/Iv1mEYnUW0x6XopgaaA2FkY2cpK0/EvcJl8iEVsyav1EceJ8ROBUKOGW9+b
         3ak5b6EIiz0lQJhjYB3wO0NlOOO1JSgM4CXIpMfaca4XNcC+tfEJU5XNG6N3WzSt3ZRX
         IQH1BDh5Ih759Xwhf+zTxI+fMkFE8sKPvzkYNoEY50d5x3LtQI+gDNaUHYYFCxma+9IU
         2P6F02HojeLp7KKLAPOLTL6JIXn6dPC+ILmS/e3DCnqhsRK4VMvgjGLVjr7M8Y8dyKcm
         Z3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766163000; x=1766767800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=abKin0XLy7cbeuJKUPVafCEbiJ8dnNbPxx208D/l2TI=;
        b=FET4q4fViQ4Vso6uLUwK51CsXvgdXCvLwVkyVM581wTnPkD0MHuvP07yuV15XWrGEJ
         MuYr4Ysqo+C+44iPnZtGRau2QRCEvKkkqMSwIu/Z7yAINS+nClDP1ZKbu1o2wW3CchNo
         wvQ5yrDKjGd23xq+2kb2OV9mixwYKfUCk79gYN42ET6Ao6Kh50nYdD78ivP1D1z7mB9t
         WCEciNzI/g+ZwHWs6d2/vUn6K65QWzUmzokz0B+hxlxXrHy/CK9DCVol+dUOsar4h8Wf
         Vd8xvOX67BtufgkWVkNckxFhtgwBr++zTnFEhL0SvuEYXspcY+OU+/bogbizdRyik0cI
         B/Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWpqVaFsOXuRd0rUMP9aDUE50XyxJWIZvjwMXBO8F8pZFIHYvcEeg9X9O1nJF+M7Zrk33IWcK6aXy8yXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSY9+BwI8HAXu8+1hque0786w/DxjBv7BBLkoJrqChtA9B/XjZ
	OgIVM4rEOsrZbhNGnQiUzpCIW5XDfzbiIE8WV8tgkZCRRHs2y+rPKoXS
X-Gm-Gg: AY/fxX6jXD9KG6u6mjQD6AAPJewOjQZdDmTtJpWCtYKBm/+HUA08rrqaW5ojw3Ok4hT
	xgRQXhFCg0Mj9kbb4ik3zJmyIS/DsdEhmpmr4stzm4VbFIpfd8pfU0SDcBko9dJywQhi3g3teX+
	PZ0+KYeFx5AS9MCtXlvqnO7fCvWKD5ZVJ0D/Jdbt6437FcHidxkb2e7nrHJ5c3VX8H9Jin1h8G9
	oypS+5DE4KAaICxvdEomLNBhjOEG9Fwl4XrMgp9ojUTq/YrJtqyGhxbRMh/6I+NDDvfu79NWwYy
	5HpaCIahFDdSOXC0sLVThgAm+RU1o8ChHGwOu4wzeeibYxSD1xpxpBex8t1nrUabjwcbB5Zf07Q
	1mSq8WOCCkLVkpZHCuDBv3AMwWSBxcMhghSYCsuU7/zBtqGbXPoLsigpfhg8/DaHIZfDpjRSXIq
	Jo1U4fYqQoLweIerq8REWUtvSk
X-Google-Smtp-Source: AGHT+IHnkxb1HJgurtut7Ez1hF4iCE8k7yTVxjrhryrJzgeEvqIZ5Ob6FGIW0tLLqiXi6EpbmNEJQQ==
X-Received: by 2002:a05:7301:719e:b0:2af:f2c2:3bdb with SMTP id 5a478bee46e88-2b04cafa74cmr5767856eec.2.1766163000133;
        Fri, 19 Dec 2025 08:50:00 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffad66fsm6729545eec.4.2025.12.19.08.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:49:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 19 Dec 2025 08:49:58 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, wyx137120466@gmail.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add mps mp5926 driver bindings
Message-ID: <dc0f3e63-89a8-4f66-a6d7-d51043bd11d3@roeck-us.net>
References: <20251219055413.1661-1-Yuxi.Wang@monolithicpower.com>
 <20251219055413.1661-2-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219055413.1661-2-Yuxi.Wang@monolithicpower.com>

On Fri, Dec 19, 2025 at 01:54:12PM +0800, Yuxi Wang wrote:
> Add a device tree bindings for mp5926 device.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>

Applied.

Thnaks,
Guenter
