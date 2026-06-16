Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4AA44E038
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 16:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625972; cv=none; b=XlIzDNGUaj+R4XwWRbVqqC71p3UIVKY/0RUae2CeZbzRiVezlFp7g4psWhNI9scedH2MQcvy18AzCKeu3N1dWl40VTgyeXVwUCKGHgTg1A6yfvOURED3ddD+XXiHXbdEemvFGI70bSJwQRtxDy1DhP1Z/EZtPz088bK35GtzHGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625972; c=relaxed/simple;
	bh=+FxnwydxHua8Z6tkMX36UHcpuucb1rXxmv27CydN09c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSVBqH3Quvqw/TkmM47Rgn6XcjfLCWZmxq3KHsCPIrmbzUSbjYFmykSjUH8IbPhecNISR4HA6xkUkj7Reh2dYGkeYhk/NykJz0NCimT9vxLs9LShP0FHgABj7hmtJSmULywj9SQwqTJV6Ug37cDqbrBln+ZwHlYJjeXKyQgx0ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qMCfNzRC; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qMCfNzRC"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-842cd900ee0so2184894b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 09:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781625970; x=1782230770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aX9hyq1cLGDHYR490qDGwzNNEN7oKaQ0B3Q6KeGbmjc=;
        b=qMCfNzRCdhAMPobIF6Gl8MJPrSFW8NpBsVvtGDXrbPnoz4hxQmhHXFi7DgljdXeBeW
         CI/YYkLqJgJA7uFgTbczIq2IvaJkGb8G0UB/QcNRWMmvGVV93qbkvZkA9JJrS8tgHH7r
         M5rqwGJXGQgTVSu9rXrX6E5y7rql6+reYbyO/5jCThdQpo9uSImVSijycIeLRLgqk7yI
         OWfMLOuvEmj0Du1WfLfTj3fdA+bd3mzIEz4U670PJoZ+2+C6+HX0REAuJqWdpKC229Kc
         cy8UZ2qq46olmV2rn+KnTV4Kd/VvrcYaKrlLuVOSXmYH+4JphnwUHH5LkvSQ9o7/E33f
         U1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781625970; x=1782230770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aX9hyq1cLGDHYR490qDGwzNNEN7oKaQ0B3Q6KeGbmjc=;
        b=m8E6UwU+sjkhBzhjWxISw0VuNDO2KoT1QhlbzlZcCKnbwzKWc4yOWgFodgNdd4A0gT
         p8excEzSPkdIHZvmJraJ+tmMXfYmKS/E62vxeEzv516VUSx82aYBo3/IWQt+y0sMKCO0
         qM/LmSIDWGtIN8PVykeHq/4/Nv3w/IiNKGSyLwbCC8MzGyqvAgs4sqguyibHSg4WFOau
         jK1Guplaw7/lsVOTBKGGecNeJ/5LtHrJDofhCJjawYBpKYhT1KCh1YscC4hjCgsAROsl
         JRlN1dmEjNaIt6L2GMv9W5iR1JJFDwXpHomxoUXL/ReUOTcf/47RgPFB6AgCDwPrRTaK
         SGaw==
X-Forwarded-Encrypted: i=1; AFNElJ+bQA77ILy8FNE9dcserMgvxw4ynQ4SLEmxnqj3Ll9luAFBT+GkOgTZzvMUpP8ye716a9guDDAUv6tyuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrRATCUyUydLiIU+f5bOwBmY1BacxaPzXK2QujOVL7R5LUpx0v
	b3MLo5bKv9OijoqZDLpBPjPmRFglzEU3x9DeVM1LLhRv54JnrAVLGu4c
X-Gm-Gg: Acq92OGZbDZkRVODW4pqa7I9fwW/w/CBtqafSCSoUAzb3NPhokANh+sJYnvyljlby4P
	DDelJctrIXEPL8pZSEXBegx+g+NXVhIxhrFYc1gf9FHLPFR+NVhvd1ju868FbFqVNp2F/f6Lun8
	5xmoMZwvb4d/2P1a1h9Z2sd0xyjAkOpLqOlF9wk77c+tn2RqY73JbVOUaULOxjt6brct1M21m3h
	NHb362vE75ZxNHxb2aoZzxhgFCbYYYXtA8TtOHUToH1YAZEhHQjzGTTzVJkbcu3hfCMfFYXmQFE
	ypQINeBd6iXV/kVebv8rmY5D3H/xXUtRQKcXndbQELpbo2xskTJgsW78ymhQidYxBpJKbJ55mJT
	S91vcMBoJUPgM2RmwghbHpLyWgvgeTrVyHs0OfvXl982MIX5m7WzR60wm7hwv7/HHHqzPtb7XOp
	z84Lzujprpd8u3mtaejSt6N150Lhwa9Gl3oQZa
X-Received: by 2002:a05:6a00:418c:b0:835:405a:7e6f with SMTP id d2e1a72fcca58-84515357f7emr3850005b3a.14.1781625970515;
        Tue, 16 Jun 2026 09:06:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acca7ecsm13880233b3a.13.2026.06.16.09.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:06:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Jun 2026 09:06:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Zev Weiss <zev@bewilderbeest.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Mike Hsieh <Mike_Hsieh@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add
 current limit properties
Message-ID: <ff79cd10-557e-446d-a599-93b228f9427a@roeck-us.net>
References: <20260615-lm25066-cl-config-v3-0-decb4f5b0b77@gmail.com>
 <20260615-lm25066-cl-config-v3-1-decb4f5b0b77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-lm25066-cl-config-v3-1-decb4f5b0b77@gmail.com>

On Mon, Jun 15, 2026 at 05:49:16PM +0800, Potin Lai wrote:
> Add a 'ti,current-range' string property to configure the device's Current
> Limit (CL) behavior to "high" or "low" via the register, overriding the
> physical CL pin setting.
> 
> This configuration is supported on LM25066, LM5064, LM5066, and LM5066i.
> LM25056 is excluded because it does not support configuring the current
> limit via the DEVICE_SETUP register (bit 2 of DEVICE_SETUP is reserved).
> 
> The values "low" and "high" map to the respective low/high threshold
> voltages of the chips:
> - LM25066: low = 25 mV, high = 46 mV
> - LM5064, LM5066, LM5066i: low = 26 mV, high = 50 mV
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Applied to hwmon-next.

Thanks,
Guenter
