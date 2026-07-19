Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEAA31195C
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470250; cv=none; b=UnFBDOr7kHqspD8o41oy+oJlczEDZMDi2jct6ri8yTkoCCwbzMG1ZLECkca3ffkXNkkwMUeg5Vrm96H9lve3wDv2v3m1q0xN1Z1/q7s5oJfXZuzPqzyWHaHfBORUIlw+lEo2uzOVY6lGKdbEZ61+SBhbqY0PEhqRpY7yVzpYTe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470250; c=relaxed/simple;
	bh=AwjrCMQvYaRPfReSbT0Zk0Mdomjz3pkjLoad6E3xe3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gTOujyqxF/IVV7wazIO2gYQDSSlwVlwVI+DJ/JGORNqcqlGjWgaVucmYkwFarrEFj1Y94AqSjQm2JU5cAju21ngYktSNYz4nAG57oFsa68Lqa+HDWpELtfdkR3YtRqxjHEPJCwOzEiOTGNyQXzKQ9ni4sHka+R830MWVRtM+0iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNV/hgk2; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNV/hgk2"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-845c92bc464so5316117b3a.2
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470248; x=1785075048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iTQJmk4kawkMOWfiMMG71fcFWpUDKgihPyJUTSXNHlU=;
        b=KNV/hgk29/mpccjSworPLrtGJXDXNl19OFdNG0gR6LjGMpx2FXx5Yb4tK0vYIxqxI4
         4IMaoloKyymb2Y+k04cFwb2Ly1QQxaymJooQSudvryMibJZ15XEVrsq3NWmCzZTPSYck
         1wZ4W5AKI4jfM5cHZV8m3iYWk0urIKWpVfumg7mqyQG7zomII7naApprEkHM8mnY4D+d
         yy6HEvuWd5vfS0a3Xh91yCXG1+Ki0AB6qq/CmS+dokgMQG6oWmpPJS6Q/XRrQEFxIilq
         X7KUYldHrb5Lep2DxxGmObyDYKLktrJvE1k5HV6ozoYCZunvea5j1pcmtzCJXaJQACZc
         suaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470248; x=1785075048;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTQJmk4kawkMOWfiMMG71fcFWpUDKgihPyJUTSXNHlU=;
        b=PrLoYyWwvxyIVgSljHKLUV+dFO8lOgHQk9A0w7/AgcoB4/t7B+1zq0zDf1uNXjvPW+
         JHh7c3cp5eBqHtQSmcWgNxLl2WIv66bm5Wd0KP/xGVleJG4GtcCtvlrhb4ehy8rVnuFI
         P+r4oyk1kxZMsc3TLRKlWIju+BaBLDtRZBsUarhxPTZav5x70duWNHsaljokhkp9LNRc
         9l4KaoZT5Jycxt5ubcViBL7GwJU9faLsVTNkwMwB+/IRiWMFcaDzrCEmR7Ne9mbYJPgr
         Lh/QVS59EXzk7vU2t/RrY9KDU913tLSbUCyTVwVeUaABfM0E9EC9KZwPOcomizGkiA/j
         /JbA==
X-Forwarded-Encrypted: i=1; AHgh+RpJd0SvqaQn062oOV/FPETEdPI54MJ67spFeQ1vAK1RCeCKQQQd702f0advvXoFsvU9RHdke13FkJSWNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzo0T5si768ONDtE0pQs/t5DnWtHty9dzjCKrOEz1iBB4ObkEt
	XSTXclrCtfpbB4rFy6Wn7HmNQJpwl5CovAMNY+6TVVWH/q4YyUpuLIlD
X-Gm-Gg: AfdE7ckBxDjiloocqhiYLOgJgdDfdzl/E8ByBneVp/AqqISHvJFpKx7siVAh7ej7Y/L
	7qvCijn2sf0dmJvCw32Ht5pRETG3RgMlCw5Aum16BzXoQQAPdlmGjlFfoe9HOYPkTj4rfB9PMHW
	hTcM1Xb+L5zK3IPiRuPw57DhufI/k8XWR6cpxFbFsdUjsEuBchaANfMqZ4L4rFkMYhwkrCoXtDC
	YTozFBCxcDZ+g05jobzAeEKl+fZ/Wa2zBHHTrK+tSJ/SpRq5n5pfUetpJPQ2/GA1qqdBA4cIbg0
	jHo8QL79tIgHCy/OW2nEco1vjlzbtxP6C4++Penhcfgc65Qpo6EgCZwqaSGtMBf9D1pM8S0b++O
	E0CRnb/7/MbrtAtEbYqQ9AV43MUwgJzVvrBLdb7HpmDfyp7h4leJjnP/mDqq2tXRTQ6cZGMlHqy
	fYmqLgH5DGU84feZw=
X-Received: by 2002:a05:6a00:94ee:b0:848:6c37:cd7c with SMTP id d2e1a72fcca58-84c292b434fmr9984258b3a.28.1784470247818;
        Sun, 19 Jul 2026 07:10:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb5159b11a5sm3261800a12.0.2026.07.19.07.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:10:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:10:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Vishaal Saraiya <vishaal.saraiya@gmail.com>,
	"open list:ASUS EC HARDWARE MONITOR DRIVER" <linux-hwmon@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] hwmon: (asus-ec-sensors) add T_Sensor for ROG
 STRIX X870E-E GAMING WIFI
Message-ID: <c580bb14-9531-4f31-b36c-60195b272569@roeck-us.net>
References: <20260711073319.553163-1-eugene.shalygin@gmail.com>
 <20260711073319.553163-2-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711073319.553163-2-eugene.shalygin@gmail.com>

On Sat, Jul 11, 2026 at 09:31:52AM +0200, Eugene Shalygin wrote:
> From: Vishaal Saraiya <vishaal.saraiya@gmail.com>
> 
> Enable T_Sensor for ROG STRIX X870E-E GAMING WIFI.
> 
> Board specs list the sensor, reading at the standard for this family
> address without the thermistor connected to the motherboard, returns
> -62, which is one of the known blank values (the other one in -40)
> readings for temperature sensors in the ASUS EC when there is no
> thermistor connected to the motherboard socket. With that evidence we
> conclude that the T_Sensor can be enabled in the driver for this board.
> 
> Signed-off-by: Vishaal Saraiya <vishaal.saraiya@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
