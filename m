Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8B217E4;
	Wed, 29 Jan 2025 16:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738167392; cv=none; b=to2vPQ5p53KwrFIlOd/2V6TjgZdRb/B7oTClPZ0sfUd6n8pIz+uEo/0vY0GKRXsp8owWuUqlHERfm8dmubOqMd/kIwnqz/ETxZtLfRRsHZSBdaYv+v7JktAsaxgM69AawoH9e4009IqD0MkFkDr+kVr2YHMO4lMTsHFYrIirV9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738167392; c=relaxed/simple;
	bh=TNoNnYJaa5nOpDnY7QApkdk7umSzrL4ydYUnJxnQQLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3b2HZ6SZZqD0uGhiVZ+kvnZDLfigTTWlUeDbCCg51PXzgWlI672K84TGgGwWdrygvzyiN/R/kCW0d1DmT3/0OXVZwR/nWvS/w6dfteWaFp3pd8OSyc546Xpak6zd9wI+5KvyBhaz0BtGNZVrrKI3NQupKGb22pW6jHvfYpwokQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlYbeydF; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlYbeydF"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso1537546a91.1;
        Wed, 29 Jan 2025 08:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738167390; x=1738772190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1LaB2/B6i98udc/O9KkShg0gNefHzLeEQDIrYO3ozQ=;
        b=ZlYbeydFoExVijLTM22YyNlesReF9GiKal8ij20ah8UM/azd5ILgfmLtxlot+BvwGy
         ENfjfvXo9mwxds/NJB5eZTSwzY1GFvqcjtwr0XJFaxtXGRtpulVtYspT9hul6kHn+Z9N
         7fDua1ontNETceTPb1IfewnJo0vLO5MYGqfNupp2H/HaY+zoNg+HSUg+XcRh77redZZ3
         +tXw2n/9jCsyhkQGwyxrj+fdbihlzKqUzJlEoL0i++xdtDGr82Xhrt1jJWvTS8A/Lo2+
         Lpjc4MHRbU7kQbGFHQB+u1AzafR5fCjsrrsH8qjRE2EID060RXBJ1UcTwNbczbGlhIB2
         saAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738167390; x=1738772190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1LaB2/B6i98udc/O9KkShg0gNefHzLeEQDIrYO3ozQ=;
        b=DEwbrbn8OHtl15NRNfNCOSThhfc4efnzQoptJmkGVGVHkkTVwmrI8rZqzFxboaOOq0
         cRzzs0vaL8qcxsz+EPf1oOJWWnD123RBQ70Ui+J4SJjSOLr4C7tpd9mTzV5K/ROw1IqA
         AKUHLaJGXibDMTo/e51L1CevGpYHaw6bQPccKKPL8qGr4zlJVdTQJlx0zsmaEHTCalYP
         EeXysht28zbiB/MUHHKPfNRYod+5+Gq/t8O4iSTGMpEAv7QPKcHsDA+FHdMCqGNYEUhz
         jZwfpV9uHmkhCpVnrMzHaIIqeSggNQ1ycRBkcQJBeNczVzgP1fKpVcV164IXqEwbhSfe
         MHUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzXt2f+iNhuFwlDMWmipmKRLZ3yro2SFbirYYyXtdZFlOn1x0Ip1Dt9jIuJXeSQROBC5L67LHW7sZOtU0L@vger.kernel.org, AJvYcCWTp3iH8kmxK1MYtMbU9c17J5FFRz0dlhWDYGocSgIYC1eNhJ1glKgpc9LOFZHleKrUDKiMDFtzRaeC@vger.kernel.org, AJvYcCXjyOetZceuMZhWbNKFHKOy8Cc2Km7JAxez7JyLu7EdeFyKFrH9XrBmn3yd8Z2Gfy3V7OfvpGXihn3s@vger.kernel.org, AJvYcCXqoTiH6BLvFhCV8ohlVuIxRFOLZZFHuPef5fHEsr8kbR94jBZpnoI4Ls7QcQickwKp1ih9rL/unNTvbmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAO8cSJ59aPJaE4aNZMF03XBHo2ZijrCu7mFUIgjUyEMtNe1ob
	hIUJmyDfL48rcjRqk0FmEEGZVwQbl0xDB4xNtvgnZh2UISeOswcS
X-Gm-Gg: ASbGncvsH1m0QS98l5NopS6oP66KmpOXgs58fp16deNy5ZJz2sZfarIpe5hMBfvdjPd
	HfKqx7MNq0YHwpCA/lNEFSNxNK1JHfc0Xp4Keg4UoML6mgnarj5KauAgZbpmOE+MQv0rOulLvbI
	mIHn8nfnC31RR8jaDwnHhDEl6c2fgyJwQumayYEPGXho+I6qgqYgsPmwoVl5yxhnUq6VgwjwMb/
	4XZc3bn0/hp5CwsizJ7DDjtxxSIYXWdw+eAfQeRlPJEl7iC/ZlvcSb5nYfkqCup9jcb2fBDEttb
	y+SrKON+1wwrHYd8rOPOc8MrgTMt
X-Google-Smtp-Source: AGHT+IGQn6Eg303I1nG1Rt0CR095ZOnRntl3W8W2VD2jTRtZ6xEmK8RSduUiVokLoir0e3kpXttVLw==
X-Received: by 2002:a17:90a:dfc3:b0:2f5:5bc6:a78d with SMTP id 98e67ed59e1d1-2f82bfa1fd6mr11476481a91.3.1738167390572;
        Wed, 29 Jan 2025 08:16:30 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bc97d32sm1914252a91.4.2025.01.29.08.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:16:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Jan 2025 08:16:28 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, jdelvare@suse.com, corbet@lwn.net, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: hwmon: lm90: Add support for
 NCT7716, NCT7717 and NCT7718
Message-ID: <dec22abf-6ae0-4ae3-a39b-ca1e53e41ccd@roeck-us.net>
References: <20250117100744.1571385-1-a0282524688@gmail.com>
 <20250117100744.1571385-3-a0282524688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117100744.1571385-3-a0282524688@gmail.com>

On Fri, Jan 17, 2025 at 06:07:44PM +0800, Ming Yu wrote:
> Add support for the Nuvoton NCT7716/7717/7718 thermal sensors.
> 
> NCT7716 and NCT7717 do not support to add temperature offset.
> The maximum offset supported by NCT7718 is 127875 millicelsius
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Applied to hwmon-next.

Note that the branch will only be pushed to linux-next after the commit
window closed.

Thanks,
Guenter
