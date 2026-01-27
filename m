Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834D61D9A54
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 18:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540392; cv=none; b=akCfBWdFVZFQq90p5QIQTNOOtbDfvDuQccqlT1ZSWOjL9abINn5A8HjOYrr6ULgAj5GrOKQHOTuJgjVLyjNWYvoMA0H2VbOKRECE3cZ6dJTt1PNw4VjBAejC/jpqaPjrODScGokrPgaUuisvPFlKox1xJ1cecuuZW1uVljCUBKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540392; c=relaxed/simple;
	bh=XwkACK+iKw7oI/5o/Gv8sfELgLAgj1JR8qRdX4LMvYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEtd/E52qMg1ND7MCuV3VZTni+wK/2bBqe6o2OtMknAbO32PG56o9O2Y01VjSfO45umnb1qXW5eC+aQNePqV9j5MhS7k+xQCdliIxdmdkP2z8v06GL3zYSoEF6dBZ+lGZkmK8HaXz5VJHL3xSpudP2VJxNio+9q+q1Xo+G2/eTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvfrEpUB; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvfrEpUB"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d18cf89e72so118780a34.1
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 10:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540390; x=1770145190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ZfqLGIvRpFE/gnKzE3sUmBILX80gzyy9OqTW4jmzZU=;
        b=hvfrEpUBMVVYnLjafDsvVE/rrw9l03PAK0UDpmdDToTXA5yYqZ5K3AIRCEtv+kphgq
         sMl26hwjGrpiY6+loLpHBB9Ai3NaszSyOsI9xUN4P0yBOi1lRD2ivsoWdhqD0xLoJrNX
         WGYl5zvlDDXKYxm4zGWiEGTu7KwQa7D6W2oNn2vSqiELtDuapxolK3E2csaW9Fg/og+r
         blCBW4VHNbdDuoasT5vHbmX1nP17m/kuDJH/E3uFkix1qQSZx8B+VN2AUJdcJu+QsuTu
         /JYka8VzARbdQSP4PLX84YpMYsGBeTr4wKKhuhzTEO0JeJeOL04cMiGJLCyqWdTpaKHu
         Pf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540390; x=1770145190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3ZfqLGIvRpFE/gnKzE3sUmBILX80gzyy9OqTW4jmzZU=;
        b=p1X6DmqW0CoRQZyARfFRhQFtAxW2eenGOvWr6u9rwaImq00h71U8jL5JxvdeuAQ0X5
         ucdLHLGNPfjH+1zSV1ZPqf0ORwEMMdMXJt5GkF1/CMGqEYx0yzjWBQ+eeqh09g/tqW/v
         IKqdRyoVVW9kK5vlJEbyb9PgbL0Zg92Ft/3NKwLVD8iti3IRL2g8WpAEkoOjQQ8Dp7Ho
         dwV74UA8c6b07rLVAScEKIy1qDwRSX0yNtUq+sqnr/+y+VF8R2q0M/e7k3oeJznvgGn/
         +A9TBxcNfp0GoGfevL2cAihFECnJzd9VWUyhM7qJ1ZMxyMLyTPTMBmHOJMRwrbK2EuMH
         kl4g==
X-Gm-Message-State: AOJu0YwOBLXrnTuERdzYhV62Fv7uC4PxFXdRc4HWIOpqEoi/GRDTGeCk
	Prdd5RcA6pExw62iNp9kb2MsfqO1jYkbSR+sXMBl3uSv1ICRBx3JRoYRNwaIZWy0
X-Gm-Gg: AZuq6aKmjSnIhsN4cOa5YriTo2lR0LExMkxzRPx4EDJiJNK/zXcR+EBQbqNNRfx2TTS
	p0sWau5UL70tLOLyKiYKt/3+hj1uhwZE/neGLz9wqEoNvD7zJt3u4dSSOlBJJ38ulvRAc9kJJN6
	N2ddV+bIqrQLVRbmqXRnD3Uus0tBEovQibQs3xPVzHmpmZkRvylE+66YSPNvOEiLRKtLVwRc1Oc
	na7N07pxG6YYJRZ3xnCHUfTkd8MH7bPKZFhUyIOZmTLCz82v12eoJ69SNB3aPIEhEO7hkhK/zsz
	urZkezOw+J7fwSdBgWlOuHjRRD8hp27Jju3pYeZH+EKsEq98XnSFDBUuwkCLHQAemWpahTfAdUT
	llsx1fXXeGoInyUTtImgnIN3qNPlFePbf8/BHzT8+eYoatfozBPK8md8ohZ7SPtsYUTRPdP9nZp
	44DZNu81BVziYLx/b+rh7ppeFb
X-Received: by 2002:a05:7300:2382:b0:2b0:4f34:eed6 with SMTP id 5a478bee46e88-2b78d9d75acmr1505750eec.26.1769533958980;
        Tue, 27 Jan 2026 09:12:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b79c3aa364sm33692eec.11.2026.01.27.09.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 09:12:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 27 Jan 2026 09:12:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Almog Ben Shaul <almogbs@amazon.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	itamark@amazon.com, talel@amazon.com, farbere@amazon.com,
	ayalstei@amazon.com, dwmw@amazon.com
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: Add jedec,pmic50x0
Message-ID: <13b492a0-db2e-4e44-b145-cf99f1975fd8@roeck-us.net>
References: <20260121151947.37719-1-almogbs@amazon.com>
 <20260121151947.37719-2-almogbs@amazon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121151947.37719-2-almogbs@amazon.com>

On Wed, Jan 21, 2026 at 03:19:46PM +0000, Almog Ben Shaul wrote:
> Add devicetree binding for JEDEC PMIC50x0 compliant I2C DDR5 PMICs.
> https://www.jedec.org/standards-documents/docs/jesd301-1a03
> 
> Signed-off-by: Almog Ben Shaul <almogbs@amazon.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index d0f7dbf15d6f..fb16bd91c76c 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -171,6 +171,8 @@ properties:
>            - isil,isl76682
>              # JEDEC JESD300 (SPD5118) Hub and Serial Presence Detect
>            - jedec,spd5118
> +            # JEDEC PMIC50X0 DDR5 Power Management ICs
> +          - jedec,pmic50x0

This should probably refer to the standard (JEDEC JESD301). Also, I am not
sure if pmic50x0 is appropriate, since the standard refers to pmic5000 and
pmic5010, but does not cover pmic50[2-9]0.

Guenter

>              # Linear Technology LTC2488
>            - lineartechnology,ltc2488
>              # 5 Bit Programmable, Pulse-Width Modulator
