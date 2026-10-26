Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048385;
	b=EUI2ZJSPiuh+tCIXHt8nUWXhohhGNXaCcHPswUA0es0J8dXn26Ia/E1+/XA9stiSXzIj
	 9+d1m8MiPTMP2/tUMYHxh/lsTjZEf49Irs61bjgHAYgqx8OQneF9Uo+f8x2GEJtuWseJm
	 OzAiZx3p+jxcV/aUR813sJRbkDUDDChSg6zaPDfaGMnriD8+uKrZzE4eXPkv/B0ALusG+
	 yV/01vU+FdjPp/t0A2scoIfkYWE0xbs3fqPKG4Xag7AdHYt5FcLu8S8chC8K8qxyeuY+n
	 +hcQ1wNHssgy+5Mjofkfupp8J3d6a9LzD7du81/505tnh3uEwbay9EaIN8QF1YZ1jcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ElnGyBhxTlC0UTRUSBEeogLksVwHxSNCvVEisIaHZ+c=;
	b=UbBJU/9K3HvdKa/5ghryhKdxUu4xfi2YM8DL8SiJwIerhke+Luul8qxkgtF3I7K4KtZo
	 jOifiioFgfrcTmGi3EW5T0PAuK2s+j7h0uMrwnBJcYcGEralgf/zSarsHxT/e9K/0Ph1N
	 hwS/VbuPfhMLHe51UFtMIXKDYWnN7N0lO7lJrV9WBATI/ie0gSGqMbCEpdCUl7tJCFN+Q
	 fLzO6Py+40ipa+d1YXBmhHk9LZyP/m0zfJWQqiGf8UXf1ooUfdneoBDn1EtZIPcGNJHCy
	 1jv6WRy23tgKa5TqBw8VZcuskr2xNEeDOhkKo1l56ZMz35i+L60YUa1uc7OirHeyYhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A87SY9TI;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14969606A31B
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 20:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14969606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A87SY9TI
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35829219da8so416552eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 13:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048384; x=1793653184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ElnGyBhxTlC0UTRUSBEeogLksVwHxSNCvVEisIaHZ+c=;
        b=A87SY9TIKRzMzmJAHN5112qIQmlDCnKr9GFGl0CuWf42MtLScgEH0grHVP3r+xoVQq
         0XaWksEYPI4fBCpiLeDA/sqMqIbXq3xOA4xV/K/sT/xZHl+H3mHGkIfij0HUv43H6ahf
         GfXm4+e0f06yGJWSQag3ULHpRnA/WmBj1aI11jVC1uJTwaZZV90+WXYsmOOraeNIaxH9
         MaE1K8SKFYlxYkVc1dX4KetSqISyJKQoqYxNuIlxzNh1lDOz8IEgyKq5UvYzbstmXzfO
         X+xOgAuW9/oE3KeANZYraaxVbUKPTns9c5HTirX07Ukjty9Q1teGyCk2LWlW5Zb5ans+
         LPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048384; x=1793653184;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElnGyBhxTlC0UTRUSBEeogLksVwHxSNCvVEisIaHZ+c=;
        b=FXHy7sarpTcH0m8u+AP2Ou1tX+ONM5o3EeGoB51qLR/fyohCINsW8AlKQAxIeJ6b7Y
         COQW5bR8qWPRodLm7D1DJIp7GySEojV53+MWi4punlCLR9dOao3SbSQABP50+U/GyzlU
         WOuuMLUACbRzn6uImKTpZExodwROX8o48kzKtGCehBceJ/Ct167ZoYBaN9Y02YPk+zH+
         bLLENEmKvN86DZB2ErFQbOFCDMy9EUOhdKsSvUQLUmitcLFeLQtJYW7PnWA1c+wVm40U
         ufYcJtwzPECkOyhgmilVO37UtGI1i1nSHbQaKO0elhpKZJRIvYhAMc1RqHRPSQyKpElH
         4OnA==
X-Forwarded-Encrypted: i=1; AKwUvBw/QZQgBH6yGqko6TeLpiL0M+Lti1IDpmrMZYZRB2S580naAazSf1VLwWkv0eOwJyMx3uTBf5UQsZOhcA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJBG7o772HJhboJ92+VbB9OzZE+JKInwpxhXP3fT4vOIlyckQd1
	7ggWT/1HTEozlF6XyrX+FlOBnCDfHp5LoqKXKHvaGJnSWimITFuJNlqxb5R3lg==
X-Gm-Gg: AYBFou1+LYzQOx90v0gIZ881QLt1Y9PL2smiEP4zmX3wwRvGCMyNILs/mTAsnLngBpS
	fGNE5RAhJ4IRc9rIe3fXKrYd7IgcBH7kcT0FxqO+Wwr9kT26I7hMrjz1QUep+hpp4b2/Uvo2Acl
	/zoMvBPlRazRd5VzdWRfWYHj3Ar0qVABM1fUtOEQqG0CjEUiNoXpqIk3I9NKfas5DSS3t2SqA8v
	WNCi9/XwpVHRGSaJBoAYmWMn0nsC6cv349UsD3z3462+BFT+ue9r/SOuhJQBiBEEzSkb3zfbXZm
	jFlGUEt+40PG6RBZ9uh2P0o02IKvv51pzV6MZhi8v1GQLQecjLeuy/fEtV3SNjRvU0Rd3TihD0U
	uQfy1r1ZXFVGldKRtFxXLFdkveqEQ6Ax5BAO5KXbGc8W9CTvvotW2Pvm/VdBmSKDzkk1BU1Gxu1
	ViFlfEzKZ24v/HUJnWST2qJaGHKqIMCTtxFwlgZrUIVHGEk1nP6mPYyPDGyo3p5lGOHdyeyUYWD
	9+peZLh40/xGdh98aVlvL2YyT8hoB75Y4SpRtqOetsqnakw0sMNK5tfy+o0oy/I3EYQag==
X-Received: by 2002:a05:7022:31b:b0:185:6c8c:d860 with SMTP id a92af1059eb24-1a3c3240329mr1386744c88.5.1793048384105;
        Mon, 26 Oct 2026 13:59:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm26721350c88.1.2026.10.26.13.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:59:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:59:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: Add starfive,jhb100-pwm-fan
Message-ID: <9e95afd7-d99f-447b-8c16-5fb7073f51c0@roeck-us.net>
References: <20261008071950.4772-1-changhuang.liang@starfivetech.com>
 <20261008071950.4772-2-changhuang.liang@starfivetech.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008071950.4772-2-changhuang.liang@starfivetech.com>

On Thu, Oct 08, 2026 at 12:19:49AM -0700, Changhuang Liang wrote:
> Add a binding for the StarFive JHB100 PWM fan controller. The controller
> has a hardware tachometer block with 16 tachometer inputs, while fan
> speed is controlled through 8 PWM channels supplied by an external PWM
> controller.
> 
> One PWM channel can drive up to two fans, so each fan-N child node
> references one PWM channel and lists the tachometer inputs wired to the
> fans it drives.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
