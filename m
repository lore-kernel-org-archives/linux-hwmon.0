Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C7D42B726
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 14:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558186; cv=none; b=O1Nmj6oWqWgdXPYlhc36Z3139VZky6P3dazjpyPhEoSi3abycWxtNs5ZAxhG63z+3QbEbOmrdOdBbX84o7Lw3q/yQFXOTfajPlyCc7/MVZGvJs97BHHPpLrxMxQnSZkpcEKp2FPE9Uy8GDYj0pPi5vMxCG6Vqs7QnniwrYj+ITI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558186; c=relaxed/simple;
	bh=vAQkxvt5sH/zcQpWhBOuISTD9H5lzrEIUTBx5PYqsN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmDmHlB/e1p/NrOi22QPxKcEe49G2Hb96uwOE3RN6QmK3laqg74ZTsxx6SaK6QU9tqEH7OazPz9N2Qk9jJTHAYTznFTi5L/SlM9LqfUleqCONUG1Q9zggynztCVwkW13Tv0sgyPGwmmJe4JzzQ86rdG0mH60/Lc24pfpUkybL4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAAL+4BS; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAAL+4BS"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e041ea211so7997528a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 07:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784558184; x=1785162984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hx78D4UkMFP4yK3F9SEOUzuXHFefOHu2JmeYkPuo8jk=;
        b=QAAL+4BSknmT5x2hCYYtRGkzOVyEU+g7RtMZJUc2J7CxqbEIcuUDyqiNd1CuCRKiDZ
         f/JQZ8u2icl4ZV1gEO1cq5QQSsWcJRAPjbQkCsrgqyCaj1vt76P6OvOxk1IifDzgRCUL
         Bc/wKe2Y0usFpyFf0i+U/KfbRxt98LFmCAumnt/dEHMyHx7L5nGsa+PkQDE1MkdanLs0
         CWv/rQpES44N8yC8XAKMg2JqzpN0lGe8snThnTpUEzWYfG9xH6bMiawCiKtfHoT/T0VH
         VFLp1uykDWd621UgEnMpr/GwtuD85nS8r8nWVu/DnWg6byjUQotQVmh59GVQKPXCPbmI
         NatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784558184; x=1785162984;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hx78D4UkMFP4yK3F9SEOUzuXHFefOHu2JmeYkPuo8jk=;
        b=PdreYns/3iP3p6BD8Hp/ZZE4tldbDYkUwqGzrAGf9lY/oIw8EuZ030KWnFjoQpfUCs
         yvQFR0muV/it5gO3nR9gBkPZDp7AZpX5ONfW1CgYTA5BdaYtTxKvsMBJK+xvDvrOU65u
         asVVp5qiRGOOT3V48US2LQ+sUlf/oxaSAzfNQqHcIf6d7dIaWICgQmvDYVMdhtLRTzrp
         9dmShVHUabOPrhLqIYcv0wUH6RV9XhyBE8wthTU1n9amaM1jItu3T/ZJyXh+45Ve3/fp
         v+e9oj1syC/AcpHcGQ9ESw+nO0qf3OPUuqdFW16/GyPJYwFcDfsrhfbaOv7KGdreh/4Q
         SUDw==
X-Forwarded-Encrypted: i=1; AHgh+RpUfEak65gCOT7nG/Qt70eD9HyfFdC/mtJ/dSW1VoyPJ3a1ImfjxSJGs2XP2VDA9mGQof1DfRwe+uMj6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4SULlHc1mvJ0ATXpEyssmLY4k5jCNS5hWHvcTtEM8wL1MTaYD
	ht8Y+xCM80pScLAIjBDdPiqsrKeQFke8jj8x1fYdd8lZor4hUEBLnt6k
X-Gm-Gg: AR+sD12DVEN7uF4Sms/UmX+PJwyoQqq6DxNQ3JhCVvCuADuvqyxtXRPrMpQIMd02vPN
	MRvuA4rZiy1oBR4DrJpx/0sQ6d7SFj2Wm/44IqcgpcHQ/N7re6jTNLjkZrHZz3ENSP+d0pmqSZ1
	cuzntCrmAaV/2S4T92mojG4VjNF4lrC5wJCOsSxdvqYsFBg5I3Bt5r1Zv52rs4z2mUtPCElwdUl
	lQsS19Sb4vTLyxZpIOB7LviGZZPu6rliTuq+gF0O3xU/LeifR6I93AlE9Vg0h769VcAwnod9ERj
	b+8+QZteOANqOeu9QZ3xAzFK3WXxMnbGUMh4z6fGgba5DNFOuUX8LO0ZyaYKLp4Fy9Zx7z+M2NN
	W1/HU3J7nwfW2nAtp+qEu9GGS8xPZeka+oHf41+3xR90L8PbZXotksIsIpn288fO9+HzJmfAooa
	+9vXUFTivn8sSnhjo=
X-Received: by 2002:a17:90b:3808:b0:381:cef1:11bb with SMTP id 98e67ed59e1d1-38e4b51c562mr15078749a91.22.1784558184060;
        Mon, 20 Jul 2026 07:36:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cd6e6esm31416767c88.13.2026.07.20.07.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:36:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 20 Jul 2026 07:36:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pan Chuang <panchuang@vivo.com>
Cc: Sanman Pradhan <psanman@juniper.net>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 7/7] hwmon: (pmbus) Remove redundant dev_err()
Message-ID: <8b9dc58a-b29a-4c2b-b721-3b5e537e162d@roeck-us.net>
References: <20260720063745.309331-1-panchuang@vivo.com>
 <20260720063745.309331-8-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720063745.309331-8-panchuang@vivo.com>

On Mon, Jul 20, 2026 at 02:37:41PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() call.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Applied.

Thanks,
Guenter
