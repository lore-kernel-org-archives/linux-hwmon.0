Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048550;
	b=fjN/9JZ3nLWgW0j6kbUJaIKQyxLue4Tly4mQw6R3PP42V+iIytdnWCt5Nd5Wcd/v2qNm
	 UUcV7xyNuJYGZ84ggMYayV3UeVoNwLsUBJY6EJrW/eFUD3AOUZOwrLEnCTrE8ViTuSRaw
	 ne9Fbz8+P6Dpc6qavbfxQ6LjIAPrpJu++XLKNiw3buqkFFqlUSXZQQNUp1qAtCugLJUBV
	 bw9sFibvMvmFWLjkR2yBVhPA27SzrQW7vTLGp3k+XStlMw0t6sQP1NB3XwB0ZgbnUxIus
	 m+g2c3ujEKjAy38yQbAFVkQmSpNmzsQ2wrcPxhvsxcW8rhKhVUKokLITO+jpnVPvmug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=h5mYYH6ztXAGlslcRFjxz9nzyFLofC1QN+/Q6baEB84=;
	b=wh/24bM3LASGxucaLnOrcm2pzdtlW+lUca/0TceNLNOyxQ7Yre+WKQknEW9HR1C8iSCA
	 1oi5UFhqDVYBzTOSugM4Bi/EdM+kAChSJ00TvbHEV9b5HKDt/uJZJqlBc9CqIgFXd8U9u
	 lC2NXDEB3RMm1kL5hD8T8iu1R4SiW3+Hsb/63ncd9vLoKB6rrtKECL71JMQq65T/V9Psg
	 AlEKqMAz9B7DsNaeyzdKo7UKFXdyLfLhlg/oNr4hitMMQcg6npEJxT/MXV5Bvfce18KA8
	 nW4h3XYFqURdDehj57tfH2tp8omFZZcLJGgwGo5C4A2PsFiIKZyj3IHmJK+fTbGtC2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VxewqWBw;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F2A606A31F
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 21:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81F2A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VxewqWBw
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-369f3e9e431so266549eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 14:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048550; x=1793653350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h5mYYH6ztXAGlslcRFjxz9nzyFLofC1QN+/Q6baEB84=;
        b=VxewqWBwssajqE1K/421twDEM50Ya0fxQ2dAzdBlnKNWbwpj7J17CO4utV9RQPeDXl
         G1jSBc7MExVNmLM+hg3feEcOLCYA9JlvbD6GAvfloZ514VUyF3uDEM8TCQ11nuDCtk/U
         wcBiWvOy+kvdWunLmDcJBV4+E6dByLruzRSFyUNHBbqtJt/CmVZMvaiOAjkS9D3EduMd
         OXWXRPP2slF02OW98RJIoDQ4QsyYeb8S2RlsXTdfaJzkts73/5gmTaZ8AITeuAj1IuSO
         q0e1WyHqg0eNbPrT4XlAE9VRgCzt9CfononI4rbBfisAPukqf/g/rJVbu2EIanaY7eH/
         mDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048550; x=1793653350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5mYYH6ztXAGlslcRFjxz9nzyFLofC1QN+/Q6baEB84=;
        b=ESX3RYfYIlG51c6jCKEtpudxMy0QpVWbRH1U3vHfjM9c8YY6Z0dISAp02pkibWqhAj
         0OfX/SxIkqkE3olwECvIpWwTxk7tqs1sXcechIBIMmzNLPfeB/80TgvM5ZCfc+FnzvNo
         JgDKKsCW5Lx+VwZXa8rTtmKtdo1Goao7L/F9CJu7zkEgCaO4w9PSl/I1x+0TMKcgucxG
         3q3/Htd4kAVUdbZ4PJc8utfGeFgXuBIZ6ESeAnj0YISf2WHiGD68cnd726mS7Z37Rsho
         9D/F+5YdwN+oPNjUXl0dm+oERMTIosJW+2mYePeEEHHaMqD534AIbAmT/ZYwbaky/kyu
         FjvA==
X-Forwarded-Encrypted: i=1; AKwUvBz5tCk66th4qOsBFJ/3FL5LhnXoJPc6INS6jPoNKLPwm6svCeF4Jbxu0uC0Xc6ZRukYAri9/5i/3Mqb4Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYLB0sBGw++rOlisJbZHGqhutc1XEDN7ZcL4nEvkj/s7/rSOM4Kf
	220O8x4sDbYmpVfDCGl4FelKvX8rKHYpDwB43PivJcIYmyICz5JUm1pV
X-Gm-Gg: AYBFou3E9n7Ic138Cohsk0gpjuS7Wq9B+oVtPRYSG0tgxhQKxPhvduAYhS1U50AlZf0
	NrxQCjq1RXoFWVLOUjvb2kr0SJj/m8vEbzNI5Fs7lbU89sIgXaeCp0muuu2iNQTC8P7FPKrheHG
	RhkbRQ9E+WN14wKOm/4wrTQjsUY9JA4F2dsjIcSowTWYuQe5I3jthDrT6wtclkcHVMEuU3aPVQZ
	YPqB8VMP2oJMCzsLxE89HIlALrBSXPHmdpKw8GUaeSIyy8KdFmA2QIxcfABpKzXgZyI8owk2DnG
	sW/YHxxfzmnq28OgLSkATGfnu7jD1DOYCXqUUrDq89IdSiaBt2Ksv+vc6KpDiRVlhvUtOkWPPTu
	mnrA9kgJ8ydjQEh9z30cvnp0O2iepxKtSfUy5iSPcFRtoZvp21Ey+4SYg7ciafWGGVmV+DvYNjb
	PgeS7u3qo8FAxLOiY1UJZWfUwMPXUuT0nAide9Ba0pULf51vuqcOhJYMjwbpnEap1BZ2pwbTumm
	KlAyjht5ziHuUZDwe1V+of9atr4qdVXeza7mSmBtmYi8jLN84dLCuIPAydSTCYd/uUr39rafDBX
	BjZ3iHK6Uoz+xfo=
X-Received: by 2002:a05:7301:618c:20b0:369:f1ca:5b24 with SMTP id 5a478bee46e88-36a0f52f51cmr959274eec.6.1793048549375;
        Mon, 26 Oct 2026 14:02:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ecf087sm29394389eec.27.2026.10.26.14.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:02:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 14:02:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/2] hwmon: (starfive-pwm-fan) Add PWM fan driver for
 StarFive JHB100
Message-ID: <ddf7f5b4-9166-443b-9105-807f77307bb7@roeck-us.net>
References: <20261008071950.4772-1-changhuang.liang@starfivetech.com>
 <20261008071950.4772-3-changhuang.liang@starfivetech.com>
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
In-Reply-To: <20261008071950.4772-3-changhuang.liang@starfivetech.com>

On Thu, Oct 08, 2026 at 12:19:50AM -0700, Changhuang Liang wrote:
> Add PWM fan controller driver for StarFive JHB100 SoC.
> 
> Fan speed is controlled through up to 8 PWM channels supplied by an
> external PWM controller and exposed as pwm[1-8], and one PWM channel can
> drive up to two fans. The tachometer block supports 16 independent
> inputs and reports fan speed in RPM through the hwmon sysfs interface,
> along with stall and low-speed alarms.
> 
> For this controller, the special clock and reset operation sequence is:
>   probe: clk_prepare_enable() then reset_control_deassert()
>   remove: clk_disable_unprepare() then reset_control_assert()
> 
> Co-developed-by: William Qiu <william.qiu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Applied.

Thanks,
Guenter
