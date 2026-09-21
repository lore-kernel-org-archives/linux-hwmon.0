Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444F949E127
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 15:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002949; cv=none; b=Iw8FTKMLieArDXILbcoP9lo5AQZ/Hy6Vyo2R6X2UtUylBls1PsCqKTiE2lrQWZvSXyKEHH8RrWPgc4542BKOjsfjDcu0LaueWPQDNVzqJCjHX4XckjcO/NfT9CRJzIn4yw4u1x5dF+KSwn2XEAvraw2An1g6XxtA1VxGrVn1Q2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002949; c=relaxed/simple;
	bh=lLDssI3Ig9cvLyC9Gnf2t/ppG8752TKcbDmH4uKVMvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heZEwveFEKlDZyQfDUYazC9ikAnWRzTaPKzxfzFttujLqD2XB337eIl61jUfT8p36IyJiRMq/GQ0OiZH1rPqE2yG4LJEJghui7MCapp1qS8MXjossitEboV8seTmIUzPs63U9fdcaNFy+J4Io2yFAAS1GPSqGISSV2hXD5UqQ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dy4bYq0d; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dy4bYq0d"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e211a3so2718484b3a.2
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 08:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790002946; x=1790607746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=scSu49n0yZs/NkIL79oefwB1Fce7usaOArd+rmA6NfU=;
        b=dy4bYq0dogCqoDDOLnkmopm4wwSvKTdy9hHoG5AN64SzPhq7XFt0Mkur7PqNXp1sQ6
         SJZG6Y9rXr/oh6Gja4H1ZyP3QTmi9T4fVdWA3RY4AbPV1T1cej4NbyFEEWhYfNgLSkH2
         4ONzSkd+0ytqpRYXYfl8quJcu20UnCPGktGpsBW/rFI0kEEJt52S1IemxIZYWPxjJ5aE
         YBV7wm8Eek57Q29kO+awD91/7sFh4kyKDwVjYiXOL/9x2tOxOVdPIY++f3kKQpTQdBlH
         gxKirNPg32mFyQvGGvVCerLfH1CD9kY0E0E5c+KAHpM0ajuq9AkvJqOKt3WHreJ4DBQ8
         G8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002946; x=1790607746;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scSu49n0yZs/NkIL79oefwB1Fce7usaOArd+rmA6NfU=;
        b=qd9i73wBeA0NRC/qd6RR3sbpFpU1wDYbV3rTwK4X2rvsTJdnWBvdb2BWW0LCGcM8g3
         rrOyqPCusR5t1kCLl86TODE4jQuWU+x2Q0A1njU/b5ZDdnwuAuVhOl4qj7+2ykr4Dj2O
         K4aA9l2pm1b7lr7DfwkHnFp7sYn86swwzi6j3ckB/0ql8itRdy/9QAHhX4EOzz0/I6vh
         64MYAeTPSXnVnejc+x+u6avqZJvFonHH3dqygfcukGT4MGX4GU4ux+aJ/rT+40oUzd45
         UQXbMCFW0H3Prf0eD85mcxXh4bqufi8VALe2S+HBjqox4VoA0cmNt2KWIpbDm5j+Qhmk
         VPLA==
X-Forwarded-Encrypted: i=1; AKwUvBxHryB9E1hOyczNaWxIe9A7Gc7Li0pyammn/1tmYh7onVaF6ci33+ulKDbkWHT7dMwswV+csjGtqr1EWQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l0XXydlGROSO2ULSmc1HnMCrvIW0q9eU+2YoVwOx8GqpNHzTZ2
	ywbyAd1Y9ZmY1DsS43PiHputw+kvlH64U1gGmnZ0FcQtdlzzZKKlwMeW
X-Gm-Gg: AYBFou1AHYIbFFCzsyyuIRoed5CiFzCIpHgouYMrCtH6rB1uugz6IJINC2zHkkSNQyE
	HUQ15TKxVvHY32SICS5X+Qo/VgDJshqpsOt8nz3s9jpOcbTyRQ5PVGf1WTvJ3s0mcsI1qigzVM4
	LcJ1HZUJfwy/3f8v9v/avJrsefVexEn/ZXRWrJonZUIuBuRNhSEIz4oJbFIS4HSM/IVp0YnN/8K
	vavnW65KcYLlj4Q+6JWjHQU4QaKNvVPnvSEv3h/AuAaq+bSVw/AK17jK9mnE6lL8eJYhI+mE3SU
	DVMG76idsY8BvyTX5QkT4rCbaSczhpcp9FlmQJv1fYDGOVht2HcJIEV/WXPGqlK8Us8T28dKBc/
	SO5E4jwDBR3paXOrBQ7ky10PUTxYEYo0bd1hxZJo+j5bGnngexW9MI8ArmMsSFQLnkwBzQyaaYC
	SmDoGySi8u2ZCrJBH9UPxBsyVc0DUf+47nlOxuQu6ZzL7OkZ21Xc+Ob/51DaitdAtK9gyz7c9Zu
	yIziYTT/d9/
X-Received: by 2002:aa7:88d0:0:b0:878:3538:8f80 with SMTP id d2e1a72fcca58-87835389b2bmr7554907b3a.46.1790002946544;
        Mon, 21 Sep 2026 08:02:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a95eceb2sm3411465b3a.24.2026.09.21.08.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:02:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 21 Sep 2026 08:02:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: add Axiado AX3000 and AX3005
 PWM fan controller
Message-ID: <01278847-ebeb-45af-b520-765fa6ae3477@roeck-us.net>
References: <20260921-axiado-ax3000-pwm-fan-v3-0-3def8b6ffec9@axiado.com>
 <20260921-axiado-ax3000-pwm-fan-v3-1-3def8b6ffec9@axiado.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-axiado-ax3000-pwm-fan-v3-1-3def8b6ffec9@axiado.com>

On Mon, Sep 21, 2026 at 12:23:55AM -0700, Petar Stepanovic wrote:
> Add a Devicetree binding for the PWM fan controller found on the
> Axiado AX3000 and AX3005 SoCs.
> 
> The controller measures fan speed using a hardware tachometer block.
> Fan speed is controlled through a PWM signal supplied by an external
> PWM controller.
> 
> Add a MAINTAINERS entry for the binding.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Applied.

Thanks,
Guenter
