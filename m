Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3294B423148
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 13:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010871; cv=none; b=MvRcsCjQHDrzoaAioiNWHq0yJ93YuY696Mj8JCbJEi7TYZ3mqb9ec8a3gP3DX5r44NjRoAXpCQiF+QI6P7AAizxKks7ROUjGJQC/Tv2UuEfYnAJeHn3NssyvZpXhsoh4MH7OZLaATfpRTnKaQHVQ0Bd2x2iL/E8JmdM5dBnE0dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010871; c=relaxed/simple;
	bh=2Hn+kM/vBl5Y+oGy2tUn6XoBN0Urk2DCaa4LHKLj2vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAxoVt1n4JPd75kJJADQP7RDh6c29ywQv92sS6HvKVnmR4LhwV/HN1r3hes8a0LmD1FzUrEzhby3K0rfKgHWRf4qdu+M7WJggBnu1Riso7ljqzbo83lzABQ7hf1y/jxyhUzCqXtMNDEVPRPzRavp29Ag46T3P4vshq9SCLwms/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ReuqD2bm; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReuqD2bm"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0c3543590so36941415ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 06:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781010869; x=1781615669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XpF88ssB7OGQIU0/2BYnkpklMaNApzKBPoVuDN5kZk=;
        b=ReuqD2bmIKxAdxVmEgoI+aeuj0T01y2FQxNI6lsjd0HJu8mrikuPb84IR2/lKdcI+v
         nMqeGm44+v/Q+5T0YykUCzZkTTOVQH/EQLNGZnBaqNJbwWxn94yWu7yN52gC6mB+ww8k
         jIv9QsH5yjQVZDB0pp6HSE+32hLi+C7f2mRghaPCi+NgBBL3dpWuTDFiivwlkrA+Azka
         xlShR6cr6+xBFvWO2d5F1ID4EG+1rZ63zperdIDq21QwOpHJDf3sACr0yQHUp0+orY40
         KagUR72420XRxAYQSDIQT/GB6z3DywT+/IHPQW4UGNp2Ibnj2+7R63fYTkdshpZIW4oe
         86gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010869; x=1781615669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4XpF88ssB7OGQIU0/2BYnkpklMaNApzKBPoVuDN5kZk=;
        b=Aibp1HX8gcfGwCq+OQ0hBqjx6M4RZLtA+eAm2SjEVLooO0Imbdqt6nFV2Kn831yZtw
         5jHHO/G7/G2SezbtVYrQ2Y0IODeo5/hxbfR3WqnUsNND0ZesiY+8FtCOqvKcW7XEhtS9
         PMYT9IVUwy+qJ/veaOqXhB6/grfUGUsyrNq0tP+5VS6j/WU7mVeqzmBAEnmAIR819W+g
         ZlGsCaZRvNvdDITAe9K3WAsP6ySgcq9cbyqSzp33UXgqFQ+4e/NL9jOqWafRVAPw/Wzl
         UUYqg5SJDEqly3VmiUv0s4gm/wZBE/j+S0S5GaS0AtVnQPIh6ZQaFN+5MgmkEhFRy8mj
         087g==
X-Forwarded-Encrypted: i=1; AFNElJ9rRPKWhoMtd9Lg4xmXRJL/wSXTVL20n/Cll6TArrkGAEx+6YOy7p4rYuNurOpJkzvdQ1GMb0+QxA+xYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiOoR2gHgmadplXLZ2FSJrlYh63gofu48zEcb/3Zt8+hndlxnp
	Ixpz9qfrRvMZcpMCYdfSpu9RgHy5yhhBaOGZHx0XJTfq6V0aS0oLl6AH
X-Gm-Gg: Acq92OE90Mmfdlie4LAJl5NXYraq2wgIXllJx84XzSsiKt0vXxtpx2pdmeaZUaKlhMd
	UCWr6UGshZA8TK0rPSCuu62JTgQ6xmLjDj6lMZQ0p+M5WqGZU5hlYQamej4P63FyyjjGgUDF0/l
	Vvo/+NhuRXoWQAMALCIgcwzCmZ32SyuXOpwhI2zcfVCwRzAUyOHZKLYgJYV6EKJULC/hgxMVjPL
	AAt4kaQgP+1RHJ9uipNV1m3sQ1lyPrl5VZjW5PTTzRGiSslecYtZN7yPu8MK062H0nUIFNw5h+k
	1E/fKLRaQqRp10u7YWZQgKD+GeprVogPnyHEvqvR4NAUT0uUis7gcN8kc7G/9zCyRch3CXjki2z
	SRADTPdJqnYwcU6FRiv59ozfjMFqzD7rbF/Vc6mNBH6eW+lfAa9GD30pbqm1ofEjt6zKcvn90Ua
	9UwbuAPk900/xu6LfRhV58xL3IMLGOoP4xIto9HSpUjCVWqnY=
X-Received: by 2002:a17:902:cf11:b0:2c1:ea95:8297 with SMTP id d9443c01a7336-2c1ea958447mr240566365ad.7.1781010869431;
        Tue, 09 Jun 2026 06:14:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d1e5sm201467585ad.12.2026.06.09.06.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 06:14:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 06:14:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH v5 2/3] hwmon:(pmbus/xdp720) Add support for efuse xdp730
Message-ID: <a3622473-dd54-4b06-9b02-bd3fc590b1b7@roeck-us.net>
References: <20260609072231.15486-1-Ashish.Yadav@infineon.com>
 <20260609072231.15486-3-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609072231.15486-3-Ashish.Yadav@infineon.com>

On Tue, Jun 09, 2026 at 12:52:30PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Adds support for the Infineon XDP730 Digital eFuse Controller by
> updating the existing XDP720 driver.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Applied.

Thanks,
Guenter
