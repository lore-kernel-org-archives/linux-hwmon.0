Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D64386C17
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 22:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778798315; cv=none; b=ryU4awyhYlF815RTeTEg7FrUr3bgUKCniRWDXAUR+UdypjmUNWGINAqGdIrrcmCwgrNLW9TnycVLi3FfztsMqUFnNfY9LXY/YKnO7TGiKCRkul4tVQidf9SlwbZ/PYDkEEHtfivT7R6DuvxVHrG8fJnLvpIk2BqAzXAI/r3kZbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778798315; c=relaxed/simple;
	bh=7dMcmHM4bG6T1r3xB7LqsoDEtv/hCVRu2lwlbCyPzCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQ2zZkyBfIe7B23b4f4zAIUf//KzM7tYhIAz3QNPMzc7HfhMItDQNfNYsNnqhEVRmPaNX5iOY++97zAJIhHBeSzFDsBciegRhtOV6QCNRA5N21+FijsAcVUsy+yGZOgqPIF+wAYc9fNSBdKwldquCwvvGYeuxpfe3np36AEcSfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gc4mcl+F; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gc4mcl+F"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c8f9846c8so12801107c88.0
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 15:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778798313; x=1779403113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bA6YtwXc/fVdQNdP1NGr27OY7GnO4TrnmnNOSxDvyVc=;
        b=gc4mcl+FTVAGsahMSB/SfZY1WARa1wJYwugo7c9XqFIftRYI2+qZ/AJs5MmQeY6Z1x
         Nr5AYsX1SFZ+lveZOwiA4fAvG8zY0WFL4VfasfsarentBVkllterRp2lqRM6RsJOVBEa
         WH6tBwCvnW1mAK/Ku95brXFnTC2F+mwM+pIkRMyqx+CydkOL3eXFZil06HqGJW/2CgtU
         BzrAUalyBT6GeAadrLL9UDszvv78vHJAchBue/zzyqvTvz4sQlmEQb3gxEMNY2oEglbk
         kzwxnvj/GsDu3qrVvxEsDKqjRnvRDHsRYr0H1/o0sztWu6iiU8bY+fPSAh3l4nSfumzg
         dwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778798313; x=1779403113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bA6YtwXc/fVdQNdP1NGr27OY7GnO4TrnmnNOSxDvyVc=;
        b=cdUvnVKt4bgvUnH/168SmkSJiLljhLwuQJ8TbBXEB3OQAqJOPDCyg/z/UQ2hgOstrf
         FJtXvQgcTsHd8ZPmUrSCX5DjZi0a7czZbqdCHaeVRf93Q3KJEV7c2O47t5PhhXTLbtgU
         sx44ibGLQO4GJqig8ZbynBEbzr4j9ZFx2HH9ju6fNDqAcJqTsfiC8Ncfu9rberMZeU3k
         yotg84z0Jp8NT3YJlBBJlaOZjA0VlMaNbpeW+bNE1hdG1R/vKaljiR6mBc+CkidEVGqr
         71m35pJsbt9EcR2mlqz9/2oaQVV61Ac6MgFghLWmzmaMrNnw4V6L4FZQ9FxTW+XsSm2w
         c0/w==
X-Forwarded-Encrypted: i=1; AFNElJ/2rA0lgdXD5Qg06ex+AAhmhKZcY+yoYEC1FMnnX/Is86Wrq9mdTdHHslPy6LMVngqzKXV5p0ubogK65Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl/wa4JWuLv1RkVqTFPsIh/E2glgiNJdY7NfH5kza4Dk+CgfeC
	sXIokvlGPa83ReLjHuLLLsTmHFh11c1/6tYRqmjfX0CjthZG303ZCuSA
X-Gm-Gg: Acq92OHrESzGLbAR7VZmsRVSooaxAkOOgmaFBcC9+4/lf17NysFg8Y7HuS5jXJ8Qb5B
	3UtXnfjYja/ByUsmJbNm/ptwDLUiVchc4ZGO5jrceVtN8PvMNmmEcttOn8Vvs6io+FWNAPW8U6l
	bclEmCCGR2cP5KNCObgh7RGqccfycTsP/bBzD/Cqpq17S7TY8PFfx07LZciOhCF14iuSKwpLnZK
	VE//0U/Gzpvk1VUuJNyr/kmZLv4HMXZ10Zdx4oiUfz3100bKTRbA5tsJVNDxGZFbZP3XlKUKdGW
	7Xrw0WqV3yqOwmxrLGXuI/FeqTRLgUy9B459+SDfGrSL2rgjqk8SHDmEAhnD9HJZhJGdNJOZtTw
	RFr/3Lg5EMgqEa2xGjmX3BybamROiFMihz1CI/ChNudjLP3efIxgdIn28R4IbpxU/mfOblyUB9L
	U2ApvHHHG5V6HM8BGLhgSJPl1WXuztcff84KvTOyQn4r/frRQ=
X-Received: by 2002:a05:7300:e78c:b0:2da:a813:a60c with SMTP id 5a478bee46e88-3039867e573mr761921eec.20.1778798313075;
        Thu, 14 May 2026 15:38:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978afe8dsm4932735eec.27.2026.05.14.15.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:38:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 14 May 2026 15:38:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v2] hwmon: (nct7802) Add time step attributes for
 tweaking responsiveness
Message-ID: <0bec6b06-c5cc-42f1-8448-1880f86e3e2a@roeck-us.net>
References: <20260514003404.1548747-2-ronan.dalton@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514003404.1548747-2-ronan.dalton@alliedtelesis.co.nz>

On Thu, May 14, 2026 at 12:34:04PM +1200, Ronan Dalton wrote:
> The nct7802 chip exposes two registers that allow setting the time
> interval between successive duty increases or decreases in Smart Fan
> mode. The units are intervals of 0.1 second. The default value at power
> on is 10, so 1 second.
> 
> Add sysfs attributes for step_up_time and step_down_time to allow
> controlling the responsiveness of the fan speed. Values are represented
> as milliseconds to the user. When set, the value is clamped to the valid
> range of 100 to 25500 (0.1 to 25.5 seconds), and rounded to the nearest
> multiple of 100.
> 
> Signed-off-by: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-hwmon@vger.kernel.org
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>

Applied.

Thanks,
Guenter
