Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDA61BC4E;
	Mon, 11 Nov 2024 19:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731353576; cv=none; b=KreKuH3SZoOccaKh1LockcR/wGe5mFgBqthnz4dx8k+R8CZRiqU43XQwbjE2GYjH6vuKLLtnlVh+OyVvSuHGWjJpN67eWA85agsBmeyaUGbJXKftXCGBv1tUKsBfb4KDThX+iQCTs4k/gIJ5asC6ESleAbdm7IJ6QntB6+0PHKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731353576; c=relaxed/simple;
	bh=0eg1Nok9J9WCRkntDpwpPq+fQFUsXJ+LSm1FZXnGv6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dzu2Jr+nEanldTaZ5nvnF4mqu276ZTmfdQX4S1Ej5PkgCX0B2ECPJ6UBvhadegztKY2kP4HSkUs+IDljQQmbtw4flDzNKipA+oB1QxHAUYc47awghGtN6+PIPAGCrhvN3DTEfHnfWEBV3U9H4z4hsKXfZzlgrre/H0BTWdvXcQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cgk6oOcM; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cgk6oOcM"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-28c7f207806so2116540fac.3;
        Mon, 11 Nov 2024 11:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731353574; x=1731958374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1t7vfPfqONGobIgnQ4Y64fF98ZQrn916KgEe9Uxdn+0=;
        b=cgk6oOcM7Dijao5673rmPI/FbuOtSWPj/3MRzkEA2kxguaotQ12mo+2PCAkGTEcaA/
         5tkIgqbo2yXzNd5CeMbWS83PQrWgyOHk+oIItx3lCUMgFJATIkNj1VSWwUkdTkoogwcu
         syjvA/JpqO60CQTBWDxmmo6KaKcC0pb0+z57qGlBw3ykuNRxcTooYM1nDmsx28kCXC/b
         JUIHGizYmOsXtO016ySUlN8ewMSDs56FcXH0DY83wAQa45SKVUsIH+0lT1JveWmZjM2n
         IoAfvBgVlM3rSJvDgy8Ghd1Vs3tYaKE/fKpv9Ch5nmvo41aTciekLkEjuWh0y7G95eVM
         Hrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731353574; x=1731958374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1t7vfPfqONGobIgnQ4Y64fF98ZQrn916KgEe9Uxdn+0=;
        b=ZtSKpepd/eUyuNng+YDquYgn7hyXhrcY/jxZFgNn4IfildYUpIjtEi1kIvlMpdUGND
         M4qLB86kvA9zsjOg94CVJPXgBloVfHl+88Yf454NlUMSE87m4ESleTEZefLib8vbZ0VL
         f+QaqQSELOyiej9jSLetJL0wlNu7LYoSOltDMezGZ1Q3vikL7QqtcCrTAKYFmOR2RiBs
         oeXcgU+xg3vHk7dX7XdyORcbt95zDYQ1Nt37bDnZbSFojXa/qsPJ6LQQLc4j0AOUrzuU
         YcfRn9ZdNTDuJiKdFbsy9QCw8kvKcgrf6D/Y2pztFiFHCo3WES9Ep5V0T4JwsJYODsDh
         f4IQ==
X-Forwarded-Encrypted: i=1; AJvYcCULeqeoKgDa6dsMN+1Ip3iesJzqT5vlWebkYrWoX/di9Wpfmy2dAHroy67EHYVU7BqWQ2CGz7XE3iLW@vger.kernel.org
X-Gm-Message-State: AOJu0YwSEtrLVRdHAJkkqru9FxYAqDWZKPtXXRPJMnWs+tFk7I/FoNn6
	H6R2hWSTUKynyV28KxWpCZ8RIyJbZzfk6KFcL3+Kh/Kblpl04gYnBct8fA==
X-Google-Smtp-Source: AGHT+IEzbChDSDmrvoIf7oHiP/V7s5GuDwXJoFoEhrmrOC0neQs4nweHiPgBNmYAtcCedJ1SG6AcWw==
X-Received: by 2002:a05:6871:10e:b0:288:4823:fe1b with SMTP id 586e51a60fabf-295ccfd946dmr169489fac.17.1731353574221;
        Mon, 11 Nov 2024 11:32:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f5e083fsm8976063a12.41.2024.11.11.11.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 11:32:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 Nov 2024 11:32:52 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-hwmon@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (pwm-fan) Introduce start from stopped
 state handling
Message-ID: <feaa62fa-cf0b-4e4c-aadc-007729ec7ee6@roeck-us.net>
References: <20241106185925.223736-1-marex@denx.de>
 <20241106185925.223736-2-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106185925.223736-2-marex@denx.de>

On Wed, Nov 06, 2024 at 07:59:05PM +0100, Marek Vasut wrote:
> Delta AFC0612DB-F00 fan has to be set to at least 30% PWM duty cycle
> to spin up from a stopped state, and can be afterward throttled down to
> lower PWM duty cycle. Introduce support for operating such fans which
> need to start at higher PWM duty cycle first and can slow down next.
> 
> Introduce two new DT properties, "fan-stop-to-start-percent" and
> "fan-stop-to-start-us". The former describes the minimum percent
> of fan RPM at which it will surely spin up from stopped state. This
> value can be found in the fan datasheet and can be converted to PWM
> duty cycle easily. The "fan-stop-to-start-us" describes the minimum
> time in microseconds for which the fan has to be set to stopped state
> start RPM for the fan to surely spin up.
> 
> Adjust the PWM setting code such that if the PWM duty cycle is below
> the minimum duty cycle needed by the fan to spin up from stopped state,
> then first set the PWM duty cycle to the minimum duty cycle needed
> by the fan to spin up from stopped state, then wait the time necessary
> for the fan to spin up from stopped state, and finally set the PWM duty
> cycle to the one desired by user.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied.

Thanks,
Guenter
