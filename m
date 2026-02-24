Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCE9273D76
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 15:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947207; cv=none; b=kDnoaFIxSMl/DS7tclHS4y0ElimOpru2FaCeouZbapqBPpIa4G53X5qYFb/c4Ow8zfFR05tNn7wMLtHJe0g0Lw7vSbRKs9HI2BSDjhmJVQmIxMykLonNdt9PdYhL5eUZOx0pFlimzhXZ0hr4/wi4bbCtcQeC66HEkmAq+Ezh1LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947207; c=relaxed/simple;
	bh=M6YedSy+AP0wOYR6fhU26h01gWxmgRGC+8l9ODMRulI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y/8GbrAca8fjrJkLHpxoviHnUoc9qRZHXphXtCOndOICOZEzwE57AmODhfCMZBAOXbTAUfiC9fUdZVMynrlWCpVBkxml9eiZt2Y9sp+f6rTUrwyWXuY5UKGcGgyogDLpb9uEceYvJM8ss4NaaF2BaFeYbIhcmqBgxRNJpHu1ypA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXGpIIMf; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXGpIIMf"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1271257ae53so5370879c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 07:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771947205; x=1772552005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTBR/5xyCK5HrxbICx3c4MlZLtKp/necKiN5zbOKDvE=;
        b=mXGpIIMfOZAqHZzToLe7isugIKgf2Ch2FkIKm2t+Dm7ODqqO1wckVXWX3xDzvmDIxE
         ldF8WStKtxsLYgbKXY+/9Ql/VW54sy7YkKFTlJ/PlrKfh9KH5PAew7Pd13/NhVIHtJgW
         kZRCrrYP3h8rs1pYpMFnOaIR1Rh+wo3UtgMdxZXhLwOjI4Rr5t7kPYpanR8K9npolzm8
         6MI9w1HHbEJKl4z7Ii6z4oyK5n4UAYf4boPBC0q7aDoepQD1G4el+95EoHkk4ICTi8x2
         11G8dvBB9xK7mythJ4zi+fdvgH6Eg22zyTOw07JzG9rNoBBNtz44QWeVeEvRaor2NK0l
         Fz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771947205; x=1772552005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wTBR/5xyCK5HrxbICx3c4MlZLtKp/necKiN5zbOKDvE=;
        b=p/sy1xKsOMWCJwM0LzOKiU3OGg16XiuHbrp/6TNpxKd+KMaJ9lsPVejy1FyAOM8tkU
         lAXiTWsRB44F5/CO6+JOtZjcOI6OIbA5KK85ao0XTQ5HeMTdNwbyUsOkkZ9nPmwoCRa8
         GludZYWmKvIl1p1zuKjBxQX3UKXAjOTG/FEFdiH/1ntwAAa8y+7uSduOQ9Phpt/fOLET
         lBQt3Gc1/ZezVV5qejuk5wVrVwRQV3sSi+ijUMiPBjelkXhs6LEzSBozOjEHZOKRanpy
         2P8HfUeYpP6Z75ceyRNLSbJksmqqJ6z0h9ouqTB7yTAJ4x1cLVF0LbypL8qJ7qgCU2mB
         zvZg==
X-Forwarded-Encrypted: i=1; AJvYcCWeCPjsN1oHeb0JMipeuPNmSDpAzgXs1SGXslGYW11mQtnrUE4O0sCNaa203c3jopxQ92DW4zpLV6YlEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd9PwSH3E1GGi0rY+YUZ0i24CIZpR6srBJ2aqRpgy5hq77rRZG
	OeaQbjde9GHW1xuGMR7/B3T6wdIjFh/hCAFev+LJoEEnASZ2opn99/Bv
X-Gm-Gg: ATEYQzw7D9tBjDs9N9Tljm/yzOAyVHDj7XhRnN8VVBOBuM7Oy5N58Rxhomf+ZXLQyhT
	kFPLrcsz5YjeIVjgQKGt9q8uocOres9kJUomZeEKOOLwHcMqHqp2AHoX638827mmLEEUa30b+ZC
	LIfXbrWYitTlTm3iYpKmQQgPzne8Nn+VWkJBdgLYAcrfM58MrJfDXqQb0SLVl5Qfk8ddbHLyW9g
	6uLGeqlycecmD7qwGvXzzScdqdCG/7zbgOIHIFRlGHUwsiPyAz9+4djGKTesfUnChcaCkKnrUbu
	uiJxeZUdPsEGq8VdtZ0eKcomDD9eT1eZOfr+Ej148MirD76wegSXX5x9zSamoPXqPH6Yitf7Hgb
	AfYakVXwmls3dPs+SFtC1FpQdElRXdcRJ9y5jC6+BC0ePf8WPQOXPjClCeyilSXhrvbCeXvSZdc
	Xi20l7AQ4w0+Ud0uL+LTC/8Q6xx+ISQeSmd5DPnMvKdTTdvOk=
X-Received: by 2002:a05:7300:2393:b0:2b8:1d16:9726 with SMTP id 5a478bee46e88-2bd7bd38a08mr4752096eec.31.1771947205407;
        Tue, 24 Feb 2026 07:33:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daa37e9sm6847639eec.11.2026.02.24.07.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:33:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 24 Feb 2026 07:33:23 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Hao Yu <haoyufine@gmail.com>
Cc: krzk@kernel.org, akhilesh@ee.iitb.ac.in, conor+dt@kernel.org,
	devicetree@vger.kernel.org, jcdra1@gmail.com, krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: add Aosong AHT10/AHT20/DHT20
 to trivial devices
Message-ID: <14d6f03a-c857-4464-ab0d-91e6ba55967c@roeck-us.net>
References: <20260222105831.7360-1-haoyufine@gmail.com>
 <20260223173853.30617-2-haoyufine@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223173853.30617-2-haoyufine@gmail.com>

On Tue, Feb 24, 2026 at 01:38:52AM +0800, Hao Yu wrote:
> Add Aosong AHT10, AHT20 and DHT20 temperature and humidity sensors
> to the trivial-devices documentation. These sensors use a standard
> I2C interface and do not require complex binding definitions.
> 
> Signed-off-by: Hao Yu <haoyufine@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
