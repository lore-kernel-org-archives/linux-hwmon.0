Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0B12EDD40
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Dec 2025 18:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766084342; cv=none; b=pU8tCtIFayNSl9/JQf+mDUSXCA2dHc3Ov0M2CR+NLTtNhnpOiaoYUKfpiZi9dM9S1vJ85+26Hm+/GVlFQX6fNjdpddmKXLIp71yndlNgCtt5ZCQ9jYB2ikk3KI4whbWQXEbk2rd26oSxjfR2CZ04iULs3+iUAkyHx3NC9xDuPoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766084342; c=relaxed/simple;
	bh=Jku28IM/c1IYSHnKsavbvy9aaLBIgMj3F4YQHgrupho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPPX5MDhQHs67byIeidaEKpS6p2Aw2TzH9Lv/RF+oD70FtvWsXm6WwxYOx2/xKpPIGPVQ1zGC2/qu15p0/BZ/4TqHJJEmmslkdvnAvIUmlbcKIFY6UqydOowYoYdYziyTVyGU84QPq53jc4RDkBv4SuLriyydARPkJZG76pr9c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzOjmPrn; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzOjmPrn"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7ba55660769so852108b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Dec 2025 10:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766084317; x=1766689117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQfRVSe9fO1PObUKRZHse1cNpjrf0uUXBusNVMTFfiA=;
        b=NzOjmPrn46f7eL94kTiu7+0zvL7EqcBFTL/HGLf3Rc6h3rBZjvJM5i3qCCD2fYrXy7
         eJklrOOWGmpDdYURm2bD9+/3PlBRsY8WKHCZ2GLGzwLcw74QlWuQ3QwUrvnoh8XgWay8
         gOij/Oftk04H9HcDeMjrum7Gp/tJMDS9TcpBQwDo75WutLi+yiY8j3WBiG0hbm0He5W7
         e9CpO9bAAOVDpz+N+io0xTJRBjOcs9kNkjAd+Z+kY0znjtSG4hOPaCJlbg1PV1xakEpj
         cFYP81lVX+QhyL2f1NFGqqWTbtem9suiHwzZLYFwy//KO+NJmpEmbUADkYq65Km/0XcM
         myZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766084317; x=1766689117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AQfRVSe9fO1PObUKRZHse1cNpjrf0uUXBusNVMTFfiA=;
        b=TNkKYBA+yJyOpjTEHQzzxkU/QK1irrntGvG0rxAh0YrWsXzKlbqqy3qtsVYFtlyd5+
         ufaWVwU1AYp57QF9juyLHm0v8D3Qibqr4csSxBfIufhIktHLW5WNmQtZJdfLPXy1Ldb3
         S7yUeWpFsdG1XO2G/GzTwFbSGWpQ7BjYu+1zczVuEPHewduYJEPyROZfqfiRmvOzHnLi
         UbuNMaI3j33d7RX8Gcocmy6giTfXy6iZ9JdCSeSMAxvkuuAH1aC/VzSz0bstGHkeG6yj
         IqJLzgeZQUpSPKNcwfAXggjelqmiAnXUEnn0P+vjgleQNksVh+Vp04UD1/LT0ToW4rLu
         AndA==
X-Forwarded-Encrypted: i=1; AJvYcCXchZIxxuXUfWAae4j5b0LBZwdFB5rqpJNYYsHvmLnLhDQ/gVuY96te56+oHAeDipVp+prCMEv+AyYcHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGcM2zicFSQdhrePZWXSv2QVjabHofEC2nutTmaApQKgH1stj7
	rlcayYXa4BbjuGiFlQbkHVFQTzXHWDECXU0a6YTy9GYzWxPgXBuRv8uB
X-Gm-Gg: AY/fxX4jQAzs+gaHKPjdhh5C+PopRqUuoAq9HIi3oQXbDQn3wMqBQl+USzEnfp37nZM
	JHt2XbI9ysxb/JqlB5TTLggseF3Vw6CeLHRm/OtXHzs5J5TnTeCoWchpONHOQBW9y32HkGvsGNW
	k7O9g+FlNM2NoyYqHuDZQZV2qHd4hKO3sKi44vb/SIJC4fcyND7YPXYPrSCJNgP3EX7YDiIkIGu
	IvxPYBwrkWdgR27o0LwgiGYWCl0Gk89aw1DI2qvckpxuY5mM118GJpXLXI9zt909TxYNhuSI7ZE
	9LhDLwHL/M/tfzA+Udo7bGjFloQ+EZVXq4t3NYypIAUFtAwMp5ODbbYFnKjN7Z6F749AJYstG5y
	PQWxEMaUbGJ4b5lgT7RJZwhu9EvoP4DD/tX2GhJVvL9DdcwF6brUDJSeHTHe4lN6/ag9qiZuCpp
	E6groPlsz7buHApqMHYSAVLnel
X-Google-Smtp-Source: AGHT+IFf3D0xeHaQPPXEeazhorZHgIgTwRHiyRuussKNgJjGtFBYIJhQUMgRhb/IHzjPiFdB5lKzgg==
X-Received: by 2002:a05:7022:3705:b0:119:e56b:91e9 with SMTP id a92af1059eb24-121722dff1cmr177764c88.26.1766084317443;
        Thu, 18 Dec 2025 10:58:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c0c6sm299016c88.12.2025.12.18.10.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 10:58:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 18 Dec 2025 10:58:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
	andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linusw@kernel.org, olivia@selenic.com, radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	richardcochran@gmail.com, wsa+renesas@sang-engineering.com,
	romain.sioen@microchip.com, Ryan.Wanner@microchip.com,
	lars.povlsen@microchip.com, tudor.ambarus@linaro.org,
	charan.pedumuru@microchip.com, kavyasree.kotagiri@microchip.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org, mwalle@kernel.org,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v2 15/19] dt-bindings: hwmon: sparx5: add
 microchip,lan9691-temp
Message-ID: <8462a516-4e8f-413c-813d-e7ff0e6eaa1d@roeck-us.net>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-15-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215163820.1584926-15-robert.marko@sartura.hr>

On Mon, Dec 15, 2025 at 05:35:32PM +0100, Robert Marko wrote:
> Document LAN969x hwmon temperature sensor compatible.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
