Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AB44B8271
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 15:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003817; cv=none; b=c/7G6l8MUXCke6wZ83/53QAzJ40o/vigTYi76G0u9h59pls+tazPXHcQy+KxWgBSfm2VXtuoKBD4X6yQXyTLK1RTErq0wc58cQEPv2nexAemuq6THiBKyXuhrrXwHoF5jYvTx+Ndnp4lfmoDFQQ54YRE/9nOph4lWGyBGTRKk2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003817; c=relaxed/simple;
	bh=btmsrMp6ZT1BNi7RwicFG5ia2RT35kS11G26E2R65RI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQKslj4/hmriUhSMQGF/x9mLyE0/L/E3xvIh6MsClhP5ZzV2eUmDNX7YENbZS9K4u+0NOYJDdpPYy7l75nSBwCJZJjQY6ijw30Tz5ViEDzPwTlxW7VwMNF3gvczlkyGc4LfhizE2kMWuBmC9M+lzDKbtFCiO6B4RBaoMNE3WAss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gsv5SvNc; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gsv5SvNc"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e211a0so3450120b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 08:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003815; x=1790608615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DrpGKqIUkLFawAwAJ6T5iyyW+Mbq35mI1r9oJC3ubjA=;
        b=Gsv5SvNc3udEak8jwB8FeYVWdWaqy/aay5ShKJkiMtg7dgfnXhWKyS/x9mmisNKdNJ
         zC62/crv6yTsmQQR6AxoUxJ8Oi0pg2GXPur83bfU4kUZtXwqwTIQkNm1ph1W3SbHIodE
         p574YS5oyMiWYGYYjx3I4PM95ly8nfYqyQt5FilDDyGZR/t/OQB0KfFfV+bedIm0juxk
         kkUTofiJ6n1EKP9D8mufAjKZl+0X98BhZ4vg+ebTFvBO+vlEyodH8C2gDlirrt0AueJP
         nmofaNVDrotJ2D73E9JkCMMpO1CeC28c8k/YhI/LG/sWUA+cX0WXXrAox34iH5AS/3PL
         PsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003815; x=1790608615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DrpGKqIUkLFawAwAJ6T5iyyW+Mbq35mI1r9oJC3ubjA=;
        b=tbSyv1ljLmA5SJumAOwXZYZIVgXc8iFFKwJ2v4bfZqrsaigpG05qCHzG+ChQHL3dyD
         T4UDAcjbEB3r+AvXhk/HoYwqiJDQpcAQGGaE4heABPmnijSlib2O5beD0tseMTh2fSgy
         JtXp6Ejoa5K1/mWIXwDvRKK9X0GegbpEJMgcuUYn5m3xg5hKNIqDzO2bpAT7xIDqi1fH
         EMJUEeKGxbL2VUfoGdaf4mvW9RjNwj0/heGneQauW3A41U7ev67Nw23iEi1H11Fte3wW
         X1k3vEuqERrNAxV4mCeLK15w+E/SX1O+Hezbm9uLGNP4O4HD8uD1UR138ajAzLm48g98
         XStQ==
X-Forwarded-Encrypted: i=1; AKwUvByQY28y+MvQyseZW6X3lH1vmcdADYUf4NAueFxgOI+r8BfBW0xT0gEyOQJTHBZtPRbsAmq0b+INrXRNhQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kFfWXwPkKgcT7WOFv0BZUSV5CeucbU4Z+gwxzqU1v5/o1+7ffb
	E3F7LJanYcpIveyN6owix2ffNSorasckJtAXIaWU+OIP55QixCEXRMvE
X-Gm-Gg: AYBFou3yIn7o/2QdbOgtmbEEPduDkUrjVeZFxBrjI8ost5cG2UeYXcW73bAesCu/HUa
	HH1an5Fpjc4ZUcXdXMYNT5W5pLDmkM7eE7v4BSBTBF+TiOXPZiHC6jgCqNPFefUuD56leCfX2bx
	z3JvmiYHsQLj/OX/DbBLz3h8C3QmnvvBX0L178FrMPdulPgryv0lx2upuR2RpgAxF6V3latzBFS
	3X41pKqrjrCIhEsHfrVMzMtLo+3P95xZdNayFVZ4PF5UzHs27cbKfpOa3tyyQHv+5GPmBEWeqXz
	SKhIuN5zYtXXgoLUpJTZ6J9YAWtXikzs3mrsByPNmlZYQxUxrY3323U0aGqJZDA7+8aiYC/oPHz
	5OJFajXJkYScwDH9InpaMEIltMqyUCA3od35vnLYd94I17VXR2GhAzixkzsnHq7Bf6YKRidf21c
	9TnRq4X3RayMeuqOMen1v/wy+FV0Vudoh0awDL7xv7+mclssga56RKnO+pctjBs6jQFa/pUgZCp
	CRJGTEckhGw
X-Received: by 2002:a05:6a00:ad08:b0:874:706d:857b with SMTP id d2e1a72fcca58-874de9fd734mr15109225b3a.35.1790003815225;
        Mon, 21 Sep 2026 08:16:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a95eceb2sm3431796b3a.24.2026.09.21.08.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:16:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 21 Sep 2026 08:16:53 -0700
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
	linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 2/2] hwmon: add Axiado AX3000 and AX3005 PWM fan
 controller driver
Message-ID: <d9dfa12a-0999-4425-ba83-aacd48eea1ea@roeck-us.net>
References: <20260921-axiado-ax3000-pwm-fan-v3-0-3def8b6ffec9@axiado.com>
 <20260921-axiado-ax3000-pwm-fan-v3-2-3def8b6ffec9@axiado.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-axiado-ax3000-pwm-fan-v3-2-3def8b6ffec9@axiado.com>

On Mon, Sep 21, 2026 at 12:23:56AM -0700, Petar Stepanovic wrote:
> Add support for the PWM fan controller found on the Axiado AX3000 and
> AX3005 SoCs.
> 
> The controller uses a hardware tachometer block and interrupt to measure
> fan speed. Fan speed is controlled through a PWM signal supplied by an
> external PWM controller.
> 
> Register the controller with the hwmon subsystem and expose the standard
> fan1_input and pwm1 attributes. The physical fan is represented by a fan
> child node containing the PWM specifier and the optional
> pulses-per-revolution property. If pulses-per-revolution is not specified,
> the driver uses two pulses per revolution.
> 
> The driver was tested on AX3000 and AX3005 boards.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Applied.

Thanks,
Guenter
