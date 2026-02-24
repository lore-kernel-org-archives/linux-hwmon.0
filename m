Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD863A4F36
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 15:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947547; cv=none; b=Z8o0n5iHZZnnynOU7m/0bnDDD4gi05BEWhReE6PEzSsRz9f/cbFVhj/pvy59k7dmVKUYkxVgqaXp2d6lQFdiVAhO9INdfiI0ALWTfARHEYtkdZtA7Err0bDA3RXy51wUtUc4QD99rhnX5EWtfG51o8uTzuBF3R99mJ1Rc3jMAjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947547; c=relaxed/simple;
	bh=cZ2dUQDXKPFtDwjbLj7qN4H5mYtnNOEQI6uw/38U1LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkbBpJU/YWEMHO8eFNq4rWJEKTELOASCnTGC2vyDKmuPe4q4QGonVoGLZjkFCP9kkapUlB+avfyE/NhlpnQDOPdRkW2IUB32rYbyZ9OKi6L8h7HO/9t30RpapyeWn7OePgvBBGqhKDEx31sz/EUtKhLAePhM3G7wFwzI6mHF/nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsovXX8v; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsovXX8v"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-126ea4e9694so270226c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 07:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771947544; x=1772552344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vi7E+fFd25dHhSq0UPIuOVw7/nIwnNwLt9NCUlo2++0=;
        b=lsovXX8vT1GRQHxQyId4cfqpnY+E+uII6oDqSxz0jdWd2i7rbuN08jmjhvGZj45X1K
         QZW8jUweuQVnAztFY1sflq/4ePdWYRX3QRnkguaXM7f+jF4KGSXdlb0BkqveOMjCOOFG
         jxAAYP2bUyMwAqdP9YdiBGZvHiyCKywAJctiDdbJ4mezXRcTPEGBqDGDangz73d9cV6J
         +XlHpf6hd43FzlMDX8W2Z36LrbipDSXQxOyjyNIofweRXX1rpxnzQNrDHhzcxAXAck75
         kBPNrFD71rSnUKagKCjGiYOgGS2Bn/RKlY9zyDQ5zPOQBWvtZGFJGAdy9IsMNCv9A/3h
         vtiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771947544; x=1772552344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vi7E+fFd25dHhSq0UPIuOVw7/nIwnNwLt9NCUlo2++0=;
        b=Pn7siuTUEw/QRTE/ndxWYcpAprEOUHurbXtyHVoi0nCFFblqD2W4Tzn1NaBBXFec0Z
         3NckYrRsyDOEjm9j4UULZMJ15kITtl4tkvAhqatWel0rzq6+fks7lP8V0VkahjPLA7YQ
         Vj16mBJAn3GPVVs9BqeP+61kNGt5aWm/GlIcbRJXqfN6PIxSulgyyDbrk9rEyOaQKZ18
         Ul0Mcu/yMNpWUmTin+m8NwVjFxTLUasu0T6TGzSyJTM3TmOlCUwougXPa/udu5l1slEc
         VdrL+D28bcESekDuY0UNVAXl2INvUrDZ54SibsnEsTtefI8E7S1N7faM+VXQv4slp8NT
         4RmA==
X-Forwarded-Encrypted: i=1; AJvYcCUuO5rgLbvOY3lnOjrR6HaX709JOHKCdf3VW70MQuMqszWnp0mZuEgDEYae79ouQ7ogcdt69uz6ZhjFIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTrSHTsc60D8n8tDNCmjaR5qCbeV7CcahznZYkUbTI2+Tt0UQF
	KH5WrfIJd4q6NiwpwpfJsoVqee70lBXoPSKwrYGruCzkJzuYdYUyLH3D
X-Gm-Gg: AZuq6aKyfsanRZm+PrhFS2MeTNtlzx5NMQk076d2RFhIiBqtqkiRTu6U5+i77o8jP1J
	eBUztN4SFJA6sosy67ooE4lZsxfP1ElzuW2wkb6l04HpMHVvM28CbMnmtLU0Mvb5f0v4ck/fHLw
	VKkmhhd8lOySa2iaHmTpEHrAC9zwZVERKc9ZqVcmHCRqS9p5rmrVQu7KLvtsel4qRDXfuZ0kAIP
	EyTW/HqAprZpwyKAG0T3JxzAEVfXyNF+rFWksfuZRzoJWH7SWDy7BzeDQLbCIRuGaTKzX2DHSAP
	zXVNtdCdIhc7tU3fFkKQmJmsU9T4feBoDp6/uOSorj/S8+wsUq1tC9YCM74i6dvPyCRj/lzG52z
	6IA5WTABCJiR22EtNeu4bq4hUTEliSvxl+KpvKQAucVMrXvCrllgQvajiu+xXWXuC9SMrXPHija
	UCRQRRkyvjks1ZunTouANezQVEV4engzETeBwF
X-Received: by 2002:a05:7022:6993:b0:124:9acd:3ef9 with SMTP id a92af1059eb24-1276acb1c97mr5939643c88.8.1771947544202;
        Tue, 24 Feb 2026 07:39:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe8304sm6956981eec.17.2026.02.24.07.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:39:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 24 Feb 2026 07:39:02 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, avifishman70@gmail.com,
	tali.perry1@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, venture@google.com, yuenn@google.com,
	benjaminfair@google.com, openbmc@lists.ozlabs.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: hwmon: convert npcm750-pwm-fan to DT
 schema
Message-ID: <09fd1cc4-76ce-4691-bfe5-3167f2940b57@roeck-us.net>
References: <20260215163553.1334475-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215163553.1334475-1-tmaimon77@gmail.com>

On Sun, Feb 15, 2026 at 06:35:53PM +0200, Tomer Maimon wrote:
> Convert the Nuvoton HWMON PWM and FAN controllers binding to schema
> format.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied.

Thanks,
Guenter
