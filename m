Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB741591E1
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Apr 2024 15:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712761575; cv=none; b=VrPW1j3gFXVADpz0Ind43y+7FnxCc2hLFaBVCDwugYxv/DchgSodQbKeV70LKTB0LC0asDj30rdHAUKlnGxbd2RI66zf27v54gXwmR0/AYurswIIOnBtKhNUEeu3008rQorebRvszmFP+j0kBX4L9Uw2L3JEmP2LIdGkDjPAgww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712761575; c=relaxed/simple;
	bh=/6rEHl4f/Rbzjb+lMsGS9eMwhZEdchCak6sVpt+1By4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWYf7ja6UApHE8ZziW6rBeQoiD5fQkBNE5puzWVBTM4qMG7RLDhI+PobUBVhJ/L5aO2RLccKvml9dLBZvDFx+qgx7OnCk0VNBOMlvsKpaqoRYIu0XFjYQrBP/CosFtDljQ099k8Bgf6VfoFFmx7M6MEeAHMclrj+rwim9kg6fgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNBIUYa0; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNBIUYa0"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ed2dbf3c92so2736865b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Apr 2024 08:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712761573; x=1713366373; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6vqlk/SomMLPQ4FVbSGs86RYi7S1wMHuvJyHDDLYAWQ=;
        b=jNBIUYa02E56iIFU9UZ0a6Rqvwh8RlLmpKpnw7bT4hh4zpBi8B2IDjIIka39H7HtKZ
         rY/XS2aX+MeIKZAuT0EwCuxkGj011Z1LdrXrdiak8YMQ6fVZk/3s4ddQvZk0k8zOzqPn
         +RQnWoliE1a4uEUFa6cyNF0yQB5PjBCFcRDoqZmvC/+VWdKYmL2AVXOnMW3diXgqt8fT
         wuL4q07f42/LJlp3DZPBdbOIEKW4ArRvYnumPo1sxfCVamnGCocU6eleZ4WCKh4FpPD7
         +FKGNhlcNOfBXIfAIzb2uiTXdLDHr2vRQLDobaYPcmp8UXhcZiQeXHf+6Utz3dp/Qp2k
         JwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712761573; x=1713366373;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6vqlk/SomMLPQ4FVbSGs86RYi7S1wMHuvJyHDDLYAWQ=;
        b=emCljVu56ZW25rTM8twPxCeXmj/T4lVHzCOvqcrrnuiaG5Y5iINUVkgR+h5lLKm8Km
         hyl3icbAwHWyz/7RbwuNTwIKkMXnV3ILM1LxRJR+1ByU2U5bwE8MBgxOFVYJ+O88kyhT
         x10bRvHjTR19m4LdBITdRs7AjpAJB36zWi899IqjypOjxoT3HOjP+iVP6FtAmSs8TTCZ
         ffyRuGYXH14FOiR5A30FEXkghimInJIVxTZwqPuBdwoIH1QkaS577o6quykvWu0LmKrK
         u3ZAxBWJzfmZG2vIqaRkV4DkbrtcctctfBNdVBv+tQ014xdkfpYohNGaF2UKFwVTyCYJ
         qYXw==
X-Forwarded-Encrypted: i=1; AJvYcCW/hiZi/T+A0EX70t9K42t4dy8c3ALp1vXmKpw2ZnnI91L3EZTpuG3kPc6E384anSoOtTBxtoHv9VXsIGgjAESmA+SBiYuqaHJA9sU=
X-Gm-Message-State: AOJu0YwPVuEC46KM+7lMw4qT/ET5+7H2TxczyL9SWWydmwKb86P+i7Df
	68lC4yZONDE/wII0N7m15X64r1n8QKmoKnVO5SOuhnX92CTFPc6x
X-Google-Smtp-Source: AGHT+IHb/BqnOK3lIbidy44kYmAAQQ3ACgYHA1ibS57uQ5YoZYYUn6Snx4hIfA1rV6t6o7efdCi8BQ==
X-Received: by 2002:a05:6a00:4b05:b0:6e6:5396:ce43 with SMTP id kq5-20020a056a004b0500b006e65396ce43mr3280605pfb.7.1712761573079;
        Wed, 10 Apr 2024 08:06:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h6-20020a654046000000b005dab535fac2sm8587425pgp.90.2024.04.10.08.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 08:06:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Apr 2024 08:06:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jean Delvare <jdelvare@suse.com>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-hwmon@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	kernel@pengutronix.de, Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH] hwmon: (aspeed-g6-pwm-tach) Convert to platform remove
 callback returning void
Message-ID: <1bc1f772-1576-4496-af4d-5123869838bf@roeck-us.net>
References: <20240409085552.19868-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409085552.19868-2-u.kleine-koenig@pengutronix.de>

On Tue, Apr 09, 2024 at 10:55:53AM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Applied.

Thanks,
Guenter
