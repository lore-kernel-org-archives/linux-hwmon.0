Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FE426A0DB
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 20:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762978419; cv=none; b=Tms/mxGsCCODdzMSXdJ00cHUxRvRyTiRkUgf4/yFk0t+z6pQQt053sUeP4WeVs60I6PC/TdyGIvYWh/ie1kd28ZKFihm7X4Zlql698T6YpnMWJQ3LcRZ6Tcw8oWhmSlj22aR/4eSoBmmDxjcMQmqeWLWgBiPYoqQTtIwGqt7OHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762978419; c=relaxed/simple;
	bh=7OpbfbJTDoF2lSeL8JxLl5pSRv5Udk+mhhoKn/NRqV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ok6u+Nea0GeJ2tD0Sw6v3ZlnCavRNTYlpVGLCMuvbnS7gH8GL88xJbqLdKK9hXv9+x/XaS3LPJ2ApGAD13o8g5lJr4C3hqKDjQ2AOGYIv6ywx5fn6IaY7xIzGcT6Eh6IABPSd9szxG6eFEy8B4RHllW9OXqGgsPQJSp9k4efxoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/WRnWFW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/WRnWFW"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29568d93e87so181615ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 12:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762978417; x=1763583217; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YEnCcyn20grhq9FQbq7ZypXotvEYNCiIdOYGNMkBNrM=;
        b=N/WRnWFWVhmnlhCYrOoBq7jr8QuDWHQUJSVnKx8M139twZ5ktHh4rs4xMyVdXLvNVT
         Txrdl0SGceqiufxg6Gdam8dyciL0ow+1mc2FW5HZwHg5N/OXjQqX1IIVT2mL8F4D7aWb
         2tnR4qP5Yu1PSUJzVDIECBtZTAj4g9n9VRWvXAIiJM2KF7S3I2a7cSz4/oxIoTj01UIX
         4jk+hTiUqF46YGqFqhQHEOlqLNZsmTBZpD1cUb4fgiXXKANF2fav49HWYa3sPUh/rT26
         Q6VpxZ6KaPKTSMzMnm1eNbI8ySKDgcyt7W03ePwbgZlf3BYoxYKqkP0479c+R+3SjDSY
         azCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762978417; x=1763583217;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEnCcyn20grhq9FQbq7ZypXotvEYNCiIdOYGNMkBNrM=;
        b=hu/9GDdOnSmvBSmFd86hTGCatjSwtBg9fqaL9x/4tzr/wHmf7N6LnSzyYdWgYjR3YQ
         8+MiJQHZdNYxm/+pI29MOTPWE4BRniQyWhC96vkRalDHLdqGmcPJE1RPzQbUs3qBTU2O
         2vCsggKuEeeaCo+4nL+VgrcAHc/7BKvhwedOUDSBe14/9o4AkZm0O1UVPS03rL8elSsr
         sKyDRHsY9btzf3tEU8KKaFWwMufJ3sKe8qzUd30vyGKPKpdIJhdes7ahq1DVeQp+280w
         Hi7RzWvMQMEMUw3K3h1eTDQBFx3amWLTlztPruqhqyyEeQ1ikowsSqJYPho1wWPeH7Zi
         Hcag==
X-Forwarded-Encrypted: i=1; AJvYcCXdIAnjpy5pdXhsmPVsDRADLKgU18pp00sfXND53qTEFlxezEA2TwGcs4QOLTqFr3hc7zuAaLPCwhMosw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1frZu3xZ2XzEzSqD5w3/hNtVOJslS4Ulr+2WOd0Uyacit990h
	enmK/zqNVt4vlYwpLpsKc+DdHQ9o5cGTgCpir0eeeqBATLbWFF6lf6IX
X-Gm-Gg: ASbGncshz+muf3RfMFMganoWQdWBrx+gMymcTF7OrotHWZr+OxT4+cCsori4ZyfoBma
	Eog/lAkhxv385oo8b45SL/pXj7m7ws31lk0Mno9xHrOFwNRRudwYJL375xHLhir/Kn3qJUf+H1b
	C7x2NNC8aa3ZNUAtNuDdpITUgOwuSpmFeRuHBEJwEw2tUyZEFJWiqp2VN7kWUVkBM4wB387Vasm
	rx43Jr+0qw2PM/Qe/wGXkJ5Y8dKrzifL1O2xAYHJgqFxniD/rEy3tbNwwvMAFnxXgXc9UQtScAH
	MLBYoQEYx6SlTD6AYtlD4xlrw/yqdHoVLn1Kg8gSjJSLrIYBnqoedYS5rcvv/mhZtXFEuR6Qilj
	uK4QGSoVf2u6/xibU6Sm9BXt/8kWHNLnt8IM4gmaMItKwj0M0T9/ck6yMvRndmF6e6t/fnK3oP0
	+2vJHqziA9GzMc
X-Google-Smtp-Source: AGHT+IF2e0Z9qSykfZsEZ45SSppVY6cM1szbGS+Fu+IeCdq2h7xLoE73yVG5z5KjZM2jI4DB8M3Kdw==
X-Received: by 2002:a17:903:90f:b0:27d:69cc:9a6 with SMTP id d9443c01a7336-2984ee1df02mr52346215ad.53.1762978416891;
        Wed, 12 Nov 2025 12:13:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346ffsm179175ad.9.2025.11.12.12.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 12:13:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Nov 2025 12:13:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jeff Lin <jefflin994697@gmail.com>
Cc: jdelvare@suse.com, Mariel.Tinaco@analog.com,
	andriy.shevchenko@linux.intel.com,
	cedricjustine.encarnacion@analog.com, chiang.brian@inventec.com,
	grantpeltier93@gmail.com, gregkh@linuxfoundation.org,
	jbrunet@baylibre.com, johnerasmusmari.geronimo@analog.com,
	kimseer.paller@analog.com, krzysztof.kozlowski@linaro.org,
	leo.yang.sy0@gmail.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, ninad@linux.ibm.com,
	nuno.sa@analog.com, peterz@infradead.org, thorsten.blum@linux.dev,
	tzungbi@kernel.org, william@wkennington.com
Subject: Re: [PATCH v2] drivers/hwmon/pmbus: Add support for raa229141 in
 isl68137
Message-ID: <afcb3018-7fd9-4099-a443-2ba6b6513986@roeck-us.net>
References: <20251106104519.2014853-1-jefflin994697@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251106104519.2014853-1-jefflin994697@gmail.com>

On Thu, Nov 06, 2025 at 06:45:19PM +0800, Jeff Lin wrote:
> The RAA229141A is a digital dual output multiphase (X+Y ≤ 12) PWM
> controller designed to be compliant with Intel VR13, VR13.HC, VR14 and
> VR14.Cloud specifications, targeting VCORE and auxiliary rails.
> 
> The RAA229141A supports the Intel SVID interface along with PMBus V1.3
> specifications, making it ideal for controlling the microprocessor core and
> system rails in Intel VR13, VR13.HC, VR14 and VR14.Cloud platforms.
> 
> Signed-off-by: Jeff Lin <jefflin994697@gmail.com>
> ---
> v1 -> v2:
> - Modify subject and description for the requirements

Subject should have been "hwmon/pmbus: (isl68137) Add support for raa229141"

On a side note, you were asked _not_ to resend unless asked to do so.

Never mind, I updated the subject and applied the patch.

Thanks,
Guenter
