Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F752DA756
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773763185; cv=none; b=E1pCPkV98GxW6COykLdy2AICe/DHW/y7M5UoGkDoUnvrV1PKTjLa1KvMtz1gM38FdQoiolqPTjgPXa8gRzgTxBwKb2Zp3epuxbPwuxeGxa5zQJMkNBBQXK4c9xha/Wu7vlN7PtfGj4xlx+52V40gizzWG7hDYbie+tMW+a3I514=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773763185; c=relaxed/simple;
	bh=rhfyqxH0aD0+p3Dpg2vsvaa7zDV0kR6JjfIqK+30h9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6V+qCesKyO+pwsw8zorM6SSGYeHNImJO7vmQ1aU6E7Ij9WIg9rN5olfKyWDZsN2WtjMXZWldOPpMIVIP8PhnsghrS0GXpmsN6VjuCcouDpdMtZSpmuXmqxHw70/TtDXv5Y6yp2PB5ohW+hFl/HNqZJGtXYxCy5O7bVhH/oS8Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTJUnI07; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTJUnI07"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-128ef6c4a41so2807218c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 08:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773763184; x=1774367984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qStIndcPGw+JcPKLiWKmJZ3dJRcw/C0qeNG09MqJaTo=;
        b=BTJUnI07Ig1TLRJUdNAoARb+Z2uKhqlcdfd3nDrqmiWutbADOx4WmMlpabQfnFymla
         tP/9D9c59Ih48EVjsIybtttehOkCWb/5OZXbkbkbWGJpLM2RJsaijBxLfRNgz43P/rS+
         ARrk2g1u2WoBZJz7nA/l3th4DoMGf0L7UdmgcAlEkFpfFwum9XGDxJGg1gDCD2svgIaR
         MpEttFVmQO7Ri4ofKghaPtVH6kjDcLl79LF+IIDgzsS4EJM3UaGz0jqxksRrkTnAlGP+
         gOBrK1qvHUQ7re803B/nszktl6PC3yS2XK5Jc7GxLZ7eFCZ4MhXPsSW6It6iC+RyLOMt
         ClEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773763184; x=1774367984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qStIndcPGw+JcPKLiWKmJZ3dJRcw/C0qeNG09MqJaTo=;
        b=gUHPeCxYC5nGhzRSVUNbZO8Q82/z5Z9uz1w492/vQcepuAyGYNaOGobLR3p3zErdiz
         wk/ld4n1WmkXejdZenM6M1XtExo7tf7bA+ylJ3kidzmcu0Vq58EfDfU6an5CHmJxuMse
         khfdJQA8wMmdPLIxLCqhmtOAvgvTdmQCr6sjhBSsXi8fmZuukseTUQuQgLBzibxS00/g
         KqRfncAb7aeLm1mwAE1aEPR29VW3pR1w5G8P6xW2HihHiCyu7wAKG8DDbhlylTyk8znx
         lygzxHQ7LR76BGQhBjptAWuuV4yIBJDWPK6LLFmAoenrKTBN4zcjrGNvxSY3mi0VjchC
         FKdA==
X-Forwarded-Encrypted: i=1; AJvYcCV9BGaSkknFOqZeqErDtDhXy3iJFnotagtvcxu2HiDnd1xJIwPekdUMN1GqMQlfcVWEHCapT6Wq8Sp2HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI2lEC/x1eUV+livu2ofrbJh4bJlTDYxbpOpaiIS0EMTIcQG6r
	zx/NvemJt9axVkkjYy4BmE1VCPF7RPSvgytXfottd/D4ihMLH9IlXpA+
X-Gm-Gg: ATEYQzyptBZJDskTy+X4nIu5Hac1Yj6d7iahvVwFgpmqQvtmrcT8LVCVlnv/Kz02jFk
	ikj3aC1hZ3KwXi4QgOFW+syq49gEMpK+so0oEy6SqeJUUxSHLHtyVRcvg7N9rxHzQMfgJvGGlNV
	vVTkiepTxyVLijqcdsN2B3N8EKeeqLsnBoYUh1P7SjlQ+WZpzEcGbuWfKQuz3kmpWTsJ7M4ExEJ
	bOfPEONczANR5LbPXpx+BQCAFRkTGG9UXO+2oDTriNtFgQsOq2+68VcnC+VzXqXaeNecuuhh6Ma
	PR22YLX8Egf8eIeNXtub8C+GghfcvyLF+H287wP81ZeKdzXmew4fcc9o11IFPLurJ8k1QojjHJN
	d0KR8gDMv0WGtFfwWVe77ZkGhjYTTaOufi+JUSLGSb6lhprKn5R4ssbYIw1vKu52weobEdl4DXc
	LxrE6MkiAiTslvPesLrIky0/5tFl96p6gT1lfz
X-Received: by 2002:a05:7022:4387:b0:119:e569:f609 with SMTP id a92af1059eb24-1299ba1cb97mr18072c88.2.1773763183880;
        Tue, 17 Mar 2026 08:59:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f62991c7sm16442227c88.5.2026.03.17.08.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:59:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Mar 2026 08:59:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (aspeed-g6-pwm-tach): remove redundant driver
 remove callback
Message-ID: <351decf2-0a11-4f4c-a332-d5ae28c4c13f@roeck-us.net>
References: <20260309-pwm_fixes-v2-1-ca9768e70470@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-pwm_fixes-v2-1-ca9768e70470@aspeedtech.com>

On Mon, Mar 09, 2026 at 10:33:24AM +0800, Billy Tsai wrote:
> Drops the remove callback as it only asserts reset and the probe already
> registers a devres action (devm_add_action_or_reset()) to call
> aspeed_pwm_tach_reset_assert().
> 
> Fixes: 7e1449cd15d1 ("hwmon: (aspeed-g6-pwm-tacho): Support for ASPEED g6 PWM/Fan tach")
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Applied.

Thanks,
Guenter
