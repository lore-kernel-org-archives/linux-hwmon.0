Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCB02E8B9B
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Feb 2026 20:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771619185; cv=none; b=SyUNZJ/aPaGunumpvtLwvpLGfYFETwxUyYe9k6i++oo8DlJsO5vt/2FJ0Qe7FSnrOhKNiARU43utWko11IfnDseLm544VnfhtBTgisQTdQslsJze8LBliznuY9KhuZ95ji9B5X91e7J86T/+DG/T3b5IB7OBk06FzRfx2yBfwGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771619185; c=relaxed/simple;
	bh=3LrO+3uAhEcYoNGmJx3iNjvB7cvq/qu/fv/qFBwznC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r71GxZ29lm6TlHJNRCKF8W40PbCHPShekX5nxfkBz+sirjjY9sYabZE+CFSVa3juALvcaWZjgzmCh/IJ//YnUfxR572liRZGFHlNz6sXjcJM9bv4vmMr3u8uXhDuhZ3llTaKgbFwS7gQQPai/+9u2yUgBhLhFpayso4HxK3m/CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZmc7gG7; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZmc7gG7"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b82c605dbdso1934247eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Feb 2026 12:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771619183; x=1772223983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZUWYRoA/blMOConDb/gz4Dp4zS4A+VuBuSeP0SKMyw=;
        b=IZmc7gG7Tsyn64Cbea/WqgpZPQSsFlOwfvBY9nBg6TG5Gi6Zw6GmVX7NulXl0JHD2+
         pAHOJcP5ob/IqJ+5XU3YyNE8aUIqf+0c+ShZdXmJN4hSHV5ceBtS+LI8aRmtE016Wys9
         1ZOYbOVLqabtuyoJvE8P4liM08+O4f0OPJ4OX77BOcbTkjaM+Hs8UiSnkCFSvP8FqWxD
         ZhC5cSe/h6GN0CZpGmX10xkyfnihZgEDXlN23v/4govSr5dvIv5gfmYuXGwJ1QR2Cz5L
         ZCoNBHUSSAMJ5XHQJ2akv+HOCobdDrCrmbl6FFKAFpPk368xWaaFmoa0+URRfUXCKyoz
         PixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771619183; x=1772223983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ZUWYRoA/blMOConDb/gz4Dp4zS4A+VuBuSeP0SKMyw=;
        b=V14M3rieXiFVdPAdXV+HhTfTEWA5YqHNbvaDaAQTfJLc7fMxBd/TD/GOHeMCzDHfEY
         MYb83CrUwlS/7SMF02gbg5LVmqG5GZH7UHTThwtHGF+Tg+gI50df8jq9NRaR+RaYqpE1
         TZTUm4iQVOVYqwL2+fSNrL8iGtHn2S7AgdEqj+mlT506bLTEzV8ooKG+LYW0zKpw5HnT
         FaKdNxvDRXrW/hMyHcbHfs9zBj8+suFhvv5q1ZydzMbi4xFRjIkgpXMi3UyFGsfHm+h+
         +iqBtSG6DiOZDa3AeKpfif+ZvSJw0ndwDqOO2W3/bQDf1XDUOBZquSlAXgoA6uIxfC2S
         E3yA==
X-Forwarded-Encrypted: i=1; AJvYcCV94Xg6GjhpzcoQMyVpvoZV1okZvpDG3etBEei+johgj/nsq8iL985eqBsQo54tXRvJT7SLLEvt9OPKAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1/A+JiSH8OuKg9+2AALZv6VWZjfOeQjgIklNynhQ7cEdLoyv2
	5wZ1W7FkahMxb+J1f3zrtldJpI/XmWF63caP9iWLmuJ1ux0zTLUQsetzFBBOeZHU
X-Gm-Gg: AZuq6aICYGHs+46nHZ1xQvs+NCXIooaq0RQpqI7EdH2DUNO4IoI07Z+UBZDc5ev3E9x
	tzTbq8GiDCl8VdLpEm9oyk0bwG3PJMJu/0PbTWjp+WtrEeLXwM6YLpIWCQ6k3LqjbhsHlsHI210
	X0hopliifWsULGW1FgMO1Je4gto/e8HxI1CX/SVVPlRfJygH+KC6BxmB6vtrA9/1EVdeFlNnD0B
	LA//QxqmWUwcuG5xCHO+HTGaDfUYCkgRV7wLmAXvS2+FDLV01g+Jsu87nsg7AizqMsnkK+4qUzc
	Ym/HvPVj8Mm3NLVEw7B5lrC+IG9r/IS8xTHc2Tnk7zW/5K6YIoU+mTT5cGbqiH5L8l70P8ZMyCU
	YoxgkOnobhgmaXCH2zZBOAJRX21BkJM+0EaMZ3rQLrEdoEo1wdOuYZmOQScyNTzaJTU4MpWz+tF
	Or1ZL0vf0XID5HD3/SI8NiszODxFtAAlSf8Yx6QQIZnUwS4wo=
X-Received: by 2002:a05:7022:50b:b0:123:3461:99be with SMTP id a92af1059eb24-1276ad1a7e6mr475490c88.21.1771619182982;
        Fri, 20 Feb 2026 12:26:22 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af8ac3fsm415246c88.13.2026.02.20.12.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 12:26:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 20 Feb 2026 12:26:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: "Timothy C. Sweeney-Fanelli" <tim@zerobytellc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (asus-ec-sensors )add ROG CROSSHAIR X670E
 EXTREME
Message-ID: <08e82cad-4482-427b-9c80-df49151c6477@roeck-us.net>
References: <20260215151743.20138-1-eugene.shalygin@gmail.com>
 <20260215151743.20138-3-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215151743.20138-3-eugene.shalygin@gmail.com>

On Sun, Feb 15, 2026 at 04:16:18PM +0100, Eugene Shalygin wrote:
> From: "Timothy C. Sweeney-Fanelli" <tim@zerobytellc.com>
> 
> Adding support for ROG CROSSHAIR X670E EXTREME

Nit: Add

> 
> Signed-off-by: Timothy C. Sweeney-Fanelli <tim@zerobytellc.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
