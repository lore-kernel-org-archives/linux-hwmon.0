Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B9929ACC5
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Feb 2026 14:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599219; cv=none; b=YBeuUHNBq6hwtkoM3AfqxDTHSgr/uZOOGFjWgrljl27kc/xOuP+VFB+KwTl6Aq+z06s6ZwuEoG2wljXRpW5eHswr+6BWe/M02o2U4YwAwY8TxuMqsQO2ZUYWeM8fGDfAojj1UCJyIwVDnXPp9b/b6XNKv4UpakVsLVcAq2lIfiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599219; c=relaxed/simple;
	bh=C8KBltZBz0shXp0UC+0E2H1XlBJRZ+SECI8IyXlYY+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lx6DMDMUqKv9UOym9DwLn5u8Y9aRUPLkhxE5qLQDz0iqV+YMoSH1knNAG7Y2hG6/1Id+ho4BO1EGrN40cc5pHmUj0pbbIz/fO9u1sZdHdaMp4PRr/pHTL86kox+1bdR+pNRUvrX7/TPtfParuh+RhZ6/6mUBMmIaOHszT2lWuaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxhsGmZ2; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxhsGmZ2"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1270ac5d3efso2007605c88.1
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Feb 2026 06:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771599217; x=1772204017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2sH1xEnUbFZli4ZGw1UQSL+uYlLc6fkYPIZlNGvWzo=;
        b=MxhsGmZ2jBWkncmEvG43LMl/NxKly+Xc98C1+XqCvx8LHfUX2PfQ8dEjgo70HXwhKt
         yB1F2vNueLp6VjdDllGeY5olaXO3fpXyCsvbDhDGAm7Ml6WoBxyShI5WeLKHzCdJs/xc
         szFSTMO0HHvRaCpea3Y6OhTqitlAlQT9Nii4SSkvFpz0Wv3VdnjU8Uc5ajT9pSQzK5py
         DAtbQ710Vk1UZMDRXb5IgYVIW0UMG1p3+FbKupgarHLbCibR34/PwDQJrme8QW5pPHrg
         tlb771k8FHi4vvoudJvRJTr0hPTHP4CH7U4ggYNYFWBQ2dAJLbihWffZdiH4/05Ki/IF
         3MpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771599217; x=1772204017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I2sH1xEnUbFZli4ZGw1UQSL+uYlLc6fkYPIZlNGvWzo=;
        b=F1OAS3LzyZCgFFQPo//7fLXZ0dKMf20qlEI/AGmmA0ZOekbQEMyrS7zV9XoGcMZIQB
         FMzM3eAE3dB3jBlmSnAxQVtZqNNAP3pFjB40GNrRcYySFBN85yFunpY3OBZYtUcNtu12
         eDUVEw4zVq+L2epqNfBe994yBMj3tEU4HSuyMdbyLEKr4uoShANm1bfI9W3o17LlOTA1
         Qlz8ZUJg/oJmdSEFB4q4jm1csFZCDM56jIZXeh/bPLcdeLnrdksxehrpGZx4ZL4wcZnK
         53qkyFOiFDLKeW2s9BW0RT574JOvfBndsgeGhnPxjp/J6nimexCAgysTIEpb0JebUdHz
         zjcg==
X-Forwarded-Encrypted: i=1; AJvYcCXxQdcHNkNovWs9lfrKSuEJO8BoBOPvQX05ruVlN4CaPgtptUqlQjX8SKrKxrwfbSvsgqEktTa6ti0yxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2RQOF+jaEZWR+JI9cSIaUe6PXIw2tvrCm8mj/rVF3BboO33Yb
	yfI7nzbpuDHMM4um3j8trpZHEDMES43ci+TPsfutS9Yao2EOI9HTpKhJ
X-Gm-Gg: AZuq6aKJLHXglaM0sPrbbipmM3Z9CI2wO+z2T5kyiIHlOslCQCZhlq0jc/13bclWNNg
	y8EE3sdYtYuc2J4BLxAR9mpaRjwao+Q70PioWQirMnClmFYLhCCuT07mYamF2xs3+2fnNiT8EJy
	uEdif578/0i9h4jVkTQjCl3m0GeJ1rP6i7pZdlRFChGLZhZ61xVeEkH6JHrrSfNwBJHd2aq3ifk
	EFRl/rzwtJdUSpraO7EVLYW6jafwKHSCBezhVRnsdRaFHIpHOUiq8OKn0Z+Fdfgrd4TVaCpqT/z
	LnjdsNk71+JgyJg8zgNoa8bQveOo8Qm8Oax2PLkmMiBZgMo6VtRE7PLCseEfCwi2+d3QkioVT0I
	ZaD/nIlXNjt3hnr5emUFKhEX4HCCh2PcdOIyYbJ1bb7Jebhcc7EnSVe+GPnb1VsPcYHfeZLRFSK
	b2QwP4QOC9vj9Zv/sbvBmzFH18RDY6f9ZV4vex
X-Received: by 2002:a05:7022:6192:b0:123:33c3:7c7e with SMTP id a92af1059eb24-12741bd058dmr9618535c88.37.1771599217148;
        Fri, 20 Feb 2026 06:53:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb658544sm26813575eec.17.2026.02.20.06.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 06:53:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 20 Feb 2026 06:53:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Kalhan Trisal <kalhan.trisal@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] hwmon: (emc1403) correct a malformed email address
Message-ID: <a29d7f6c-d809-47c7-ab34-220159c4067e@roeck-us.net>
References: <20260215010327.1687304-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215010327.1687304-1-rdunlap@infradead.org>

On Sat, Feb 14, 2026 at 05:03:27PM -0800, Randy Dunlap wrote:
> Add a closing '>' to Kalhan's emaill address.
> 
> line 60:  Kalhan Trisal <kalhan.trisal@intel.com
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied.

Thanks,
Guenter
