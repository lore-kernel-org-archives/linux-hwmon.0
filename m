Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5D7429825
	for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 14:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892531; cv=none; b=RHY2LJpj69XpDRu77kPg6ev7gz9+lJLReYH5xZ0fWSvBkD5tGxs9ArSWFWXZ6nE2Vi97AsH3Bb/G8ZRYchgkMYm/HMiJ2EcFSDBT9iT2SaB278RCv8uR3VhoUzSckoKDSkbM3CxH6/jpSe+t2q4MpBLM72tJkGMxD6syQMM8gGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892531; c=relaxed/simple;
	bh=P4wkV9mEDD23BeKG4vbE2EM7CHolhjJ2JRjQJMeo9kM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hUJhT2vhwmCmZfhB2cqYzfzncc5j00one8bE+N/hUtTJxJSRvJAKzhs10kAnf+IkdbPV/CVUsWHuDbZmjSrQO13iqRqPHDl66mjxEjL6auMTDgisUwNO9SGBa3fQyIQrnKbgjRak4ChrWBvDT7vHXBxhFERji65wWc8sDPJYuKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqcVKvfO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqcVKvfO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4905e190c71so40812405e9.3
        for <linux-hwmon@vger.kernel.org>; Wed, 27 May 2026 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779892525; x=1780497325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vua8WCuJgrLlWDfrDB827XHjkp+v2MUAOu7XMIUMLuo=;
        b=mqcVKvfOYp+DM15QeRBAI9Zm4J7Pvam+Az4FOSTiezQonnOybXs8VhnUkeLkTUWcNr
         xghQa++Kq20M3BHpXk2chPFVwSuQE+YgFqzROMKWjEfSP3v4lwDB+FRrcR9TFXSySGLz
         alUuw/pmgrcMd4V98cOXlMzZXQPTpChQa7cpH0QbTs9jFawEVq1uwo+FOrQAmyvu6G0P
         IxXAAJPiIbmxjw6LuDRr1Cy9qOgPhjJeZr+2rPlCyPkfzit2SEWs3MuqxO4XPJqrhC+u
         8ULbfFoTASPIP9Hmm6ITF5G/4zv4UI2aFV0mGz7jKZl9dYTAckpamhbTmOEHl3e6gcpd
         F1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779892525; x=1780497325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vua8WCuJgrLlWDfrDB827XHjkp+v2MUAOu7XMIUMLuo=;
        b=jP/Zzxudwgs2+pJfNbizSHc8PFCykx8Vl6bSXoO32QS/BIzOfKZ8hjrmhIF7jHSbFz
         qOosoYbdED7xFbRsolB1u5lixYQi2AGZcBsnS+61StHb6BeXpVgLoyuwfl05MmMAn+QC
         x9c7zg2gkE3YbR59Qc5+LP7UejrGR4qP/oE7y6Mfrb3LALSkQXVKjD6Vrn7w+uvfbd6i
         8o57mLDaWSr8PYLlWxgl187k9AbV4Dl0f7h+5qCmczCroel8KuKLs4wvVJ4Lho2JTJtk
         xpqmxEwSz8skTE8Bs7ODVQFOXi+4/uCvtBYIoMqVmooKImIzVsUiaxq1Zd/Aqxgkvgmt
         WfBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9G/S6eCKn7HyJa3GoghdRCYEOy1udN+kTCAfvLkwRHv5FS0F/ROhssukUUpXTIcjCQgz4mT1PYNQNHnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJTsriGSPhGouRX5Kxa9L6IrUUzB5zyxSN864Xrd9mIV+g5IjT
	rVubJLmI45vq64dm+zCIRotb+pQe1VwxhJKAm+tKY+rqx7+cGQO0HPMe
X-Gm-Gg: Acq92OFgDxlbcT1+ehN07ml8beEeFc6mHdHJiZOXx77czOAsrp5R+jJo+RStnVBUH4V
	iOdkN05nfs7HTXtiu9rYWX/s/ccsBJ7pzK/2Xh4mkf038fAc8U6ZAWKVHKWpD+FPZhoPTcjkLai
	BakQDtyIO3KvCitKdstKI8ChkrLxgHkoHjjHxa+3At5dUA17/iQ6NfI5ZguVlBxlfpKSEFq0nKH
	Tpo+Ng00SlrumTmSljYRIWkZ1rEIy+Sk5nZ3+KpmVQkaNIbTh54wl4xfblVQmX6Qwdk1oBvADB1
	Y8QeiG2uymkQ828Pb61BccJCAqW6UzvK0rV3iPOYaWyKbJfrFDLLFpWjQbl6zTivF1LPOm+go9D
	f3QJgvNpDlMloly5bHEnboJGRqiKP89n8D9c+DEApMNf/y++uUQxQWtfosCFuvvHUmfm8ZrfkZU
	IXRVXI6ohvoKsCzCE97+ato7qxog==
X-Received: by 2002:a05:600c:c4a3:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-490426ceed2mr394337305e9.21.1779892525073;
        Wed, 27 May 2026 07:35:25 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb5584b8sm6239763f8f.11.2026.05.27.07.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 07:35:24 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	lars@metafoo.de,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jdelvare@suse.com,
	ak@it-klinger.de,
	linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/4] iio: types: add IIO_VOLUMEFLOW channel type
Date: Wed, 27 May 2026 16:35:05 +0200
Message-ID: <20260527143515.102794-8-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260526165950.6ebbf673@jic23-huawei>
References: <20260524205112.26638-1-wafgo01@gmail.com> <20260524205112.26638-2-wafgo01@gmail.com> <95f0914a-cb25-44ea-9cef-d203c624f74d@roeck-us.net> <20260526165950.6ebbf673@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 26 May 2026 16:59:50 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> > Two questions: Why restricting to liquid (there are also gas flow sensors),
> > and why litres/second and not per minute which seems to be a more common
> > unit ?  
> 
> I'd rather we went to the SI units where possible.

Agreed - SI in v2.  in_volumeflow_raw / _scale stays in l/s
(rescaled SI m^3/s, matching the rest of IIO's "kept-small-for-
userspace" convention).  The ABI doc and a driver comment call
that out.

On the gas-flow question: rather than adding IIO_MASSFLOW now
without a driver, I dropped the "liquid" wording from the channel
type doc.  The SLF3S driver is liquid-only, but the channel type
itself just means "volumetric flow rate" and could describe a gas
sensor reporting actual volume rate just as well.  IIO_MASSFLOW
for standard-volume / mass-equivalent gas flow can come later
when a driver shows up.

Thanks,
Wadim
