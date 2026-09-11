Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077CA4A8FF3
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 19:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154261; cv=none; b=KAHWuWQ45SUN7H1hvmS/ORBXFxTEA1pNrwxaMVHjUh6e+a69PjSRNdbNYqdDtuhuJZzHPjfe+9mATjlKvijNc5DEfYx3oOhYuySaWvG4cxujzsUfOot2uZgujTiHD2+Sy0tR+cpjhtb4Ek8CS/zZmxMW2flGGiUabnUuXGE0P+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154261; c=relaxed/simple;
	bh=z5AMCbTCJKiKwhdeueVhwArRsGJl7LsXJxyw2+s69h0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKZtaEKzt1zNwcW32a4gYnbPyBfbys2Y3M9Q2bEj2MyXBMmwCo8d0xGexvklssdBrlJheYrWspsXG2x4g1Owekc18jQgZH8j99p9oaKm7Kd6fZDhx3zZq99cTgs7y1qJIHySPGejQtHthnX3ya/SKJd3MR1M1pzH3KPp+IlYK68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n5Wd7qUb; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5Wd7qUb"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso1771746a91.2
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 12:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789154243; x=1789759043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+1FYrSwjWs0il95z3HoNX6WKScSsEKBA0Ab3Jhz+P48=;
        b=n5Wd7qUbXBb52MIPy9zOsuTen8ubkv6bp6Pi48hWIJn8Z1qNhctuUM2Oj7bIG4y8f/
         70N/78FcKN1xKbIA6cWus/VxbyyxnEmrnCmzG0SiVc6Gv1Cs7AEb9akpyFDblB0iiC7F
         sX0LSupbCOzYLnRRYHiq/Rp0sZtsAWDRu2fKObHySRggJ6vlkXS+0S+LDg4FLOXnydx5
         9o+rZX4fAzVGFeJ9vPMV+vmKaBrLlH2+MFeEN4WqJX+yQ4pY1FuKpAWQnZ/UeX3X+WK6
         k5d2wEDI0RyRB5H+wD0XbNA1rD2zp8TqcxRuSMKDkBhULvb9EekiRjwgqe8N02XMuXjP
         6/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154243; x=1789759043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1FYrSwjWs0il95z3HoNX6WKScSsEKBA0Ab3Jhz+P48=;
        b=V6y4Qx1YtXUN7ZnrNqAYFDAovTjqMbaB4/LVUMiX5bZAsUR1axq/TgDBeRYJBMw0tO
         lRx6YAPqL4Y9n9YWciy0CHATPq2mVsaZcWTH0EpRu/7CJoHDG2gcEMpzQge2pbjBUdQJ
         CCP1dWQ3oXrlvzvJuDpHvBkLWx1VWfwOB2jf2eKjehfEOkNQmoFzSXXGmaPQCHcXS6g/
         8147mnhA7phYLjor2rjgk7iFgGAD2Lj2pupkqfGoI/1sYUYshT9fzOWt5NdhtzNYKiiZ
         DD6k/ztUgqXWUBlamWcdOUCUO2H5QTzJc4YF0wkEotfljTVA2bCoTQNjUmNPLN/PQAmi
         Kqtw==
X-Forwarded-Encrypted: i=1; AKwUvByOiDnx6sNJZa5Fz3grsvkTGjm6jZYGu+5bb5j3ZuqnGWVw91c/kkQNEq2QcGUQz1a4dBG/7hNkr+UEaQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mu3EUNKJ498CqHaQ9qBGvYcWq43Hvj6aOPoPhGRTMSsunxMyhu
	K9TkWkhUPjgD/qMlEFum/regfEzJzsFEvBTSg0063dI4SbjVd3dsrCLv
X-Gm-Gg: AYBFou0KgWaJypoPVHfrrdEDNZrADJJkSlBkL3tNBRlam+8j47lpIoYYs//Ffw9baaY
	qi4GA2kuo+cY+XhFiEgc5DON3zFAiDyEmcTmYfS4wqLsjggmq9bRlxMruSam0VCZzsjAsa40xD7
	S1agLaO5vuieanZloP5SN7CvJVkwKX4Q0MqhOUHTEGprPOo/g1S3IQrah0f2JChCNbKb5rDVMXF
	FHc1BLvookwVskyywfLefNNwlvpBfnAcO+StKxM6q75J4CNT6D0Zo2HiFVlwcsLoIK8MgtVYKg8
	+6LNfzrkAUTiLbRhqYFnmbYtOjbPVZfSmV/BAAz/tIstYE30PJtiw3PMJH4sKzQiRtxc98m0pER
	bccevQ6WC3nrKubXfBrKbJ8y+KHfQR4RSjOC8QG/qM6thjKIJBX1OoX9YE2o+9ioRSV34cfVj/t
	X5L6Vm8aT17XdXiMQGFOtB+KNXZousEH3hXN6MgDDuLxqmuVNAo/X8XFU5nqGgTY3j1i0QhqstE
	DfGsdPt/bJFRA==
X-Received: by 2002:a17:90b:1b05:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39d9bd9515amr8974372a91.9.1789154243279;
        Fri, 11 Sep 2026 12:17:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94744dfdsm6689115a91.0.2026.09.11.12.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:17:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 11 Sep 2026 12:17:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Werner Gartner <Werner.Gartner@congatec.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (cgbc-hwmon): Fix current sensors ID lookup
Message-ID: <8b822b80-8d5b-403a-8bee-c288fde6cbc6@roeck-us.net>
References: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-0-0c6bf078d173@bootlin.com>
 <20260911-cgbc-hwmon-fix-and-new-sensors-v2-1-0c6bf078d173@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-1-0c6bf078d173@bootlin.com>

On Fri, Sep 11, 2026 at 07:31:58PM +0200, Thomas Richard (congatec GmbH) wrote:
> Current sensors on the Congatec Board Controller don't use consecutive IDs,
> unlike other sensor types (voltage, temperature, fan). The driver assumed
> consecutive IDs and performed a simple lookup, which caused an unknown
> sensor warning. Define current sensor IDs explicitly.
> 
> Changes the warning on conga-SA7 (type and channel are correct now).
> Before:
>   Board Controller returned an unknown sensor (type=2, channel=17), ignore it
> After:
>   Board Controller returned an unknown sensor (bc_type=1, bc_id=11), ignore it
> 
> Cc: stable@kernel.org
> Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller monitoring driver")
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Applied.

Thanks,
Guenter
