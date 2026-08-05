Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E48360ECF
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785941893; cv=none; b=vGsuEns5TJ4Npkzz1Po5lU4BcsnkLii00NmPH2gkJbqKylEjZyjGHWttLsHHHsqoAalmnciTMQvJM2OOHUJJKz3/ec33FYywL1Brbcjq9wg8G4jOCcpW5MHAuKiouF+oSe2YBSjwjIc87/Gzg/YcY8mPKwUHFOZ3YWFs0DQ7Okw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785941893; c=relaxed/simple;
	bh=9S/faSZXw85fr7ERVeNcmiX7A2STfXPOz+vsocu6na4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyE3YXg5cnBnK9is8srrd+lE7JMtDGpWS9KDD1fMr2ic9KzRridhpr9tCv9djWAbsIhQkYQhI7Nho0I/s5CyIPUOS6ya/4g/eG61uwSLfll2QEyJ8J0Oao5NVHqI24mEEDlYAw5X4SFeYlgGETcV0x8rTIGoJoIav8AUIxxEmik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZA3v6CJ8; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZA3v6CJ8"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so1287279a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785941892; x=1786546692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qoe2BAtQzV2Z/pr4B+d9y9nLNSXO+lcdy6rhWuxxDJo=;
        b=ZA3v6CJ8WbCrpq5kc4HNlWpTgSpNPnvhmavRSWGxkc87ofa6r+7LFxX7nr1e8DJvkg
         0N8BIUWK5O45niwHEffpF/zMr8smQo2pmFD4Ocmod70jpAMzlE4Hx5gsu7oj6Fm+jfS2
         ezKWXZMyW5lf1Exd4Ocfffrsc8YRK8tg6S2/ev35oURVGAVSfbEqZ2VSf0JujWkFbICk
         jFguACUJVfDXq3YGk50xP3GD4e9+xXK4hV7xKw9ev8wQLZK5x++L5mjkYl80T7NBXwr2
         fNUYpV3kwfImsDfVDQfGs0XXFMl3ImwUi1V6KbaHpUOOkaJL1+RgkHa89Hfk0H3EKPWG
         W6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785941892; x=1786546692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qoe2BAtQzV2Z/pr4B+d9y9nLNSXO+lcdy6rhWuxxDJo=;
        b=h3B9zw8+HvMbMtzXjq/Sm7mjYBjosjCx1k9lrt4Fp8Z/XYyrQIkIC0e5rdtlSR7QNb
         eWocXiq6t1cQVvvos3LUFR5fJyiOIw8OUq7pN5ot2Uo4BCYqKsFnrAN1fviS9jg56zLN
         vGfeY5ZnFcfKCNxoLb7LfeSJma+4qhZFmh+75tsGn98mLQI3PXw2pIH9z+ZtnhS7FQZX
         s3lpNltqXA25Yzb+S0WqwkujQ2PoIrhBQzItLedL4F3i9UwjQJ5SyUQtmsBbXPKrz7Nx
         PJGXSIOfbacNZGSU8BvQr0IuqhlfRQbTdVuzb4AMwibkA+IeK8+ZuIbZhk/UhrC9lY40
         uoqA==
X-Forwarded-Encrypted: i=1; AHgh+RohhKWLz/rRcTNMuty/UCDgxZ2hBlEhY70yFS0T80DTd6GokWA442eqGh/mywfSkamRsB1/A1J1TOhYSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4A7UJiYN1Yi0Tmr2JYucTKqfuv1rZz20QhWb45fQ4GxRfRp3W
	3wNx2xKIO29suaAcXC4j09uwQi7wQ0ROMK5Ihxe55s2b9GDQ5TznrkD5
X-Gm-Gg: AR+sD10WNdiZ1AqCB/wqRU9DOUq8tpS897/9Cy2JI4Cj+xbmilh1bH1XEX0C+QKihYI
	WYLk0hDzJrUVzqFe8dG267nvFHeaJxBx+flctvWhG3ykqQAb2XwtEv+J68bul12SJ4tf08DrRmp
	hDWfcNPpHgCjSPTG4ZR0HBsmpOUZME+D6oOO80q8seX7O4bRybIiBNY8RLTTeAQcsQAO9dPW0ie
	4X3jDH87q9G9+UHlCFet59xPwUFd9v9z+aA5PCggrGrIqaGB9loojULcM6hpmm3sjZcOdyKdr1L
	72xOMeT/Ez82OvinNpmbWiIWKgBJjlgBwCS/6SwdPnGueinG6MREcwmdo/57KBhV2Og72XRubkz
	se6Tc4ZujMoPivKVruhVRmL0S02r6AOHrV2wZ0vepMjgfhMYlWXCWI9PwqkfuivyJoOKDf0HN88
	ibB6Qfvx2rP4GBdC05LHJnTOzkDpEqJci3kRKV8km2hZ/0X0o+HdpQUsK5n8r/LILO+Iv1QdrPy
	g==
X-Received: by 2002:a17:90b:280d:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-3903c54fbebmr8588690a91.1.1785941891593;
        Wed, 05 Aug 2026 07:58:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca8df88csm13204639c88.11.2026.08.05.07.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 07:58:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 5 Aug 2026 07:58:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@us.ibm.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [hwmon-next PATCH v6 2/4] hwmon: (adt7470) Add ADT7470_PWM_MAX
 macro
Message-ID: <f6ecb967-b77a-4983-ac2c-3b33822480c5@roeck-us.net>
References: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
 <20260805-adt7470_thermalzone-v6-2-5605a5f95467@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-adt7470_thermalzone-v6-2-5605a5f95467@gmail.com>

On Wed, Aug 05, 2026 at 10:15:18AM -0300, Luiz Angelo Daros de Luca wrote:
> Instead of a magic 255, use a macro to refer to it.
> 
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Applied.

Thanks,
Guenter
