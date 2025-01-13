Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A18620AF6F;
	Mon, 13 Jan 2025 16:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736787400; cv=none; b=AevTVINDwdGfS6PAYQLxxm5eu0tlN7BWyiYYCt6+4XGRLiZ36wQwePpa/Aszolxbus7+5/+D8y/3rWJnVhh1olX+2GB2iVTGuILiPNg4/VAVFY8j1vQ8w1u2qzKQLIwsxUy8J1y5w8ox4JpZyafkTnTx4CQUwa3kRBtOmhYcBFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736787400; c=relaxed/simple;
	bh=+4ugZh4mTgnA1hmRAHiaerVfmzDwsttFHy5mbI8bYIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+6VvXgbwycoJ3KoewjmJiX8TTI++Qx7yVu+JN2pQbHi/MflK1arWehBtWlgYCtYT2L0bQIkqquqEOiHTLOfr+rC3TAKB/x0OGD/GEH3+ggmrnzKZItn2FJG4F8rBUuSDKJm2KKJy7q3lc+4HvOyhaMl12DaWDW6OuXyfV6f4fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEpl2n82; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEpl2n82"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21661be2c2dso76796925ad.1;
        Mon, 13 Jan 2025 08:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736787398; x=1737392198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6bQwzLo5Y7a/1/TWGYdRTtfr4KCDsl/yTMNAV3ttII=;
        b=EEpl2n82ec1K1DBsDnquqr8iHt86nJ/dCWDCj7Lft68FBnhyGtEosm8pEC9SJeAjjn
         BZ2cHPl+rWYqf08r/6eqgmeLESTcHgfPu2kC7X2N1xNU/umxZ4o0Dk96s5fhcJ/7aguw
         3Z5g4BX0nzuFSXVkF4l3G4o1TMgWyLgoJiNhUTpl+mRGrPX+7bpAGvxkXWLzLnw1yhQG
         ZwZBjIeQySzaOgs1o1Zkbuq4F1NHeepgKPstTaW15pm/qB3W8tD2fXy0bSri2lrviEMG
         RcKV21C/VIq1s0VE1b5EK3wKnkVnqrZas/dw9cq854d1ZGE2rw+PF5DmJjHcXiPtt8zT
         OjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736787398; x=1737392198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6bQwzLo5Y7a/1/TWGYdRTtfr4KCDsl/yTMNAV3ttII=;
        b=reoAGvDN1aL+g2rMWO8+h98qKdUmhBZZJGoiyphjTPGy70sNu5Y5IJ7GUjMFXLAxIu
         bD/cD0Z9GIqdZKgJoTBf96j7PDP+vka2mel30nqRhSqmvTmgkvI1VtKByVQnyR9Qo/fO
         FV+sLTbLvYLH/bnoFX2GjN9hLhM1vyE5cK+J7fdzKEL7CiJbXAcftSq829bZu/TGeRrD
         4wYxbOSGIC6SDLQIvGc+RgD+3geqGscYCpI5sBnif3tXx72Fw1Wvqhq4zfcMRiLhmDTm
         X9ghEORQR576W5avzYEBBhRx17udmDcmxEpD4gKTvuqGXEWrlMp0R7Kz1XXs4WCtAXWg
         TtYw==
X-Forwarded-Encrypted: i=1; AJvYcCU6mJKWgNc6MHPChuiBX6oz87QKEGEwd4HMkFXOnUr+VKnq9iQZwEnLscXC3T676dzDrqIddc0I5Kt8QGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPH+uw6FJQ7qFAxrccu96aOjF8mi5wu5Qhc0c49wBCnaU4QNcU
	q+9GLn2dfGt40DpFTqeoWic8V8vGZBe1OAjjjLy5/KVLTxMWM64dg6fFLw==
X-Gm-Gg: ASbGncv5zbWHZmP2zl7mWOs8BboBycxJKEt07O6Xp2tKKoOdAlTJzgboVxscc0hfF+p
	YH3A8++ACJVhJ9GldWGAxqC+8whHZHQTNA+BDFv2nOhK8wtsq4FdyF9M7B/C9bPgWkcC5HkZMPU
	IJqdobtEesAVDOKnMtquQBCpbCdxB5M6tOa5jIDjTbfgLvOvw2qBGqyNvbs6bn2T+fAAYEfXL5+
	c/VTC5P2MqpLsf2ACD7jiSnBu/XgA9mAQMDNc923ZHJFCkZnCdXjyI0P1vraQQzNUvOCg==
X-Google-Smtp-Source: AGHT+IF2HJVV4O5c10Kgg3IkWszR0w8LMsiMhsh4ncpplcbA1xvwWHM4Cw0hrlJvkv1G3ncIRfM3PA==
X-Received: by 2002:a17:902:d4d2:b0:215:b9a7:5282 with SMTP id d9443c01a7336-21a83f6458amr313871535ad.26.1736787397973;
        Mon, 13 Jan 2025 08:56:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219aefsm55361645ad.107.2025.01.13.08.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 08:56:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 13 Jan 2025 08:56:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] hwmon: (pwm-fan): Default to the Maximum cooling
 level if provided
Message-ID: <7bad4087-5ad1-448e-ac9f-c298a66052d8@roeck-us.net>
References: <20250113135118.3994998-1-peter@korsgaard.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113135118.3994998-1-peter@korsgaard.com>

On Mon, Jan 13, 2025 at 02:51:18PM +0100, Peter Korsgaard wrote:
> The pwm-fan driver uses full PWM (255) duty cycle at startup, which may not
> always be desirable because of noise or power consumption peaks.
> 
> The driver optionally accept a list of "cooling-levels" for the thermal
> subsystem.  If provided, use the PWM value corresponding to the maximum
> cooling level rather than the full level as the initial PWM setting.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied, after

> +	ret = pwm_fan_get_cooling_data(dev, ctx);
> +	if (ret)
> +		return ret;
> +
> +

dropping this double empty line.

Guenter
