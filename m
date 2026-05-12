Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE18B2E2665
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 18:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778611024; cv=none; b=Xq9rw+WY+MNBWx5hsS1fY0ePqZklS91v189mKV1/a35CwuyJxGr5y0RUXPt+j3jU+JUJYVzKx/7vSoAh/BjI5rLx7emBMJSNoKhNKWJrU6mmZfwKi3mqHsiq9KVVg0VPGsHvdowvYLJswcmzw8VYFmxZ2aDQv4npm/juze9rtr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778611024; c=relaxed/simple;
	bh=Lmw4zzrDnEkopelh8judBj4IbZeGRbaQsS2lKFuYqwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NDwtm5I+YTZQkS+PiTcstXjaZVNbrwTbcgygxupvKKnwPH6RhpTs8Ae7UfHUwFnsCr2wm4cx6oTARUyhlUQL4N8g+lzAFT+D5K7qYUQ84oMMBkWcGb9/oZHW1w17n59mpuaH5RNxxnUqje2hv1b14YTaQ451sBf6tAtg89RJpqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3Q74cZw; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3Q74cZw"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-133466cf955so3573717c88.0
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 11:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778611022; x=1779215822; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HtFSXLG+TAJ66NeG8XHAI0qa1TU1npD9a29cCddYQHE=;
        b=a3Q74cZwuF6k/EIN6/z3rgwlmQN/hzGvJ4DSXTLE6cqWaWQs0USVyoXOV3iqY6Cl2n
         B7ElcNqo5WOOzvlKjNk1bb7ERwnHi8yno9KFG8zUvdhQ4Rls6bM5+UmEEHyA0dV3TW6p
         ylOR2YfUGOUWvaLQ121KuwgaxDPvg34Ylrnot0LvN73OfdV+BHm46+mfUZjljaROzKzX
         1uKeAwNO25/zrMJAKSwS6uN1uvk9Gao1GxuiADluxU9UuVRpsmF+hpPwawtouWM4zq5G
         AMTxlbs+shZ6097zR9rN0hvUtzrNlY1vGuqKQzjiENvbf+fyYg1Cm8nadvnWEzb0b1UZ
         VkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778611022; x=1779215822;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HtFSXLG+TAJ66NeG8XHAI0qa1TU1npD9a29cCddYQHE=;
        b=sXoS9/cGrkWel/giIn3XMRTkA7sfxRzpixS5BUxdg3VywkAq+u3NDuXpM9aH2T3hYT
         2pvm9KHmS2Ka+bxurq9U2qyIzuLENCDgac34qADvU3t4V9GbPQtF8Z4qu34fZDFFk8CW
         V81mbZdCy96vwyCeUoP38nZ0MqY/AHl7nVjCKo0yFUX6c82E8XA7f/dWO9diwlFoPAkl
         pn6D1FPdxp7pjt6Ge+tGPH0v8RDz6K1ADJUubzzUDIRgzoDRWzc+EA36o+Cvt/c0sTF6
         iblrKKLwwX5Bpfm4X2+fM5lVR8aBubgaQ10nLPTtr95M1MLI9VujzujFrPh7ehsSaLNg
         bHhw==
X-Forwarded-Encrypted: i=1; AFNElJ9UAKROI/IfQwf3WS7wJ+8Caakq9BJTaE28hhLxVro+ZDXF+GrvZR+fnkkBgX+qZrnJnZqxOUCVdvb4cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpaaeA0W9vJny6x5k5NQpm/7f+6BtmBoxTCoza91TenUpI5Ffs
	V2YQt946FB4KUldVo6FMuWxGlVpae10eFyHfcz1NXWO1DIMNHNbOI2wC
X-Gm-Gg: Acq92OFXCyVmLruqsYkqpX5vK+Nk3IA5oJx8B4X1EnLiXBZUAH9bGUow8M+yDMfDiSD
	gMICp+FAE8toxwUoiacWX9IGUo5+DrlWi1iG1JsCVeNGkDsMpFM2e/0/uQrWhy/phZRm3ZxL/9C
	S7Yxr8ZYVJcq65wyEULOhYdlFMSk74YhUtjXUMXVN/dQoMJxqO17OVg7y+Ep2XdCJHTmw2R0SYN
	oaryp1vC7plZMLzJyVpCFRTIYwFItEyxxlRv6h8HMvMhMTgD4r889XTP0Eh4uqBUuGMmlmiFU7D
	CUZgle7WIsMkqzsS5chA8uWM4nEN7Bp/h2XpXnNAYcTptIPfGzL2Adv9PiWF6wrM74W+Bex3/T9
	oNMmEWu+YWNzsSuJoh/hE1ZMHHr/POOq4ka1B+DfADjYnrBM4W0LvzS1zrWHN2rcJe2oE4rl2Jg
	r/tgcDxTd50hb/eRlt4ax/ad/Ha4EV9T2eFICPvA5/17x8v6isxQoqD5GuEg==
X-Received: by 2002:a05:7022:43:b0:128:d4be:7428 with SMTP id a92af1059eb24-13436781e9bmr108440c88.19.1778611022107;
        Tue, 12 May 2026 11:37:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327821fd00sm24380586c88.8.2026.05.12.11.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:37:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 12 May 2026 11:37:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Wensheng Wang <wenswang@yeah.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] hwmon: (pmbus/mp2869) Remove unused driver data
Message-ID: <9abc033a-329b-4bf1-b3d2-d4d745fc40b7@roeck-us.net>
References: <cover.1778603083.git.ukleinek@kernel.org>
 <dcfcc82a93da77b55503998c5c7acf2a80c4a615.1778603083.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcfcc82a93da77b55503998c5c7acf2a80c4a615.1778603083.git.ukleinek@kernel.org>

On Tue, May 12, 2026 at 06:28:56PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The driver doesn't make use of the i2c .driver_data and the of .data. So
> drop the useless and irritating assignments.
> 
> While touching all these lines, use named initializers for the i2c
> device ids and convert to the most common usage of spacing in such
> arrays.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Applied.

Thanks,
Guenter
